`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2026 12:09:52
// Design Name: 
// Module Name: register_file
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


module register_file(
input clk, reg_write, reset,
input [4:0] rs1, rs2, rd,
input [31:0] write_data,
output [31:0] read_data1, read_data2
    );
    reg [31:0] registers [31:0];
    assign read_data1 = (rs1 == 0) ? 32'b0 : registers[rs1];
    assign read_data2 = (rs2 == 0) ? 32'b0 : registers[rs2];
    integer i;
    always @(posedge clk) begin
    if(reset) begin 
    for(i = 0; i < 32; i = i+1) begin 
      registers[i] <= 32'h00000000;
      end
    end else if(reg_write && (rd != 0)) begin
    registers[rd] <= write_data;
    end
   end
endmodule
