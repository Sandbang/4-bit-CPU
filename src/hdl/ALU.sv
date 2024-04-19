`timescale 1ns / 1ps
module ALU(
    input wire [3:0] opCode,
    input wire [3:0] a,
    input wire [3:0] b,
    output reg [3:0] aOut,
    output reg overFlow
    );
    always @(*)
    begin
        case(opCode)
        4'b0100:  begin //add a and b
            if (a+b>15)begin
                overFlow = 1;
            end
            else begin
                aOut = a+b;
                overFlow = 0;
            end
        end
        4'b0101: begin //sub a and b
            if (a<b)begin
                overFlow = 1;
            end
            else begin
                aOut = a-b;
                overFlow = 0;
            end
        end
        4'b0110: begin //a or b
            aOut[0] = a[0] || b[0];
            aOut[1] = a[1] || b[1];
            aOut[2] = a[2] || b[2];
            aOut[3] = a[3] || b[3];
            overFlow = 0;
        end
        4'b0111: begin //a and b
            aOut[0] = a[0] && b[0];
            aOut[1] = a[1] && b[1];
            aOut[2] = a[2] && b[2];
            aOut[3] = a[3] && b[3];
            overFlow = 0;
        end 
        4'b1000: begin //not a
            aOut[0] = !a[0];
            aOut[1] = !a[1];
            aOut[2] = !a[2];
            aOut[3] = !a[3];
            overFlow = 0;
        end 
        default: begin
            aOut[0] = 0;
            aOut[1] = 0;
            aOut[2] = 0;
            aOut[3] = 0;
            overFlow = 0;
        end
        endcase
    end
endmodule
