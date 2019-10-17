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
// Description:    DVI display unit for RISC-V core
//
////////////////////////////////////////////////////////////////////////////////

module dvi_display(
  input           clk,              // clock source (at pixel frequency)
  input           serial_clk,       // clock source (at DVI DDR frequency)
  input           reset,            // reset input

  // Interface signals for reading from, and writing to, the frame buffer
  //
  input           px_request_a,     // async: active-high FB request
  input           px_write,         // async: 1=> write FB, 0 => read FB
  input  [15:0]   px_address,       // async: select cols 0..255 within FB
  input  [23:0]   px_write_data,    // async: pixel value to be written to FB
  //
  output          px_ready,         // 1=> write done or read data ready
  output [23:0]   px_read_data,     // pixel value read from FB

  // Define timer value, driven by the msec_timer module
  //
  output [31:0]   msec_elapsed,     // elapsed milliseconds

  // DVI output interface to DVI display pins
  //
  output          TMDS_Clk_p,       // DVI clock channel (positive)
  output          TMDS_Clk_n,       // DVI clock channel (negative)
  output [2:0]    TMDS_Data_p,      // DVI data channel (positive)
  output [2:0]    TMDS_Data_n       // DVI data channel (negative)
);

// Define the interface signals between the VGA controller and
// the Frame Buffer. The VGA controller only reads from the Frame
// Buffer, in order to refresh the display.
//
wire  [7:0]     vc_col_address;     // select cols 0..255 within FB
wire  [7:0]     vc_row_address;     // select rows 0..255 within FB
wire  [23:0]    vc_read_data;       // pixel value read from FB
wire            vc_request;         // active-high FB request

// Define the interface signals between the VGA controller and
// the RGB-to-DVI converter module.
//
wire  [7:0]     vga_red;            // 5-bit Red signal
wire  [7:0]     vga_green;          // 6-bit Green signal
wire  [7:0]     vga_blue;           // 5- bit Blue signal
wire            vga_hsync;          // Horizontal sync pulse
wire            vga_vsync;          // Vertical sync pulse
wire            vga_enable;         // Video data enable

// Define synch flops at CDC boundaries
//
reg             sync_px_1_r;        // first px_request_a sync flop
reg             sync_px_2_r;        // second px_request_a sync flop
wire            px_request;         // sync'd px_request signal

// Instantiate the VGA controller module
//
vga_control u_vga_control (
  .clk            (clk            ),
  .reset          (reset          ),
  //
  .vc_col_address (vc_col_address ),
  .vc_row_address (vc_row_address ),
  .vc_request     (vc_request     ),
  .vc_read_data   (vc_read_data   ),
  //
  .vga_red        (vga_red        ),
  .vga_green      (vga_green      ),
  .vga_blue       (vga_blue       ),
  .vga_hsync      (vga_hsync      ),
  .vga_vsync      (vga_vsync      ),
  .vga_enable     (vga_enable     )
);

// Instantiate the Frame Buffer module
//
frame_buffer u_frame_buffer (
  .clk            (clk            ),
  .reset          (reset          ),
  //
  .vc_row_address (vc_row_address ),
  .vc_col_address (vc_col_address ),
  .vc_request     (vc_request     ),
  .vc_read_data   (vc_read_data   ),
  //
  .px_row_address (px_address[15:8]),
  .px_col_address (px_address[7:0]),
  .px_write_data  (px_write_data  ),
  .px_read_data   (px_read_data   ),
  .px_request     (px_request     ),
  .px_write       (px_write       ),
  .px_ready       (px_ready       )
);
 
// Map the VGA signals to the rgb2dvi input ports
//
wire        PixelClk   = clk;
wire        SerialClk  = serial_clk;
wire        aRst       = reset;

wire [23:0] vid_pData  = {vga_red, vga_blue, vga_green};

wire        vid_pVDE   = vga_enable;
wire        vid_pHSync = vga_hsync;
wire        vid_pVSync = vga_vsync;

// Instantiate the RGB-to-DVI converter module
//
rgb2dvi_0 u_rgb2dvi (
  .PixelClk       (PixelClk       ),
  .SerialClk      (SerialClk      ),
  .aRst           (aRst           ),
  .vid_pData      (vid_pData      ),
  .vid_pVDE       (vid_pVDE       ),
  .vid_pHSync     (vid_pHSync     ),
  .vid_pVSync     (vid_pVSync     ),
  .TMDS_Clk_p     (TMDS_Clk_p     ),
  .TMDS_Clk_n     (TMDS_Clk_n     ),
  .TMDS_Data_p    (TMDS_Data_p    ),
  .TMDS_Data_n    (TMDS_Data_n    )
);

// 2-flop synchronizer for the asynchronous px_request input
//
always @(posedge clk or posedge reset)
  if (reset == 1'b1)
    begin
    sync_px_2_r  <= 1'b0;
    sync_px_1_r  <= 1'b0;
    end
  else
    begin
    sync_px_2_r <= sync_px_1_r;
    sync_px_1_r <= px_request_a;
    end

assign px_request = sync_px_2_r;

// Instantiate a millisecond timer running from 40 MHz pixel clock
//
msec_timer u_msec_timer(
  .clk            (clk            ), // clock source (at 40 MHz frequency)
  .reset          (reset          ), // reset input
  .msec_elapsed   (msec_elapsed   )  // milliseconds since reset
);

endmodule
