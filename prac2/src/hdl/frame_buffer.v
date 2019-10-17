////////////////////////////////////////////////////////////////////////
// Company:        The University of Edinburgh
// Engineer:       Nigel Topham
// 
// Create Date:    13:21:43 07/29/2015 
// Design Name:    prac2
// Module Name:    frame_buffer
// Project Name:   prac2
// Target Devices: Zync-7020
// Tool versions:  Vivado 2018.3
// Description:    Frame buffer module for practical 2
//
// Dependencies:   
//
// Revision: 
// Revision 1.0 - File Created
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////

module frame_buffer(
  input           clk,              // 108 MHz pixel clock
  input           reset,            // global reset signal

  // Frame Buffer read-refresh interface with VGA Controller
  //
  input  [7:0]    vc_col_address,   // select cols 0..255 within FB
  input  [7:0]    vc_row_address,   // select rows 0..255 within FB
  input           vc_request,       // active-high FB request
  output [23:0]   vc_read_data,     // pixel value read from FB

  // Frame Buffer read-write interface with User Module
  //
  input  [7:0]    px_col_address,   // select cols 0..255 within FB
  input  [7:0]    px_row_address,   // select rows 0..255 within FB
  input  [23:0]   px_write_data,    // pixel value to be written to FB
  input           px_request,       // active-high FB request
  input           px_write,         // 1=> write FB, 0 => read FB
  output [23:0]   px_read_data,     // pixel value read from FB
  output reg      px_ready          // 1=> write done or read data ready
);

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Declare the Frame Buffer memory. This is a 16-bit wide memory      //
// containing 65536 entries (128KB in total). It implements a         //
// frame buffer for a 256x256 region, with 16-bit pixels              //
//                                                                    //
////////////////////////////////////////////////////////////////////////

parameter RAM_WIDTH     = 24;
parameter RAM_MSB       = RAM_WIDTH-1;
parameter RAM_ADDR_BITS = 16;
parameter RAM_MAX_WORD  = 65536;

reg [23:0]        fb_memory[0:65536];

reg [15:0]        fb_addr;      // muxed address to fb_memory
reg [23:0]        fb_wr_data;   // selected write data for fb_memory
reg [23:0]        fb_rd_data;   // read data from fb_memory
reg               fb_cen;       // fb_memory 'chip enable' signal
reg               fb_wen;       // fb_memory 'write enable' signal
reg               px_sel;       // 0=>vga; 1=>px interface

integer i;

initial
begin
  for (i = 0; i < 65536; i = i + 1)
    fb_memory[i] = {8'h10, 8'h3f, 8'h0f}; 
end

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Combinational process to abitrate accesses to fb_memory            //
//                                                                    //
////////////////////////////////////////////////////////////////////////

always @*
begin: fb_arb_PROC

  px_sel      = 1'b0;
  fb_addr     = 16'd0;
  fb_wr_data  = px_write_data;
  fb_cen      = 1'b0;
  fb_wen      = 1'b0;

  if (vc_request == 1'b1)
    begin
    fb_addr     = {vc_row_address, vc_col_address};
    fb_cen      = 1'b1;
    end
  else
    begin
    if (px_request == 1'b1)
      begin
      fb_addr   = {px_row_address, px_col_address};
      fb_cen    = 1'b1;
      fb_wen    = px_write;
      px_sel    = 1'b1;
      end
    end

end // fb_arb_PROC

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Combinational process for user interface state machine             //
//                                                                    //
////////////////////////////////////////////////////////////////////////

parameter PX_IDLE     = 2'd0;
parameter PX_RD_WAIT  = 2'd1;
parameter PX_RD_READY = 2'd2;

reg [1:0] px_state_r;
reg [1:0] px_state_nxt;

always @*
begin: fb_ack_PROC

  px_ready     = 1'b0;
  px_state_nxt = px_state_r;
  
  case (px_state_r)
    PX_IDLE:
        begin
        if ((px_sel == 1'b1) && (px_write == 1'b0))
          px_state_nxt = PX_RD_WAIT;
        else if ((px_sel == 1'b1) && (px_write == 1'b1))
          px_ready     = 1'b1;
        end
                
    PX_RD_WAIT:
        begin
        px_state_nxt = PX_RD_READY;
        px_ready     = 1'b0;
        end
        
    PX_RD_READY:
        begin
        px_state_nxt = PX_IDLE;
        px_ready     = 1'b1;
        end
        
    default: 
        begin
        px_state_nxt = PX_IDLE;
        px_ready     = 1'b0;
        end
       
  endcase

end

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Sequential process for bus response state machine                  //
//                                                                    //
////////////////////////////////////////////////////////////////////////

always @(posedge clk or posedge reset)
begin: px_fsm_PROC
    if (reset == 1'b1)
      begin
      px_state_r <= 2'd0;
      end
    else
      begin
      px_state_r <= px_state_nxt;
      end
end

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Sequential process defining the frame buffer RAM                   //
//                                                                    //
////////////////////////////////////////////////////////////////////////

always @(posedge clk)
begin: fb_memory_PROC

  if (fb_cen == 1'b1)
    begin
    if (fb_wen == 1'b1)
      fb_memory[fb_addr] <= fb_wr_data;
    fb_rd_data <= fb_memory[fb_addr];
    end
  else
    fb_rd_data <= 24'd0;

end // fb_memory_PROC

////////////////////////////////////////////////////////////////////////
//                                                                    //
// Assignment of output wires                                         //
//                                                                    //
////////////////////////////////////////////////////////////////////////

assign vc_read_data   = fb_rd_data;
assign px_read_data   = fb_rd_data;

endmodule
