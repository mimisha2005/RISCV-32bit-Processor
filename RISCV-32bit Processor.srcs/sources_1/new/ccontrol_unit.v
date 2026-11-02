`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2026 12:40:04
// Design Name: 
// Module Name: control_unit
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


module control_unit(
input [6:0] opcode,
output reg reg_write, alu_src, mem_to_reg, mem_write,
output reg [1:0] alu_op
    );
    
    always @(*) begin
    case(opcode) 
    7'b0110011: begin 
    reg_write = 1; alu_src = 0; mem_to_reg = 0; mem_write = 0; alu_op = 2'b10;
    end 
    7'b0010011: begin 
    reg_write = 1; alu_src = 1; mem_to_reg = 0; mem_write = 0; alu_op = 2'b11;
    end
    7'b0000011: begin 
    reg_write = 1; alu_src = 1; mem_to_reg = 1; mem_write = 0; alu_op = 2'b00;
    end
    7'b0100011: begin 
    reg_write = 0; alu_src = 1; mem_to_reg = 0; mem_write = 1; alu_op = 2'b00;
    end
    default: begin
    reg_write = 0; alu_src = 0; mem_to_reg = 0; mem_write = 0; alu_op = 2'b00;
     end
    endcase
end
endmodule
