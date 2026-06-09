
module DFF(input d,rst,clk,output q,qbar);
sr_flipflop ff (d,~d,rst,clk,q,qbar);

endmodule
