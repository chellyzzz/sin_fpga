`timescale 1ns/1ns

module sin_table_testbench;
    reg clk, rst_n;
    reg [7:0] io_a_in, io_b_in;
    wire [7:0] io_a_out, io_b_out;
    wire [7:0] io_a_oe, io_b_oe;

    digital_io dut (
        .clk(clk),
        .rst_n(rst_n),
        .io_a_in(io_a_in),
        .io_a_out(io_a_out),
        .io_a_oe(io_a_oe),
        .io_b_in(io_b_in),
        .io_b_out(io_b_out),
        .io_b_oe(io_b_oe)
    );

    initial begin
        clk = 0;
        rst_n = 0;
        io_a_in = 8'b01000000;
        io_b_in = 8'b11000000;
        #50 rst_n = 1;
        #50 io_a_in = 8'b11000000;
        #10240 io_a_in = 8'b10000000;
        #50 rst_n = ~rst_n;
        #50 rst_n = ~rst_n;
        #50 io_a_in[7] = ~io_a_in[7];
        #50 io_a_in[7] = ~io_a_in[7];
        #10240 $finish;
    end
    // initial begin

    // end
    always #5 clk = ~clk;

    // Add test vectors here if needed

endmodule
