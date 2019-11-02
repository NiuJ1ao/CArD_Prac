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
// Description:    Execution unit pipeline for RISC-V core
// 
// Dependencies:   params.v, decoder.v, regfile.v
// 
////////////////////////////////////////////////////////////////////////////////

module exec_unit (
  input           clk,              // external clock source
  input           reset,            // async reset input

  //==== Control unit interface ================================================
  //
  // ... interface to change the run mode
  input           run_cmd_val,      // signal a new run mode on run_cmd_mode
  input [1:0]     run_cmd_mode,     // next run mode
  //
  // ... interface to support instruction stepping
  output reg      commit_evt,       // any committing event at MEM stage
  //
  // ... CSRRW, CSRRS, CSRRC instruction interface
  output          csr_valid_op,     // single-cycle CSR activation command
  output          csr_commit_op,    // single-cycle CSR commit indicator
  output [11:0]   csr_addr,         // CSR address
  output [2:0]    csr_opc,          // CSR operation code
  output [31:0]   csr_wdata,        // CSR write data
  input  [31:0]   csr_rdata,        // CSR read data
  input           csr_mem_stall,    // CSR op stalls at MEM
  //
  // ... EBREAK, ECALL privileged instruction interface
  output reg      commit_ebreak,    // perform EBREAK instruction
  output reg      commit_ecall,     // perform ECALL instruction

  //==== Instruction Issue interface ===========================================
  //
  input           fch_valid,        // valid incoming instruction
  input  [2:0]    fch_index,        // unique ID of issued instruction
  input  [31:0]   fch_inst,         // instructigon from fetch_unit
  input  [31:0]   fch_pc,           // speculative PC of issued instruction
  output reg      exu_accept,       // willing to accept an incoming instruction

  //==== Memory interface to ICCM (read only) ==================================
  //
  output reg [12:2] exe_iccm_addr,  // load address targeting ICCM
  output reg        exe_iccm_load,  // valid load to ICCM at EXE stage
  input      [31:0] fch_iccm_dout,  // read data for loads accessing ICCM

  //==== Fetch Restart interface ===============================================
  output          wrb_restart,      // flush pipeline and restart fetching
  output [31:0]   wrb_restart_pc,   // ... from wrb_restart_pc

  //==== Branch Prediction Issue interface =====================================
  //
  input           bpu_predicted,    // BPU found a prediction for issued instr
  input           bpu_pred_taken,   // 1 => predict taken; 0 => pred NT or NP
  input  [2:0]    bpu_pred_type,    // type of branch
  input  [1:0]    bpu_pred_state,   // {Not-taken, Taken} x {Weak, Strong}
  input  [31:0]   bpu_pred_target,  // predicted PC of next instruction to issue
  
  //==== Branch Resolution interface ===========================================
  //
  // ... control interface
  output          wrb_update_bpu,   // 1 => report branch or prediction outcome
  output          wrb_was_pred,     // 1 => update pred; 0 => initialize pred
  output [1:0]    wrb_pred_state,   // prediction state of updating branch
  output [2:0]    wrb_index,        // instruction ID for prediction update
  output [31:0]   wrb_pc,           // PC of writeback instruction
  //
  // ... misprediction indicators
  output          wrb_mispred_dir,  // 1 => branch outcome was mispredicted
  output          wrb_mispred_typ,  // 1 => prediction had incorrect branch type
  output          wrb_mispred_tgt,  // 1 => branch/jump target was mispredicted
  //
  // ... actual outcome indicators
  output          wrb_direction,    // actual outcome of branch condition
  output [2:0]    wrb_branch_type,  // actual type of branch
  output [31:0]   wrb_target        // actual target of branch/jump
);

`include "params.v"

reg             done_reset_r;       // 1 => reset sequence is complete

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Program Counter registers within the Execution Unit pipeline               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

reg   [31:2]    dec_pc_r;           // DEC stage speculative PC
reg   [31:2]    exe_pc_r;           // EXE stage speculative PC
reg   [31:2]    mem_pc_r;           // MEM stage speculative PC
reg   [31:2]    wrb_pc_r;           // WRB stage committed PC
reg   [31:2]    nxt_pc_r;           // PC of next instruction to commit

////////////////////////////////////////////////////////////////////////////////
// Pipeline stage freeze signals                                              //
////////////////////////////////////////////////////////////////////////////////

reg             dec_freeze;         // 1 => hold current DEC-stage instruction
reg             exe_freeze;         // 1 => hold current EXE-stage instruction
reg             mem_freeze;         // holds MEM stage

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Decode Stage                                                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

reg             dec_valid_r;        // DEC stage has valid instruction
reg   [31:0]    dec_inst_r;         // DEC stage instruction
reg   [2:0]     dec_index_r;        // DEC stage index
//
reg             dec_predicted_r;    // 1 => DEC stage instr had a prediction
reg             dec_pred_taken_r;   // 1 => prediction is to take branch
reg   [2:0]     dec_pred_type_r;    // predicted type of branch
reg   [1:0]     dec_pred_state_r;   // prediction state at DEC stage
reg   [31:0]    dec_pred_target_r;  // predicted PC at DEC stage
//
reg             dec_ctrl_cg0;       // DEC-stage control input register enable
reg             dec_inst_cg0;       // DEC-stage instruction input register enable
reg             dec_valid_nxt;      // validity of next DEC-stage values

always @(posedge clk or posedge reset)
  begin : dec_ctrl_reg_PROC
  if (reset == 1'b1)
    begin
    dec_valid_r       <= 1'b0;
    dec_predicted_r   <= 1'b0;
    end
  else if (dec_ctrl_cg0 == 1'b1)
    begin
    dec_valid_r       <= dec_valid_nxt;
    dec_predicted_r   <= bpu_predicted;
    end
  end // dec_ctrl_reg_PROC

always @(posedge clk)
  begin : dec_inst_reg_PROC
  if (dec_inst_cg0 == 1'b1)
    begin
    dec_inst_r        <= fch_inst;
    dec_index_r       <= fch_index;
    dec_pred_taken_r  <= bpu_pred_taken;
    dec_pred_type_r   <= bpu_pred_type;
    dec_pred_state_r  <= bpu_pred_state;
    dec_pred_target_r <= bpu_pred_target;
    end
  end // dec_inst_reg_PROC

wire  [4:0]     dec_rs1;            // First source register address
wire  [4:0]     dec_rs2;            // Second source register address
wire  [4:0]     dec_rd;             // Destination register address
wire  [31:0]    dec_imm;            // Immediate operand
wire  [11:0]    dec_csr_addr;       // CSR address
wire  [3:0]     dec_alu_opc;        // ALU operation code
wire  [2:0]     dec_func3;          // sub-opcode (branch, CSR, LD, ST)
wire            dec_sel_pc;         // first source operand is PC versus rs1
wire            dec_sel_imm;        // second source operand is imm versus rs2
wire            dec_rd_wenb;        // rd write enable
wire            dec_rs1_renb;       // rs1 read enable
wire            dec_rs2_renb;       // rs2 read enable
wire            dec_load;           // Instruction is a LOAD
wire            dec_store;          // Instruction is a STORE
wire            dec_branch;         // Instruction is a BRANCH
wire            dec_jump;           // Instruciton is a JUMP
wire            dec_csr;            // Instruction is a CSR op
wire            dec_priv;           // Instruction is a PRIVileged op
wire            dec_m32_op;         // 32-bit 'M' operation for MUL/DIV
wire            dec_illegal;        // unrecognized instruction

reg   [31:0]    wrb_rd_wdata_r;     // register result at WRB stage
reg   [4:0]     wrb_rd_r;           // Destination register address
reg             wrb_rd_wenb_r;      // rd write enable


decoder u_decoder (
  .inst             (dec_inst_r     ), // RISC-V instruction to be decoded
  .dec_rs1          (dec_rs1        ), // First source register address
  .dec_rs2          (dec_rs2        ), // Second source register address
  .dec_rd           (dec_rd         ), // Destination register address
  .dec_imm          (dec_imm        ), // Immediate operand
  .dec_csr_addr     (dec_csr_addr   ), // CSR address
  .dec_alu_opc      (dec_alu_opc    ), // ALU operation code
  .dec_func3        (dec_func3      ), // sub-opcode (branch, CSR, LD, ST)
  .dec_sel_pc       (dec_sel_pc     ), // first source operand is PC versus rs1
  .dec_sel_imm      (dec_sel_imm    ), // second source operand is imm versus rs2
  .dec_rd_wenb      (dec_rd_wenb    ), // rd write enable
  .dec_rs1_renb     (dec_rs1_renb   ), // rs1 read enable
  .dec_rs2_renb     (dec_rs2_renb   ), // rs2 read enable
  .dec_load         (dec_load       ), // Instruction is a LOAD
  .dec_store        (dec_store      ), // Instruction is a STORE
  .dec_branch       (dec_branch     ), // Instruction is a BRANCH
  .dec_jump         (dec_jump       ), // Instruciton is a JUMP
  .dec_csr          (dec_csr        ), // Instruction is a CSR op
  .dec_priv         (dec_priv       ), // Instruction is a PRIVileged op
  .dec_m32_op       (dec_m32_op     ), // 32-bit 'M' operation for MUL/DIV
  .dec_illegal      (dec_illegal    )  // unrecognized instruction
);

wire  [31:0]        dec_rdata1;     // first source register read data at DEC
wire  [31:0]        dec_rdata2;     // first source register read data at DEC

regfile u_regfile(
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input
  .rs1              (dec_rs1        ), // first source register address
  .rs2              (dec_rs2        ), // second source register address
  .rd               (wrb_rd_r       ), // destination register address
  .renb1            (dec_rs1_renb   ), // rs1 read enable
  .renb2            (dec_rs2_renb   ), // rs2 read enable
  .wenb             (wrb_rd_wenb_r  ), // write enable
  .wdata            (wrb_rd_wdata_r ), // write data
  .rdata1           (dec_rdata1     ), // first source read data
  .rdata2           (dec_rdata2     )  // second source read data
);

wire            dec_stall;          // 1 => stall DEC, 0 => no stall at DEC
wire            dec_load_use;       // DEC stall is due to Load use with MEM
wire            dec_csr_use;        // DEC stall is due to CSR use with MEM
wire  [31:0]    dec_rs1_data;       // R[rs1] value to pass on to EXE stage
wire  [31:0]    dec_rs2_data;       // R[rs2] value to pass on to EXE stage

reg             dec_call_jmp;
reg             dec_retn_jmp;
reg   [31:0]    exe_reg1_nxt;
reg   [31:0]    exe_src2_nxt;
reg   [31:0]    exe_reg2_nxt;
reg             exe_valid_nxt;
reg             dec_pass;
reg   [2:0]     exe_branch_type_nxt;
reg             dec_start_div;

always @*
  begin : dec_logic_PROC
  dec_freeze        = !done_reset_r | dec_stall | (dec_valid_r & exe_freeze);
  
  // Signals to control the DEC-stage input registers and to handshake
  // with the fetch unit.
  //
  exu_accept        = !dec_freeze | !dec_valid_r;
  dec_valid_nxt     = fch_valid & !wrb_restart;
  
  dec_inst_cg0      = (fch_valid & exu_accept) | wrb_restart;
  dec_ctrl_cg0      = dec_inst_cg0 | (dec_valid_r & !dec_freeze); 
  
  exe_reg1_nxt      = dec_rs1_data;
  exe_src2_nxt      = dec_sel_imm ? dec_imm : dec_rs2_data;
  exe_reg2_nxt      = dec_rs2_data;
  exe_valid_nxt     = dec_valid_r & (!dec_freeze);
  dec_pass          = exe_valid_nxt & (!wrb_restart);

  dec_call_jmp      = dec_jump & (dec_rd  == X1_REG) &  dec_rd_wenb;
  dec_retn_jmp      = dec_jump & (dec_rs1 == X1_REG) & !dec_rd_wenb;
  
  casez ({ dec_branch, dec_jump, dec_call_jmp, dec_retn_jmp })
    4'b1???:  exe_branch_type_nxt = BPU_BRANCH;
    4'b0100:  exe_branch_type_nxt = BPU_JUMP;
    4'b0110:  exe_branch_type_nxt = BPU_CALL;
    4'b0101:  exe_branch_type_nxt = BPU_RETURN;
    default:  exe_branch_type_nxt = BPU_NO_PRED;
  endcase

  dec_start_div     = dec_m32_op & dec_alu_opc[2] & dec_pass;

  end // dec_logic_PROC

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Execute Stage                                                              //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

reg             exe_valid_r;        // valid instruction at EXE stage
reg             exe_rd_wenb_r;      // rd write enable
reg             exe_sel_pc_r;       // ALU src1 is PC at EXE stage
reg             exe_load_r;         // Instruction is a LOAD
reg             exe_store_r;        // Instruction is a STORE
reg             exe_branch_r;       // Instruction is a BRANCH
reg             exe_jump_r;         // Instruciton is a JUMP
reg             exe_csr_r;          // Instruction is a CSR op
reg             exe_priv_r;         // Instruction is a PRIVileged op
reg             exe_m32_op_r;       // 32-bit 'M' operation for MUL/DIV
reg             exe_illegal_r;      // unrecognized instruction
reg             exe_predicted_r;    // 1 => EXE stage instr had a prediction

reg   [31:0]    exe_reg1_r;         // rs1 register source operand at EXE
reg   [31:0]    exe_src2_r;         // rs2 or immediate source operand at EXE
reg   [31:0]    exe_reg2_r;         // rs2 register source operand at EXE
reg   [4:0]     exe_rd_r;           // Destination register address
reg   [11:0]    exe_csr_addr_r;     // CSR address
reg   [3:0]     exe_alu_opc_r;      // ALU operation code
reg   [2:0]     exe_func3_r;        // sub-opcode (branch, CSR, LD, ST)
reg   [2:0]     exe_index_r;        // ID of branch instruction at EXE
reg             exe_pred_taken_r;   // 1 => prediction is to take branch
reg   [2:0]     exe_pred_type_r;    // predicted type of branch
reg   [1:0]     exe_pred_state_r;   // prediction state at EXE stage
reg   [31:0]    exe_pred_target_r;  // predicted PC at EXE stage
reg   [2:0]     exe_branch_type_r;  // actual branch type at EXE

reg             exe_ctrl_cg0;       // plr update enable for ctrl info at EXE
reg             exe_data_cg0;       // plr update enable for data info at EXE

reg   [32:0]    mul_src1;           // multiplier operand, at DEC stage
reg   [32:0]    mul_src2;           // multiplicand operand, at DEC stage

wire  [31:0]    alu_result;         // result output from the ALU module

wire            exe_div_busy;       // indicates DIV/REM unit is busy
wire            exe_div_ready;      // indicates DIV/REM operation is complete
wire  [31:0]    exe_div_result;     // the current DIV/REM result value

always @(posedge clk or posedge reset)
  begin : exe_ctrl_reg_PROC
  if (reset == 1'b1)
    begin
    exe_valid_r       <= 1'b0;
    exe_rd_wenb_r     <= 1'b0;
    exe_sel_pc_r      <= 1'b0;
    exe_load_r        <= 1'b0;
    exe_store_r       <= 1'b0;
    exe_branch_r      <= 1'b0;
    exe_jump_r        <= 1'b0;
    exe_csr_r         <= 1'b0;
    exe_priv_r        <= 1'b0;
    exe_m32_op_r      <= 1'b0;
    exe_illegal_r     <= 1'b0;
    //
    exe_predicted_r   <= 1'b0;
    end
  else if (exe_ctrl_cg0 == 1'b1)
    begin
    exe_valid_r       <= exe_valid_nxt    & !wrb_restart;
    exe_rd_wenb_r     <= dec_rd_wenb      & dec_pass;
    exe_sel_pc_r      <= dec_sel_pc       & dec_pass;
    exe_load_r        <= dec_load         & dec_pass;
    exe_store_r       <= dec_store        & dec_pass;
    exe_branch_r      <= dec_branch       & dec_pass;
    exe_jump_r        <= dec_jump         & dec_pass;
    exe_csr_r         <= dec_csr          & dec_pass;
    exe_priv_r        <= dec_priv         & dec_pass;
    exe_m32_op_r      <= dec_m32_op       & dec_pass;
    exe_illegal_r     <= dec_illegal      & dec_pass;
    //
    exe_predicted_r   <= dec_predicted_r  & dec_pass;
    end
  end // exe_ctrl_reg_PROC

always @(posedge clk)
  begin : exe_data_reg_PROC
  if (exe_data_cg0 == 1'b1)
    begin
    exe_reg1_r        <= exe_reg1_nxt;
    exe_src2_r        <= exe_src2_nxt;
    exe_reg2_r        <= exe_reg2_nxt;
    exe_rd_r          <= dec_rd;
    exe_csr_addr_r    <= dec_csr_addr;
    exe_alu_opc_r     <= dec_alu_opc;
    exe_func3_r       <= dec_func3;
    //
    exe_index_r       <= dec_index_r;
    exe_pred_taken_r  <= dec_pred_taken_r;
    exe_pred_type_r   <= dec_pred_type_r;
    exe_pred_state_r  <= dec_pred_state_r;
    exe_pred_target_r <= dec_pred_target_r;
    //
    exe_branch_type_r <= exe_branch_type_nxt;
    end
  end // exe_data_reg_PROC


////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Instantiate the ALU module                                                 //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`ALU_MODULE u_alu(
  .exe_alu_opc_r    (exe_alu_opc_r  ), // ALU sub-opcode (defined in params.v)
  .exe_sel_pc_r     (exe_sel_pc_r   ), // Mux between PC (1) or Xreg rs1 (0)
  .exe_pc_r         ({exe_pc_r,2'd0}), // PC at the EXE stage
  .exe_reg1_r       (exe_reg1_r     ), // Xreg rs1 at the EXE stage
  .exe_src2_r       (exe_src2_r     ), // Second source register at EXE
  .alu_result       (alu_result     )  // ALU result output
);


////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Instantiate the divider module                                             //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

divider u_divider(
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input
  
  //==== DIV/REM instruction issue interface ===================================
  //
  .dec_start_div    (dec_start_div  ), // initiate a div or rem instruction
  .dec_div_opc      (dec_alu_opc[1:0]), // one of {0: DIV, 1:DIVU, 2:REM, 3:REMU}
  .dec_src1         (exe_reg1_nxt   ), // dividend operand
  .dec_src2         (exe_reg2_nxt   ), // divisor operand
  .dec_rs1          (dec_rs1        ), // first source register number
  .dec_rs2          (dec_rs2        ), // second source register number  
  .wrb_restart      (wrb_restart    ), // 1 => terminate any active operation
  .div_busy         (exe_div_busy   ), // divider unable to accept new operation
  
  //==== DIV/REM result interface ==============================================
  //
  .div_ready        (exe_div_ready  ), // 1 => result is ready to use
  .div_result       (exe_div_result )  // result of div or rem operation
);

always @*
  begin : exe_ctrl_logic_PROC
  exe_freeze      = exe_div_busy | (exe_valid_r & mem_freeze);
  exe_ctrl_cg0    = (exe_valid_nxt | exe_valid_r) & (!exe_freeze | wrb_restart);
  exe_data_cg0    = exe_valid_nxt & !exe_freeze;
  end // exe_ctrl_logic_PROC

reg             mem_valid_nxt;
reg             exe_pass;
reg   [31:0]    mem_result_nxt;
reg   [31:0]    mem_data_nxt;
reg             mem_br_taken_nxt;
reg             br_is_taken;
reg   [31:0]    m32_result;
reg   [63:0]    m64_result;

always @*
  begin : exe_datapath_PROC
  
  // We implement the 32x32=>64 integer multiplier logic within the
  // EXE stage using an inferred multiplier. This maps to DSP48
  // modules on a Xilinx FPGA, and is normally fast enough to
  // meet timing at 100 MHz on a xc7z010clg400-3 FPGA part.
  //
  // 1. Extend 32-bit multiplier source operands by one bit to allow
  //    values to be either sign-extended or zero-extended depending
  //    on whether they are to be considered signed or unsigned operands.
  //    mul_src1 is sign-extended for MUL, MULH and MULHSU
  //    mul_src2 is sign-extended for MUL and MULH, although technically
  //    sign-extension vs zero-extension is irrelevant for MUL operations.
  //
  mul_src1    = {(exe_reg1_r[31] & !(&exe_alu_opc_r[1:0])), exe_reg1_r};
  mul_src2    = {(exe_reg2_r[31] & !exe_alu_opc_r[1]),      exe_reg2_r};
  
  // 2. Compute a 64-bit product of mul_src1 x mul_src2, from which
  //    the 32-bit result can be selected according to the type of
  //    mul instruction.
  //
  m64_result  = mul_src1 * mul_src2;

  // Select the 32-bit result from one of the 'M' extension instructions
  // which may be the upper/lower 32 bits of the 64-bit multiplier
  // result (m64_result), or may be the result from the divider module
  // (exe_div_result). The result is undefined if any undefined opcode
  // is encountered. This provided error reporting during simulation,
  // and also enables synthesis to consider such occurences as don't care
  // cases.
  //
  case (exe_alu_opc_r)
    M32_OPC_MUL:    m32_result  = m64_result[31:0];
    M32_OPC_MULH,
    M32_OPC_MULHSU,
    M32_OPC_MULHU:  m32_result  = m64_result[63:32];
    M32_OPC_DIV,
    M32_OPC_DIVU,
    M32_OPC_REM,
    M32_OPC_REMU:   m32_result  = exe_div_result;
    default:        m32_result  = 32'hXXXX_XXXX;
  endcase

  // There are two values to pass from the EXE stage to the MEM stage.
  // These are the result of the ALU or 'M' extension computation
  // and the data value used as store data or the link address for a
  // JALR instruction.
  //
  // 1. Select the mem_result_nxt value from m32_result if the EXE
  //    instruction is an 'M' extension, or from alu_result in all
  //    other cases.
  //
  mem_result_nxt  = exe_m32_op_r ? m32_result : alu_result;
  
  // 2. Select the mem_data_nxt value from exe_reg2_r when the EXE
  //    instruction is a 'store' operation, or from the next PC
  //    value (i.e. PC+4) in all other cases (JALR is assumed).
  //
  mem_data_nxt    = exe_store_r
                  ? exe_reg2_r                        // ... store data
                  : {(exe_pc_r[31:2] + 30'd1), 2'b00} // ... link address
                  ;

  // Compute the relational tests for conditional branch instructions
  // and select the test result that is needed by the branch condition
  // at the EXE stage (if any).
  //
  case (exe_func3_r)
    BEQ_OPC:      br_is_taken = exe_reg1_r == exe_reg2_r;
    BNE_OPC:      br_is_taken = exe_reg1_r != exe_reg2_r;
    BLT_OPC:      br_is_taken = $signed(exe_reg1_r) < $signed(exe_reg2_r);
    BGE_OPC:      br_is_taken = !($signed(exe_reg1_r) < $signed(exe_reg2_r));
    BLTU_OPC:     br_is_taken =   $unsigned(exe_reg1_r) < $unsigned(exe_reg2_r);
    BGEU_OPC:     br_is_taken = !($unsigned(exe_reg1_r) < $unsigned(exe_reg2_r));
    default:      br_is_taken = 1'b0;
  endcase

  mem_valid_nxt     = exe_valid_r & (!exe_freeze);
  exe_pass          = mem_valid_nxt & !wrb_restart;

  // Determine whether a branch or jump is taken or not-taken:
  //  (a) all jump instructions are taken
  //  (b) branch instructions are taken if their condition is true
  //
  mem_br_taken_nxt  = exe_jump_r                      // (a)
                    | (exe_branch_r & br_is_taken)    // (b)
                    ;

  // Pass the load address and command to FCH in cases where the load address
  // targets ICCM (read-only)
  //
  exe_iccm_addr     = alu_result[12:2];
  exe_iccm_load     = exe_valid_r & exe_load_r & !alu_result[13];

  end // exe_datapath_PROC

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Memory Access Stage                                                        //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

reg             mem_valid_r;        // valid instruction at MEM stage
reg             mem_rd_wenb_r;      // rd write enable
reg             mem_load_r;         // Instruction is a LOAD
reg             mem_store_r;        // Instruction is a STORE
reg             mem_branch_r;       // Instruction is a BRANCH
reg             mem_jump_r;         // Instruction is a JUMP
reg             mem_csr_r;          // Instruction is a CSR op
reg             mem_priv_r;         // Instruction is a PRIVileged op
reg             mem_illegal_r;      // unrecognized instruction
reg             mem_predicted_r;    // 1 => MEM stage instr had a prediction

reg   [31:0]    mem_result_r;       // ALU result, address or target at MEM stage
reg   [31:0]    mem_data_r;         // store data or link address at MEM stage
reg   [4:0]     mem_rd_r;           // Destination register address
reg   [11:0]    mem_csr_addr_r;     // CSR address
reg   [2:0]     mem_func3_r;        // sub-opcode (branch, CSR, LD, ST)
reg   [2:0]     mem_index_r;        // ID of branch at MEM stage
reg             mem_pred_taken_r;   // 1 => prediction is to take branch
reg   [2:0]     mem_pred_type_r;    // predicted type of branch
reg   [1:0]     mem_pred_state_r;   // prediction state at MEM stage
reg   [31:0]    mem_pred_target_r;  // predicted PC at MEM stage

reg   [2:0]     mem_branch_type_r;  // actual branch type at MEM
reg             mem_br_taken_r;     // actual branch/jump outcome at MEM

reg             mem_ctrl_cg0;       // plr update enable for ctrl info at MEM
reg             mem_data_cg0;       // plr update enable for data info at MEM
reg             mem_update_bpu;     // MEM instruction updates BPU on commit
reg             mem_mispredict;     // MEM instruction was mispredicted
reg   [2:0]     mem_branch_type;    // actual branch type at MEM stage
reg             mem_mispred_dir;
reg             mem_mispred_tgt;
reg             mem_mispred_typ;
reg             mem_pc_mismatch;

always @(posedge clk or posedge reset)
  begin : mem_ctrl_reg_PROC
  if (reset == 1'b1)
    begin
    mem_valid_r       <= 1'b0;
    mem_rd_wenb_r     <= 1'b0;
    mem_load_r        <= 1'b0;
    mem_store_r       <= 1'b0;
    mem_branch_r      <= 1'b0;
    mem_jump_r        <= 1'b0;
    mem_csr_r         <= 1'b0;
    mem_priv_r        <= 1'b0;
    mem_illegal_r     <= 1'b0;
    //
    mem_predicted_r   <= 1'b0;
    end
  else if (mem_ctrl_cg0 == 1'b1)
    begin
    mem_valid_r       <= mem_valid_nxt    & !wrb_restart;
    mem_rd_wenb_r     <= exe_rd_wenb_r    & exe_pass;
    mem_load_r        <= exe_load_r       & exe_pass;
    mem_store_r       <= exe_store_r      & exe_pass;
    mem_branch_r      <= exe_branch_r     & exe_pass;
    mem_jump_r        <= exe_jump_r       & exe_pass;
    mem_csr_r         <= exe_csr_r        & exe_pass;
    mem_priv_r        <= exe_priv_r       & exe_pass;
    mem_illegal_r     <= exe_illegal_r    & exe_pass;
    //
    mem_predicted_r   <= exe_predicted_r  & exe_pass;
    end
  end // mem_ctrl_reg_PROC

always @(posedge clk)
  begin : mem_data_reg_PROC
  if (mem_data_cg0 == 1'b1)
    begin
    mem_result_r      <= mem_result_nxt;
    mem_data_r        <= mem_data_nxt;
    mem_rd_r          <= exe_rd_r;
    mem_csr_addr_r    <= exe_csr_addr_r;
    mem_func3_r       <= exe_func3_r;
    //
    mem_index_r       <= exe_index_r;
    mem_pred_taken_r  <= exe_pred_taken_r;
    mem_pred_type_r   <= exe_pred_type_r;
    mem_pred_state_r  <= exe_pred_state_r;
    mem_pred_target_r <= exe_pred_target_r;
    //
    mem_br_taken_r    <= mem_br_taken_nxt;
    mem_branch_type_r <= exe_branch_type_r;
    end
  end // mem_data_reg_PROC

always @*
  begin : mem_ctrl_logic_PROC
  mem_freeze      = mem_csr_r & csr_mem_stall;
  mem_ctrl_cg0    = (mem_valid_nxt | mem_valid_r) & (!mem_freeze | wrb_restart);
  mem_data_cg0    = mem_valid_nxt & !mem_freeze;
  
  // a branch or jump direction misprediction occurs if either:
  //  (a) the outcome of a predicted instruction differs from its prediction
  //  (b) taken branch or jump had no prediction
  //
  mem_mispred_dir = mem_predicted_r & (mem_pred_taken_r != mem_br_taken_r)
                  | (mem_br_taken_r & !mem_predicted_r)
                  ;

  // a branch or jump target misprediction occurs if either:
  //  (a) the target of a predicted instruction differs from its actual target
  //  (b) a taken branch or jump had no prediction, and thus no predicted target
  //
  mem_mispred_tgt = mem_predicted_r & (mem_pred_target_r != mem_result_r)
                  | (mem_br_taken_r & !mem_predicted_r)
                  ;

  // a branch or jump type misprediction occurs if either:
  //  (a) the type of a predicted instruction differs from its actual type
  //  (b) a taken branch or jump had no prediction, and thus no predicted type
  //
  mem_mispred_typ =  mem_predicted_r & (mem_pred_type_r != mem_branch_type_r)
                  | (mem_br_taken_r & !mem_predicted_r)
                  ;
  
  mem_mispredict  = mem_valid_r
                  & (   mem_mispred_dir
                      | mem_mispred_tgt
                      | mem_mispred_typ
                    )
                  ; 

  // update the prediction for this instruction if it had a prediction or
  // if it was mispredicted for any reasons.
  //
  mem_update_bpu  = mem_predicted_r
                  | mem_mispredict
                  ;

  end // mem_ctrl_logic_PROC

////////////////////////////////////////////////////////////////////////////////
// Data Closely Couple Memory - DCCM  - straddling the EXE and MEM stages     //
////////////////////////////////////////////////////////////////////////////////

reg             exe_dccm_cen;       // DCCM memory enable signal at EXE
reg   [3:0]     exe_dccm_wenb;      // write enables for each byte-lane
reg   [11:2]    exe_dccm_addr;      // muxed address for DCCM RAMs
reg   [31:0]    exe_dccm_din;       // muxed data-in for DCCM RAMs
wire  [31:0]    mem_dccm_dout;      // data-out from DCCM RAMs

wire            stq_mem_req;        // retire request from STQ
reg             stq_mem_ack;        // 1 => retire store, 0 => no retire
wire  [11:2]    stq_mem_addr;       // retirement address from STQ to MEM
wire  [31:0]    stq_mem_data;       // retirement data from STQ to MEM
wire  [3:0]     stq_mem_wenb;       // retirement byte writes from STQ to MEM
reg   [11:2]    mem_ld_addr;        // load address from MEM to STQ
reg   [31:0]    mem_ld_data;        // load data before STQ forwarding
wire  [31:0]    stq_ld_data;        // load data after STQ forwarding
reg   [31:0]    ld_data;            // final aligned and extended load data

reg             wrb_valid_nxt;      // valid inst from MEM to WRB
reg             wrb_rd_wenb_nxt;    // valid writeback from MEM to WRB
reg   [31:0]    wrb_rd_wdata_nxt;   // result data from MEM to WRB
reg             wrb_restart_nxt;    // restart pipe on the next clock
reg             wrb_update_bpu_nxt; // MEM->WRB will update BPU next clock
reg             wrb_was_pred_nxt;   // 1 iff next WRB instr had a prediction

reg             take_exception;     // core takes an exception
reg             take_interrupt;     // core takes an interrupt
reg             mem_commit_inst;    // commit MEM-stage instruction
reg             mem_do_replay;      // MEM instruction must be replayed
reg             mem_core_restart;   // non-stallable core restart
reg             mem_inst_restart;   // instruction restart, can stall at MEM

always @*
  begin : mem_read_PROC

  stq_mem_ack   = stq_mem_req & !exe_load_r;

  exe_dccm_cen  = stq_mem_req | exe_load_r;

  if (stq_mem_ack)
    begin
    exe_dccm_addr = stq_mem_addr;
    exe_dccm_din  = stq_mem_data;
    exe_dccm_wenb = stq_mem_wenb;
    end
  else
    begin
    exe_dccm_addr = alu_result[11:2];
    exe_dccm_din  = 32'hXXXXXXXX;
    exe_dccm_wenb = 4'b0000;
    end

  // Load address at MEM stage for STQ module bypass checks
  //
  mem_ld_addr   = mem_result_r[11:2];
  
  // Load data can come from DCCM (normally) or from ICCM,
  // depending on address range.
  //
  mem_ld_data   = mem_result_r[MEM_DCCM_SEL] ? mem_dccm_dout : fch_iccm_dout;

  // Align and extend the load data result according to the size,
  // type, and low-order address bits.
  //
  casez ({mem_func3_r, mem_result_r[1:0]})
   {LBU_OPC, 2'b00}: ld_data = {24'd0, stq_ld_data[7:0]  };
   {LBU_OPC, 2'b01}: ld_data = {24'd0, stq_ld_data[15:8] };
   {LBU_OPC, 2'b10}: ld_data = {24'd0, stq_ld_data[23:16]};
   {LBU_OPC, 2'b11}: ld_data = {24'd0, stq_ld_data[31:24]};
   //
   {LB_OPC,  2'b00}: ld_data = {{24{stq_ld_data[7]}},  stq_ld_data[7:0]  };
   {LB_OPC,  2'b01}: ld_data = {{24{stq_ld_data[15]}}, stq_ld_data[15:8] };
   {LB_OPC,  2'b10}: ld_data = {{24{stq_ld_data[23]}}, stq_ld_data[23:16]};
   {LB_OPC,  2'b11}: ld_data = {{24{stq_ld_data[31]}}, stq_ld_data[31:24]};
   //
   {LHU_OPC, 2'b0?}: ld_data = {16'd0, stq_ld_data[15:0] };
   {LHU_OPC, 2'b1?}: ld_data = {16'd0, stq_ld_data[31:16]};
   //
   {LH_OPC,  2'b0?}: ld_data = {{16{stq_ld_data[15]}}, stq_ld_data[15:0] };
   {LH_OPC,  2'b1?}: ld_data = {{16{stq_ld_data[31]}}, stq_ld_data[31:16]};
   //
   {LW_OPC,  2'b??}: ld_data = stq_ld_data;
   //
   default:          ld_data = 32'hXXXX_XXXX; // don't care case
  endcase

  // Select the MEM-stage result depending on whether it is a Load instruction
  // or a non-Load instruction. A jump instruction sets the MEM-stage result
  // to the link value contained in mem_data_r, whereas non-jump instructions
  // returm the ALU result contained in mem_result_r.
  //
  wrb_rd_wdata_nxt    = mem_load_r 
                      ? ld_data
                      : (   mem_jump_r
                          ? mem_data_r
                          : (csr_valid_op ? csr_rdata : mem_result_r)
                        )
                      ;
  
  mem_pc_mismatch     = mem_valid_r & (mem_pc_r != nxt_pc_r);

  // @@@ TBD - detect exceptions and interrupts
  //
  take_exception      = 1'b0;
  take_interrupt      = 1'b0;
  
  // @@@ TBD - figure out when a replay is needed
  //
  mem_do_replay       = 1'b0;

  // restart the pipeline in the next cycle if any of the following events
  // are active in the current cycle
  //
  // ------------- events where MEM does not commit ----------------------------
  // (a) this is the first cycle after reset is rescinded
  // (b) an exception is raised on the MEM-stage instruction
  // (c) an interrupt is to be taken
  // (d) the current MEM-stage instruction should be replayed
  // (e) the MEM-stage PC does not match the expected next PC
  // ------------- events where MEM does commit --------------------------------
  // (f) the current MEM-stage instruction has a branch misprediction
  //
  mem_core_restart    = (!done_reset_r)       // (a)
                      | take_exception        // (b)
                      | take_interrupt        // (c)
                      ;
  mem_inst_restart    = mem_do_replay         // (d)
                      | mem_pc_mismatch       // (e)
                      | mem_mispredict        // (f)
                      ;

  mem_commit_inst     = mem_valid_r
                      & !mem_freeze
                      & !mem_do_replay
                      & !wrb_restart
                      & !mem_core_restart
                      ;

  wrb_valid_nxt       = mem_valid_r   & mem_commit_inst;
  wrb_rd_wenb_nxt     = mem_rd_wenb_r & mem_commit_inst;

  wrb_restart_nxt     = mem_core_restart
                      | (mem_inst_restart & !mem_freeze)
                      | run_cmd_val
                      ;

  wrb_update_bpu_nxt  = mem_update_bpu & mem_commit_inst;
  
  wrb_was_pred_nxt    = mem_predicted_r;

  commit_evt          = mem_commit_inst
                      | take_exception
                      | take_interrupt
                      ;

  commit_ebreak       = mem_commit_inst
                      & mem_priv_r
                      & (mem_func3_r    == SYS_PRIV_OP)
                      & (mem_csr_addr_r == PRIV_EBREAK_OP)
                      ;

  commit_ecall        = mem_commit_inst
                      & mem_priv_r
                      & (mem_func3_r    == SYS_PRIV_OP)
                      & (mem_csr_addr_r == PRIV_ECALL_OP)
                      ;

  end // mem_read_PROC

reg   [3:0]     sb_wenb;
reg   [3:0]     sh_wenb;
reg   [3:0]     sw_wenb;

reg             mem_stq_commit; // store instruction commits this cycle
reg   [31:0]    mem_stq_data;   // store data committing this cycle
reg   [11:2]    mem_stq_addr;   // address of store committing this cycle
reg   [3:0]     mem_stq_wenb;   // byte-lane enables of committing store

always @*
  begin : mem_st_logic_PROC

  case (mem_result_r[1:0])
    2'b00: sb_wenb = 4'b0001;
    2'b01: sb_wenb = 4'b0010;
    2'b10: sb_wenb = 4'b0100;
    2'b11: sb_wenb = 4'b1000;
  endcase

  sh_wenb = mem_result_r[1] ? 4'b1100 : 4'b0011;
  sw_wenb = 4'b1111;
  
  case ({mem_store_r, mem_func3_r})
    {1'b1, SB_OPC}:  mem_stq_wenb = sb_wenb;
    {1'b1, SH_OPC}:  mem_stq_wenb = sh_wenb;
    {1'b1, SW_OPC}:  mem_stq_wenb = sw_wenb;
    default:         mem_stq_wenb = 4'b0000;
  endcase

  case (mem_func3_r)
    SB_OPC:  mem_stq_data = { mem_data_r[7:0],
                              mem_data_r[7:0],
                              mem_data_r[7:0],
                              mem_data_r[7:0]
                            };
    SH_OPC:  mem_stq_data = { mem_data_r[15:0],
                              mem_data_r[15:0]
                            };
    SW_OPC:  mem_stq_data = mem_data_r;
    default: mem_stq_data = 32'hXXXX_XXXX; // don't care case
  endcase

  mem_stq_commit    = mem_store_r & !mem_do_replay & !mem_freeze & !wrb_restart;
  
  mem_stq_addr      = mem_result_r[11:2];
  
  end // mem_logic_PROC

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Writeback Stage                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

reg             wrb_restart_r;      // flush pipeline and goto nxt_pc_r
reg             wrb_valid_r;        // valid instruction at WRB stage

reg             wrb_ctrl_cg0;       // plr update enable for ctrl info at WRB
reg             wrb_data_cg0;       // plr update enable for data info at WRB

// branch prediction update indicator
reg             wrb_update_bpu_r;   // 1 => report branch or prediction outcome
reg             wrb_was_pred_r;     // 1 => update pred; 0 => initialize pred
reg   [1:0]     wrb_pred_state_r;   // prediction state at WRB stage
reg   [3:0]     wrb_index_r;        // ID of branch to report to BPU
// branch misprediction indicators
reg             wrb_mispred_dir_r;  // 1 => branch outcome was mispredicted
reg             wrb_mispred_typ_r;  // 1 => prediction had incorrect branch type
reg             wrb_mispred_tgt_r;  // 1 => branch/jump target was mispredicted
// actual branch outcome indicators
reg             wrb_direction_r;    // actual outcome of branch condition
reg   [2:0]     wrb_branch_type_r;  // actual type of branch
reg   [31:0]    wrb_target_r;       // actual target of branch/jump

always @(posedge clk or posedge reset)
  begin : wrb_ctrl_reg_PROC
  if (reset == 1'b1)
    begin
    wrb_valid_r       <= 1'b0;
    wrb_rd_wenb_r     <= 1'b0;
    wrb_update_bpu_r  <= 1'b0;
    wrb_was_pred_r    <= 1'b0;
    wrb_restart_r     <= 1'b0;
    end
  else
    begin
      wrb_restart_r  <= wrb_restart_nxt & !wrb_restart;
      if (wrb_ctrl_cg0 == 1'b1)
        begin
        wrb_valid_r       <= wrb_valid_nxt;
        wrb_rd_wenb_r     <= wrb_rd_wenb_nxt;
        wrb_update_bpu_r  <= wrb_update_bpu_nxt;
        wrb_was_pred_r    <= wrb_was_pred_nxt;
        end
    end
  end // wrb_ctrl_reg_PROC


always @(posedge clk)
  begin : wrb_data_reg_PROC
  if (wrb_data_cg0 == 1'b1)
    begin
    wrb_rd_wdata_r    <= wrb_rd_wdata_nxt;
    wrb_rd_r          <= mem_rd_r;
    //
    wrb_index_r       <= mem_index_r;
    wrb_pred_state_r  <= mem_pred_state_r;
    wrb_mispred_dir_r <= mem_mispred_dir;
    wrb_mispred_typ_r <= mem_mispred_typ;
    wrb_mispred_tgt_r <= mem_mispred_tgt;
    wrb_direction_r   <= mem_br_taken_r;
    wrb_branch_type_r <= mem_branch_type_r;
    wrb_target_r      <= mem_result_r;
    end
  end // wrb_data_reg_PROC

always @*
  begin : wrb_ctrl_logic_PROC
  wrb_ctrl_cg0    = (wrb_valid_nxt | wrb_valid_r);
  wrb_data_cg0    = wrb_valid_nxt;
  end // wrb_ctrl_logic_PROC

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Instantiate module to perform register bypass and detect dependency stalls //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

bypass_or_stall u_bypass_or_stall(

  //==== DEC-stage source operands  ============================================
  //
  .dec_rs1          (dec_rs1        ), // first source operand register address
  .dec_rs1_renb     (dec_rs1_renb   ), // 1 => rs1 is used, 0 => rs1 is unused
  .dec_rdata1       (dec_rdata1     ), // R[rs1] from register file
  //
  .dec_rs2          (dec_rs2        ), // second source operand register address
  .dec_rs2_renb     (dec_rs2_renb   ), // 1 => rs2 is used, 0 => rs2 is unused
  .dec_rdata2       (dec_rdata2     ), // R[rs2] from register file

  //==== EXE-stage instruction information  ====================================
  //
  .exe_rd           (exe_rd_r       ), // EXE destination operand register address
  .exe_rd_wenb      (exe_rd_wenb_r  ), // 1 => rd is written, 0 => rd not written
  .exe_result       (alu_result     ), // result at EXE stage, destined for R[rd]
//  .exe_result       (mem_result_nxt ), // result at EXE stage, destined for R[rd]
  .exe_load         (exe_load_r     ), // EXE instruction is a Load operation
  .exe_csr          (exe_csr_r      ), // EXE instruction is a CSRRs operation
  .exe_m32          (exe_m32_op_r   ),

  //==== MEM-stage instruction information  ====================================
  //
  .mem_rd           (mem_rd_r       ), // MEM destination operand register address
  .mem_rd_wenb      (mem_rd_wenb_r  ), // 1 => rd is written, 0 => rd not written
  .mem_result       (wrb_rd_wdata_nxt),// result at MEM stage, destined for R[rd]

  //==== WRB-stage instruction information  ====================================
  //
  .wrb_rd           (wrb_rd_r       ), // WRB destination operand register address
  .wrb_rd_wenb      (wrb_rd_wenb_r  ), // 1 => rd is written, 0 => rd not written
  .wrb_result       (wrb_rd_wdata_r ), // result at WRB stage, destined for R[rd]

  //==== Outputs to stall DEC stage and provide forwarded results ==============
  //
  .dec_stall        (dec_stall      ), // 1 => stall DEC, 0 => no stall at DEC
  .dec_load_use     (dec_load_use   ), // DEC stall due to Load use with MEM
  .dec_csr_use      (dec_csr_use    ), // DEC stall due to CSR use with MEM
  .dec_rs1_data     (dec_rs1_data   ), // R[rs1] value to pass on to EXE stage
  .dec_rs2_data     (dec_rs2_data   )  // R[rs2] value to pass on to EXE stage
);

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Instantiate the Store Queue module                                         //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

store_queue #(11) u_store_queue (
  .clk              (clk            ), // external clock source
  .reset            (reset          ), // async reset input

  //==== store commit interface ================================================
  //
  .mem_stq_commit   (mem_stq_commit ), // store instruction commits this cycle
  .mem_stq_data     (mem_stq_data   ), // store data committing this cycle
  .mem_stq_addr     (mem_stq_addr   ), // address of store committing this cycle
  .mem_stq_wenb     (mem_stq_wenb   ), // byte-lane enables of committing store

  //==== store retirement interface ============================================
  //
  .stq_mem_req      (stq_mem_req    ), // request to retire from store queue
  .stq_mem_ack      (stq_mem_ack    ), // permission to retire is granted
  //
  .stq_mem_data     (stq_mem_data   ), // store data to retire to memory
  .stq_mem_addr     (stq_mem_addr   ), // store address in memory to retire
  .stq_mem_wenb     (stq_mem_wenb   ), // byte-lane enables for memory store

  //==== store forwarding interface ============================================
  //
  .mem_ld_addr      (mem_ld_addr    ), // load address (word aligned)
  .mem_ld_data      (mem_ld_data    ), // load data pre-forwarding
  .stq_ld_data      (stq_ld_data    )  // load data post-forwarding
);

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Instantiate the DCCM RAM module                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

dccm_ram #(1024,                       // number of 32-bit words
             11,                       // most-significant address bit
              2)                       // least-significant address bit
u_dccm_ram (
  .clk              (clk            ), // external clock source
  .dccm_cen         (exe_dccm_cen   ), // RAM enable signal
  .dccm_addr        (exe_dccm_addr  ), // read/write address
  .dccm_wenb        (exe_dccm_wenb  ), // write enables
  .dccm_din         (exe_dccm_din   ), // write data input
  .dccm_dout        (mem_dccm_dout  )  // read data output
);

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Program Counter pipeline                                                   //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

wire  [31:0]    dec_pc;
wire  [31:0]    exe_pc;
wire  [31:0]    mem_pc;
wire  [31:0]    nxt_pc;

reg   [31:2]    dec_pc_nxt;
reg   [31:2]    exe_pc_nxt;
reg   [31:2]    mem_pc_nxt;
reg   [31:2]    wrb_pc_nxt;
reg   [31:2]    nxt_pc_nxt;
reg             nxt_pc_cg0;

assign dec_pc = dec_valid_r ? {dec_pc_r, 2'b00} : 32'hXXXXXXXX;
assign exe_pc = exe_valid_r ? {exe_pc_r, 2'b00} : 32'hXXXXXXXX;
assign mem_pc = mem_valid_r ? {mem_pc_r, 2'b00} : 32'hXXXXXXXX;
assign wrb_pc = wrb_valid_r ? {wrb_pc_r, 2'b00} : 32'hXXXXXXXX;
assign nxt_pc = {nxt_pc_r, 2'b00};

always @*
  begin : pc_pipe_logic_PROC
  
  dec_pc_nxt  = fch_pc[31:2];
  exe_pc_nxt  = dec_pc_r;
  mem_pc_nxt  = exe_pc_r;
  wrb_pc_nxt  = mem_pc_r;
  
  // nxt_pc_nxt defines the architectural PC of the next instruction to be
  // committed on transition from MEM -> WRB. This may be any of the following:
  //
  // 1. ------------ cases where an exceptional event happens ------------------
  //  (a) the reset entry point, when first starting after reset
  //  (b) exception entry address, if an exception is taken
  //  (c) interrupt entry address, if an interrupt is taken
  //  (d) nxt_pc_r, if replaying the instruction or resuming after EBREAK
  //     (this can happen if mem_pc_r != nxt_pc_r, and is implemented by not
  //      enabling an update to nxt_pc_c)
  //
  // 2. ------------- cases where current MEM instruction commits normally -----
  //  (e) the target of a branch/jump instruction, if branch/jump is taken
  //  (f) nxt_pc_r + 4, if current instruction does not branch or jump (default)
  //
  // If the MEM-stage instruction is a branch that commits normally, then we are
  // sure that the target is computed correctly.
  //
  casez ({  done_reset_r,                       // (a)
            take_exception,                     // (b)
            take_interrupt,                     // (c)
            mem_br_taken_r                      // (e)
        })
    4'b0???:  nxt_pc_nxt  = RESET_VECTOR;       // (a)
    4'b11??:  nxt_pc_nxt  = EXCPN_VECTOR;       // (b)
    4'b101?:  nxt_pc_nxt  = INT_VECTOR;         // (c)
    4'b1001:  nxt_pc_nxt  = mem_result_r[31:2]; // (e)
    default:  nxt_pc_nxt  = nxt_pc_r + 30'd1;   // (f)
  endcase

  nxt_pc_cg0  = !done_reset_r                   // (a)
              | take_exception                  // (b)
              | take_interrupt                  // (c)
              | mem_commit_inst                 // (e,f)
              ;

  end // pc_pipe_logic_PROC

always @(posedge clk or posedge reset)
  begin : pc_pipe_reg_PROC
  if (reset == 1'b1)
    begin
    dec_pc_r  <= 30'd0;
    exe_pc_r  <= 30'd0;
    mem_pc_r  <= 30'd0;
    wrb_pc_r  <= 30'd0;
    nxt_pc_r  <= 30'd0;    
    end
  else
    begin
    if (dec_inst_cg0)     dec_pc_r <= dec_pc_nxt;
    if (exe_data_cg0)     exe_pc_r <= exe_pc_nxt;
    if (mem_data_cg0)     mem_pc_r <= mem_pc_nxt;
    if (mem_commit_inst)  wrb_pc_r <= wrb_pc_nxt;
    if (nxt_pc_cg0)       nxt_pc_r <= nxt_pc_nxt;
    end
  end // pc_pipe_reg_PROC

always @(posedge clk or posedge reset)
  begin : reset_reg_PROC
  if (reset)
    done_reset_r <= 1'b0;
  else
    done_reset_r <= 1'b1;
  end

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Performance Monitoring within the execution pipeline                       //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

reg   [3:0]     dec_dep_ctr_r;      // count of dependency stalls at DEC stage
reg   [3:0]     exe_dep_ctr_r;      // count of dependency stalls at EXE stage
reg   [3:0]     mem_dep_ctr_r;      // count of dependency stalls at MEM stage
reg   [3:0]     wrb_dep_ctr_r;      // count of dependency stalls at WRB stage

reg   [3:0]     dec_dep_ctr_nxt;    // next value for dec_dep_ctr_r
reg   [3:0]     exe_dep_ctr_nxt;    // next value for exe_dep_ctr_r
reg   [3:0]     mem_dep_ctr_nxt;    // next value for mem_dep_ctr_r
reg   [3:0]     wrb_dep_ctr_nxt;    // next value for wrb_dep_ctr_r

reg   [3:0]     dec_pm_code_r;      // reason code for dep stalls at DEC stage
reg   [3:0]     exe_pm_code_r;      // reason code for dep stalls at EXE stage
reg   [3:0]     mem_pm_code_r;      // reason code for dep stalls at MEM stage
reg   [3:0]     wrb_pm_code_r;      // reason code for dep stalls at WRB stage

reg   [3:0]     dec_pm_code_nxt;    // next reason code for stalls at DEC stage
reg   [3:0]     exe_pm_code_nxt;    // next reason code for stalls at EXE stage
reg   [3:0]     mem_pm_code_nxt;    // next reason code for stalls at MEM stage
reg   [3:0]     wrb_pm_code_nxt;    // next reason code for stalls at WRB stage

reg   [5:0]     exe_div_ctr_r;      // divider stalls at EXE stage
reg   [5:0]     mem_div_ctr_r;      // divider stalls at MEM stage
reg   [5:0]     wrb_div_ctr_r;      // divider stalls at WRB stage

reg   [5:0]     exe_div_ctr_nxt;    // next value for exe_div_ctr_r
reg   [5:0]     mem_div_ctr_nxt;    // next value for mem_div_ctr_r
reg   [5:0]     wrb_div_ctr_nxt;    // next value for wrb_div_ctr_r

reg             dec_pm_cg0;         // enables PM state at DEC stage
reg             exe_pm_cg0;         // enables PM state at EXE stage
reg             mem_pm_cg0;         // enables PM state at MEM stage
reg             wrb_pm_cg0;         // enables PM state at WRB stage

always @*
  begin : exec_pm_logic_PROC
  
  case ({exe_freeze, dec_load_use, dec_csr_use})
    3'b010:   dec_pm_code_nxt = PM_CYC_USE_LD;
    3'b001:   dec_pm_code_nxt = PM_CYC_USE_CSR;
    default:  dec_pm_code_nxt = PM_CYC_UNKNOWN;
  endcase
  
  exe_pm_code_nxt = dec_pass        ? dec_pm_code_r : PM_CYC_UNKNOWN;
  mem_pm_code_nxt = exe_pass        ? exe_pm_code_r : PM_CYC_UNKNOWN;
  wrb_pm_code_nxt = mem_commit_inst ? mem_pm_code_r : PM_CYC_UNKNOWN;
  
  dec_dep_ctr_nxt = (dec_stall & !exe_freeze & !wrb_restart)
                  ? (dec_dep_ctr_r + 4'd1)
                  : 4'd0;

  exe_dep_ctr_nxt = dec_pass        ? dec_dep_ctr_r : 4'd0;
  mem_dep_ctr_nxt = exe_pass        ? exe_dep_ctr_r : 4'd0;
  wrb_dep_ctr_nxt = mem_commit_inst ? mem_dep_ctr_r : 4'd0;

  exe_div_ctr_nxt = (exe_div_busy & !wrb_restart)
                  ? (exe_div_ctr_r + 6'd1)
                  : 6'd0;

  mem_div_ctr_nxt = exe_pass        ? exe_div_ctr_r : 6'd0;
  wrb_div_ctr_nxt = mem_commit_inst ? mem_div_ctr_r : 6'd0;
  
  dec_pm_cg0      = dec_valid_nxt | dec_valid_r | wrb_restart;
  exe_pm_cg0      = exe_valid_nxt | exe_valid_r | wrb_restart;
  mem_pm_cg0      = mem_valid_nxt | mem_valid_r | wrb_restart;
  wrb_pm_cg0      = wrb_valid_nxt | wrb_valid_r | wrb_restart;
  
  end // exec_pm_logic_PROC

always @(posedge clk or posedge reset)
  begin : exec_pm_reg_PROC
  if (reset)
    begin
    dec_dep_ctr_r = 4'd0;
    exe_dep_ctr_r = 4'd0;
    mem_dep_ctr_r = 4'd0;
    wrb_dep_ctr_r = 4'd0;
    dec_pm_code_r = PM_CYC_UNKNOWN;
    exe_pm_code_r = PM_CYC_UNKNOWN;
    mem_pm_code_r = PM_CYC_UNKNOWN;
    wrb_pm_code_r = PM_CYC_UNKNOWN;
    exe_div_ctr_r = 6'd0;
    mem_div_ctr_r = 6'd0;
    wrb_div_ctr_r = 6'd0;
    end
  else
    begin
    if (dec_pm_cg0)
      begin
      dec_dep_ctr_r <= dec_dep_ctr_nxt;
      dec_pm_code_r <= dec_pm_code_nxt;
      end
    if (exe_pm_cg0)
      begin
      exe_dep_ctr_r <= exe_dep_ctr_nxt;
      exe_pm_code_r <= exe_pm_code_nxt;
      exe_div_ctr_r <= exe_div_ctr_nxt;
      end
    if (mem_pm_cg0)
      begin
      mem_dep_ctr_r <= mem_dep_ctr_nxt;
      mem_pm_code_r <= mem_pm_code_nxt;
      mem_div_ctr_r <= mem_div_ctr_nxt;
      end
    if (wrb_pm_cg0)
      begin
      wrb_dep_ctr_r <= wrb_dep_ctr_nxt;
      wrb_pm_code_r <= wrb_pm_code_nxt;
      wrb_div_ctr_r <= wrb_div_ctr_nxt;
      end
    end
  end // exec_pm_logic_PROC

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Output assignments                                                         //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

assign wrb_restart      = wrb_restart_r;
assign wrb_restart_pc   = {nxt_pc_r, 2'b00};
assign wrb_update_bpu   = wrb_update_bpu_r;
assign wrb_was_pred     = wrb_was_pred_r;
assign wrb_pred_state   = wrb_pred_state_r;
assign wrb_index        = wrb_index_r;
assign wrb_mispred_dir  = wrb_mispred_dir_r;
assign wrb_mispred_typ  = wrb_mispred_typ_r;
assign wrb_mispred_tgt  = wrb_mispred_tgt_r;
assign wrb_direction    = wrb_direction_r;
assign wrb_branch_type  = wrb_branch_type_r;
assign wrb_target       = wrb_target_r;

assign csr_valid_op     = mem_csr_r;
assign csr_commit_op    = mem_csr_r & mem_commit_inst;
assign csr_addr         = mem_csr_addr_r;
assign csr_opc          = mem_func3_r;
assign csr_wdata        = mem_result_r;

endmodule
