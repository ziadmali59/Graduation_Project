`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2024 03:30:31 PM
// Design Name: 
// Module Name: Counter_Write_Channel_Interleaver
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
module Counter_Write_Channel_Interleaver(
input 	 logic		i_clk,
input 	 logic		i_rst_n,
input 	 logic		[8:0]i_Rows,
input	 logic		[5:0]i_columns,
input 	 logic		i_start,
//input    logic      i_serial_in,
//input    logic      i_enable,
//input    logic		WE,
//input    logic		READ,
//input    logic      serializer_done,
output	 logic		[14:0]index,
output	 logic		Write_done,
//output	 logic		READ_done,
output   logic      o_valid
);
//logic     [8:0]   index_interal;
logic	  [14:0] count;
//logic	  [8:0]    count_row;
logic     [14:0] result_multiply;
logic flag;
assign result_multiply=i_Rows*i_columns;
always_ff@(negedge i_clk or negedge i_rst_n)begin
if (!i_rst_n)begin
//index_interal<=0;
count<=1;
flag<=0;
Write_done<=0;
//READ_done<=0;
o_valid<=0;
end
else/* if(i_enable)*/ begin
	//if(!Write_done)begin
	
       if(count== result_multiply)begin
            
             Write_done<=1;
             count<=1'b1;
             o_valid<=0;
             if (count==1 && Write_done)begin
              Write_done<=1;
              count<=count;
              o_valid<=0;
             end
//             else begin
//              Write_done<=1;
//              count<=count;
//              o_valid<=0;
//             end
       end
          else if(count==1 && !flag )begin
         flag<=1;
         o_valid<=1;
         end
        

       
         else if(i_start)begin
            count<=count+1'b1;
             Write_done<=0;
             o_valid<=1;
         end
         else begin
             count<=count;
             Write_done<=0;
             o_valid<=0;
         end
        end
	end///// 
//	else begin   
//                           if(count==0)begin
//                           o_valid<=1;
//                           count<=1;
                        
//                           end
                
			 
			 
//			               else if(count_row==i_columns)begin
//                                 READ_done<=1;
//                                 o_valid<=0;
//                                 count=1'b1;
//                             end
                             
                
//                             else if(index_interal==i_Rows-1 && serializer_done )begin
//                                 index_interal=0;
//                                 count_row=count_row+1'b1;
//                                 count=count_row+1'b1;
//                                 o_valid<=1;///
//                             end
                           
//                             else if(serializer_done) begin
//                                count<=count+i_columns;
//                                index_interal<=index_interal+1'b1;
//                                o_valid<=1;
//                             end    
//                             else begin
//                             count<=count;
//                             READ_done<=0;
//                             o_valid<=0;/////////
//                            end
//                 end
			
			 
//	   end


//else	begin
//	    index_interal<=0;
//		 count<=1;
//		 count_row<=0; 
//		 o_valid<=0; 
//end
//end
assign index=  count-1'b1;
endmodule