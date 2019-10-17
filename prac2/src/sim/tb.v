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
// Description:    Simulation test-bench for RISC-V core
// 
// Dependencies:   Design Under Test (dut)
// 
////////////////////////////////////////////////////////////////////////////////


module tb();

`include "params.v"

// Declare signals that are ports of the top-level design
//
reg             clk_in;           // 125 MHz clock source
reg             rst_a;            // global async reset wire 
        
// Push-button signals
//
reg    [3:1]    btn_a;            // three push-button wire s
    
// Switch wire  signals
//
reg    [1:0]    switch_a;         // four switch wire s
    
// LED output signals
//
wire   [3:0]    leds;             // four LED outputs
    
// SSD output signals
//
wire   [6:0]    ssd_a;            // PMOD outputs to SSD anodes
wire            ssd_c;            // PMOD output to SSD control
      
wire   [1:0]    run_cmd_mode;     // halt, run, step_cycle or step_inst
wire            cpu_commit;       // 1 => instruction was committed
wire            cpu_running;      // 0 => CPU halted, 1 => CPU running

// Instantiate the design under test (DUT), which is the RV32IM pipeline
//
top dut(
  .clk_in           (clk_in         ), // 125 MHz clock source
  .rst_a            (rst_a          ), // global async reset input
  .btn_a            (btn_a          ), // three push-button inputs
  .switch_a         (switch_a       ), // four switch inputs
  .leds             (leds           ), // four LED outputs
  .ssd_a            (ssd_a          ), // PMOD outputs to SSD anodes
  .ssd_c            (ssd_c          )  // PMOD output to SSD control
);

// Probes into the SoC top-level module to extract I/O signals post-sync
//
wire  [3:0]   zybo_switches   = dut.zybo_switches;
wire  [3:1]   zybo_buttons    = dut.zybo_buttons;
wire          clk_core        = dut.cpu_clk;
wire          reset_core      = dut.reset;
wire          step_cycle      = dut.step_cycle;
wire          step_instr      = dut.step_instr;
wire          dbg_halt_core   = dut.dbg_halt_core;
wire          dbg_run_core    = dut.dbg_run_core;

// Probes into core for instruction tracing and diagnostic checking
//
wire          wrb_valid       = dut.u_cpu.u_exec_unit.wrb_valid_r;
wire  [4:0]   wrb_rd          = dut.u_cpu.u_exec_unit.wrb_rd_r;
wire  [31:0]  wrb_data        = dut.u_cpu.u_exec_unit.wrb_rd_wdata_r;
wire          wrb_wenb        = dut.u_cpu.u_exec_unit.wrb_rd_wenb_r;
wire  [31:0]  wrb_pc          = dut.u_cpu.u_exec_unit.wrb_pc;

wire  [3:0]   wrb_st_wenb     = dut.u_cpu.u_exec_unit.exe_dccm_wenb;
wire  [31:0]  wrb_st_data     = dut.u_cpu.u_exec_unit.exe_dccm_din;
wire  [11:2]  wrb_st_addr     = dut.u_cpu.u_exec_unit.exe_dccm_addr;

wire          fch_valid       = dut.u_cpu.u_exec_unit.fch_valid;
wire  [31:0]  fch_inst        = dut.u_cpu.u_exec_unit.fch_inst;
wire  [31:0]  fch_pc          = dut.u_cpu.u_exec_unit.fch_pc;

wire          bpu_predicted   = dut.u_cpu.u_exec_unit.bpu_predicted;
wire          bpu_pred_taken  = dut.u_cpu.u_exec_unit.bpu_pred_taken;
wire  [2:0]   bpu_pred_type   = dut.u_cpu.u_exec_unit.bpu_pred_type;
wire  [1:0]   bpu_pred_state  = dut.u_cpu.u_exec_unit.bpu_pred_state;
wire  [31:0]  bpu_pred_target = dut.u_cpu.u_exec_unit.bpu_pred_target;

wire          dec_valid       = dut.u_cpu.u_exec_unit.dec_valid_r;
wire  [31:0]  dec_inst        = dut.u_cpu.u_exec_unit.dec_inst_r;
wire  [31:0]  dec_pc          = dut.u_cpu.u_exec_unit.dec_pc;

wire          dec_rs1_renb    = dut.u_cpu.u_exec_unit.dec_rs1_renb;
wire  [4:0]   dec_rs1         = dut.u_cpu.u_exec_unit.dec_rs1;
wire  [31:0]  dec_rdata1      = dut.u_cpu.u_exec_unit.dec_rdata1;

wire          dec_rs2_renb    = dut.u_cpu.u_exec_unit.dec_rs2_renb;
wire  [4:0]   dec_rs2         = dut.u_cpu.u_exec_unit.dec_rs2;
wire  [31:0]  dec_rdata2      = dut.u_cpu.u_exec_unit.dec_rdata2;

wire          dec_rd          = dut.u_cpu.u_exec_unit.dec_rd;
wire          dec_rd_wenb     = dut.u_cpu.u_exec_unit.dec_rd_wenb;

wire          dec_load        = dut.u_cpu.u_exec_unit.dec_load;
wire          dec_store       = dut.u_cpu.u_exec_unit.dec_store;
wire          dec_branch      = dut.u_cpu.u_exec_unit.dec_branch;
wire          dec_jump        = dut.u_cpu.u_exec_unit.dec_jump;
wire          dec_csr         = dut.u_cpu.u_exec_unit.dec_csr;
wire          dec_priv        = dut.u_cpu.u_exec_unit.dec_priv;
wire          dec_m32_op      = dut.u_cpu.u_exec_unit.dec_m32_op;
wire          dec_illegal     = dut.u_cpu.u_exec_unit.dec_illegal;
wire          dec_sel_pc      = dut.u_cpu.u_exec_unit.dec_sel_pc;

wire          dec_sel_imm     = dut.u_cpu.u_exec_unit.dec_sel_imm;
wire  [31:0]  dec_imm         = dut.u_cpu.u_exec_unit.dec_imm;

wire          exe_valid       = dut.u_cpu.u_exec_unit.exe_valid_r;
wire  [31:0]  exe_pc          = dut.u_cpu.u_exec_unit.exe_pc;

wire          mem_valid       = dut.u_cpu.u_exec_unit.mem_valid_r;
wire  [31:0]  mem_pc          = dut.u_cpu.u_exec_unit.mem_pc;

wire          dec_freeze      = dut.u_cpu.u_exec_unit.dec_freeze;
wire          exe_freeze      = dut.u_cpu.u_exec_unit.exe_freeze;
wire          mem_freeze      = dut.u_cpu.u_exec_unit.mem_freeze;

wire          cpu_clk         = dut.u_cpu.clk;
wire  [1:0]   run_mode        = dut.u_cpu.run_cmd_mode;
wire          commit_evt      = dut.u_cpu.u_exec_unit.commit_evt;

wire  [23:0]  ten_x_cycle     = dut.u_cpu.u_control_unit.ten_x_cycle_r;
wire  [15:0]  one_x_instr     = dut.u_cpu.u_control_unit.one_x_instr_r;
wire  [23:0]  cpi_x_ten       = ten_x_cycle / one_x_instr;
wire  [31:0]  cpi_int_part    = $unsigned(cpi_x_ten) / 'd10;
wire  [31:0]  cpi_frac_part   = cpi_x_ten - (cpi_int_part * 'd10);

reg           check_failure;    // TB checks failed, so terminate simulation
reg           valid_dec_inst;   // TB check indicates a valid DEC instruction

// Declaration of reference output signals from checker module rv32im_ref
//
wire          ref_rd_wenb;
wire  [4:0]   ref_rd;
wire  [31:0]  ref_rd_wdata;
wire  [7:0]   ref_zybo_ssd;
wire  [3:0]   ref_zybo_leds;
wire  [31:0]  ibu_addr;
reg   [31:0]  ibu_inst;
wire  [31:0]  dbu_addr;
reg   [31:0]  dbu_rdata;
wire  [31:0]  dbu_wdata;
wire  [3:0]   dbu_write;
wire          step_ack;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                  Instantiate the reference core                            //
//                                                                            //
// The reference core is used by the TB to validate all state changed made by //
// the actual pipelined core.                                                 //
//                                                                            //
// The testbench (TB) performs the following checks.                          //
//                                                                            //
// 1. The reference PC must match the wrb_pc of the core pipeline.            //
//                                                                            //
// 2. Any register result being written at the WRB stage of the core pipeline //
//    must match the reference result for the instruction at the reference    //
//    PC, and vice versa.                                                     //
//                                                                            //
// 3. Memory writes, at either the WRB stage of the core pipeline or the      //
//    reference core, must match in all respects.                             //
//                                                                            //
// 4. CSR writes, at either the WRB stage of the core pipeline or the         //
//    reference core, must match in all respects.                             //
//                                                                            //
// 5. Exceptions raised, either in the WRB stage of the core pipeline or the  //
//    reference core, must match in all respects.                             //
//                                                                            //
// Any register, memory or CSR writes that are probed from the WRB stage of   //
// the core pipeline, are applied to the reference core on the next rising    //
// edge of the clock that has been probed from the core pipeline. This has    //
// effect of keeping both cores in step, even if the core pipeline writes an  //
// incorrect value. This allows the TB to report each discrepancy, after      //
// which the reference core adopts the state of the core pipeline.            //
// The two models therefore do not diverge after a state-update mismatch.     //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

rv32im_rm_0 u_rv32im_rm_0(
  .clk              (clk_core       ), // external clock source
  .reset            (reset_core     ), // async reset input
  .commit_evt       (wrb_valid      ), // any commit event at WRB
  
  //==== Instruction Memory interface ==========================================
  //
  .ibu_addr         (ibu_addr       ), // address to fetch next instruction
  .ibu_inst         (ibu_inst       ), // instruction at mem[fetch_addr]
  
  //==== Data Memory interface =================================================
  //
  .dbu_addr         (dbu_addr       ), // address of next data access
  .dbu_rdata        (dbu_rdata      ), // current data at mem[dbu_addr]
  .dbu_wdata        (dbu_wdata      ), // data to write to mem[dbu_addr]
  .dbu_write        (dbu_write      ), // byte-write enables for data memory
  
  //==== Register Result interface =============================================
  //
  .ref_rd_wenb      (ref_rd_wenb    ), // 1 => write xreg_wdata to X[xreg_rd]
  .ref_rd           (ref_rd         ), // address of register to be written
  .ref_rd_wdata     (ref_rd_wdata   ), // data to write to X[xreg_rd]

  //==== Register Updates interface ============================================
  //
  .xreg_write       (wrb_wenb       ), // 1 => write xreg_wdata to X[xreg_rd]
  .xreg_rd          (wrb_rd         ), // address of register to be written
  .xreg_wdata       (wrb_data       ), // data to write to X[xreg_rd]

  //==== Run control/status shadow interface ===================================
  //
  .run_cmd_mode     (               ), // halt, run, step_cycle or step_inst
  .cpu_commit       (               ), // 1 => instruction was committed
  .cpu_running      (               ), // 0 => CPU halted, 1 => CPU running
  
  //==== Single-step shadow interface ==========================================
  //
  .step_cycle       (step_cycle     ), // 0->1 is a cycle-step request
  .step_instr       (step_instr     ), // 0->1 is an instruction-step request
  .step_ack         (step_ack       ), // 0->1 when step is complete (4-cycle)
  
  //==== Debugger shadow interface =============================================
  //
  .dbg_halt_core    (dbg_halt_core  ), // 1 => halt core, 1-cycle pulse command
  .dbg_run_core     (dbg_run_core   ), // 1 => run core, 1-cycle pulse command
  
  //==== GPIO shadow interface to switches, buttons, LEDs and SSD ==============
  //
  .zybo_switches    (zybo_switches  ), // current switch settings on ZYBO board
  .zybo_buttons     (zybo_buttons   ), // current value of push buttons on ZYBO
  .zybo_leds        (ref_zybo_leds  ), // output to the LEDs on the ZYBO board
  .zybo_ssd         (ref_zybo_ssd   )  // ouptut to the 7-segment display PMOD
);

////////////////////////////////////////////////////////////////////////////////
// Shadow Instruction Closely Coupled Memory - ICCM  - within the testbench   //
////////////////////////////////////////////////////////////////////////////////

(* rom_style="block" *)
reg [ROM_WIDTH-1:0] iccm [(2**ROM_WORD_BITS)-1:0];

reg [ROM_WIDTH-1:0] iccm_dout;          // data-out from ICCM RAM

initial
  $readmemh(HEX_FILE, iccm, 0, (2**ROM_WORD_BITS)-1);

always @*
  ibu_inst = iccm[ibu_addr[13:2]];

////////////////////////////////////////////////////////////////////////////////
// Declare simulation variables                                               //
////////////////////////////////////////////////////////////////////////////////
integer cycles;
integer icount;
reg     halted;
reg     incr_icount;

////////////////////////////////////////////////////////////////////////////////
// Initialize the testbench outputs and simulation variables                  //
////////////////////////////////////////////////////////////////////////////////
initial
begin
  cycles   = 32'd0;
  icount   = 32'd0;
  rst_a    = 1'b1;
  btn_a    = 3'd0;
  clk_in   = 1'b0;
  switch_a = 2'd0;
  halted   = 1'b0;

 #50 rst_a = 1'b0;

 #5000 btn_a[1] = 1'b1;
 #5500 btn_a[1] = 1'b0;

 #10000 switch_a = 2'b01;

// #100050 btn_a[2] = 1'b1;
// #100500 btn_a[2] = 1'b0;
end

////////////////////////////////////////////////////////////////////////////////
// Implement the simulated clock signal                                       //
////////////////////////////////////////////////////////////////////////////////
always
    #4 clk_in = !clk_in;

////////////////////////////////////////////////////////////////////////////////
// Control the shutdown of simulation                                         //
////////////////////////////////////////////////////////////////////////////////
integer start_cycle = 1000;
integer halt_cycle  = 1000000;
integer stop_cycle  = 1000000;

always @*
  begin
  if (cycles == start_cycle)
    begin
    btn_a[1]     = 1'b1;
    end
  else
    begin
    if (!halted && (cycles > start_cycle) && (run_mode == 2'b00))
      begin
      halted     = 1'b1;
      btn_a[1]   = 1'b0;
      btn_a[2]   = 1'b1;
      stop_cycle = cycles + 100;
      end
    if (cycles == stop_cycle)
      $finish;
    end
  end

////////////////////////////////////////////////////////////////////////////////
// Declare data structure to hold the register name mapping                   //
////////////////////////////////////////////////////////////////////////////////
reg [8*14:1] rd;

////////////////////////////////////////////////////////////////////////////////
// Count simulation cycles                                                    //
///////////////////////////////////////////////////////////////////////////////
always @(posedge cpu_clk)
  begin
  cycles <= cycles + 1;
  if (incr_icount == 1'b1) icount <= icount + 1;
  end

////////////////////////////////////////////////////////////////////////////////
// Implement diagnostic checking and tracing on the negedge                   //
////////////////////////////////////////////////////////////////////////////////
always @(negedge cpu_clk)
  begin
  case (wrb_rd)
  5'd0  : rd = "0";
  5'd1  : rd = "ra";
  5'd2  : rd = "sp";
  5'd3  : rd = "gp";
  5'd4  : rd = "tp";
  5'd5  : rd = "t0";
  5'd6  : rd = "t1";
  5'd7  : rd = "t2";
  5'd8  : rd = "fp";
  5'd9  : rd = "s1";
  5'd10 : rd = "a0";
  5'd11 : rd = "a1";
  5'd12 : rd = "a2";
  5'd13 : rd = "a3";
  5'd14 : rd = "a4";
  5'd15 : rd = "a5";
  5'd16 : rd = "a6";
  5'd17 : rd = "a7";
  5'd18 : rd = "s2";
  5'd19 : rd = "s3";
  5'd20 : rd = "s4";
  5'd21 : rd = "s5";
  5'd22 : rd = "s6";
  5'd23 : rd = "s7";
  5'd24 : rd = "s8";
  5'd25 : rd = "s9";
  5'd26 : rd = "s10";
  5'd27 : rd = "s11";
  5'd28 : rd = "t3";
  5'd29 : rd = "t4";
  5'd30 : rd = "t5";
  5'd31 : rd = "t6";
  endcase

  check_failure  = 1'b0;
  valid_dec_inst = 1'b0;
  incr_icount    = 1'b0;
  
  if ((cycles > 0) && (rst_a == 1'b0))
    begin
      // Check if any write-back control signal is undefined and terminate.
      //
      if (wrb_valid === 1'bx)
        begin
        $write("[%d] Error: wrb_valid_r == 1'bx, terminating simulation\n", cycles);
        check_failure = 1'b1;
        end
      if (^wrb_st_wenb == 1'bx)
        begin
        $write("[%d] Error: wrb_st_wenb contains X's, terminating simulation\n", cycles);
        check_failure = 1'b1;
        end
      
      // Check if Fetch stage has any undefined values that must be defined.
      //
      if (fch_valid === 1'bx)
        begin
        $write("[%d] Error: fch_valid == 1'bx, terminating simulation\n", cycles);
        check_failure = 1'b1;
        end
      else if (fch_valid == 1'b1)
        begin
        valid_dec_inst = 1'b1; // we may have a valid instruction at DEC
        if (^fch_pc === 1'bx)
          begin
          $write("[%d] Error: fch_pc contains X's when issuing a valid instruction\n", cycles);
          check_failure  = 1'b1;
          valid_dec_inst = 1'b0; // instruction considered invalid if PC is invalid
          end
        if (^fch_inst === 1'bx)
          begin
          $write("[%d] Error: fch_inst constains X's when issuing a valid instruction\n", cycles);
          check_failure  = 1'b1;
          valid_dec_inst = 1'b0; // undefined instruction needs no further analysis
          end
        if (bpu_predicted === 1'bx)
          begin
          $write("[%d] Error: bpu_predicted is undefined when issuing a valid instruction\n", cycles);
          check_failure  = 1'b1;
          end
        else if (bpu_predicted == 1'b1)
          begin
          if (^{bpu_pred_taken, bpu_pred_type, bpu_pred_state, bpu_pred_target} === 1'bx)
            begin
            $write("[%d] Error: branch prediction interface contains undefined value(s)\n", cycles);
            $write("[%d] Info:  check the outputs from your branch predictor module\n", cycles);
            check_failure  = 1'b1;
            end
          end
        end
    
      // Check if Decode stage has any undefined input values that must be defined.
      //
      if (dec_freeze === 1'bx)
        begin
        $write("[%d] Error: stall signal at DEC stage, dec_freeze, is undefined\n", cycles);
        check_failure = 1'b1;
        end
      if (dec_valid === 1'bx)
        begin
        $write("[%d] Error: dec_valid_r == 1'bx\n", cycles);
        check_failure = 1'b1;
        end
      else if (dec_valid == 1'b1)
        begin
        if (^dec_pc == 1'bx)
          begin
          $write("[%d] Error: dec_pc contains X's when DEC stage has a valid instruction\n", cycles);
          check_failure = 1'b1;
          end
        if (^dec_inst == 1'bx)
          valid_dec_inst = 1'b0;
     
        if (valid_dec_inst)
          begin
          // Check for any invalid outputs of the instruction decoder if we have a valid instruction
          //
          if (dec_rs1_renb == 1'bx)
            begin
            $write("[%d] Error: dec_rs1_renb == 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          else if (dec_rs1_renb == 1'b1)
            begin
            if (^dec_rs1 === 1'bx)
              begin
              $write("[%d] Error: dec_rs1 contained X's when reading from register file port rs1\n", cycles);
              check_failure = 1'b1;
              end
            if (^dec_rdata1 === 1'bx)
              begin
              $write("[%d] Warning: read undefined value %08x from x%d on port rs1\n", cycles, dec_rdata1, dec_rs1); 
              end
            end
          if (dec_rs2_renb == 1'bx)
            begin
            $write("[%d] Error: dec_rs2_renb == 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          else if (dec_rs2_renb == 1'b1)
            begin
            if (^dec_rs2 === 1'bx)
              begin
              $write("[%d] Error: dec_rs2 contained X's when reading from register file port rs2\n", cycles);
              check_failure = 1'b1;
              end
            if (^dec_rdata2 === 1'bx)
              begin
              $write("[%d] Warning: read undefined value %08x from x%d on port rs1\n", cycles, dec_rdata2, dec_rs2); 
              end
            end
          if (dec_load == 1'bx)
            begin
            $write("[%d] Error: dec_load was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          if (dec_store == 1'bx)
            begin
            $write("[%d] Error: dec_store was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          if (dec_branch == 1'bx)
            begin
            $write("[%d] Error: dec_branch was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          if (dec_jump == 1'bx)
            begin
            $write("[%d] Error: dec_jump was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          if (dec_csr == 1'bx)
            begin
            $write("[%d] Error: dec_csr was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          if (dec_priv == 1'bx)
            begin
            $write("[%d] Error: dec_priv was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          if (dec_m32_op == 1'bx)
            begin
            $write("[%d] Error: dec_m32_op was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          if (dec_illegal == 1'bx)
            begin
            $write("[%d] Error: dec_illegal was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          if (dec_sel_pc == 1'bx)
            begin
            $write("[%d] Error: dec_sel_pc was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          if (dec_sel_imm == 1'bx)
            begin
            $write("[%d] Error: dec_sel_imm was 1'bx when decoding a valid instruction\n", cycles);
            check_failure = 1'b1;
            end
          else if ((dec_sel_imm == 1'b1) && (^dec_imm === 1'bx))
            begin
            $write("[%d] Error: dec_imm contained X's when dec_sel_imm == 1'b1\n", cycles);
            check_failure = 1'b1;
            end
          end     //   if (valid_dec_inst)
        end       // if (dec_valid === 1'bx)
    
      // Check if Execute stage has any undefined input values that must be defined.
      //
      if (exe_freeze == 1'bx)
        begin
        $write("[%d] Error: stall signal at EXE stage, exe_freeze, is undefined\n", cycles);
        check_failure = 1'b1;
        end
      if (exe_valid === 1'bx)
        begin
        $write("[%d] Error: exe_valid_r == 1'bx, terminating simulation\n", cycles);
        check_failure = 1'b1;
        end
      else if (exe_valid == 1'b1)
        begin
        if (^exe_pc == 1'bx)
          begin
          $write("[%d] Error: exe_pc contains X's when EXE stage has a valid instruction\n", cycles);
          check_failure = 1'b1;
          end
        end
    end
    
  if (check_failure)
    begin
    $write("Testbench detected illegal undefined values, terminating simulation\n");
    $finish;
    end
  else
    begin
    if (wrb_valid)
      begin
      $write("%8d %2d.%1d 0x%08x ", cycles, cpi_int_part, cpi_frac_part, wrb_pc);
      if (wrb_wenb)
        $write("%2s <= %8x", rd, wrb_data);
      else
        $write("              ");
      if (|wrb_st_wenb)
        begin
        $write("mem[%08x] <= ", {20'd0, wrb_st_addr, 2'b00});
        if (wrb_st_wenb[3]) $write("%02x", wrb_st_data[31:24]); else $write("--");
        if (wrb_st_wenb[2]) $write("%02x", wrb_st_data[23:16]); else $write("--");
        if (wrb_st_wenb[1]) $write("%02x", wrb_st_data[15:8]);  else $write("--");
        if (wrb_st_wenb[0]) $write("%02x", wrb_st_data[7:0]);   else $write("--");
        end
      $write("\n");
      end
    end
    
  if (wrb_valid)
    begin
    if (wrb_wenb != ref_rd_wenb)
      begin
      if (wrb_wenb)
        $write("[%d] Error: a destination register was written unexpectedly\n", cycles);
      else
        $write("[%d] Error: destination register write was expected\n", cycles);
      check_failure = 1'b1;
      end
    if (wrb_rd != ref_rd)
      begin
      $write("[%d] Error: wrong register written. Expected to write x%d, but wrote x%d\n", cycles, ref_rd, wrb_rd);
      check_failure = 1'b1;
      end
    if (wrb_wenb & (wrb_data != ref_rd_wdata))
      begin
      $write("[%d] Error: wrong result written. Expected to write 0x%08x, but wrote 0x%08x\n", cycles, ref_rd_wdata, wrb_data);
      check_failure = 1'b1;
      end
    if (check_failure)
      begin
      $write("Testbench detected faulty CPU behaviour, terminating simulation early\n\n");
      $finish;
      end
    end

  if ((wrb_valid == 1'b1) && (check_failure == 1'b0))
    incr_icount = 1'b1;
  else
    incr_icount = 1'b0;
  end

endmodule
