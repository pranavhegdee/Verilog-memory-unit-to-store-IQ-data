module iqdata_tb( );  
 reg clk = 0;
    reg [9:0] addr = 0;
    wire [15:0] dout;
    wire signed [7:0] I = dout[15:8];
    wire signed [7:0] Q = dout[7:0];

    // Instantiate the memory module
    iqmemory uut (
        .clk(clk),
        .addr(addr),
        .dout(dout)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        $display("Time\tAddr\tI\tQ");
        $monitor("%t\t%0d\t%d\t%d", $time, addr, I, Q);

        #10;
        repeat (16) begin
            #10;
            addr = addr + 1;
        end

        #20;
        $finish;
    end
