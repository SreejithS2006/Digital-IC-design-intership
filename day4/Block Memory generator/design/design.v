

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 13:41:18
// Design Name: 
// Module Name: block_mem_generator
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


module block_mem_generator(input clk,arstn,wr_enb,input [2:0]wr_ad,input [2:0]rd_add,input [7:0]d_in,output reg [7:0]d_out);
reg [7:0]mem [7:0];

integer i;
always @(posedge clk or negedge arstn)
begin
    if(!arstn)
    begin
        d_out <=0;
        for(i=0;i<8;i=i+1)
            mem[i] <= 8'd0;
    end
    else
    begin
        if(wr_enb)
            mem[wr_ad] <= d_in;
        else
            d_out <= mem[rd_add];
    end
end



endmodule
