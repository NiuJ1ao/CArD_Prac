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
// Description:    instruction decoder for RISC-V core
// 
// Dependencies:   params.v
// 
////////////////////////////////////////////////////////////////////////////////

module decoder(
  input       [31:0]  inst,             // RISC-V instruction to be decoded
  //
  output reg  [4:0]   dec_rs1,          // First source register address
  output reg  [4:0]   dec_rs2,          // Second source register address
  output reg  [4:0]   dec_rd,           // Destination register address
  output reg  [31:0]  dec_imm,          // Immediate operand
  output reg  [11:0]  dec_csr_addr,     // CSR address
  output reg  [3:0]   dec_alu_opc,      // ALU operation code
  output reg  [2:0]   dec_func3,        // sub-opcode (branch, CSR, LD, ST)
  output reg          dec_sel_pc,       // first source operand is PC versus rs1
  output reg          dec_sel_imm,      // second source operand is imm versus rs2
  //
  output reg          dec_rd_wenb,      // rd write enable
  output reg          dec_rs1_renb,     // rs1 read enable
  output reg          dec_rs2_renb,     // rs2 read enable
  //
  output reg          dec_load,         // Instruction is a LOAD
  output reg          dec_store,        // Instruction is a STORE
  output reg          dec_branch,       // Instruction is a BRANCH
  output reg          dec_jump,         // Instruciton is a JUMP
  output reg          dec_csr,          // Instruction is a CSR op
  output reg          dec_priv,         // Instruction is a PRIVileged op
  output reg          dec_m32_op,       // 32-bit 'M' extension for MUL/DIV
  output reg          dec_illegal       // unrecognized instruction
);

`include "params.v"

localparam I_IMM_EXT = 21;
localparam S_IMM_EXT = 21;
localparam B_IMM_EXT = 20;
localparam J_IMM_EXT = 12;
localparam C_IMM_EXT = 27;

reg             isgn;
reg   [31:0]    i_fmt_imm;
reg   [31:0]    s_fmt_imm;
reg   [31:0]    b_fmt_imm;
reg   [31:0]    u_fmt_imm;
reg   [31:0]    j_fmt_imm;
reg   [31:0]    c_fmt_imm;
reg             func1;
reg   [2:0]     func3;
reg   [6:0]     func7;
reg             rd_not_x0;
reg             rs1_not_x0;
reg             rs2_not_x0;

always @*
  begin : decode_PROC

  // Initialize all passive decoder output regs to undefined,
  // as this will allow for maximum logic minimization in
  // the decode logic. 
  // The decode logic has to set these output regs to a defined
  // value for each instruction where the datapath depends
  // on these signals.
  //
  dec_rs1       = 5'bxxxxx;
  dec_rs2       = 5'bxxxxx;
  dec_rd        = 5'bxxxxx;
  dec_alu_opc   = 4'bxxxx;
  dec_func3     = 3'bxxx;
  dec_imm       = 32'hXXXXXXXX;
  dec_csr_addr  = 12'hXXX;

  // Initialize decoder output regs to zero to give a default value
  // for inactive control signals for all instructions.
  //
  dec_illegal   = 1'b0;
  dec_sel_pc    = 1'b0;
  dec_sel_imm   = 1'b0;
  dec_rs1_renb  = 1'b0;
  dec_rs2_renb  = 1'b0;
  dec_rd_wenb   = 1'b0;
  dec_load      = 1'b0;
  dec_store     = 1'b0;
  dec_branch    = 1'b0;
  dec_jump      = 1'b0;
  dec_csr       = 1'b0;
  dec_priv      = 1'b0;
  dec_m32_op    = 1'b0;

  // Extract fixed fields from the instruction
  //
  isgn      = inst[31];
  func1     = inst[30];
  func3     = inst[14:12];
  func7     = inst[31:25];
  
  // Extract the immediate values that may be needed during decoding
  //
  i_fmt_imm = { {I_IMM_EXT{isgn}}, inst[30:25], inst[24:21], inst[20] };
  s_fmt_imm = { {S_IMM_EXT{isgn}}, inst[30:25], inst[11:8],  inst[7] };
  b_fmt_imm = { {B_IMM_EXT{isgn}}, inst[7], inst[30:25],  inst[11:8], 1'b0 };
  u_fmt_imm = { inst[31:12], 12'd0 };
  j_fmt_imm = { {J_IMM_EXT{isgn}}, inst[19:12], inst[20], inst[30:21], 1'b0 };
  c_fmt_imm = { {C_IMM_EXT{1'b0}}, inst[19:15] };

  // Decode the instruction and set the decoder output regs accordingly
  //
  case (inst[1:0])
    2'b11: // catch all of the 32-bit RISC-V encodings
      begin
      dec_rs1     = inst[19:15];
      dec_rs2     = inst[24:20];
      dec_rd      = inst[11:7];
      rd_not_x0   = (dec_rd  != X0_REG);
      rs1_not_x0  = (dec_rs1 != X0_REG);
      rs2_not_x0  = (dec_rs2 != X0_REG);
      
      case (inst[6:2])
        OP_R_FORMAT: // 5'b01100
          begin
          dec_alu_opc   = {func1, func3};
          dec_m32_op    = inst[25];
          dec_rd_wenb   = rd_not_x0;
          dec_rs1_renb  = rs1_not_x0;
          dec_rs2_renb  = rs2_not_x0;
          end

        OP_I_FORMAT: // 5'b00100
          begin
          dec_alu_opc   = {1'b0, func3};
          dec_rd_wenb   = rd_not_x0;
          dec_rs1_renb  = rs1_not_x0;
          dec_sel_imm   = 1'b1;
          dec_imm       = i_fmt_imm;
          end

        JR_I_FORMAT: // 5'b11001
          begin
          if ({1'b0, func3} != ALU_OPC_ADD)       // catch unused sub-opcodes
            dec_illegal = 1'b1;                   // ... and mark as illegal
          else                                    // else valid jump instruction
            dec_jump    = 1'b1;                   // ... where result = PC + 4
          //
          dec_alu_opc   = ALU_OPC_ADD;            // ALU computes jump target
          dec_rd_wenb   = rd_not_x0;              // R[rd] <= result if rd != X0
          dec_rs1_renb  = rs1_not_x0;             // read from rs1 if not X0
          dec_sel_imm   = 1'b1;                   // second source is immediate
          dec_imm       = i_fmt_imm;              // immediate is i_fmt_imm
          end

        JR_U_FORMAT: // 5'b11011
          begin
          dec_jump      = 1'b1;                   // instruction result = PC + 4
          dec_alu_opc   = ALU_OPC_ADD;            // ALU computes jump target
          dec_rd_wenb   = rd_not_x0;              // R[rd] <= result if rd != X0
          dec_sel_pc    = 1'b1;                   // first source is PC
          dec_sel_imm   = 1'b1;                   // second source is immediate
          dec_imm       = j_fmt_imm;              // immediate is j_fmt_imm
          end

        BR_S_FORMAT: // 5'b11000
          begin
          if (    (func3 == F3_UNUSED_2)
               || (func3 == F3_UNUSED_3))         // catch unused sub-opcodes
            dec_illegal = 1'b1;                   // ... and mark as illegal
          else
            dec_branch  = 1'b1;                   // a valid branch instruction
          //
          dec_func3     = func3;                  // get the relational test
          dec_alu_opc   = ALU_OPC_ADD;            // ALU computes branch target
          dec_sel_pc    = 1'b1;                   // first source is PC
          dec_sel_imm   = 1'b1;                   // second source is immediate
          dec_imm       = b_fmt_imm;              // Branches use b_fmt_imm value
          dec_rs1_renb  = rs1_not_x0;             // read R[rs1] for branch test
          dec_rs2_renb  = rs2_not_x0;             // read R[rs2] for branch test
          end

        SYS_I_FORMAT: // 5'b11100
          begin
          dec_func3     = func3;                  // get the sub-opcode
          dec_csr_addr  = inst[31:20];            // get CSR address or code
          case (func3)
            SYS_PRIV_OP:
              begin
              if (rd_not_x0 || rs1_not_x0)        // catch rd, rs1 not X0
                dec_illegal = 1'b1;               // ... and mark as illegal
              else                                // else this is a legal
                dec_priv    = 1'b1;               // ... ECALL or EBREAK
              end
            F3_UNUSED_4:
              dec_illegal   = 1'b1;
            default:
              begin
              dec_csr       = 1'b1;               // this is a CSR instruction
              dec_rd_wenb   = rd_not_x0;          // R[rd] <= CSR if rd != X0
              dec_rs1_renb  = rs1_not_x0          // read rs1 if it is not X0
                            & !func3[2];          //  and instruction uses it
              dec_sel_imm   = func3[2];           // select immediate if needed
              dec_imm       = c_fmt_imm;          // CSR ops use c_fmt_imm
              dec_alu_opc   = ALU_OPC_OR;         // OR src1 or src2 with 0
              end                
          endcase // func3 decode
          end

        LU_I_FORMAT: // 5'b01101
          begin
          dec_alu_opc   = ALU_OPC_OR;             // OR 0 with immediate
          dec_sel_imm   = 1'b1;                   // second source is immediate
          dec_imm       = u_fmt_imm;              // immediate is u_fmt_imm
          dec_rd_wenb   = rd_not_x0;              // write to Rd if it is not X0
          end

        AU_I_FORMAT: // 5'b00101
          begin
          dec_alu_opc   = ALU_OPC_ADD;            // ADD PC and immediate
          dec_sel_pc    = 1'b1;                   // first source is PC
          dec_sel_imm   = 1'b1;                   // second source is immediate
          dec_imm       = u_fmt_imm;              // immediate is u_fmt_imm
          dec_rd_wenb   = rd_not_x0;              // write to Rd if it is not X0
          end

        LW_I_FORMAT: // 5'b00000
          begin
          if (    (func3 == LD_OPC)               // catch unsupported RV64I op
               || (func3 == LWU_OPC)              // catch unsupported RV64I op
               || (func3 == F3_UNUSED_7))         // catch unused sub-opcode
            dec_illegal = 1'b1;                   // ... and mark as illegal
          else
            begin
            dec_load    = 1'b1;                   // a valid LOAD instruction
            dec_rd_wenb = rd_not_x0;              // R[rd] <= data if rd != X0
            end
          //
          dec_func3     = func3;                  // get the type of LOAD inst
          dec_alu_opc   = {1'b0, ALU_OPC_ADD};    // ALU computes effective addr
          dec_rs1_renb  = rs1_not_x0;             // read rs1 if it is not X0
          dec_sel_imm   = 1'b1;                   // second source is immediate
          dec_imm       = i_fmt_imm;              // immediate is i_fmt_imm
          end

        SW_S_FORMAT: // 5'b01000
          begin
          if (    (func3 == SD_OPC)               // catch unsupported RV64I op
               || (func3[2] == 1'b1))             // catch unused sub-opcodes
            dec_illegal = 1'b1;                   // ... and mark as illegal
          else
            dec_store   = 1'b1;                   // a valid STORE instruction
          //
          dec_func3     = func3;                  // get the type of STORE inst
          dec_alu_opc   = {1'b0, ALU_OPC_ADD};    // ALU computes effective addr
          dec_rs1_renb  = rs1_not_x0;             // read rs1 if it is not X0
          dec_rs2_renb  = rs2_not_x0;             // read rs2 if it is not X0
          dec_sel_imm   = 1'b1;                   // second source is immediate
          dec_imm       = s_fmt_imm;              // immediate is s_fmt_imm
          end

        default: // catch all unsupported 16-bit RISC-V encodings
          dec_illegal = 1'b1;
      endcase // inst[6:2]
      end

    default: // catch 16-bit RISC-V encodings, which are not supported
      dec_illegal = 1'b1;

  endcase // inst[1:0]
  end // decode_PROC

endmodule
