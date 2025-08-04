module iq_processor_once (
    input wire clk,
    input wire rst,
    output reg [9:0] used_addr,
    output reg signed [7:0] I,
    output reg signed [7:0] Q,
    output reg signed [8:0] add_result,
    output reg signed [8:0] sub_result,
    output reg signed [15:0] mul_result
);
    wire [15:0] dout;

    // Instantiate memory
    iqmemory mem (
        .clk(clk),
        .addr(used_addr),
        .dout(dout)
    );

    reg done = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            used_addr <= $urandom % 1024;  // Random address only once
            done <= 0;
        end else if (!done) begin
            I <= dout[15:8];
            Q <= dout[7:0];

            add_result <= $signed(dout[15:8]) + $signed(dout[7:0]);
            sub_result <= $signed(dout[15:8]) - $signed(dout[7:0]);
            mul_result <= $signed(dout[15:8]) * $signed(dout[7:0]);

            done <= 1;  // Only do this once
        end
    end
endmodule
