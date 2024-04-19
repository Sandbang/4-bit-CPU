`timescale 1ns / 1ps

module tb_ALU();
reg [3:0] opCode;
reg [3:0] a;
reg [3:0] b;
wire [3:0] aOut;
wire overFlow;

ALU dut(.opCode(opCode), .a(a), .b(b), .aOut(aOut), .overFlow(overFlow));

reg [11:0] testbenchVid = 0;

initial begin
    for(int i =0; i<4096; i=i+1) begin
        testbenchVid = i;
        opCode = testbenchVid[3:0];
        a = testbenchVid[7:4];
        b = testbenchVid[11:8];
        #1;
    end
end


endmodule
