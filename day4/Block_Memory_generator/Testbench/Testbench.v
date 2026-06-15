`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 16:34:46
// Design Name: 
// Module Name: block_mem_generator_tb
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


`timescale 1ns / 1ps

module block_mem_generator_tb;

reg clk;
reg arstn;
reg wr_enb;
reg [2:0] wr_ad;
reg [2:0] rd_add;
reg [7:0] d_in;
wire [7:0] d_out;

block_mem_generator dut(clk,arstn,wr_enb,wr_ad,rd_add,d_in,d_out);


always #5 clk = ~clk;

initial
begin
    clk = 0;
    arstn = 0;
    wr_enb = 0;
    wr_ad = 0;
    rd_add = 0;
    d_in = 0;

    #10 arstn = 1;

    
    #10;
    wr_enb = 1;
    wr_ad = 3'd0;
    d_in = 8'h15;

    #10;
    wr_ad = 3'd1;
    d_in = 8'h5C;

    #10;
    wr_ad = 3'd2;
    d_in = 8'h11;

 
    #10;
    wr_enb = 0;
    rd_add = 3'd0;

    #10;
    rd_add = 3'd1;

    #10;
    rd_add = 3'd2;

   
end

endmodule

