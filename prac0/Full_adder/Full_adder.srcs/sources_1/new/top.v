`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2019 16:09:47
// Design Name: 
// Module Name: top
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


module top(
    input a,
    input b,
    input c_in,
    output reg sum,
    output reg c_out,
    input clock,
    input reset 
    );
    
wire adder_sum, adder_cout;
    
// assign {c_out, sum} = a + b + c_in;
assign adder_cout = a && b || b && c_in || a && c_in;
assign adder_sum = !a && !b && c_in || !a && b && !c_in || a && b && c_in || a && !b && !c_in;

always @(posedge clock or posedge reset)
begin 
    if (reset == 1'b1)
        {sum, c_out} <= 2'b00;
    else
        {sum, c_out} <= {adder_sum, adder_cout};
end

endmodule
