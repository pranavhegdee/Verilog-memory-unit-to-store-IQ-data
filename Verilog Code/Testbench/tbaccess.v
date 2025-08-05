module tb_once();

    reg clk = 0;
    reg rst = 1;

    wire signed [7:0] I, Q;
    wire signed [8:0] add_result, sub_result;
    wire signed [15:0] mul_result;
    wire [9:0] used_addr;

    // Instantiate processor
    iq_processor_once uut (
        .clk(clk),
        .rst(rst),
        .used_addr(used_addr),
        .I(I),
        .Q(Q),
        .add_result(add_result),
        .sub_result(sub_result),
        .mul_result(mul_result)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Time\tAddr\tI\tQ\tADD\tSUB\tMUL");
        #10 rst = 0;

        #50;
        $display("%t\t%d\t%d\t%d\t%d\t%d\t%d", $time, used_addr, I, Q, add_result, sub_result, mul_result);
        $finish;
    end

endmodule
