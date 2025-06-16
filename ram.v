module ram (
    input clk,
    input [3:0] addr,
    input [7:0] data_in,
    output reg [7:0] data_out,
    input we,
    input re
);

reg [7:0] mem [15:0]; // 16x8 RAM

initial begin
    data_out = 8'b0; // Initialize output to avoid undefined state
end

always @(posedge clk) begin
    if (we)
        mem[addr] <= data_in;
    else if (re)
        data_out <= mem[addr];
end

endmodule
