module data_provider(

input  logic signed  [15:0]i_FFT_REAL[11:0],
input  logic signed  [15:0]i_FFT_IMAGINARY[11:0],
input  logic   i_rst_n,
input  logic signed  [15:0]i_DMRS_REAL [11:0],
input  logic   i_clk,
input  logic   i_FFT_Valid,
input  logic signed   [15:0]i_DMRS_IMAGINARY[11:0],
input  logic   i_DMRS_valid,
input  logic   [3:0]i_index,
input  logic   [5:0] i_Isc,
output logic signed  [15:0] o_REM_output_REAL[11:0],
output logic signed  [15:0] o_REM_output_Imaginary[11:0],
output logic   o_valid,
output logic   o_pilot
);
//logic [3:0]count;
always@(posedge i_clk or negedge i_rst_n) begin
if(!i_rst_n)begin
o_REM_output_REAL[0]<=16'b0;
o_REM_output_REAL[1]<=16'b0;
o_REM_output_REAL[2]<=16'b0;
o_REM_output_REAL[3]<=16'b0;
o_REM_output_REAL[4]<=16'b0;
o_REM_output_REAL[5]<=16'b0;
o_REM_output_REAL[6]<=16'b0;
o_REM_output_REAL[7]<=16'b0;
o_REM_output_REAL[8]<=16'b0;
o_REM_output_REAL[9]<=16'b0;
o_REM_output_REAL[10]<=16'b0;
o_REM_output_REAL[11]<=16'b0;

//
o_REM_output_Imaginary[0]<=16'b0;
o_REM_output_Imaginary[1]<=16'b0;
o_REM_output_Imaginary[2]<=16'b0;
o_REM_output_Imaginary[3]<=16'b0;
o_REM_output_Imaginary[4]<=16'b0;
o_REM_output_Imaginary[5]<=16'b0;
o_REM_output_Imaginary[6]<=16'b0;
o_REM_output_Imaginary[7]<=16'b0;
o_REM_output_Imaginary[8]<=16'b0;
o_REM_output_Imaginary[9]<=16'b0;
o_REM_output_Imaginary[10]<=16'b0;
o_REM_output_Imaginary[11]<=16'b0;


o_valid<=0;

end

else begin
if(i_index==4'b0011 || i_index==4'b1010 && i_DMRS_valid  )begin
                            o_REM_output_REAL[0]<=i_DMRS_REAL[0];
                            o_REM_output_REAL[1]<=i_DMRS_REAL[1];
                            o_REM_output_REAL[2]<=i_DMRS_REAL[2];
                            o_REM_output_REAL[3]<=i_DMRS_REAL[3];
                            o_REM_output_REAL[4]<=i_DMRS_REAL[4];
                            o_REM_output_REAL[5]<=i_DMRS_REAL[5];
                            o_REM_output_REAL[6]<=i_DMRS_REAL[6];
                            o_REM_output_REAL[7]<=i_DMRS_REAL[7];
                            o_REM_output_REAL[8]<=i_DMRS_REAL[8];
                            o_REM_output_REAL[9]<=i_DMRS_REAL[9];
                            o_REM_output_REAL[10]<=i_DMRS_REAL[10];
                            o_REM_output_REAL[11]<=i_DMRS_REAL[11];
                      
                            //
                            o_REM_output_Imaginary[0]<=i_DMRS_IMAGINARY[0];
                            o_REM_output_Imaginary[1]<=i_DMRS_IMAGINARY[1];
                            o_REM_output_Imaginary[2]<=i_DMRS_IMAGINARY[2];
                            o_REM_output_Imaginary[3]<=i_DMRS_IMAGINARY[3];
                            o_REM_output_Imaginary[4]<=i_DMRS_IMAGINARY[4];
                            o_REM_output_Imaginary[5]<=i_DMRS_IMAGINARY[5];
                            o_REM_output_Imaginary[6]<=i_DMRS_IMAGINARY[6];
                            o_REM_output_Imaginary[7]<=i_DMRS_IMAGINARY[7];
                            o_REM_output_Imaginary[8]<=i_DMRS_IMAGINARY[8];
                            o_REM_output_Imaginary[9]<=i_DMRS_IMAGINARY[9];
                            o_REM_output_Imaginary[10]<=i_DMRS_IMAGINARY[10];
                            o_REM_output_Imaginary[11]<=i_DMRS_IMAGINARY[11];
                            o_pilot<=1;
                            o_valid<=1;
                            if(o_valid==1)begin
                            o_valid<=0;
                            o_pilot<=0;
                            end
                           
                            end
else begin
                    if(!i_FFT_Valid )begin
                    o_valid<=0;
                    end
                    else begin
                    case(i_Isc)
                            6'b1100: begin
                            o_REM_output_REAL[0]<=i_FFT_REAL[0];
                            o_REM_output_REAL[1]<=i_FFT_REAL[1];
                            o_REM_output_REAL[2]<=i_FFT_REAL[2];
                            o_REM_output_REAL[3]<=16'b0;
                            o_REM_output_REAL[4]<=16'b0;
                            o_REM_output_REAL[5]<=16'b0;
                            o_REM_output_REAL[6]<=16'b0;
                            o_REM_output_REAL[7]<=16'b0;
                            o_REM_output_REAL[8]<=16'b0;
                            o_REM_output_REAL[9]<=16'b0;
                            o_REM_output_REAL[10]<=16'b0;
                            o_REM_output_REAL[11]<=16'b0;
                          
                            //
                            o_REM_output_Imaginary[0]<=i_FFT_IMAGINARY[0];
                            o_REM_output_Imaginary[1]<=i_FFT_IMAGINARY[1];
                            o_REM_output_Imaginary[2]<=i_FFT_IMAGINARY[2];
                            o_REM_output_Imaginary[3]<=16'b0;
                            o_REM_output_Imaginary[4]<=16'b0;
                            o_REM_output_Imaginary[5]<=16'b0;
                            o_REM_output_Imaginary[6]<=16'b0;
                            o_REM_output_Imaginary[7]<=16'b0;
                            o_REM_output_Imaginary[8]<=16'b0;
                            o_REM_output_Imaginary[9]<=16'b0;
                            o_REM_output_Imaginary[10]<=16'b0;
                            o_REM_output_Imaginary[11]<=16'b0;
                       
                        
                            o_valid<=1;
                         
                            end
                            6'b1101: begin
                            o_REM_output_REAL[0]<=16'b0;
                            o_REM_output_REAL[1]<=16'b0;
                            o_REM_output_REAL[2]<=16'b0;
                            o_REM_output_REAL[3]<=i_FFT_REAL[0];
                            o_REM_output_REAL[4]<=i_FFT_REAL[1];
                            o_REM_output_REAL[5]<=i_FFT_REAL[2];
                            o_REM_output_REAL[6]<=16'b0;
                            o_REM_output_REAL[7]<=16'b0;
                            o_REM_output_REAL[8]<=16'b0;
                            o_REM_output_REAL[9]<=16'b0;
                            o_REM_output_REAL[10]<=16'b0;
                            o_REM_output_REAL[11]<=16'b0;
                            
                            //
                            o_REM_output_Imaginary[0]<=16'b0;
                            o_REM_output_Imaginary[1]<=16'b0;
                            o_REM_output_Imaginary[2]<=16'b0;
                            o_REM_output_Imaginary[3]<=i_FFT_IMAGINARY[0];
                            o_REM_output_Imaginary[4]<=i_FFT_IMAGINARY[1];
                            o_REM_output_Imaginary[5]<=i_FFT_IMAGINARY[2];
                            o_REM_output_Imaginary[6]<=16'b0;
                            o_REM_output_Imaginary[7]<=16'b0;
                            o_REM_output_Imaginary[8]<=16'b0;
                            o_REM_output_Imaginary[9]<=16'b0;
                            o_REM_output_Imaginary[10]<=16'b0;
                            o_REM_output_Imaginary[11]<=16'b0;
                            
                            o_valid<=1;
                    
                            end
                            6'b1110: begin
                            o_REM_output_REAL[0]<=16'b0;
                            o_REM_output_REAL[1]<=16'b0;
                            o_REM_output_REAL[2]<=16'b0;
                            o_REM_output_REAL[3]<=16'b0;
                            o_REM_output_REAL[4]<=16'b0;
                            o_REM_output_REAL[5]<=16'b0;
                            o_REM_output_REAL[6]<=i_FFT_REAL[0];
                            o_REM_output_REAL[7]<=i_FFT_REAL[1];
                            o_REM_output_REAL[8]<=i_FFT_REAL[2];
                            o_REM_output_REAL[9]<=16'b0;
                            o_REM_output_REAL[10]<=16'b0;
                            o_REM_output_REAL[11]<=16'b0;
                           
                            //
                            o_REM_output_Imaginary[0]<=16'b0;
                            o_REM_output_Imaginary[1]<=16'b0;
                            o_REM_output_Imaginary[2]<=16'b0;
                            o_REM_output_Imaginary[3]<=16'b0;
                            o_REM_output_Imaginary[4]<=16'b0;
                            o_REM_output_Imaginary[5]<=16'b0;
                            o_REM_output_Imaginary[6]<=i_FFT_IMAGINARY[0];
                            o_REM_output_Imaginary[7]<=i_FFT_IMAGINARY[1];
                            o_REM_output_Imaginary[8]<=i_FFT_IMAGINARY[2];
                            o_REM_output_Imaginary[9]<=16'b0;
                            o_REM_output_Imaginary[10]<=16'b0;
                            o_REM_output_Imaginary[11]<=16'b0;
                         
                            o_valid<=1;
                      
                            end
                            6'b1111:begin
                            o_REM_output_REAL[0]<=16'b0;
                            o_REM_output_REAL[1]<=16'b0;
                            o_REM_output_REAL[2]<=16'b0;
                            o_REM_output_REAL[3]<=16'b0;
                            o_REM_output_REAL[4]<=16'b0;
                            o_REM_output_REAL[5]<=16'b0;
                            o_REM_output_REAL[6]<=16'b0;
                            o_REM_output_REAL[7]<=16'b0;
                            o_REM_output_REAL[8]<=16'b0;
                            o_REM_output_REAL[9]<=i_FFT_REAL[0];
                            o_REM_output_REAL[10]<=i_FFT_REAL[1];
                            o_REM_output_REAL[11]<=i_FFT_REAL[2];
                      
                            //
                            o_REM_output_Imaginary[0]<=16'b0;
                            o_REM_output_Imaginary[1]<=16'b0;
                            o_REM_output_Imaginary[2]<=16'b0;
                            o_REM_output_Imaginary[3]<=16'b0;
                            o_REM_output_Imaginary[4]<=16'b0;
                            o_REM_output_Imaginary[5]<=16'b0;
                            o_REM_output_Imaginary[6]<=16'b0;
                            o_REM_output_Imaginary[7]<=16'b0;
                            o_REM_output_Imaginary[8]<=16'b0;
                            o_REM_output_Imaginary[9]<=i_FFT_IMAGINARY[0];
                            o_REM_output_Imaginary[10]<=i_FFT_IMAGINARY[1];
                            o_REM_output_Imaginary[11]<=i_FFT_IMAGINARY[2];
                           
                            o_valid<=1;
                         
                            end
                            6'b10000: begin
                            o_REM_output_REAL[0]<=i_FFT_REAL[0];
                            o_REM_output_REAL[1]<=i_FFT_REAL[1];
                            o_REM_output_REAL[2]<=i_FFT_REAL[2];
                            o_REM_output_REAL[3]<=i_FFT_REAL[3];
                            o_REM_output_REAL[4]<=i_FFT_REAL[4];
                            o_REM_output_REAL[5]<=i_FFT_REAL[5];
                            o_REM_output_REAL[6]<=16'b0;
                            o_REM_output_REAL[7]<=16'b0;
                            o_REM_output_REAL[8]<=16'b0;
                            o_REM_output_REAL[9]<=16'b0;
                            o_REM_output_REAL[10]<=16'b0;
                            o_REM_output_REAL[11]<=16'b0;
                      
                            //
                            o_REM_output_Imaginary[0]<=i_FFT_IMAGINARY[0];
                            o_REM_output_Imaginary[1]<=i_FFT_IMAGINARY[1];
                            o_REM_output_Imaginary[2]<=i_FFT_IMAGINARY[2];
                            o_REM_output_Imaginary[3]<=i_FFT_IMAGINARY[3];
                            o_REM_output_Imaginary[4]<=i_FFT_IMAGINARY[4];
                            o_REM_output_Imaginary[5]<=i_FFT_IMAGINARY[5];
                            o_REM_output_Imaginary[6]<=16'b0;
                            o_REM_output_Imaginary[7]<=16'b0;
                            o_REM_output_Imaginary[8]<=16'b0;
                            o_REM_output_Imaginary[9]<=16'b0;
                            o_REM_output_Imaginary[10]<=16'b0;
                            o_REM_output_Imaginary[11]<=16'b0;
                          
                            o_valid<=1;
                            
                            end
                            6'b10001: begin
                            o_REM_output_REAL[0]<=16'b0;
                            o_REM_output_REAL[1]<=16'b0;
                            o_REM_output_REAL[2]<=16'b0;
                            o_REM_output_REAL[3]<=16'b0;
                            o_REM_output_REAL[4]<=16'b0;
                            o_REM_output_REAL[5]<=16'b0;
                            o_REM_output_REAL[6]<=i_FFT_REAL[0];
                            o_REM_output_REAL[7]<=i_FFT_REAL[1];
                            o_REM_output_REAL[8]<=i_FFT_REAL[2];
                            o_REM_output_REAL[9]<=i_FFT_REAL[3];
                            o_REM_output_REAL[10]<=i_FFT_REAL[4];
                            o_REM_output_REAL[11]<=i_FFT_REAL[5];
                          
                            //
                            o_REM_output_Imaginary[0]<=16'b0;
                            o_REM_output_Imaginary[1]<=16'b0;
                            o_REM_output_Imaginary[2]<=16'b0;
                            o_REM_output_Imaginary[3]<=16'b0;
                            o_REM_output_Imaginary[4]<=16'b0;
                            o_REM_output_Imaginary[5]<=16'b0;
                            o_REM_output_Imaginary[6]<=i_FFT_IMAGINARY[0];
                            o_REM_output_Imaginary[7]<=i_FFT_IMAGINARY[1];
                            o_REM_output_Imaginary[8]<=i_FFT_IMAGINARY[2];
                            o_REM_output_Imaginary[9]<=i_FFT_IMAGINARY[3];
                            o_REM_output_Imaginary[10]<=i_FFT_IMAGINARY[4];
                            o_REM_output_Imaginary[11]<=i_FFT_IMAGINARY[5];
                        
                        
                            o_valid<=1;
                            
                            end
                            6'b10010:   begin
                            o_REM_output_REAL[0]<=i_FFT_REAL[0];
                            o_REM_output_REAL[1]<=i_FFT_REAL[1];
                            o_REM_output_REAL[2]<=i_FFT_REAL[2];
                            o_REM_output_REAL[3]<=i_FFT_REAL[3];
                            o_REM_output_REAL[4]<=i_FFT_REAL[4];
                            o_REM_output_REAL[5]<=i_FFT_REAL[5];
                            o_REM_output_REAL[6]<=i_FFT_REAL[6];
                            o_REM_output_REAL[7]<=i_FFT_REAL[7];
                            o_REM_output_REAL[8]<=i_FFT_REAL[8];
                            o_REM_output_REAL[9]<=i_FFT_REAL[9];
                            o_REM_output_REAL[10]<=i_FFT_REAL[10];
                            o_REM_output_REAL[11]<=i_FFT_REAL[11];
                      
                            //
                            o_REM_output_Imaginary[0]<=i_FFT_IMAGINARY[0];
                            o_REM_output_Imaginary[1]<=i_FFT_IMAGINARY[1];
                            o_REM_output_Imaginary[2]<=i_FFT_IMAGINARY[2];
                            o_REM_output_Imaginary[3]<=i_FFT_IMAGINARY[3];
                            o_REM_output_Imaginary[4]<=i_FFT_IMAGINARY[4];
                            o_REM_output_Imaginary[5]<=i_FFT_IMAGINARY[5];
                            o_REM_output_Imaginary[6]<=i_FFT_IMAGINARY[6];
                            o_REM_output_Imaginary[7]<=i_FFT_IMAGINARY[7];
                            o_REM_output_Imaginary[8]<=i_FFT_IMAGINARY[8];
                            o_REM_output_Imaginary[9]<=i_FFT_IMAGINARY[9];
                            o_REM_output_Imaginary[10]<=i_FFT_IMAGINARY[10];
                            o_REM_output_Imaginary[11]<=i_FFT_IMAGINARY[11];
                    
                            o_valid<=1;
                         
                            end
                            default: begin
                            o_REM_output_REAL[0]<=16'b0;
                            o_REM_output_REAL[1]<=16'b0;
                            o_REM_output_REAL[2]<=16'b0;
                            o_REM_output_REAL[3]<=16'b0;
                            o_REM_output_REAL[4]<=16'b0;
                            o_REM_output_REAL[5]<=16'b0;
                            o_REM_output_REAL[6]<=16'b0;
                            o_REM_output_REAL[7]<=16'b0;
                            o_REM_output_REAL[8]<=16'b0;
                            o_REM_output_REAL[9]<=16'b0;
                            o_REM_output_REAL[10]<=16'b0;
                            o_REM_output_REAL[11]<=16'b0;
                          
                            //
                            o_REM_output_Imaginary[0]<=16'b0;
                            o_REM_output_Imaginary[1]<=16'b0;
                            o_REM_output_Imaginary[2]<=16'b0;
                            o_REM_output_Imaginary[3]<=16'b0;
                            o_REM_output_Imaginary[4]<=16'b0;
                            o_REM_output_Imaginary[5]<=16'b0;
                            o_REM_output_Imaginary[6]<=16'b0;
                            o_REM_output_Imaginary[7]<=16'b0;
                            o_REM_output_Imaginary[8]<=16'b0;
                            o_REM_output_Imaginary[9]<=16'b0;
                            o_REM_output_Imaginary[10]<=16'b0;
                            o_REM_output_Imaginary[11]<=16'b0;
                       
                            o_valid<=0;
                         
                            end
                        endcase
                        end
                        end
           
                           
   
//                            else begin
//                            o_REM_output_REAL[0]<=16'b0;
//                            o_REM_output_REAL[1]<=16'b0;
//                            o_REM_output_REAL[2]<=16'b0;
//                            o_REM_output_REAL[3]<=16'b0;
//                            o_REM_output_REAL[4]<=16'b0;
//                            o_REM_output_REAL[5]<=16'b0;
//                            o_REM_output_REAL[6]<=16'b0;
//                            o_REM_output_REAL[7]<=16'b0;
//                            o_REM_output_REAL[8]<=16'b0;
//                            o_REM_output_REAL[9]<=16'b0;
//                            o_REM_output_REAL[10]<=16'b0;
//                            o_REM_output_REAL[11]<=16'b0;
                          
//                            //
//                            o_REM_output_Imaginary[0]<=16'b0;
//                            o_REM_output_Imaginary[1]<=16'b0;
//                            o_REM_output_Imaginary[2]<=16'b0;
//                            o_REM_output_Imaginary[3]<=16'b0;
//                            o_REM_output_Imaginary[4]<=16'b0;
//                            o_REM_output_Imaginary[5]<=16'b0;
//                            o_REM_output_Imaginary[6]<=16'b0;
//                            o_REM_output_Imaginary[7]<=16'b0;
//                            o_REM_output_Imaginary[8]<=16'b0;
//                            o_REM_output_Imaginary[9]<=16'b0;
//                            o_REM_output_Imaginary[10]<=16'b0;
//                            o_REM_output_Imaginary[11]<=16'b0;
                           
//                            o_valid<=0;
                          
//                           end
            end
end


endmodule