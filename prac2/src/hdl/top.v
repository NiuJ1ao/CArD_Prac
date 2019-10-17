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

module top(
  input           clk_in,           // external 125 MHz clock source
  input           rst_a,            // global async reset input
    
  //==== Single-step request interface =========================================
  //
  //  input           step_cycle,       // 0->1 is a cycle-step request
  //  input           step_instr,       // 0->1 is an instruction-step request
  //  output          step_ack,         // 0->1 when step is complete (4-cycle)

  //==== Debugger halt/resume interface ========================================
  //
//  input           dbg_halt_core,    // 1 => halt core, 1-cycle pulse command
//  input           dbg_run_core,     // 1 => run core, 1-cycle pulse command

  // Push-button input signals
  //
  input   [3:1]   btn_a,            // three push-button inputs

  // Switch input signals
  //
  input   [1:0]   switch_a,         // four switch inputs

  // LED output signals
  //
  output  [3:0]   leds,             // four LED outputs

  // SSD output signals
  //
  output  [6:0]   ssd_a,            // PMOD outputs to SSD anodes
  output          ssd_c,            // PMOD output to SSD control

  // DVI output interface to DVI display pins
  //
  output          TMDS_Clk_p,       // DVI clock channel (positive)
  output          TMDS_Clk_n,       // DVI clock channel (negative)
  output [2:0]    TMDS_Data_p,      // DVI data channel (positive)
  output [2:0]    TMDS_Data_n       // DVI data channel (negative)
);

`include "params.v"

// Define wires for generated system clock, synchronized reset,
// and PLL locked signal.
//
wire            cpu_clk;            // MMCM PLL generated cpu clock
wire            pixel_clk;          // MMCM PLL generated pixel clock
wire            serial_clk;         // MMCM PLL generated serial clock
wire            reset;              // synchronized reset
wire            cpu_locked;         // CPU MMCM PLL lock status
wire            video_locked;       // CPU MMCM PLL lock status

// Define wires for input signals that need to be synchronized
// to the system clock and for SSD output signals from CPU.
// 
wire  [3:1]     zybo_buttons;       // synchronized push buttons
wire  [1:0]     zybo_switches;      // two synchronized switches
wire  [7:0]     zybo_ssd;           // 8-bit integer to display on SSD

wire  [3:0]     cpu_leds;           // led outputs from the CPU

//==== Run control/status interface ==========================================
//
wire  [1:0]     run_cmd_mode;       // halt, run, step_cycle or step_inst
wire            cpu_commit;         // 1 => a CPU event was committed
wire            cpu_running;        // 0 => CPU halted, 1 => CPU running

//==== Direct Memory Interface for ICCM write and DCCM read/write ============
//
// TBD

//==== Bidirectional data link interface to host system ======================
//
wire  [31:0]    hlnk_in_data;       // hostlink input channel data
wire            hlnk_in_valid;      // hostlink input channel valid data
wire            hlnk_in_accept;     // hostlink input channel data accept
//
wire  [31:0]    hlnk_out_data;      // hostlink input channel data
wire            hlnk_out_valid;     // hostlink input channel valid data
wire            hlnk_out_accept;    // hostlink input channel data accept

//==== Single-step request interface =========================================
//
wire            step_cycle;         // 0->1 is a cycle-step request
wire            step_instr;         // 0->1 is an instruction-step request
wire            step_ack;           // 0->1 when step is complete (4-cycle)

//==== Debugger halt/resume interface ========================================
//
wire            dbg_halt_core;      // 1 => halt core, 1-cycle pulse command
wire            dbg_run_core;       // 1 => run core, 1-cycle pulse command

//==== Frame-buffer display read/write interface ==============================
//
wire            px_request;         // active-high FB request
wire            px_write;           // 1=> write FB, 0 => read FB
wire            px_ready_a;         // async: 1=> write done or data ready
wire            px_ready;           // sync:  1=> write done or data ready
wire  [15:0]    px_address;         // select cols 0..255 within FB
wire  [23:0]    px_write_data;      // pixel value to be written to FB
wire  [23:0]    px_read_data;       // pixel value read from FB

//==== msec timer interface ==================================================
//
wire  [31:0]    msec_elapsed;       // milliseconds elapsed since reset

reg             step_detect_r;
reg             run_detect_r;
reg             halt_detect_r;

assign step_cycle     = zybo_buttons[3] & !step_detect_r;
assign step_instr     = 1'b0;
assign dbg_halt_core  = zybo_buttons[2] & !halt_detect_r;
assign dbg_run_core   = zybo_buttons[1] & !run_detect_r;

always @(posedge cpu_clk or posedge reset)
  begin : detect_reg_PROC
  if (reset)
    begin
    run_detect_r  <= 1'b0;
    halt_detect_r <= 1'b0;
    step_detect_r <= 1'b0;
    end
  else
    begin
    run_detect_r  <= zybo_buttons[1];
    halt_detect_r <= zybo_buttons[2];
    step_detect_r <= zybo_buttons[3];
    end
  end // detect_reg_PROC

// Instantiate module to drive the SSD from a 4-bit binary integer
//
ssd_driver u_ssd_driver (
  .clk              (cpu_clk        ),
  .reset            (reset          ),
  .ssd_input        (zybo_ssd       ),
  .ssd_a            (ssd_a          ),
  .ssd_c            (ssd_c          )
);

// Instantiate module to synchronize asynchronous inputs and provide
// a clean reset signal for the rest of the design
//
resync u_resync (
  .clk              (cpu_clk        ),
  .rst_a            (rst_a          ),
  .btn_a            (btn_a          ),
  .switch_a         (switch_a       ),
  .px_ready_a       (px_ready_a     ),
  .reset            (reset          ),
  .buttons          (zybo_buttons   ),
  .switches         (zybo_switches  ),
  .px_ready         (px_ready       )
);

wire  clk_60MHz;
wire  clk_75MHz;
wire  clk_125MHz = clk_in;

// Instantiate the CPU clock generator module based on MMCME2_ADV primitive
//
cpu_clock_gen u_cpu_clock_gen (
  .clk_in1        (clk_in         ), // clock input source
  .clk_60MHz      (clk_60MHz      ), // generated 60MHz clock
  .clk_75MHz      (clk_75MHz      ), // generated 75MHz clock
  // Status and control signals
  .reset          (rst_a          ), // reset input
  .locked         (cpu_locked     )  // output locked
);

// Instantiate the video clock generator module based on MMCME2_ADV primitive
//
video_clock_gen u_video_clock_gen (
  .clk_in1        (clk_75MHz      ), // clock input source
  .pixel_clk      (pixel_clk      ), // generated 40MHz clock
  .serial_clk     (serial_clk     ), // generated 200MHz clock
  // Status and control signals
  .reset          (rst_a          ), // reset input
  .locked         (video_locked   )  // output locked
);

// clock_generator u_clock_generator (
//   .clk_in1        (clk_in         ), // clock input source
//   .clk_40MHz      (clk_40MHz      ), // generated 40MHz clock
//   .clk_50MHz      (clk_50MHz      ), // generated 50MHz clock
//   .clk_65MHz      (clk_65MHz      ), // generated 65MHz clock
//   .clk_80MHz      (clk_80MHz      ), // generated 80MHz clock
//   .clk_100MHz     (clk_100MHz     ), // generated 100MHz clock
//   .clk_133MHz     (clk_133MHz     ), // generated 108MHz clock
//   .clk_160MHz     (clk_160MHz     ), // generated 118MHz clock
//   // Status and control signals
//   .reset          (rst_a          ), // reset input
//   .locked         (locked         )  // output locked
// );

// Clock the core using the 60 MHz generated clock signal
// *** If you change this, you must also update timing.xdc
//
assign cpu_clk     = clk_60MHz;

// Clock the display driver using the 108 MHz generated clock signal
// *** If you change this, you must also update timing.xdc
//
// assign pixel_clk   = clk_108MHz;

// Instantiate the CPU top-level module
//
cpu u_cpu(
  .clk              (cpu_clk        ), // external clock source
  .reset            (reset          ), // async reset input
 
  //==== Run control/status interface ==========================================
  //
  .run_cmd_mode     (run_cmd_mode   ), // halt, run, step_cycle or step_inst
  .cpu_commit       (cpu_commit     ), // 1 => a CPU event was committed
  .cpu_running      (cpu_running    ), // 0 => CPU halted, 1 => CPU running
   
  //==== Single-step request interface =========================================
  //
  .step_cycle       (step_cycle     ), // 0->1 is a cycle-step request
  .step_instr       (step_instr     ), // 0->1 is an instruction-step request
  .step_ack         (step_ack       ), // 0->1 when step is complete (4-cycle)
 
  //==== Debugger halt/resume interface ========================================
  //
  .dbg_halt_core    (dbg_halt_core  ), // 1 => halt core, 1-cycle pulse command
  .dbg_run_core     (dbg_run_core   ), // 1 => run core, 1-cycle pulse command

  //==== Direct Memory Interface for ICCM write and DCCM read/write ============
  //
  // TBD
   
  //==== Bidirectional data link interface to host system ======================
  //
  .hlnk_in_data     (32'd0          ), // hostlink input channel data
  .hlnk_in_valid    (1'b0           ), // hostlink input channel valid data
  .hlnk_in_accept   (),                // hostlink input channel data accept
  //
  .hlnk_out_data    (),                // hostlink input channel data
  .hlnk_out_valid   (),                // hostlink input channel valid data
  .hlnk_out_accept  (1'b0           ), // hostlink input channel data accept
   
  // Interface signals for reading from, and writing to, the VGA display buffer
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

  //==== GPIO interface to switches, SSD and LEDs ==============================
  //
  .zybo_switches    (zybo_switches  ), // current switch settings on ZYBO board
  .zybo_buttons     (zybo_buttons   ), // current value of push buttons on ZYBO
  .zybo_leds        (cpu_leds       ), // output to the LEDs on the ZYBO board
  .zybo_ssd         (zybo_ssd       )  // ouptut to the 7-segment display PMOD
 );

// Instantiate the DVI display module
//
dvi_display u_dvi_display(
  .clk              (pixel_clk      ), // pixel clock source
  .serial_clk       (serial_clk     ), // DVI DDR clock source
  .reset            (reset          ), // reset input

  // Interface signals for reading from, and writing to, the frame buffer
  //
  .px_request_a     (px_request     ), // active-high FB request
  .px_write         (px_write       ), // 1=> write FB, 0 => read FB
  .px_address       (px_address     ), // select cols 0..255 within FB
  .px_write_data    (px_write_data  ), // pixel value to be written to FB
  .px_ready         (px_ready_a     ), // async: 1=> write done or data ready
  .px_read_data     (px_read_data   ), // async: pixel value read from FB

  //==== msec timer interface ==================================================
  //
  .msec_elapsed     (msec_elapsed   ), // milliseconds elapsed since reset

  // DVI output interface to DVI display pins
  //
  .TMDS_Clk_p       (TMDS_Clk_p     ), // DVI clock channel (positive)
  .TMDS_Clk_n       (TMDS_Clk_n     ), // DVI clock channel (negative)
  .TMDS_Data_p      (TMDS_Data_p    ), // DVI data channel (positive)
  .TMDS_Data_n      (TMDS_Data_n    )  // DVI data channel (negative)
  );

// @@@ temporary assignments
//
assign hlnk_in_valid    = 1'b0;
assign hlnk_out_accept  = 1'b1;

assign leds[0] = cpu_locked;
assign leds[1] = video_locked;

endmodule
