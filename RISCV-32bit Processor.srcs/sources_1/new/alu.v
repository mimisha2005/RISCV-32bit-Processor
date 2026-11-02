`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2026 12:27:14
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
input [31:0] a, b,
input [3:0] alu_control,
output reg [31:0] alu_result,
output zero
    );
    always @(*) begin 
    case(alu_control) 
    4'b0000: alu_result = a + b;
    4'b0001: alu_result = a - b;
    4'b0010: alu_result = a & b;
    4'b0011: alu_result = a | b;
    4'b0100: alu_result = a ^ b;
    4'b0101: alu_result = a << b[4:0];
    default: alu_result = 32'b0;
    endcase
    end
    assign zero = (alu_result == 32'b0);
endmodule
