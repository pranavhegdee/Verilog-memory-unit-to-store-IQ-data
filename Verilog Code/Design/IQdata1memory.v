module iqmemory(
    input wire clk,
    input wire [9:0] addr,        // 10-bit address → 1024 locations
    output reg [15:0] dout        // 16-bit data output (I and Q packed)
);

    reg [15:0] mem [0:1023];      // 1024 memory locations, 16-bit each

    // Load data from hex file at simulation start
    initial begin
       $readmemh("iq_data_scaled.hex", mem);


   // Make sure file is in simulation directory
    end

    // Read data from memory on clock tick
    always @(posedge clk) begin
        dout <= mem[addr];
    end

endmodule
