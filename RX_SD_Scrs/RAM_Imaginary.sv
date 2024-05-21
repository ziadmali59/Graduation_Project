`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2024 05:01:16 PM
// Design Name: 
// Module Name: RAM_Imaginary
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


module RAM_Imaginary (clk, we, en, addr, di, dout);
  input  logic clk;
  input  logic we;
  input  logic en;
  input  logic [3:0] addr;
  input  logic signed [15:0] di;
  output logic signed [15:0] dout;

// this is the only line that changed
(* ram_style = "block" *) logic [15:0] RAM_Imaginary [13:0];

always @(posedge clk)
begin
  if (en)begin
  if (we) begin
  RAM_Imaginary[addr] <= di;
  dout <= di;
  end
  else
  dout <= RAM_Imaginary[addr];
  end
end
endmodule