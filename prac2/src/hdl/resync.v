`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         The University of Edinburgh
// Engineer:        Nigel Topham
// 
// Create Date:     17.09.2015 14:48:41
// Design Name:     Practical 2
// Module Name:     resync
// Project Name:    Computer Design
// Target Devices:  Zync-7020
// Tool Versions:   2018.3
// Description:     Module to resynchronize asynchronous external inputs
// 
// Dependencies:    none
// 
// Revision:
// Revision 1.0  - File Created
// Revision 1.1  - Added facility to synchronize the px_ready signal (13/8/2019)
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module resync(
    input         clk,          // global clock input signal
    input         rst_a,        // asynchronous reset signal
    input  [3:1]  btn_a,        // asynchronous push buttons
    input  [1:0]  switch_a,     // asynchrounous switches
    input         px_ready_a,   // asynchronous ack from display driver
    output        reset,        // synchronized reset output
    output [3:1]  buttons,      // synchronized button outputs
    output [1:0]  switches,     // synchronized switch outputs
    output        px_ready      // synchronized ack from display driver
);

// Declare reg variables through which to infer synchronizing flip-flop pairs

reg [1:0] sync_resetn_r;
reg [3:1] sync_btn_1_r;
reg [3:1] sync_btn_2_r;
reg [3:0] sync_switch_1_r;
reg [3:0] sync_switch_2_r;
reg [1:0] sync_px_ready_r;

always @(posedge clk or posedge rst_a)
begin: resync_PROC
    if (rst_a == 1'b1)
        begin
        sync_resetn_r   <= 2'b00;
        //
        sync_btn_1_r    <= 3'd0;
        sync_btn_2_r    <= 3'd0;
        //
        sync_switch_1_r <= 4'd0;
        sync_switch_2_r <= 4'd0;
        //
        sync_px_ready_r <= 2'b00;
        end
    else
        begin
        sync_resetn_r   <= {sync_resetn_r[0], 1'b1};
        //
        sync_btn_1_r    <= btn_a;
        sync_btn_2_r    <= sync_btn_1_r;
        //
        sync_switch_1_r <= switch_a;
        sync_switch_2_r <= sync_switch_1_r;
        //
        sync_px_ready_r <= {sync_px_ready_r[0], px_ready_a};
        end
end // resync_PROC

// Assign outputs from the second synchronizing flip-flop

assign buttons  = sync_btn_2_r;
assign switches = sync_switch_2_r;
assign reset    = !sync_resetn_r[1];   // reset is active high, needs inversion
assign px_ready = sync_px_ready_r[1];

endmodule
