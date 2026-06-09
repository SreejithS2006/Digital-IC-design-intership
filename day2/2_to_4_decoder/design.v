`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 16:07:38
// Design Name: 
// Module Name: Decoder_2_4
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


module Decoder_2_4(input [1:0]i, output reg [3:0]Y);
always @(*)
begin
case(i)
2'b00:Y=4'b0001;
2'b01:Y=4'b0010;
2'b10:Y=4'b0100;
2'b11:Y=4'b1000;
default:Y=4'b0000;

endcase
end
endmodule

