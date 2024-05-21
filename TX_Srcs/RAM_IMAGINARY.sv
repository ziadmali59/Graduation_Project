module RAM_IMAGINARY (clk, we, en, addr, di, dout);
  input  logic clk;
  input  logic we;
  input  logic en;
  input  logic [3:0] addr;
  input  logic signed [15:0] di;
  output logic signed [15:0] dout;

// this is the only line that changed
(* ram_style = "block" *) logic [15:0] RAM_IMAGINARY [13:0];

always @(posedge clk)
begin
  if (en)begin
  if (we) begin
  RAM_IMAGINARY[addr] <= di;
  dout <= di;
  end
  else
  dout <= RAM_IMAGINARY[addr];
  end
end

endmodule