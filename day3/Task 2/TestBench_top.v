
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 21:45:17
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb;

reg clk;
reg rst;
reg [7:0] d_in;
wire [7:0] d_out;

top_module DUT (
    .clk(clk),
    .rst(rst),
    .d_in(d_in),
    .d_out(d_out)
);

// Clock generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial
begin
    rst = 1;
    d_in = 8'd0;

    #20;
    rst = 0;

    #10 d_in = 8'd10;
    #10 d_in = 8'd20;
    #10 d_in = 8'd30;
    #10 d_in = 8'd40;
    #10 d_in = 8'd50;
    #10 d_in = 8'd60;
    #10 d_in = 8'd70;
    #10 d_in = 8'd80;

    
end

endmodule
