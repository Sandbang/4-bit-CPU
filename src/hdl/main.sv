`timescale 1ns / 1ps

module main(
    input [11:0] in,
    //input clk,
    //input switch0,
    output reg [6:0] seg,
    output reg [3:0] anode,
    output reg [2:0] ledUi
    //output reg check //lights turns on or off when an action occurs
);
    reg [3:0] a;
    reg [3:0] b;
    //reg [3:0] tmpReg;
    //reg [3:0] reg0;
    //reg [3:0] reg1;
    //reg [3:0] reg2;
    //reg [3:0] reg3;
    reg [3:0] aluOut; //allows us to not always be using the ALU
    //assign check = 0;
    assign ledUi[0] = 1;
    assign ledUi[1] = 1;
    assign ledUi[2] = 1;
    reg overFlow;
    ALU alu (.opCode(in[3:0]), .a(in[7:4]), .b(in[11:8]), .aOut(aluOut), .overFlow(overFlow)); //instantiates ALU
    seg7disp display(.sw(aluOut), .overFlow(overFlow), .seg(seg), .anode(anode)); //displays A

endmodule
