module DFF_tb();
reg d_tb;
reg rst_tb;
reg clk_tb;
wire q_tb;
wire qbar_tb;
DFF dut( d_tb,rst_tb,clk_tb,q_tb,qbar_tb);
initial
begin
    clk_tb = 0;
    forever #5 clk_tb = ~clk_tb;
    end
    initial
begin
    d_tb=0;
    rst_tb = 1;

    #10;
    rst_tb = 0;

    d_tb = 0;
    #10;

    d_tb = 1;
   
end

initial
begin
    $monitor("Time=%0t clk=%b rst=%b d=%b  q=%b qbar=%b",
             $time, clk_tb, rst_tb, d_tb, q_tb, qbar_tb);
end
endmodule
