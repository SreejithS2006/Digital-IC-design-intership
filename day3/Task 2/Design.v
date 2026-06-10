
module top_module(
    input clk,
    input rst,
    input [7:0] d_in,
    output [7:0] d_out
);

wire [7:0] face_data;
wire [7:0] fifo_data;
wire full, empty;

reg wrenb;
reg rdenb;

// Face Detection Module
Face_detect_mod u1 (
    .clk(clk),
    .s_in(d_in),
    .s_out(face_data)
);

// FIFO
FIFO u2 (
    .clk(clk),
    .rst(rst),
    .wrenb(wrenb),
    .rdenb(rdenb),
    .data_in(face_data),
    .data_out(fifo_data),
    .full(full),
    .empty(empty)
);

// Output Module
mod_out u3 (
    .clk(clk),
    .d_in(fifo_data),
    .d_out(d_out)
);

// FIFO Control
always @(posedge clk)
begin
    if (rst)
    begin
        wrenb <= 0;
        rdenb <= 0;
    end
    else
    begin
        // Write if FIFO not full
        if (!full)
            wrenb <= 1;
        else
            wrenb <= 0;

        // Read if FIFO not empty
        if (!empty)
            rdenb <= 1;
        else
            rdenb <= 0;
    end
end

endmodule
