`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////
// Company:        The University of Edinburgh
// Engineer:       Nigel Topham
// 
// Create Date:    13:21:43 07/29/2015 
// Design Name:    prac2
// Module Name:    vga_control
// Project Name:   prac2
// Target Devices: Zync-7020
// Tool versions:  Vivado 2018.3
// Description:    VGA controller module for practical 2
//
// Dependencies:   
//
// Revision: 
// Revision 1.0 - File Created
// Revision 1.1 - Modified to work at 800x600 resolution with 60Hz
//                refresh rate.
//
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////

module vga_control(
  input           clk,              // 108 MHz pixel clock
  input           reset,            // global reset signal
  
  // Frame Buffer read-refresh interface
  //
  output [7:0]    vc_col_address,   // select cols 0..255 within FB
  output [7:0]    vc_row_address,   // select rows 0..255 within FB
  output          vc_request,       // active-high FB request
  input  [23:0]   vc_read_data,     // pixel value read from FB
    
  // VGA output signals
  //
  output [7:0]    vga_red,          // 5-bit Red signal
  output [7:0]    vga_green,        // 6-bit Green signal
  output [7:0]    vga_blue,         // 5- bit Blue signal
  output          vga_hsync,        // Horizontal sync pulse
  output          vga_vsync,        // Vertical sync pulse
  output          vga_enable        // non-blanking indicator
);

`define VGA_800x600x60 1

// `define VGA_test 1

`ifdef VGA_test
// Define the timing parameters for an 800x600 @ 60Hz VGA display
//
parameter HLIMIT        = 11'd15; // max pixel per line
parameter HBLANK_START  = 11'd7;  // start of horizontal blanking
parameter HSYNC_START   = 11'd9;  // start of hsync pulse
parameter HSYNC_END     = 11'd11;  // end of hsync pulse
parameter HSTART        = 11'd2;  // delay to display start
parameter HSTOP         = 11'd6;  // delay to display stop
//
parameter VLIMIT        = 11'd11;  // max line per frame
parameter VBLANK_START  = 11'd5;  // start of vertical blanking
parameter VSYNC_START   = 11'd6;  // start of vsync pulse
parameter VSYNC_END     = 11'd9;  // end of vsync pulse
parameter VSTART        = 11'd1;  // lines of frame to start
parameter VSTOP         = 11'd4;  // lines of frame to end
`endif

`ifdef VGA_800x600x60
// Define the timing parameters for an 800x600 @ 60Hz VGA display
//
parameter HLIMIT        = 11'd1055; // max pixel per line
parameter HBLANK_START  = 11'd799;  // start of horizontal blanking
parameter HSYNC_START   = 11'd839;  // start of hsync pulse
parameter HSYNC_END     = 11'd967;  // end of hsync pulse
parameter HSTART        = 11'd272;  // delay to display start
parameter HSTOP         = 11'd527;  // delay to display stop
//
parameter VLIMIT        = 11'd627;  // max line per frame
parameter VBLANK_START  = 11'd599;  // start of vertical blanking
parameter VSYNC_START   = 11'd600;  // start of vsync pulse
parameter VSYNC_END     = 11'd604;  // end of vsync pulse
parameter VSTART        = 11'd172;  // lines of frame to start
parameter VSTOP         = 11'd427;  // lines of frame to end
`endif

`ifdef VGA_800x600x72
// Define the timing parameters for an 800x600 @ 72Hz VGA display
//
parameter HLIMIT        = 11'd1055; // max pixel per line
parameter HBLANK_START  = 11'd799;  // start of horizontal blanking
parameter HSYNC_START   = 11'd855;  // start of hsync pulse
parameter HSYNC_END     = 11'd975;  // end of hsync pulse
parameter HSTART        = 11'd272;  // delay to display start
parameter HSTOP         = 11'd527;  // delay to display stop
//
parameter VLIMIT        = 11'd627;  // max line per frame
parameter VBLANK_START  = 11'd599;  // start of vertical blanking
parameter VSYNC_START   = 11'd636;  // start of vsync pulse
parameter VSYNC_END     = 11'd642;  // end of vsync pulse
parameter VSTART        = 11'd172;  // lines of frame to start
parameter VSTOP         = 11'd427;  // lines of frame to end
`endif

`ifdef VGA_1280x1024x60
// Define the timing parameters for a 1280x1024 @ 60Hz VGA display
// pix_clk = 108 MHz
parameter HLIMIT        = 11'd1687; // max pixel per line
parameter HBLANK_START  = 11'd1279; // start of horizontal blanking
parameter HSYNC_START   = 11'd1327; // start of hsync pulse
parameter HSYNC_END     = 11'd1439; // end of hsync pulse

parameter HSTART        = 11'd512;  // delay to display start
parameter HSTOP         = 11'd767;  // delay to display stop
//
parameter VLIMIT        = 11'd1065; // max line per frame
parameter VBLANK_START  = 11'd1023; // start of vertical blanking
parameter VSYNC_START   = 11'd1024; // start of vsync pulse
parameter VSYNC_END     = 11'd1027; // end of vsync pulse

parameter VSTART        = 11'd384;  // lines of frame to start
parameter VSTOP         = 11'd639;  // lines of frame to end
`endif

// Define the registers at stage s1 of the VGA pipeline
//
reg   [10:0]      s1_hcount_r;      // counts horizontal pixel periods
reg   [10:0]      s1_vcount_r;      // counts vertical pixel periods
//
reg   [10:0]      s1_hcount_nxt;    // next s1_hcount_r
reg   [10:0]      s1_vcount_nxt;    // next s1_vcount_r

reg               s1_vcount_en;     // enable vcount clock

// Define the registers at stage s2 of the VGA pipeline
//
reg   [10:0]      s2_hcount_r;      // pipelined copy of s1_hcount_r
reg   [10:0]      s2_vcount_r;      // pipelined copy of s1_vcount_r
reg               s2_hblank_r;      // horizontal blanking at s2
reg               s2_vblank_r;      // vertical blanking at s2
reg               s2_hsync_r;       // hsync pulse at s2
reg               s2_vsync_r;       // vsync pulse at s2
reg   [7:0]       s2_col_addr_r;    // column address of next pixel
reg   [7:0]       s2_row_addr_r;    // row address of next pixel
reg               s2_read_en_r;     // read-enable for next pixel
reg               s2_row_enable_r;  // 1=> s2_hcount_r would be in-rnage
reg               s2_col_enable_r;  // 1=> s2_vcount_r would be in-range
//
reg               s2_hblank_nxt;    // next s2_hblank_r
reg               s2_vblank_nxt;    // next s2_vblank_r
reg               s2_hsync_nxt;     // next s2_hsync_r
reg               s2_vsync_nxt;     // next s2_vsync_r
reg   [7:0]       s2_col_addr_nxt;  // next s2_col_addr_r
reg   [7:0]       s2_row_addr_nxt;  // next s2_row_addr_r
reg               s2_read_en_nxt;   // next s2_read_en_r
reg               s2_row_enable_nxt;// next s2_row_enable_r
reg               s2_col_enable_nxt;// next s2_col_enable_r

// Define the registers at stage s3 of the VGA pipeline
//
reg   [10:0]      s3_hcount_r;      // pipelined copy of s2_hcount_r
reg   [10:0]      s3_vcount_r;      // pipelined copy of s2_vcount_r
reg   [23:0]      s3_read_data_r;   // pixel read from frame buffer
reg               s3_hblank_r;      // h-blanking at s3
reg               s3_vblank_r;      // v-blanking at s3
reg               s3_vde_r;         // video data enable at s3
reg               s3_hsync_r;       // hsync pulse at s3
reg               s3_vsync_r;       // vsync pulse at s3
//
reg   [23:0]      s3_read_data_nxt; // next s3_read_data_r
reg               s3_hblank_nxt;    // next s3_hblank_r
reg               s3_vblank_nxt;    // next s3_vblank_r
reg               s3_hsync_nxt;     // next s3_hsync_r
reg               s3_vsync_nxt;     // next s3_vsync_r
reg               s3_vde_nxt;       // next video data enable at s3

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Combinational process defining the next state for all s1 registers //
//                                                                    //
////////////////////////////////////////////////////////////////////////

always @*
begin: s1_comb_PROC

  s1_vcount_en      = (s1_hcount_r == HLIMIT);
  
  s1_hcount_nxt     = (s1_hcount_r == HLIMIT)
                    ? 11'd0
                    : s1_hcount_r + 1
                    ;
                    
  s1_vcount_nxt     = (s1_vcount_r == VLIMIT) ? 11'd0 : s1_vcount_r + 1;
 
end // s1_comb_PROC

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Combinational process defining the next state for all s2 registers //
//                                                                    //
////////////////////////////////////////////////////////////////////////

always @*
begin: s2_comb_PROC
  s2_hblank_nxt     = (s1_hcount_r == HBLANK_START)
                    | (s2_hblank_r && (s1_hcount_r != HLIMIT))
                    ;
  
  s2_vblank_nxt     = (    (s1_vcount_r == VBLANK_START)
                        && (s1_hcount_r == HBLANK_START))
                    | (s2_vblank_r && (s1_vcount_r != VLIMIT))
                    ;

  s2_hsync_nxt      = (s1_hcount_r == HSYNC_START)
                    | (s2_hsync_r && (s1_hcount_r != HSYNC_END))
                    ;
  
  s2_vsync_nxt      = (    (s1_vcount_r == VSYNC_START)
                        && (s1_hcount_r == HSYNC_START))
                    | (    s2_vsync_r
                        && !(    (s1_vcount_r == VSYNC_END)
                              && (s1_hcount_r == HSYNC_START)
                            )
                      )
                    ;

  s2_row_enable_nxt = (    (s1_hcount_r >= HSTART)
                        && (s1_hcount_r <= HSTOP) )
                    ;
                    
  s2_col_enable_nxt = (    (s1_vcount_r >= VSTART)
                        && (s1_vcount_r <= VSTOP) )
                    ;
                    
  s2_col_addr_nxt   = s2_col_addr_r + 1;
  
  s2_row_addr_nxt   = (s2_col_addr_r == 8'd255)
                    ? s2_row_addr_r + 1
                    : s2_row_addr_r
                    ;

  s2_read_en_nxt    = (s2_row_enable_nxt & s2_col_enable_nxt);
  
end // s2_comb_PROC

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Combinational process defining the next state for all s3 registers //
//                                                                    //
////////////////////////////////////////////////////////////////////////

wire [23:0] bground = 24'h00_00_00;

always @*
begin: s3_comb_PROC
  s3_read_data_nxt  = s2_read_en_r ? vc_read_data : bground;
  s3_hsync_nxt      = s2_hsync_r;
  s3_vsync_nxt      = s2_vsync_r;
  s3_hblank_nxt     = s2_hblank_r;
  s3_vblank_nxt     = s2_vblank_r;
  s3_vde_nxt        = !(s3_hblank_nxt | s3_vblank_nxt);
end // s3_comb_PROC

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Sequential process defining all s1 pipeline registers              //
//                                                                    //
////////////////////////////////////////////////////////////////////////

always @(posedge clk or posedge reset)
begin: s1_seq_PROC
  if (reset == 1'b1)
    begin
    s1_hcount_r   <= 11'd0;
    s1_vcount_r   <= 11'd0;
    end
  else
    begin
    s1_hcount_r   <= s1_hcount_nxt;
    
    if (s1_vcount_en == 1'b1)
      s1_vcount_r   <= s1_vcount_nxt;
    end
end // s1_seq_PROC

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Sequential process defining all s2 pipeline registers              //
//                                                                    //
////////////////////////////////////////////////////////////////////////

always @(posedge clk or posedge reset)
begin: s2_seq_PROC
  if (reset == 1'b1)
    begin
    s2_hcount_r     <= 11'd0;
    s2_vcount_r     <= 11'd0;
    s2_vsync_r      <= 1'b0;
    s2_hsync_r      <= 1'b0;
    s2_vblank_r     <= 1'b0;
    s2_hblank_r     <= 1'b0;
    s2_col_addr_r   <= 8'd0;
    s2_row_addr_r   <= 8'd0;
    s2_read_en_r    <= 1'b0;
    s2_row_enable_r <= 1'b0;
    s2_col_enable_r <= 1'b0;
    end
  else
    begin
    s2_hcount_r     <= s1_hcount_r;
    s2_vcount_r     <= s1_vcount_r;
    s2_vsync_r      <= s2_vsync_nxt;
    s2_hsync_r      <= s2_hsync_nxt;
    s2_vblank_r     <= s2_vblank_nxt;
    s2_hblank_r     <= s2_hblank_nxt;
    s2_read_en_r    <= s2_read_en_nxt;
    s2_row_enable_r <= s2_row_enable_nxt;
    s2_col_enable_r <= s2_col_enable_nxt;
    
    if (s2_read_en_r == 1'b1)
      begin
      s2_col_addr_r <= s2_col_addr_nxt;
      s2_row_addr_r <= s2_row_addr_nxt;
      end
    end
end // s2_seq_PROC

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Sequential process defining all s3 pipeline registers              //
//                                                                    //
////////////////////////////////////////////////////////////////////////

always @(posedge clk or posedge reset)
begin: s3_seq_PROC
  if (reset == 1'b1)
    begin
    s3_hcount_r     <= 11'd0;
    s3_vcount_r     <= 11'd0;
    s3_vsync_r      <= 1'b0;
    s3_hsync_r      <= 1'b0;
    s3_vblank_r     <= 1'b0;
    s3_hblank_r     <= 1'b0;
    s3_vde_r        <= 1'b0;
    s3_read_data_r  <= 24'd0;
    end
  else
    begin
    s3_hcount_r     <= s2_hcount_r;
    s3_vcount_r     <= s2_vcount_r;
    s3_vsync_r      <= s3_vsync_nxt;
    s3_hsync_r      <= s3_hsync_nxt;
    s3_vblank_r     <= s3_vblank_nxt;
    s3_hblank_r     <= s3_hblank_nxt;
    s3_vde_r        <= s3_vde_nxt;
    s3_read_data_r  <= s3_read_data_nxt;
    end
end // s3_seq_PROC

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Assignment of output wires                                         //
//                                                                    //
////////////////////////////////////////////////////////////////////////

assign vc_col_address = s2_col_addr_r;
assign vc_row_address = s2_row_addr_r;
assign vc_request     = s2_read_en_r;
assign vga_red        = s3_read_data_r[23:16];
assign vga_green      = s3_read_data_r[15:8];
assign vga_blue       = s3_read_data_r[7:0];
assign vga_hsync      = s3_hsync_r;
assign vga_vsync      = s3_vsync_r;
assign vga_enable     = s3_vde_r;

endmodule
