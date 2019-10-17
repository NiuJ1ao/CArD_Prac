`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2019, Nigel Topham, All rights reserved.
//
// This is an unpublished, proprietary work of Nigel Topham and is fully
// protected under copyright law. You may not disclose or distribute this file
// or any information contained herein except persuant to a valid written
// license from Nigel Topham.
//
// The entire notice above must be reproduced on all authorized copies.
//
////////////////////////////////////////////////////////////////////////////////
//
// Description:    CPU module for RISC-V core
// 
// Dependencies:   params.v, fetch_unit, exec_unit, control_unit
// 
////////////////////////////////////////////////////////////////////////////////

module cpu(
  input           clk,              // external clock source
  input           reset,            // async reset input

  //==== Run control/status interface ==========================================
  //
  output  [1:0]   run_cmd_mode,     // halt, run, step_cycle or step_inst
  output          cpu_commit,       // 1 => instruction was committed
  output          cpu_running,      // 0 => CPU halted, 1 => CPU running
  
  //==== Single-step request interface =========================================
  //
  input           step_cycle,       // 0->1 is a cycle-step request
  input           step_instr,       // 0->1 is an instruction-step request
  output          step_ack,         // 0->1 when step is complete (4-cycle)

  //==== Debugger halt/resume interface ========================================
  //
  input           dbg_halt_core,    // 1 => halt core, 1-cycle pulse command
  input           dbg_run_core,     // 1 => run core, 1-cycle pulse command

  //==== Direct Memory Interface for ICCM write and DCCM read/write ============
  //
  // TBD
  
  //==== Bidirectional data link interface to host system ======================
  //
  input   [31:0]  hlnk_in_data,     // hostlink input channel data
  input           hlnk_in_valid,    // hostlink input channel valid data
  output          hlnk_in_accept,   // hostlink input channel data accept
  //
  output  [31:0]  hlnk_out_data,    // hostlink input channel data
  output          hlnk_out_valid,   // hostlink input channel valid data
  input           hlnk_out_accept,  // hostlink input channel data accept
  
  // Interface signals for reading from, and writing to, the frame buffer
  //
  output          px_request,       // active-high FB request
  output          px_write,         // 1=> write FB, 0 => read FB
  input           px_ready,         // 1=> write done or read data ready
  output  [15:0]  px_address,       // select cols 0..255 within FB
  output  [23:0]  px_write_data,    // pixel value to be written to FB
  input   [23:0]  px_read_data,     // pixel value read from FB
  
  //==== msec timer interface ==================================================
  //
  input   [31:0]  msec_elapsed,     // milliseconds elapsed since reset

  //==== GPIO interface to switches, buttons, LEDs and SSD =====================
  //
  input   [1:0]   zybo_switches,    // current switch settings on ZYBO board
  input   [3:1]   zybo_buttons,     // current value of push buttons on ZYBO
  output  [3:0]   zybo_leds,        // output to the LEDs on the ZYBO board
  output  [7:0]   zybo_ssd          // ouptut to the 7-segment display PMOD
);

`include "params.v"

assign hlnk_in_accept = 1'b0;         // TBD
assign hlnk_out_data  = 32'hXXXXXXXX; // TBD
assign hlnk_out_valid = 1'b0;         // TBD

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//Declare wires to interconnect major units                                   //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

//==== Instruction Issue interface =============================================
//
wire            fch_valid;          // valid incoming instruction
wire  [2:0]     fch_index;          // unique ID of issued instruction
wire  [31:0]    fch_inst;           // instruction from fetch_unit
wire  [31:0]    fch_pc;             // speculative PC of issued instruction
wire            exu_accept;         // willing to accept an incoming instruction

//==== Memory interface to ICCM (read only) ==================================
//
wire  [12:2]    exe_iccm_addr;      // load address targeting ICCM
wire            exe_iccm_load;      // valid load to ICCM at EXE stage
wire  [31:0]    fch_iccm_dout;      // read data for loads accessing ICCM

//==== Fetch Restart interface =================================================
wire            wrb_restart;        // flush pipeline and restart fetching
wire  [31:0]    wrb_restart_pc;     // ... from wrb_restart_pc

//==== Branch Prediction Issue interface =======================================
//
wire            bpu_predicted;      // BPU found a prediction for issued instr
wire            bpu_pred_taken;     // 1 => predict taken; 0 => pred NT or NP
wire  [2:0]     bpu_pred_type;      // type of branch
wire  [1:0]     bpu_pred_state;     // {Not-taken, Taken} x {Weak, Strong}
wire  [31:0]    bpu_pred_target;    // predicted PC of next instruction to issue

//==== Branch Resolution interface =============================================
//
// ... control interface
wire            wrb_update_bpu;     // 1 => report branch or prediction outcome
wire  [1:0]     wrb_pred_state;     // prediction state of updating branch
wire            wrb_was_pred;       // 1 => update pred; 0 => initialize pred
wire  [2:0]     wrb_index;          // instruction ID for prediction update
wire  [31:0]    wrb_pc;             // PC of instruction updating the BPU
//
// ... misprediction indicators
wire            wrb_mispred_dir;    // 1 => branch outcome was mispredicted
wire            wrb_mispred_typ;    // 1 => prediction had incorrect branch type
wire            wrb_mispred_tgt;    // 1 => branch/jump target was mispredicted
//
// ... actual outcome indicators
wire            wrb_direction;      // actual outcome of branch condition
wire  [2:0]     wrb_branch_type;    // actual type of branch
wire  [31:0]    wrb_target;         // actual target of branch/jump

//==== CSRRW, CSRRS, CSRRC instruction interface ===============================
//
wire            csr_valid_op;       // single-cycle CSR activation command
wire            csr_commit_op;      // single-cycle CSR commit command
wire  [11:0]    csr_addr;           // CSR address
wire  [2:0]     csr_opc;            // CSR operation code
wire  [31:0]    csr_wdata;          // CSR write data
wire  [31:0]    csr_rdata;          // CSR read data
  
//==== EBREAK, ECALL privileged instruction interface ==========================
//
wire            commit_ebreak;      // perform EBREAK instruction
wire            commit_ecall;       // perform ECALL instruction

//==== Core pipeline control interface =========================================
//
wire            commit_evt;         // any committing event at MEM stage
wire            run_cmd_val;        // signal a new run mode on run_cmd_mode
wire            csr_mem_stall;      // CSR op stalls MEM due to VGA not ready
wire            bpu_flush;          // clear branch predictor contents

assign bpu_flush = 1'b0;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Instantiate the fetch_unit (Instruction Fetch Unit)                        //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

fetch_unit u_fetch_unit(
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input
  .run_cmd_mode     (run_cmd_mode   ), // new run mode of the CPU
  .bpu_flush        (bpu_flush      ), // clear branch predictor contents

  //==== Instruction Issue interface ===========================================
  //
  .fch_valid        (fch_valid      ), // valid incoming instruction
  .fch_index        (fch_index      ), // unique ID of issued instruction
  .fch_inst         (fch_inst       ), // instruction from fetch_unit
  .fch_pc           (fch_pc         ), // speculative PC of issued instruction
  .exu_accept       (exu_accept     ), // will accept an incoming instruction

  //==== Memory interface to ICCM (read only) ==================================
  //
  .exe_iccm_addr    (exe_iccm_addr  ), // load address targeting ICCM
  .exe_iccm_load    (exe_iccm_load  ), // valid load to ICCM at EXE stage
  .fch_iccm_dout    (fch_iccm_dout  ), // read data for loads accessing ICCM

  //==== Fetch Restart interface ===============================================
  .wrb_restart      (wrb_restart    ), // flush pipeline and restart fetching
  .wrb_restart_pc   (wrb_restart_pc ), // ... from wrb_restart_pc
  .wrb_pc           (wrb_pc         ), // PC of instruction updating the BPU

  //==== Branch Prediction Issue interface =====================================
  //
  .bpu_predicted    (bpu_predicted  ), // BPU gave a prediction to issued instr
  .bpu_pred_taken   (bpu_pred_taken ), // 1 => predict taken; 0 => pred NT or NP
  .bpu_pred_type    (bpu_pred_type  ), // predicted type of branch
  .bpu_pred_state   (bpu_pred_state ), // {Not-taken, Taken} x {Weak, Strong}
  .bpu_pred_target  (bpu_pred_target), // predicted PC of following instruction
  
  //==== Branch Prediction Resolve interface ===================================
  //
  .wrb_update_bpu   (wrb_update_bpu ), // 1 => report outcome to BPU   
  .wrb_was_pred     (wrb_was_pred   ), // 1 => update; 0 => create new prediction
  .wrb_pred_state   (wrb_pred_state ), // prediction state used by prediction
  .wrb_index        (wrb_index      ), // unique instruction ID
  .wrb_mispred_dir  (wrb_mispred_dir), // 1 => branch outcome was mispredicted
  .wrb_mispred_typ  (wrb_mispred_typ), // 1 => incorrect branch type prediction
  .wrb_mispred_tgt  (wrb_mispred_tgt), // 1 => mispredicted branch/jump target
  .wrb_direction    (wrb_direction  ), // ... actual outcome of branch condition
  .wrb_branch_type  (wrb_branch_type), // ... actual type of branch
  .wrb_target       (wrb_target     )  // ... actual target of branch/jump
);

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Instantiate the exec_unit (Execution Unit)                                 //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

exec_unit u_exec_unit(
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input
  
  //==== Control unit interface ================================================
  //
  // ... interface to change the run mode
  .run_cmd_val      (run_cmd_val    ), // command to change run mode
  .run_cmd_mode     (run_cmd_mode   ), // new run mode for the CPU
  //
  // ... interface to support instruction stepping
  .commit_evt       (commit_evt     ), // any committing event at MEM stage
  //
  // ... CSRRW, CSRRS, CSRRC instruction interface
  //
  .csr_valid_op     (csr_valid_op   ), // single-cycle CSR activation command
  .csr_commit_op    (csr_commit_op  ), // commit a CSR instruction 
  .csr_addr         (csr_addr       ), // CSR address
  .csr_opc          (csr_opc        ), // CSR operation code
  .csr_wdata        (csr_wdata      ), // CSR write data
  .csr_rdata        (csr_rdata      ), // CSR read data
  .csr_mem_stall    (csr_mem_stall  ), // Stall CSR op at MEM stage
  //
  // ... EBREAK, ECALL privileged instruction interface
  //
  .commit_ebreak    (commit_ebreak  ), // perform an EBREAK instruction
  .commit_ecall     (commit_ecall   ), // perform an ECALL instruction

  //==== Instruction Issue interface ===========================================
  //
  .fch_valid        (fch_valid      ), // valid incoming instruction
  .fch_index        (fch_index      ), // unique ID of issued instruction
  .fch_inst         (fch_inst       ), // instruction from fetch_unit
  .fch_pc           (fch_pc         ), // speculative PC of issued instruction
  .exu_accept       (exu_accept     ), // will accept an incoming instruction

  //==== Memory interface to ICCM (read only) ==================================
  //
  .exe_iccm_addr    (exe_iccm_addr  ), // load address targeting ICCM
  .exe_iccm_load    (exe_iccm_load  ), // valid load to ICCM at EXE stage
  .fch_iccm_dout    (fch_iccm_dout  ), // read data for loads accessing ICCM

  //==== Fetch Restart interface ===============================================
  .wrb_restart      (wrb_restart    ), // flush pipeline and restart fetching
  .wrb_restart_pc   (wrb_restart_pc ), // ... from wrb_restart_pc
  .wrb_pc           (wrb_pc         ), // PC of instruction updating the BPU

  //==== Branch Prediction Issue interface =====================================
  //
  .bpu_predicted    (bpu_predicted  ), // BPU gave a prediction to issued instr
  .bpu_pred_taken   (bpu_pred_taken ), // 1 => predict taken; 0 => pred NT or NP
  .bpu_pred_type    (bpu_pred_type  ), // predicted type of branch
  .bpu_pred_state   (bpu_pred_state),  // {Not-taken, Taken} x {Weak, Strong}
  .bpu_pred_target  (bpu_pred_target), // predicted PC of following instruction
  
  //==== Branch Prediction Resolve interface ===================================
  //
  .wrb_update_bpu   (wrb_update_bpu ), // 1 => report outcome to BPU
  .wrb_was_pred     (wrb_was_pred   ), // 1 => update pred; 0 => initialize pred
  .wrb_pred_state   (wrb_pred_state ), // prediction state used by prediction
  .wrb_index        (wrb_index      ), // unique instruction ID
  .wrb_mispred_dir  (wrb_mispred_dir), // 1 => branch outcome was mispredicted
  .wrb_mispred_typ  (wrb_mispred_typ), // 1 => incorrect branch type prediction
  .wrb_mispred_tgt  (wrb_mispred_tgt), // 1 => mispredicted branch/jump target
  .wrb_direction    (wrb_direction  ), // ... actual outcome of branch condition
  .wrb_branch_type  (wrb_branch_type), // ... actual type of branch
  .wrb_target       (wrb_target     )  // ... actual target of branch/jump
);

control_unit u_control_unit(
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input

  //==== ZYBO board I/O signals ================================================
  //
  .zybo_switches    (zybo_switches  ), // inputs from four on-board switches
  .zybo_buttons     (zybo_buttons   ), // resynchronized input from push buttons
  .zybo_leds        (zybo_leds      ), // outputs to the four LEDs
  .zybo_ssd         (zybo_ssd       ), // output to the seven-segment display

  //==== CSRRW, CSRRS, CSRRC instruction interface =============================
  //
  .csr_valid_op     (csr_valid_op   ), // single-cycle CSR activation command
  .csr_commit_op    (csr_commit_op  ), // commit a CSR instruction 
  .csr_addr         (csr_addr       ), // CSR address
  .csr_opc          (csr_opc        ), // CSR operation code
  .csr_wdata        (csr_wdata      ), // CSR write data
  .csr_rdata        (csr_rdata      ), // CSR read data
  
  //==== EBREAK, ECALL privileged instruction interface ========================
  //
  .commit_ebreak    (commit_ebreak  ), // perform EBREAK instruction
  .commit_ecall     (commit_ecall   ), // perform ECALL instruction

  //==== Single-step request interface =========================================
  //
  .step_cycle       (step_cycle     ), // 0->1 is a cycle-step request
  .step_instr       (step_instr     ), // 0->1 is an instruction-step request
  .step_ack         (step_ack       ), // 0->1 when step is complete (4-cycle)

  //==== Debugger halt/resume interface ========================================
  //
  .dbg_halt_core    (dbg_halt_core  ), // 1 => halt core, 1-cycle pulse command
  .dbg_run_core     (dbg_run_core   ), // 1 => run core, 1-cycle pulse command

  //==== VGA display buffer read/write interface ===============================
  //
  .px_request       (px_request     ), // active-high FB request
  .px_write         (px_write       ), // 1=> write FB, 0 => read FB
  .px_ready         (px_ready       ), // 1=> write done or read data ready
  .px_address       (px_address     ), // select cols 0..255 within FB
  .px_write_data    (px_write_data  ), // pixel value to be written to FB
  .px_read_data     (px_read_data   ), // pixel value read from FB

  //==== msec timer interface ==================================================
  //
  .msec_elapsed     (msec_elapsed   ), // milliseconds elapsed since reset

  //==== Core pipeline control interface =======================================
  //
  .commit_evt       (commit_evt     ), // any committing event at MEM stage
  .wrb_restart      (wrb_restart    ), // core pipeline flush signal
  .csr_mem_stall    (csr_mem_stall  ), // CSR op stalls MEM due to VGA not ready
  .run_cmd_val      (run_cmd_val    ), // signal a new run mode on run_cmd_mode
  .run_cmd_mode     (run_cmd_mode   )  // next run mode
);

assign cpu_commit   = commit_evt;
assign cpu_running  = (run_cmd_mode == RUN_MODE);

endmodule
