`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2026 14:43:00
// Design Name: 
// Module Name: riscv_top
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


module riscv_top(
input clk, reset,
input [31:0] instruction,
input [31:0] mem_read_data,
output [31:0] pc,
output [31:0] alu_result,
output [31:0] mem_write_data,
output mem_write
    );
    
    wire [4:0] rs1 = instruction[19:15];
    wire [4:0] rs2 = instruction[24:20];
    wire [4:0] rd = instruction[11:7];
    wire [6:0] opcode = instruction[6:0];
    
    wire reg_write, alu_src, mem_to_reg;
    wire [1:0] alu_op;
    wire [3:0] alu_control;
    
    wire [31:0] pc_next = pc + 4;
    wire [31:0] rdata1, rdata2;
    wire [31:0] imm_ext = {{20{instruction[31]}},{instruction[31:20]}};
    wire [31:0] alu_operand_b =  alu_src ? imm_ext : rdata2;
    wire [31:0] wdata = mem_to_reg ? mem_read_data : alu_result;
    
    program_counter pc_mod (.clk(clk), .reset(reset), .pc_next(pc_next), .pc(pc));
    
    control_unit ctrl_mod (.opcode(opcode), .reg_write(reg_write), .alu_src(alu_src), 
                           .mem_to_reg(mem_to_reg), .mem_write(mem_write), .alu_op(alu_op));
                           
    register_file reg_mod (.clk(clk), .reg_write(reg_write), .rs1(rs1), .rs2(rs2), .rd(rd), 
                           .write_data(wdata), .read_data1(rdata1), .read_data2(rdata2));
                           
    alu alu_mod (.a(rdata1), .b(alu_operand_b), .alu_control(alu_control), .alu_result(alu_result));

    assign mem_write_data = mem_write ? rdata2 : 32'h00000000;
endmodule
