`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2026 11:56:12
// Design Name: 
// Module Name: program_counter
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


module program_counter(
input clk, reset,
input [31:0] pc_next,
output reg [31:0] pc
    );
    always @(posedge clk or posedge reset) begin
    if(reset) pc <= 32'h00000000;
    else pc <= pc_next;
    end
endmodule
