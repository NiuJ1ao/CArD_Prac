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
// Description:    Iterative 32-bit integer divider for RISC-V core
// 
////////////////////////////////////////////////////////////////////////////////

module divider(
  input           clk,              // external clock source
  input           reset,            // async reset input
  
  //==== DIV/REM instruction issue interface ===================================
  //
  input           dec_start_div,    // initiate a div or rem instruction
  input   [1:0]   dec_div_opc,      // one of {0: DIV, 1:DIVU, 2:REM, 3:REMU}
  input   [31:0]  dec_src1,         // dividend operand
  input   [31:0]  dec_src2,         // divisor operand
  input   [4:0]   dec_rs1,          // first source register number
  input   [4:0]   dec_rs2,          // second source register number  
  input           wrb_restart,      // 1 => terminate any active operation
  output          div_busy,         // divider unable to accept new operation
  
  //==== DIV/REM result interface ==============================================
  //
  output          div_ready,        // 1 => result is ready to use
  output  [31:0]  div_result        // result of div or rem operation
);

localparam  [1:0] DIV_IDLE  = 2'd0, // divider is idle, can accept new operation
                  DIV_ITER  = 2'd1, // iterating over main divide operation
                  DIV_LAST  = 2'd2, // last cycle, correcting result
                  DIV_DONE  = 2'd3; // previous operation is completed

reg     [1:0]     div_state_r;      // divider FSM state variable
reg     [1:0]     div_state_nxt;    // next value for FSM state variable
reg               div_state_cg0;    // 1 => div_state_r will be updated

reg     [1:0]     div_opc_r;        // one of {0: DIV, 1:DIVU, 2:REM, 3:REMU}
reg     [4:0]     div_rs1_r;        // first source reg of current operation
reg     [4:0]     div_rs2_r;        // second source reg of current operation
reg               div_opc_cg0;      // 1 => div_opc_r will be updated

reg     [31:0]    div_region_r;     // divisor bits not yet shifted out of acc
reg     [31:0]    div_region_nxt;   // next value for div_region_r

reg     [64:0]    div_acc_r;        // accumulator to build quotient/reminder
reg     [64:0]    div_acc_nxt;      // next value for div_acc_r
reg               div_acc_cg0;      // 1 = > div_acc_r will be updated

reg     [31:0]    divisor_r;        // divisor operand
reg     [31:0]    divisor_nxt;      // next value for divisor operand
reg               divisor_cg0;      // 1 = > divisor_r will be updated

reg               sign_rs1_r;       // sign of first source, if signed op
reg               sign_rs2_r;       // sign of second source, if signed op
reg               sign_rs1_nxt;     // next value for sign_rs1_r
reg               sign_rs2_nxt;     // next value for sign_rs2_r

reg     [31:0]    adder_rs1;        // first source for shared add/sub unit
reg     [31:0]    adder_rs2;        // second source for shared add/sub unit
reg     [32:0]    sum_diff;         // computed sum or difference
reg               subtract;         // 1=>subtract, 0=>add
reg               pos_res;          // 1=>positive result in sum_diff
reg               signs_differ;     // signs of dividend and divisor differ

reg               more_ones;        // unshifted divisor bits contain 1s
reg               sum_diff_nz;      // 1=> sum_diff != 32'd0
reg               shift_in;         // value to shift into quotient accumulator
reg               shift_step;       // 1=>update, 0=>restore

always @*
  begin : div_arith_PROC
  
  more_ones     = (div_acc_r[31:0] & ~div_region_r) == 32'd0;

  sign_rs1_nxt  = dec_src1[31] & !dec_div_opc[0];
  sign_rs2_nxt  = dec_src2[31] & !dec_div_opc[0];
  signs_differ  = sign_rs1_r  != sign_rs2_r;
  
  sum_diff      = {1'b0, adder_rs1} + {1'b0, adder_rs2} + subtract;
  pos_res       = div_opc_r[0] ? sum_diff[32] : !sum_diff[31];
  sum_diff_nz   = sum_diff != 32'd0;
  
  shift_in      = (sign_rs1_r ? (pos_res | sum_diff_nz | more_ones) : pos_res)
                ^ sign_rs2_r
                ;

  shift_step    = shift_in != signs_differ;
  
  end // div_arith_PROC

////////////////////////////////////////////////////////////////////////////////
// Synchronous processes to define the flip-flops                             //
////////////////////////////////////////////////////////////////////////////////

always @(posedge clk or posedge reset)
  begin : div_reg_PROC
  if (reset)
    begin
    div_state_r   <= DIV_IDLE;
    div_opc_r     <= 2'b00;
    div_rs1_r     <= 5'd0;
    div_rs2_r     <= 5'd0;
    div_acc_r     <= 65'd0;
    divisor_r     <= 32'd0;
    sign_rs1_r    <= 1'b0;
    sign_rs2_r    <= 1'b0;
    div_region_r  <= 32'd0;
    end
  else
    begin
    if (div_state_cg0)
      div_state_r   <= div_state_nxt;
    if (div_opc_cg0)
      begin
      div_opc_r     <= dec_div_opc;
      div_rs1_r     <= dec_rs1;
      div_rs2_r     <= dec_rs2;
      end
    if (div_acc_cg0)
      begin
      div_acc_r     <= div_acc_nxt;
      div_region_r  <= div_region_nxt;
      end
    if (divisor_cg0)
      begin
      divisor_r     <= divisor_nxt;
      sign_rs1_r    <= sign_rs1_nxt;
      sign_rs2_r    <= sign_rs2_nxt;
      end
    end
  end // div_reg_PROC

////////////////////////////////////////////////////////////////////////////////
// Combinational processes to define the FSM and control signals              //
////////////////////////////////////////////////////////////////////////////////

always @*
  begin : div_logic_PROC
  
  div_state_nxt   = div_state_r;
  divisor_nxt     = dec_src2;
  div_acc_nxt     = div_acc_r;
  div_region_nxt  = div_region_r;
  
  div_state_cg0   = 1'b0;
  div_opc_cg0     = 1'b0;
  div_acc_cg0     = 1'b0;
  divisor_cg0     = 1'b0;
  
  adder_rs1       = div_acc_r[63:32];
  adder_rs2       = ({32{subtract}} ^ divisor_r);
  
  subtract        = !signs_differ;
  
  case (div_state_r)
    DIV_IDLE, // divider is idle, can accept new operation
    DIV_DONE: // or previous operation is completed
      begin
      if (wrb_restart)
        begin
        div_state_cg0   = 1'b1;
        div_state_nxt   = DIV_IDLE;
        end
      else if (dec_start_div)
        begin
        div_opc_cg0     = 1'b1;
        div_state_cg0   = 1'b1;
        if (    (div_state_r == DIV_DONE)
             && (dec_rs1 == div_rs1_r)
             && (dec_rs2 == div_rs2_r)
             && (dec_div_opc[0] == div_opc_r[0]))
          div_state_nxt = DIV_DONE;
        else
          begin
          div_state_nxt   = DIV_ITER;
          div_region_nxt  = 33'd0;
          div_acc_cg0     = 1'b1;
          div_acc_nxt     = {{33{sign_rs1_nxt}}, dec_src1};
          divisor_cg0     = 1'b1;
          divisor_nxt     = dec_src2;
          end
        end
      else if (div_state_r == DIV_DONE)
        begin
        div_state_cg0   = 1'b1;
        div_state_nxt   = DIV_IDLE;
        end
      end
    DIV_ITER: // iterating over main divide operation
      begin
      if (wrb_restart)
        begin
        div_state_cg0   = 1'b1;
        div_state_nxt   = DIV_IDLE;        
        div_acc_cg0     = 1'b1;
        div_acc_nxt     = 65'd0;
        end
      else
        begin
        if (div_region_r[31] == 1'b1)
          begin
          div_state_cg0   = 1'b1;
          div_state_nxt   = DIV_LAST;
          end
        div_acc_cg0     = 1'b1;
        div_acc_nxt     = shift_step
                        ? {sum_diff[31:0], div_acc_r[31:0], shift_in} 
                        : {div_acc_r[63:0], shift_in}
                        ;
        div_region_nxt  = {div_region_r[30:0],  1'b1};
        end
      end
    DIV_LAST: // last cycle, additive correction step
      begin
      div_state_cg0   = 1'b1;
      div_state_nxt   = DIV_DONE;        
      adder_rs1       = div_acc_r[31:0];
      adder_rs2       = {31'd0, signs_differ};
      subtract        = 1'b0;
      div_acc_cg0     = 1'b1;
      div_acc_nxt     = {1'b0, div_acc_r[64:33], sum_diff[31:0]};
      end
  endcase
  
  end

////////////////////////////////////////////////////////////////////////////////
// Output assignments                                                         //
////////////////////////////////////////////////////////////////////////////////

assign div_busy   = (div_state_r == DIV_ITER) || (div_state_r == DIV_LAST);
assign div_result = div_opc_r[1] ? div_acc_r[63:32] : div_acc_r[31:0];
assign div_ready  = (div_state_r == DIV_DONE);

endmodule
