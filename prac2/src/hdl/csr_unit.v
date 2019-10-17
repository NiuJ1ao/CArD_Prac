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
// Description:    Control and Status Registers for RISC-V core
// 
// Dependencies:   params.v
// 
//////////////////////////////////////////////////////////////////////////////////


module control_unit(
  input               clk,            // external clock source
  input               reset,          // async reset input

  //==== ZYBO board I/O signals ================================================
  //
  input       [1:0]   zybo_switches,  // inputs from four on-board switches
  input       [3:1]   zybo_buttons,   // resynchronized input from push buttons
  output      [3:0]   zybo_leds,      // outputs to the four LEDs
  output      [7:0]   zybo_ssd,       // output to the seven-segment display

  //==== CSRRW, CSRRS, CSRRC instruction interface =============================
  //
  input               csr_valid_op,   // single-cycle CSR activation command
  input               csr_commit_op,  // single-cycle CSR commit indicator
  input       [11:0]  csr_addr,       // CSR address
  input       [2:0]   csr_opc,        // CSR operation code
  input       [31:0]  csr_wdata,      // CSR write data
  output reg  [31:0]  csr_rdata,      // CSR read data

  //==== EBREAK, ECALL privileged instruction interface ========================
  //
  input               commit_ebreak,  // perform EBREAK instruction
  input               commit_ecall,   // perform ECALL instruction

  //==== Single-step request interface =========================================
  //
  input               step_cycle,     // 0->1 is a cycle-step request
  input               step_instr,     // 0->1 is an instruction-step request
  output reg          step_ack,       // 0->1 when step is complete (4-cycle)

  //==== Debugger halt/resume interface ========================================
  //
  input               dbg_halt_core,  // 1 => halt core, 1-cycle pulse command
  input               dbg_run_core,   // 1 => run core, 1-cycle pulse command

  //==== Execution pipeline control interface ==================================
  //
  input               commit_evt,     // any committing event at MEM stage
  input               wrb_restart,    // core pipeline flush signal
  output reg          csr_mem_stall,  // CSR op stalls MEM due to VGA not ready

  //==== Exception interface ===================================================
  //
  // TBD

  //==== VGA display interface =================================================
  //
  output reg          px_request,     // request to read/write one pixel
  output reg          px_write,       // 1=> write pixel, 0 => read pixel
  input               px_ready,       // 1=> write done or read data ready
  output     [15:0]   px_address,     // select pixel in 256x256 display frame
  output     [23:0]   px_write_data,  // RGB pixel value to be written to FB
  input      [23:0]   px_read_data,   // RGB pixel value read from FB
  
  //==== msec timer interface ==================================================
  //
  input      [31:0]   msec_elapsed,   // milliseconds elapsed since reset

  //==== Interface to set the run mode =========================================
  //
  output reg          run_cmd_val,    // signal a new run mode on run_cmd_mode
  output reg  [1:0]   run_cmd_mode    // next run mode
);

`include "params.v"

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Run / Halt / Single-step management logic                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// (1) To single step for one instruction the core must be initially halted.
//     If the core is running freely, all step commands will be ignored.
//
// The commit_evt signal is asserted at the MEM stage by the core, whenever
// it will commit an event at the end of the current cycle. In this context,
// an event may be an instruction, the taking of an exception, or the taking
// of an interrupt.
//               ___     ___     ___     ___     ___     ___     ___     ___
// clk          /   \___/   \_~_/   \___/   ~___/   \___/   \___/   \___/   \___
//              :     ______________________~____________________       :
// step_instr  ______/(1)                               :     (8)\______________
//              :       :                               : _______________
// step_ack    _____________________________~____________/(6)         (9)\______
//              :      ______                      ______               :
// run_cmd_val _______/(2)   \_______________~____/(5)   \______________________
//                      :                               :               :
// run_cmd_mode HALT ><      STEP_C_MODE          ><        HALT_MODE          >
//              :        _______                        : _______       :
// wrb_restart _________/(3)    \__________~_____________/(7)    \________________
//              :       :                           _______             :
// commit_evt  _____________________________~______/(4)    \______________________
//              :       :         :                     :               :
// step_fsm_r STEP_IDLE><         STEP_FIRE             ><   STEP_DONE  ><STEP_IDLE

localparam [1:0]  STEP_IDLE = 2'd0, // single-step FSM is idle
                  STEP_FIRE = 2'd1, // insruction step in progress
                  STEP_DONE = 2'd2; // instruction is done, shutting down the FSM

reg   [1:0]       run_mode_r;
reg               run_fsm_cg0;

reg   [1:0]       step_fsm_r;
reg   [1:0]       step_fsm_nxt;

reg               run_cmd_val_r;
reg               run_cmd_val_nxt;
reg               cpu_running;

always @*
  begin : state_logic_PROC
  
  cpu_running     = (run_mode_r == RUN_MODE);

  // Set default values for state machine variables
  //
  step_fsm_nxt    = step_fsm_r;
  run_fsm_cg0     = 1'b0;
  
  // Set default values for state machine outputs
  //
  run_cmd_val     = 1'b0;
  run_cmd_mode    = run_mode_r;
  step_ack        = 1'b0;

  casez ({run_mode_r, step_fsm_r})
    {HALT_MODE, STEP_IDLE}:
      if (step_instr == 1'b1)
        begin
        run_cmd_mode    = STEP_C_MODE;
        run_cmd_val     = 1'b1;
        step_fsm_nxt    = STEP_FIRE;
        run_fsm_cg0     = 1'b1;
        end
      else if (dbg_run_core)
        begin
        run_cmd_mode    = RUN_MODE;
        run_cmd_val     = 1'b1;
        run_fsm_cg0     = 1'b1;
        end

    {STEP_C_MODE, STEP_FIRE}:
      begin
      if (commit_evt)
        begin
        run_cmd_val     = 1'b1;
        run_cmd_mode    = HALT_MODE;
        step_fsm_nxt    = STEP_DONE;
        run_fsm_cg0     = 1'b1;
        end
      end

    {STEP_C_MODE, STEP_DONE}:
      begin
      step_ack  = 1'b1;
      if (!step_instr)
        begin
        step_fsm_nxt  = STEP_IDLE;
        run_fsm_cg0   = 1'b1;
        end
      end
      
    {RUN_MODE, 2'b??}:
      begin
      if (dbg_halt_core || commit_ebreak)
        begin
        run_cmd_mode  = HALT_MODE;
        run_cmd_val   = 1'b1;
        run_fsm_cg0   = 1'b1;
        end
      end

    default: ; // no change to run state
    endcase
  end // step_fsm_logic_PROC

always @(posedge clk or posedge reset)
  begin : state_reg_PROC
  if (reset)
    begin
    step_fsm_r    <= STEP_IDLE;
    run_mode_r    <= 1'b0;
    end
  else 
    begin
    if (run_fsm_cg0)
      begin
      step_fsm_r  <= step_fsm_nxt;
      run_mode_r  <= run_cmd_mode;
      end
    end
  end // step_fsm_reg_PROC

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Core privilege level and exception logic                                   //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

reg   [1:0]       cur_priv_r;
wire  [1:0]       cur_priv_nxt;
wire              cur_priv_cg0;

always @(posedge clk or posedge reset)
  begin : cur_priv_reg_PROC
  if (reset)
    cur_priv_r <= M_PRIV;
  else if (cur_priv_cg0)
    cur_priv_r <= cur_priv_nxt;
  end // cur_priv_reg_PROC

assign cur_priv_cg0 = 1'b0;         // TBD when exceptions and ECALL
assign cur_priv_nxt = cur_priv_r;   // are implemented

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Locally defined Control and Status Registers                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// Performance monitoring events and cycle counters
//
reg   [63:0]      mcycle_r;
reg   [63:0]      minstret_r;
reg   [4:0]       pm_event_r[3:31];
reg   [63:0]      pm_count_r[3:31];

// PM_SEL_NOTHING   = 5'd0;   // no event selected for counting
// PM_SEL_USE_LD    = 5'd1;   // load-use stall cycles
// PM_SEL_USE_CSR   = 5'd2;   // CSRR-use stall cycles
// PM_SEL_WAIT_DIV  = 5'd3;   // cycles stalling for DIV
// PM_SEL_BPM_CYC   = 5'd4;   // cycles due to branch mispredictions
// PM_SEL_BPM_EVT   = 5'd5;   // number of branch mispredictions (BMs)
// PM_SEL_BR_EVT    = 5'd6;   // number of conditional branches
// PM_SEL_JMP_EVT   = 5'd7;   // number of jumps
// PM_SEL_CTI_EVT   = 5'd8;   // number of control transfers (all types)
// PM_SEL_CALL_EVT  = 5'd9;   // number of function calls
// PM_SEL_RETN_EVT  = 5'd10;  // number of fundtion returs
// PM_SEL_BCM_EVT   = 5'd11;  // BMs due to branch cache misses
// PM_SEL_BTM_EVT   = 5'd12;  // BMs due to incorrect target prediction
// PM_SEL_MPD_EVT   = 5'd13;  // BMs due to incorrect outcome prediction
// PM_SEL_RAS_EVT   = 5'd14;  // BMs due to return-target misprediction
// PM_SEL_BBM_EVT   = 5'd15;  // BMs due to incorrect branch type prediction


reg   [31:0]                csr_data_nxt;
reg   [3:0]                 zybo_leds_r;
reg                         zybo_leds_cg0;
reg   [7:0]                 zybo_ssd_r;
reg                         zybo_ssd_cg0;

// Registers implementing the interface to the pixex read/write buffer
//
reg   [15:0]                px_address_r;
reg   [23:0]                px_write_data_r;
reg   [23:0]                px_read_data_r;
reg   [1:0]                 px_command_r;
//
reg   [23:0]                px_read_data_nxt;
reg   [1:0]                 px_command_nxt;
//
reg                         px_address_wr;
reg                         px_write_data_wr;
reg                         px_read_data_wr;
reg                         px_command_wr;
//
reg                         px_address_cg0;
reg                         px_write_data_cg0;
reg                         px_read_data_cg0;
reg                         px_command_cg0;

integer i;

always @(posedge clk or posedge reset)
  begin : counter_reg_PROC
  if (reset)
    begin
    mcycle_r    <= 64'd0;
    minstret_r  <= 64'd0;
    for (i = 3; i < 32; i = i + 1)
      begin
      pm_event_r[i] <= 5'd0;
      pm_count_r[i] <= 64'd0;
      end
    end
  else 
    begin
    if (cpu_running)
      mcycle_r    <= mcycle_r + 1;
    if (commit_evt)
      minstret_r  <= minstret_r + 1;
    end
  end // counter_reg_PROC

always @(posedge clk or posedge reset)
  begin : zybo_output_reg_PROC
  if (reset)
    begin
    zybo_leds_r <= 4'd0;
    zybo_ssd_r  <= 8'd0;
    end
  else 
    begin
    if (zybo_leds_cg0)
      zybo_leds_r <= csr_data_nxt[3:0];
    if (zybo_ssd_cg0)
      zybo_ssd_r  <= csr_data_nxt[7:0];
    end
  end // zybo_output_reg_PROC

always @(posedge clk or posedge reset)
  begin : px_interface_reg_PROC
  if (reset)
    begin
    px_address_r    <= 16'd0;
    px_write_data_r <= 24'd0;
    px_read_data_r  <= 24'd0;
    px_command_r    <= 2'd0;
    end
  else
    begin
    if (px_address_cg0 == 1'b1)
      px_address_r    <= csr_data_nxt[15:0];
    if (px_write_data_cg0 == 1'b1)
      px_write_data_r <= csr_data_nxt[23:0];
    if (px_read_data_cg0 == 1'b1)
      px_read_data_r  <= px_read_data_nxt;
    if (px_command_cg0 == 1'b1)
      px_command_r    <= px_command_nxt;
    end
  end // px_interface_reg_PROC

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Control and Status Registers (CSRs) and CSR operations                     //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

reg   [1:0]       csr_priv;         // RISC-V privilege level to access CSR
reg               csr_r_perm;       // 1 => CSR is readable
reg               csr_w_perm;       // 1 => CSR is writeable
reg               csr_dbg_only;     // 1 => CSR accessible to debugger only
reg               csr_have_priv;    // 1 => current privilege level is okay
reg               csr_write_enb;    // 1 => CSR can be legally written

always @*
  begin : csr_read_PROC
  
  csr_rdata     = 32'd0;
  
  case ({csr_valid_op, csr_addr})
    {1'b1, CSR_COREID}:     csr_rdata       = 32'd0;
    {1'b1, CSR_NUMCORES}:   csr_rdata       = 32'd1;
    //
    {1'b1, CSR_LEDS}:       csr_rdata[3:0]  = zybo_leds_r;    // non-standard
    {1'b1, CSR_SWITCHES}:   csr_rdata[1:0]  = zybo_switches;  // non-standard
    {1'b1, CSR_BUTTONS}:    csr_rdata[3:1]  = zybo_buttons;   // non-standard
    {1'b1, CSR_SSD}:        csr_rdata[3:0]  = zybo_ssd_r;     // non-standard
    //
    {1'b1, CSR_PX_ADDR}:    csr_rdata[15:0] = px_address_r;   // non-standard
    {1'b1, CSR_PX_DOUT}:    csr_rdata[23:0] = px_write_data_r;// non-standard
    {1'b1, CSR_PX_DIN}:     csr_rdata[15:0] = px_read_data_r; // non-standard
    {1'b1, CSR_PX_CMD}:     csr_rdata[1:0]  = px_command_r;   // non-standard
    //
    {1'b1, CSR_MCYCLE},
    {1'b1, CSR_CYCLE}:      csr_rdata       = mcycle_r[31:0];
    {1'b1, CSR_MINSTRET},
    {1'b1, CSR_INSTRET}:    csr_rdata       = minstret_r[31:0];
    {1'b1, CSR_MCYCLEH},
    {1'b1, CSR_CYCLEH}:     csr_rdata       = mcycle_r[63:32];
    {1'b1, CSR_MINSTRETH},
    {1'b1, CSR_INSTRETH}:   csr_rdata       = minstret_r[63:32];
    {1'b1, CSR_TIME}:       csr_rdata       = msec_elapsed;
    default:                csr_rdata       = 32'hXXXXXXXX;
  endcase

  case (csr_opc)
    SYS_CSR_RW_OP:  csr_data_nxt  = csr_wdata;
    SYS_CSR_RS_OP:  csr_data_nxt  = csr_rdata | csr_wdata;
    SYS_CSR_RC_OP:  csr_data_nxt  = csr_rdata & ~csr_wdata;
    default:        csr_data_nxt  = 32'hXXXXXXXX;
  endcase
  end

always @*
  begin : csr_write_PROC

  csr_priv      = csr_addr[9:8];
  csr_dbg_only  = csr_addr[11:6] == 6'b01_11_10;
  csr_r_perm    = !csr_dbg_only;
  csr_w_perm    = !csr_dbg_only && (csr_addr[11:10] != 2'b11);

  case ({cur_priv_r, csr_priv})
    {M_PRIV, M_PRIV}: csr_have_priv = 1'b1;
    {M_PRIV, S_PRIV}: csr_have_priv = 1'b1;
    {M_PRIV, U_PRIV}: csr_have_priv = 1'b1;
    //
    {S_PRIV, S_PRIV}: csr_have_priv = 1'b1;
    {S_PRIV, U_PRIV}: csr_have_priv = 1'b1;
    //
    {U_PRIV, U_PRIV}: csr_have_priv = 1'b1;
    //
    default:          csr_have_priv = 1'b0;
  endcase
  
  csr_write_enb   = csr_valid_op & csr_w_perm & csr_have_priv;

  zybo_leds_cg0   = csr_write_enb & (csr_addr == CSR_LEDS);
  zybo_ssd_cg0    = csr_write_enb & (csr_addr == CSR_SSD);

  // Assert px_request if there is an active bit in px_command_r
  //
  px_request        = |px_command_r;
  
  // Assert px_write if bit 0 of px_command_r is set to 1
  //
  px_write          = px_command_r[0];

  px_address_wr     = csr_write_enb & (csr_addr == CSR_PX_ADDR);
  px_write_data_wr  = csr_write_enb & (csr_addr == CSR_PX_DOUT);
  px_read_data_wr   = csr_write_enb & (csr_addr == CSR_PX_DIN);
  px_command_wr     = csr_write_enb & (csr_addr == CSR_PX_CMD);
  
  csr_mem_stall     = px_request
                    & (   px_address_wr
                        | px_write_data_wr
                        | px_read_data_wr
                        | px_command_wr
                      )
                    ;

  px_address_cg0    = (!px_request) & px_address_wr;
  px_write_data_cg0 = (!px_request) & px_write_data_wr;
  
  px_read_data_cg0  = ((!px_request) & px_read_data_wr)
                    | (px_command_r[1] & px_ready)
                    ;

  px_read_data_nxt  = px_command_r[1] ? px_read_data : csr_data_nxt[23:0];
  
  // Enable the px_command_r register if writing to CSR_PX_CMD
  // or if there is a pending command and px_ready is asserted
  //
  px_command_cg0    = ((!px_request) & px_command_wr)
                    | ((|px_command_r) & px_ready)
                    ;

  // The next px_command_r value is 2'b00 if there is already
  // an active request (i.e. clear the command registers), or
  // else it is the lower two bits of csr_wdata.
  //
  px_command_nxt    = px_request ? 2'b00 : csr_wdata[1:0];
  
  end

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Non-standard logic to compute CPI as a 4Q4 fractional value                //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* We maintain a version of the cycle count that is left-justified in a 16-bit
   register.
 * We maintain a version of the instret count that is justified by the same
   left-justification shift value as the cycle count.
 * This is achieved by maintaining an increment value, which is initially set
   to 64'b1000_0000_0000_0000_0000_0000_0000_0000.
 * On each clock, we add the increment value to cycle, and we add the increment
   to the instret value if an instruction commits.
 * When the most-significant bit of the cycle count becomes 1 we shift the
   increment, the cycle count and the instruction count to the right by 1 bit.
 * We compute CPI*10 = (10*cycle[63:48])/instret[63:48] on each cycle.
*/
localparam CPI_BITS = 48;

reg   [(CPI_BITS-1):0]      cpi_cycle_r;
reg   [(CPI_BITS-1):0]      cpi_instr_r;
reg   [(CPI_BITS-1):0]      cpi_incr_r;

reg   [(CPI_BITS-1):0]      cpi_cycle_nxt;
reg   [(CPI_BITS-1):0]      cpi_instr_nxt;
reg   [(CPI_BITS-1):0]      cpi_incr_nxt;

reg                         cpi_cycle_cg0;
reg                         cpi_instr_cg0;
reg                         cpi_incr_cg0;

reg   [23:0]      ten_x_cycle_r;
reg   [15:0]      one_x_instr_r;
reg   [23:0]      ten_x_cpi_r;

always @*
  begin : cpi_calc_PROC
  
  cpi_incr_cg0  = 1'b0;
  cpi_cycle_cg0 = 1'b0;
  cpi_instr_cg0 = 1'b0;
  cpi_incr_nxt  = cpi_incr_r;
  
  case ({cpi_cycle_r[CPI_BITS-1], run_mode_r})
    {1'b0, RUN_MODE}:
      begin
      cpi_cycle_nxt = cpi_cycle_r + cpi_incr_r;
      cpi_instr_nxt = cpi_instr_r + cpi_incr_r;
      cpi_instr_cg0 = cpu_running & commit_evt;
      cpi_cycle_cg0 = cpu_running;
      end
    {1'b1, RUN_MODE}:
      begin
      cpi_cycle_nxt = {1'b0, cpi_cycle_r[(CPI_BITS-1):1]}
                    + cpi_incr_r
                    ;
      cpi_instr_nxt = {1'b0, cpi_instr_r[(CPI_BITS-1):1]}
                    + ({CPI_BITS{commit_evt}}&cpi_incr_r)
                    ;
      cpi_incr_nxt  = {1'b0, cpi_incr_r[(CPI_BITS-1):1]};
      cpi_incr_cg0  = 1'b1;
      cpi_instr_cg0 = cpu_running;
      cpi_cycle_cg0 = cpu_running;
      end
    default:
      begin
      cpi_cycle_nxt = cpi_cycle_r;
      cpi_instr_nxt = cpi_instr_r;
      end
    endcase    
  end // cpi_calc_PROC

always @(posedge clk or posedge reset)
  begin : cpi_calc_reg_PROC
  if (reset)
    begin
    cpi_cycle_r   <= {CPI_BITS{1'd0}};
    cpi_instr_r   <= {CPI_BITS{1'd0}};
    cpi_incr_r    <= {1'b1, {(CPI_BITS-1){1'b0}}};
    ten_x_cycle_r <= 24'd0;
    one_x_instr_r <= 16'd0;
    ten_x_cpi_r   <= 24'd0;   
    end
  else
    begin
    if (cpi_cycle_cg0)
      cpi_cycle_r   <= cpi_cycle_nxt;
    if (cpi_instr_cg0)
      cpi_instr_r   <= cpi_instr_nxt;
    if (cpi_incr_cg0)
      cpi_incr_r    <= cpi_incr_nxt;    

    ten_x_cycle_r <= cpi_cycle_r[(CPI_BITS-1):(CPI_BITS-16)] * 16'd10;
    one_x_instr_r <= cpi_instr_r[(CPI_BITS-1):(CPI_BITS-16)];
//    ten_x_cpi_r   <= ten_x_cycle_r / one_x_instr_r;
    end
  end // cpi_calc_reg_PROC

// Output assignments
//
assign zybo_leds      = zybo_leds_r;

// Display CPI when button[3] is pressed, otherwise the ZYBO_SSD CSR value
//
assign zybo_ssd       = zybo_buttons[3] ? ten_x_cpi_r[7:0] : zybo_ssd_r;

assign px_address     = px_address_r;
assign px_write_data  = px_write_data_r;

endmodule
