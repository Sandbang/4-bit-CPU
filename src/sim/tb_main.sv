`timescale 1ns / 1ps

module tb_main();
reg [7:0 ] in;
reg clk;
wire [6:0] seg;
wire [3:0] anode;
wire check;

main dut(.in(in), .clk(clk), .seg(seg), .anode(anode), .check(check));
initial begin
    in = 8'b00010000;
    clk = 1;
    #10
    in = 8'b00100000;
    clk = 1;
end

endmodule
