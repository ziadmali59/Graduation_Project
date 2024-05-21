module counter_row #(parameter COUNT = 480,parameter DATAWIDTH= 9) (
  input  logic  i_clk,
  input  logic  i_rst_n,
  input  logic  i_enable,
  input 	logic	 [8:0]i_ROWS,
  input  logic  i_INCREMENT,
  //input  logic  i_rst_row_READ,
  input 	logic	 WE,
  input	 logic  READ,
  input  logic  i_columns_done,
  input 	logic	 i_deserializer_done,
  output logic  [DATAWIDTH-1:0]o_READ_count ,
  output logic  o_Reset_Column,
  output logic  o_Done_row,
  output logic  o_Increment_Column_READ,
  output logic  o_nextmode_IDLE
);

logic [DATAWIDTH-1:0] o_count;
logic i_rst_row_READ;  
 
  always_ff @(posedge i_clk, negedge i_rst_n) begin
    if (!i_rst_n) begin
      o_count <= 0;
			o_Reset_Column<=1;
			o_Done_row<=0;
			o_Increment_Column_READ<=0;
			o_nextmode_IDLE<=0;
	 end
    else if (i_enable)begin
		case ({WE,READ})
		  2'b00: begin
			o_count <= 0;
			o_Reset_Column<=1;
			o_Done_row<=0;
			o_Increment_Column_READ<=0;
			o_nextmode_IDLE<=0;
			
			end 
			
			2'b10:begin
				 if(i_INCREMENT )begin
					      if(o_count==i_ROWS-1)begin
					       o_Reset_Column<=1;
					       /////////////
								 o_count <= 1;
								 o_Done_row<=1;
								 o_Increment_Column_READ<=0; 
								 o_nextmode_IDLE<=0;
					       end
					       else begin					  
								  o_count <=o_count+1'b1;
								  o_Reset_Column<=0;
								  o_Done_row<=0;
								  o_Increment_Column_READ<=0;
								  o_nextmode_IDLE<=0;
							    end 
					end 
					else begin
								o_count<=o_count;
								o_Reset_Column<=1;
								o_Increment_Column_READ<=0;
								o_Done_row<=0;
								o_nextmode_IDLE<=0;
							end
					 end
					 
			2'b01:begin
			   /*if(o_count==0) begin
			      o_Reset_Column<=1;
						o_count <=1 ;
						o_Done_row<=0;
						o_Increment_Column_READ<=0;
						o_nextmode_IDLE<=0;
			      
			    end
					else*/if(!i_rst_row_READ)begin
						o_Reset_Column<=1;
						o_count <= 0;
						o_Done_row<=0;
						o_Increment_Column_READ<=0;
						o_nextmode_IDLE<=0;
					end
					else if(i_columns_done)begin 
					 o_nextmode_IDLE<=1;
					 o_count <= 0;
					 i_rst_row_READ<=0;
					 o_Increment_Column_READ<=1; 
					end
					else if(o_count==i_ROWS)begin
						o_Reset_Column<=1;
						o_count <= 1;
						o_Done_row<=1;
						o_Increment_Column_READ<=1; 
					 end
					 else begin
					  o_Reset_Column<=1;
						o_count <=o_count+1'b1 ;
						o_Done_row<=0;
						o_Increment_Column_READ<=0;
					 end
		end		 
		 default: begin
		   o_count <= 0;
			o_Reset_Column<=1;
			o_Done_row<=0;
			o_Increment_Column_READ<=0;
		 
		 end
						
    endcase	
    end	 
	 else begin
			o_count <= 0;
			o_Reset_Column<=1;
			o_Done_row<=0;
			o_Increment_Column_READ<=0;
	 end
	end
  
assign o_READ_count=(WE==0 && READ==1 )? o_count-1'b1:(WE==1 && READ==0 )? o_count:1'b0; 

endmodule
