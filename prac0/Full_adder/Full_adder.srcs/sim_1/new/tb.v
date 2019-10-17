`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2019 16:39:56
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb;

reg tb_a, tb_b, tb_c_in, tb_clock, tb_reset;
wire tb_sum, tb_c_out;

top u_top (
    .a (tb_a),
    .b (tb_b),
    .c_in (tb_c_in),
    .sum (tb_sum),
    .c_out (tb_c_out),
    .clock (tb_clock), 
    .reset (tb_reset)
);

initial
    begin
    {tb_a, tb_b, tb_c_in, tb_clock, tb_reset} = 5'b00000;
    
    #100;
    
    #10 {tb_a, tb_b, tb_c_in} = 3'b001;
    #10 {tb_a, tb_b, tb_c_in} = 3'b010;
    #10 {tb_a, tb_b, tb_c_in} = 3'b011;
    #10 {tb_a, tb_b, tb_c_in} = 3'b100;
    #10 {tb_a, tb_b, tb_c_in} = 3'b101;
    #10 {tb_a, tb_b, tb_c_in} = 3'b110;
    #10 {tb_a, tb_b, tb_c_in} = 3'b111;
    
    #10 $finish;
    end

endmodule
