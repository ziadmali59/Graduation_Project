module DMRS (
input    logic  [4:0] u,
input    logic  [5:0]i_Isc,
input    logic  [1:0]sixTone_BaseSequence,
input    logic  [1:0]threeTone_BaseSequence,
input    logic  [3:0]i_Nsc,
//input 	 logic  i_start,
input    logic  i_rst_n, 
output	 logic	 o_valid,
output   logic signed [15:0] o_DMRS_Real[11:0],
output   logic signed [15:0] o_DMRS_Imaginary[11:0] 
);
logic signed[15:0] phis_real[11:0];
logic signed[15:0] phis_Imaginary[11:0];
Data_Provider_DMRS DATA(
.u(u),
.sixTone_BaseSequence(sixTone_BaseSequence),
.threeTone_BaseSequence(threeTone_BaseSequence),
.i_Nsc(i_Nsc),
.phis_real(phis_real),
.phis_Imaginary(phis_Imaginary) 
);
always_comb begin

if(!i_rst_n)begin
				o_DMRS_Real[0]<=16'b0;
				o_DMRS_Real[1]<=16'b0;
				o_DMRS_Real[2]<=16'b0;
				o_DMRS_Real[3]<=16'b0;
				o_DMRS_Real[4]<=16'b0;
				o_DMRS_Real[5]<=16'b0;
				o_DMRS_Real[6]<=16'b0;
				o_DMRS_Real[7]<=16'b0;
				o_DMRS_Real[8]<=16'b0;
				o_DMRS_Real[9]<=16'b0;
				o_DMRS_Real[10]<=16'b0;
				o_DMRS_Real[11]<=16'b0;

				//
				o_DMRS_Imaginary[0]<=16'b0;
				o_DMRS_Imaginary[1]<=16'b0;
				o_DMRS_Imaginary[2]<=16'b0;
				o_DMRS_Imaginary[3]<=16'b0;
				o_DMRS_Imaginary[4]<=16'b0;
				o_DMRS_Imaginary[5]<=16'b0;
				o_DMRS_Imaginary[6]<=16'b0;
				o_DMRS_Imaginary[7]<=16'b0;
				o_DMRS_Imaginary[8]<=16'b0;
				o_DMRS_Imaginary[9]<=16'b0;
				o_DMRS_Imaginary[10]<=16'b0;
				o_DMRS_Imaginary[11]<=16'b0;

				
				o_valid<=0;
end
else begin
//if(i_start) begin
case(i_Isc)
				6'b1100: begin
				o_DMRS_Real[0]<=phis_real[0];
				o_DMRS_Real[1]<=phis_real[1];
				o_DMRS_Real[2]<=phis_real[2];
				o_DMRS_Real[3]<=16'b0;
				o_DMRS_Real[4]<=16'b0;
				o_DMRS_Real[5]<=16'b0;
				o_DMRS_Real[6]<=16'b0;
				o_DMRS_Real[7]<=16'b0;
				o_DMRS_Real[8]<=16'b0;
				o_DMRS_Real[9]<=16'b0;
				o_DMRS_Real[10]<=16'b0;
				o_DMRS_Real[11]<=16'b0;

				//
				o_DMRS_Imaginary[0]<=phis_Imaginary[0];
				o_DMRS_Imaginary[1]<=phis_Imaginary[1];
				o_DMRS_Imaginary[2]<=phis_Imaginary[2];
				o_DMRS_Imaginary[3]<=16'b0;
				o_DMRS_Imaginary[4]<=16'b0;
				o_DMRS_Imaginary[5]<=16'b0;
				o_DMRS_Imaginary[6]<=16'b0;
				o_DMRS_Imaginary[7]<=16'b0;
				o_DMRS_Imaginary[8]<=16'b0;
				o_DMRS_Imaginary[9]<=16'b0;
				o_DMRS_Imaginary[10]<=16'b0;
				o_DMRS_Imaginary[11]<=16'b0;

				
				o_valid<=1;
			
				end
				6'b1101: begin
				o_DMRS_Real[0]<=16'b0;
				o_DMRS_Real[1]<=16'b0;
				o_DMRS_Real[2]<=16'b0;
				o_DMRS_Real[3]<=phis_real[0];
				o_DMRS_Real[4]<=phis_real[1];
				o_DMRS_Real[5]<=phis_real[2];
				o_DMRS_Real[6]<=16'b0;
				o_DMRS_Real[7]<=16'b0;
				o_DMRS_Real[8]<=16'b0;
				o_DMRS_Real[9]<=16'b0;
				o_DMRS_Real[10]<=16'b0;
				o_DMRS_Real[11]<=16'b0;
	
				//
				o_DMRS_Imaginary[0]<=16'b0;
				o_DMRS_Imaginary[1]<=16'b0;
				o_DMRS_Imaginary[2]<=16'b0;
				o_DMRS_Imaginary[3]<=phis_Imaginary[0];
				o_DMRS_Imaginary[4]<=phis_Imaginary[1];
				o_DMRS_Imaginary[5]<=phis_Imaginary[2];
				o_DMRS_Imaginary[6]<=16'b0;
				o_DMRS_Imaginary[7]<=16'b0;
				o_DMRS_Imaginary[8]<=16'b0;
				o_DMRS_Imaginary[9]<=16'b0;
				o_DMRS_Imaginary[10]<=16'b0;
				o_DMRS_Imaginary[11]<=16'b0;
		
				
				o_valid<=1;
				
				end
				6'b1110: begin
				o_DMRS_Real[0]<=16'b0;
				o_DMRS_Real[1]<=16'b0;
				o_DMRS_Real[2]<=16'b0;
				o_DMRS_Real[3]<=16'b0;
				o_DMRS_Real[4]<=16'b0;
				o_DMRS_Real[5]<=16'b0;
				o_DMRS_Real[6]<=phis_real[0];
				o_DMRS_Real[7]<=phis_real[1];
				o_DMRS_Real[8]<=phis_real[2];
				o_DMRS_Real[9]<=16'b0;
				o_DMRS_Real[10]<=16'b0;
				o_DMRS_Real[11]<=16'b0;

				//
				o_DMRS_Imaginary[0]<=16'b0;
				o_DMRS_Imaginary[1]<=16'b0;
				o_DMRS_Imaginary[2]<=16'b0;
				o_DMRS_Imaginary[3]<=16'b0;
				o_DMRS_Imaginary[4]<=16'b0;
				o_DMRS_Imaginary[5]<=16'b0;
				o_DMRS_Imaginary[6]<=phis_Imaginary[0];
				o_DMRS_Imaginary[7]<=phis_Imaginary[1];
				o_DMRS_Imaginary[8]<=phis_Imaginary[2];
				o_DMRS_Imaginary[9]<=16'b0;
				o_DMRS_Imaginary[10]<=16'b0;
				o_DMRS_Imaginary[11]<=16'b0;
			
				
				o_valid<=1;
				
				end
				6'b1111:begin
				o_DMRS_Real[0]<=16'b0;
				o_DMRS_Real[1]<=16'b0;
				o_DMRS_Real[2]<=16'b0;
				o_DMRS_Real[3]<=16'b0;
				o_DMRS_Real[4]<=16'b0;
				o_DMRS_Real[5]<=16'b0;
				o_DMRS_Real[6]<=16'b0;
				o_DMRS_Real[7]<=16'b0;
				o_DMRS_Real[8]<=16'b0;
				o_DMRS_Real[9]<=phis_real[0];
				o_DMRS_Real[10]<=phis_real[1];
				o_DMRS_Real[11]<=phis_real[2];
	
				//
				o_DMRS_Imaginary[0]<=16'b0;
				o_DMRS_Imaginary[1]<=16'b0;
				o_DMRS_Imaginary[2]<=16'b0;
				o_DMRS_Imaginary[3]<=16'b0;
				o_DMRS_Imaginary[4]<=16'b0;
				o_DMRS_Imaginary[5]<=16'b0;
				o_DMRS_Imaginary[6]<=16'b0;
				o_DMRS_Imaginary[7]<=16'b0;
				o_DMRS_Imaginary[8]<=16'b0;
				o_DMRS_Imaginary[9]<=phis_Imaginary[0];
				o_DMRS_Imaginary[10]<=phis_Imaginary[1];
				o_DMRS_Imaginary[11]<=phis_Imaginary[2];
		
				
				o_valid<=1;
				
				end
				6'b10000: begin
				o_DMRS_Real[0]<=phis_real[0];
				o_DMRS_Real[1]<=phis_real[1];
				o_DMRS_Real[2]<=phis_real[2];
				o_DMRS_Real[3]<=phis_real[3];
				o_DMRS_Real[4]<=phis_real[4];
				o_DMRS_Real[5]<=phis_real[5];
				o_DMRS_Real[6]<=16'b0;
				o_DMRS_Real[7]<=16'b0;
				o_DMRS_Real[8]<=16'b0;
				o_DMRS_Real[9]<=16'b0;
				o_DMRS_Real[10]<=16'b0;
				o_DMRS_Real[11]<=16'b0;
			
				//
				o_DMRS_Imaginary[0]<=phis_Imaginary[0];
				o_DMRS_Imaginary[1]<=phis_Imaginary[1];
				o_DMRS_Imaginary[2]<=phis_Imaginary[2];
				o_DMRS_Imaginary[3]<=phis_Imaginary[3];
				o_DMRS_Imaginary[4]<=phis_Imaginary[4];
				o_DMRS_Imaginary[5]<=phis_Imaginary[5];
				o_DMRS_Imaginary[6]<=16'b0;
				o_DMRS_Imaginary[7]<=16'b0;
				o_DMRS_Imaginary[8]<=16'b0;
				o_DMRS_Imaginary[9]<=16'b0;
				o_DMRS_Imaginary[10]<=16'b0;
				o_DMRS_Imaginary[11]<=16'b0;
			
				
				o_valid<=1;
				
				end
				6'b10001: begin
				o_DMRS_Real[0]<=16'b0;
				o_DMRS_Real[1]<=16'b0;
				o_DMRS_Real[2]<=16'b0;
				o_DMRS_Real[3]<=16'b0;
				o_DMRS_Real[4]<=16'b0;
				o_DMRS_Real[5]<=16'b0;
				o_DMRS_Real[6]<=phis_real[0];
				o_DMRS_Real[7]<=phis_real[1];
				o_DMRS_Real[8]<=phis_real[2];
				o_DMRS_Real[9]<=phis_real[3];
				o_DMRS_Real[10]<=phis_real[4];
				o_DMRS_Real[11]<=phis_real[5];
			
				//
				o_DMRS_Imaginary[0]<=16'b0;
				o_DMRS_Imaginary[1]<=16'b0;
				o_DMRS_Imaginary[2]<=16'b0;
				o_DMRS_Imaginary[3]<=16'b0;
				o_DMRS_Imaginary[4]<=16'b0;
				o_DMRS_Imaginary[5]<=16'b0;
				o_DMRS_Imaginary[6]<=phis_Imaginary[0];
				o_DMRS_Imaginary[7]<=phis_Imaginary[1];
				o_DMRS_Imaginary[8]<=phis_Imaginary[2];
				o_DMRS_Imaginary[9]<=phis_Imaginary[3];
				o_DMRS_Imaginary[10]<=phis_Imaginary[4];
				o_DMRS_Imaginary[11]<=phis_Imaginary[5];
				
				
				o_valid<=1;
				
				end
				6'b10010:   begin
				o_DMRS_Real[0]<=phis_real[0];
				o_DMRS_Real[1]<=phis_real[1];
				o_DMRS_Real[2]<=phis_real[2];
				o_DMRS_Real[3]<=phis_real[3];
				o_DMRS_Real[4]<=phis_real[4];
				o_DMRS_Real[5]<=phis_real[5];
				o_DMRS_Real[6]<=phis_real[6];
				o_DMRS_Real[7]<=phis_real[7];
				o_DMRS_Real[8]<=phis_real[8];
				o_DMRS_Real[9]<=phis_real[9];
				o_DMRS_Real[10]<=phis_real[10];
				o_DMRS_Real[11]<=phis_real[11];
			
				//
				o_DMRS_Imaginary[0]<=phis_Imaginary[0];
				o_DMRS_Imaginary[1]<=phis_Imaginary[1];
				o_DMRS_Imaginary[2]<=phis_Imaginary[2];
				o_DMRS_Imaginary[3]<=phis_Imaginary[3];
				o_DMRS_Imaginary[4]<=phis_Imaginary[4];
				o_DMRS_Imaginary[5]<=phis_Imaginary[5];
				o_DMRS_Imaginary[6]<=phis_Imaginary[6];
				o_DMRS_Imaginary[7]<=phis_Imaginary[7];
				o_DMRS_Imaginary[8]<=phis_Imaginary[8];
				o_DMRS_Imaginary[9]<=phis_Imaginary[9];
				o_DMRS_Imaginary[10]<=phis_Imaginary[10];
				o_DMRS_Imaginary[11]<=phis_Imaginary[11];
				
				
				o_valid<=1;
				
				end
				default: begin
				o_DMRS_Real[0]<=16'b0;
				o_DMRS_Real[1]<=16'b0;
				o_DMRS_Real[2]<=16'b0;
				o_DMRS_Real[3]<=16'b0;
				o_DMRS_Real[4]<=16'b0;
				o_DMRS_Real[5]<=16'b0;
				o_DMRS_Real[6]<=16'b0;
				o_DMRS_Real[7]<=16'b0;
				o_DMRS_Real[8]<=16'b0;
				o_DMRS_Real[9]<=16'b0;
				o_DMRS_Real[10]<=16'b0;
				o_DMRS_Real[11]<=16'b0;
			
				//
				o_DMRS_Imaginary[0]<=16'b0;
				o_DMRS_Imaginary[1]<=16'b0;
				o_DMRS_Imaginary[2]<=16'b0;
				o_DMRS_Imaginary[3]<=16'b0;
				o_DMRS_Imaginary[4]<=16'b0;
				o_DMRS_Imaginary[5]<=16'b0;
				o_DMRS_Imaginary[6]<=16'b0;
				o_DMRS_Imaginary[7]<=16'b0;
				o_DMRS_Imaginary[8]<=16'b0;
				o_DMRS_Imaginary[9]<=16'b0;
				o_DMRS_Imaginary[10]<=16'b0;
				o_DMRS_Imaginary[11]<=16'b0;

				
				o_valid<=0;
				
				end
			endcase	
			
		end
	end


		endmodule