`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2019, Nigel Topham, All rights reserved.
//
// This is an unpublished, proprietary work of Nigel Topham and is fully
// protected under copyright and trade secret law. You may not view, use,
// disclose, or distribute this file or any information contained herein except
// persuant to a valid written license from Nigel Topham.
//
// The entire notice above must be reproduced on all authorized copies.
//
////////////////////////////////////////////////////////////////////////////////
//
// Description:    Testbench for integer RISC-V ALU (RV32I version)
//
//  This module implements a Module Level Verification (MLV) testbench for
//  an RV32I ALU. It randomly selects operations and operands for the DUT
//  to perform and then presents those test vectors to both the DUT and a
//  reference model from an IP library. Any differences are reported.
//
////////////////////////////////////////////////////////////////////////////////

module tb;

//==============================================================================
// You should change macros in this section to control the testbench.
//==============================================================================
//
// You can set the number of cycles of the test by changing NUM_CYCLES
// This should be at least 1000 times the number of instruction types included
// in the simulation. Hence, for your final run this should be set to 10000.
//
localparam NUM_CYCLES    = 10000;     // set the number of iterations of the test
//
// You can enable or disable each of four groups of instructions. The groups
// are:
//  a) Logical operations    { AND, OR, XOR  }
//  b) Additive operations   { ADD, SUB      }
//  c) Set operations        { SLT, SLTU     }
//  d) Shift operations      { SLL, SRL, SRA }
//
// You are expected to implement each group in turn and verify thee correctness
// of each group before moving on to the next one. 
//
// Set the corresponding ENABLE_* localparam to 0 to disable and 1 to enable.
// You must always have at least one of these enabled.
// You can set as many as you wish, and the simulation will create a pseudo
// random mixture of instructions from all of the enabled groups.
//
localparam ENABLE_LOGIC  = 1;        // set to 1 to enable testing of AND/OR/XOR
localparam ENABLE_ADD    = 1;        // set to 1 to enable testing of ADD/SUB
localparam ENABLE_SET    = 1;        // set to 1 to enable testing of SLT/SLTU
localparam ENABLE_SHIFTS = 1;        // set to 1 to enable SLL/SRL/SRA

//==============================================================================
// You do not need to change anything below this line.
//==============================================================================




`include "params.v"                 // include the opcode definitions

localparam NUM_INSTS     = (2*ENABLE_ADD)
                         + (3*ENABLE_LOGIC)
                         + (2*ENABLE_SET)
                         + (3*ENABLE_SHIFTS);

////////////////////////////////////////////////////////////////////////////////
// Declare signals needed to drive the DUT and reference model                //
////////////////////////////////////////////////////////////////////////////////

wire [3:0]          exe_alu_opc_r;  // ALU sub-opcode (defined in params.v)
reg                 exe_sel_pc_r;   // Mux between PC (1) or Xreg rs1 (0)
reg  [31:0]         exe_pc_r;       // PC at the EXE stage
reg  [31:0]         exe_reg1_r;     // Xreg rs1 at the EXE stage
reg  [31:0]         exe_src2_r;     // Second source register at EXE
wire [31:0]         dut_alu_result; // DUT ALU result output
wire [31:0]         ref_alu_result; // Reference ALU result output

////////////////////////////////////////////////////////////////////////////////
// Instantiate the DUT                                                        //
////////////////////////////////////////////////////////////////////////////////

alu dut_alu(
  .exe_alu_opc_r    (exe_alu_opc_r),
  .exe_sel_pc_r     (exe_sel_pc_r),
  .exe_pc_r         (exe_pc_r),
  .exe_reg1_r       (exe_reg1_r),
  .exe_src2_r       (exe_src2_r),
  .alu_result       (dut_alu_result)
);

////////////////////////////////////////////////////////////////////////////////
// Instantiate the Reference Model                                            //
////////////////////////////////////////////////////////////////////////////////

rv32im_alu_0 ref_alu(
  .exe_alu_opc_r    (exe_alu_opc_r),
  .exe_sel_pc_r     (exe_sel_pc_r),
  .exe_pc_r         (exe_pc_r),
  .exe_reg1_r       (exe_reg1_r),
  .exe_src2_r       (exe_src2_r),
  .alu_result       (ref_alu_result)
);

////////////////////////////////////////////////////////////////////////////////
// Declare testbench simulation variables                                     //
////////////////////////////////////////////////////////////////////////////////

reg                 reset;          // system reset
reg                 clk;            // system clock
wire                dut_error;      // 1 => DUT output was wrong
reg  [3:0]          opc_map[0:9];   // mapping from instr to ALU opcode
integer             inst;           // random instruction variable
integer             cycles;         // count of cycles during simulation

////////////////////////////////////////////////////////////////////////////////
// Initialize the opcode map to select operations to be covered in simulation //
////////////////////////////////////////////////////////////////////////////////

integer i;

initial
  begin
  i = 0;
  if (ENABLE_ADD == 1)
    begin
    opc_map[i]   = ALU_OPC_ADD;
    opc_map[i+1] = ALU_OPC_SUB;
    i = i + 2;
    end
  if (ENABLE_LOGIC == 1)
    begin
    opc_map[i]   = ALU_OPC_XOR;
    opc_map[i+1] = ALU_OPC_OR;
    opc_map[i+2] = ALU_OPC_AND;
    i = i + 3;
    end
  if (ENABLE_SET == 1)
    begin
    opc_map[i]   = ALU_OPC_SLT;
    opc_map[i+1] = ALU_OPC_SLTU;
    i = i + 2;
    end
  if (ENABLE_SHIFTS == 1)
    begin
    opc_map[i]   = ALU_OPC_SLL;
    opc_map[i+1] = ALU_OPC_SRL;
    opc_map[i+2] = ALU_OPC_SRA;
    i = i + 3;
    end
  if (i == 0)
    begin
    $display();
    $display("Error: no operations are enabled!");
    $display("You must enable at least one group of operations in tb.v, on lines 50-53.");
    $display();
    $finish;
    end
  end

////////////////////////////////////////////////////////////////////////////////
// Initial process to define clock and reset                                  //
////////////////////////////////////////////////////////////////////////////////

initial
  begin
  clk           = 1'b0;
  reset         = 1'b1;
  repeat (3) #5 clk = ~clk;
  reset         = 1'b0;
  forever 
    #5 clk = ~clk; // generate a clock
end

////////////////////////////////////////////////////////////////////////////////
// Initial process to drive successive test vectors into DUT and ref model    //
////////////////////////////////////////////////////////////////////////////////

initial
  begin
  // set initial values for DUT driver signals
  //
  cycles        = 0;
  inst          = 0;
  exe_sel_pc_r  = 32'd0;
  exe_pc_r      = 32'd0;
  exe_reg1_r    = 32'd0;
  exe_src2_r    = 32'd0;
  //
  // wait for reset to be rescinded
  //
  @(negedge reset);
  //
  // iterate for NUM_CYCLES, 
  //   assign random values to DUT variables on posedge clk
  //
  repeat(NUM_CYCLES) @(posedge clk)
    begin
    cycles        <= cycles + 1;
    inst          <= ($unsigned($random) % NUM_INSTS);
    exe_sel_pc_r  <= $random;
    exe_pc_r      <= $random;
    exe_reg1_r    <= $random;
    exe_src2_r    <= $random;
    end
  
  // terminate the simulation successfully
  //
  $display("Your ALU passed %0d random tests, including:", NUM_CYCLES);
  if (ENABLE_LOGIC == 1)  $display("  s) AND, OR, XOR");
  if (ENABLE_ADD == 1)    $display("  b) ADD, SUB");
  if (ENABLE_SET == 1)    $display("  c) SLT, SLTU");
  if (ENABLE_SHIFTS == 1) $display("  d) SLL, SRL, SRA");
  if ((NUM_INSTS == 10) && (NUM_CYCLES >= (1000*NUM_INSTS))) $display("Congratulations, your ALU is verified for all functions!");
  if ((NUM_INSTS == 10) && (NUM_CYCLES < (1000*NUM_INSTS)))  $display("Now increase NUM_CYCLES to at least 10000 and re-run");
  $finish;
end

////////////////////////////////////////////////////////////////////////////////
// Continuous assignments                                                     //
////////////////////////////////////////////////////////////////////////////////

// Map from an instruction in the range 0..9 to the 4-bit ALU opcode
//
assign exe_alu_opc_r = opc_map[inst];

// Define the dut_error signal to be any difference between DUT and reference
// output, provided we are not currently in reset
//
assign dut_error     = (reset == 1'b0) && (dut_alu_result !== ref_alu_result);

////////////////////////////////////////////////////////////////////////////////
// Process to check dut_error for each test vector. This happens on negedge   //
// clk as this is separated in time from the point at which all DUT inputs    //
// are changed for each test.                                                 //
////////////////////////////////////////////////////////////////////////////////

always @(negedge clk)
  begin
  if (dut_error == 1'b1)
    begin
    $display("!! Test failure at cycle %0d, DUT output = %08x, should be %08x",
             cycles, dut_alu_result, ref_alu_result);
    $finish;
    end
  end

endmodule
