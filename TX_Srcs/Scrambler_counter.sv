/*
Project        : NB_IoT uplink transmitter
Standard doc.  : 
Module name    : Scrambler_counter
Dependancy     :
Design doc.    : 
References     : 
Description    : It counts till 1600 to ensure the randomisation of the scrambler
Owner          : Mariam Ahmed
*/
module Scrambler_counter (
  input  logic 		clk,
  input  logic 		reset,
  input  logic       DisableSignal,
  output logic       cout_done
);

logic [10:0] count;

  always_ff @(posedge clk or negedge reset) begin
		 if (!reset) begin
			count <= 0;
			cout_done<=0;
		 end
		 else if(!DisableSignal) begin
		   if (count == 'd1600) begin
			cout_done<=1;
	
		   end
		   else begin
			count <= count + 1'b1;
			cout_done<=0;
		 end
		 end
		 else begin
		 count <= 0;
		 cout_done<=1;
       end
end
endmodule
