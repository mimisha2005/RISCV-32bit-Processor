`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2026 15:02:12
// Design Name: 
// Module Name: riscv_tb
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


module riscv_tb();

reg clk;
reg reset;
reg [31:0] instruction;
reg [31:0] mem_read_data;


wire [31:0] pc;
wire [31:0] alu_result;
wire [31:0] mem_write_data;
wire mem_write;

riscv_top dut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .mem_read_data(mem_read_data),
        .pc(pc),
        .alu_result(alu_result),
        .mem_write_data(mem_write_data),
        .mem_write(mem_write)
    );
    
    always begin 
    #5 clk = ~clk;
    end
    
    initial begin 
    clk = 0; 
    reset = 1;
    instruction = 32'h00000000;
    mem_read_data = 32'h00000000;
    
    #20;
    reset = 0;
    
    #10;
    instruction = 32'h005202B3;
    
    #10;
    instruction = 32'h00A00113;
    
    #10;
    instruction = 32'h00202223;
    
    
    #40;
    $finish;
    end
endmodule
