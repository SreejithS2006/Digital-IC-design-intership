
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 22:14:48
// Design Name: 
// Module Name: BCD_tb
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


module BCD_tb();
reg [3:0] A_tb;
reg [3:0]B_tb;
reg cin_tb;
wire [3:0] S_tb;
wire cout_tb;
 bcd_adder dut(A_tb,B_tb,cin_tb, S_tb, cout_tb);
initial 
begin
  {A_tb, B_tb, cin_tb} = 0;
end

initial 
begin
 A_tb = 4'b0000; B_tb = 4'b0000; cin_tb = 0; #1;
    A_tb = 4'b0011; B_tb = 4'b0101; cin_tb = 0; #1;
    A_tb = 4'b0111; B_tb = 4'b0001; cin_tb = 0; #1;
    A_tb = 4'b1111; B_tb = 4'b0001; cin_tb = 0; #1;
    A_tb = 4'b1010; B_tb = 4'b0101; cin_tb = 1; #1;
    A_tb = 4'b1111; B_tb = 4'b1111; cin_tb = 1; #1;
    $monitor("time=%0t A=%b B=%b Cin=%b Sum=%b Cout=%b",
             $time, A_tb, B_tb, cin_tb, S_tb, cout_tb);
end 
endmodule
