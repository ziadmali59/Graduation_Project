module counter_column #(parameter bit [5:0] COUNT = 'd48,parameter DATAWIDTH= 6) (
  input  logic  i_clk,
  input  logic  i_rst_n,
  input  logic  i_rst_from_row_counter,
  input  logic  i_enable,
  input 	logic	 [5:0] i_Columns,
  input  logic  i_row_done,
  input 	logic	 WE,
  input	 logic  READ,
  input 	logic	 i_deserializer_done,
  input 	logic  i_increment_column_READ,
  output logic  [DATAWIDTH-1:0] o_columnindex,
  output logic  o_increment_rowcounter,
  //output logic  o_rst_rowcounter_READ,
  output logic  o_column_done,
  output logic  o_nextmode_READ

);

  logic [5:0]o_count ;
  always_ff @(posedge i_clk, negedge i_rst_n) begin

    if (!i_rst_n)begin
	  o_count <= 0;
		o_increment_rowcounter<=0;
		o_column_done<=0;
		//o_rst_rowcounter_READ<=1;
		o_nextmode_READ<=0;
	 end
	 else if (i_enable)begin
		 case ({WE,READ})
		 2'b00: begin
					o_count <= 0;
					o_increment_rowcounter<=0;
					o_column_done<=0;
					//o_rst_rowcounter_READ<=1;
					o_nextmode_READ<=0;
				  end
		 2'b10: begin 
			 if(!i_rst_from_row_counter) begin
					  o_count <= 1;
					  o_increment_rowcounter<=0;
					  o_column_done<=0;
					  //o_rst_rowcounter_READ<=1;
					  o_nextmode_READ<=0;
					  end
			 else if (i_row_done)begin
			       o_count <= 1;
			       o_increment_rowcounter<=0;
					   o_nextmode_READ<=1;
					   //o_rst_rowcounter_READ<=1;
			       
			   
			 end
			 
			 else if(i_deserializer_done )begin
			 
					  if (o_count == i_Columns)begin
							o_count <= 1;
							o_increment_rowcounter<=1;
							o_column_done<=1;
							//o_rst_rowcounter_READ<=1;
							o_nextmode_READ<=0;
					  end
					  else begin
							o_count <= o_count + 1'b1;
							o_increment_rowcounter<=0;
							o_column_done<=0;
							//o_rst_rowcounter_READ<=1;
							o_nextmode_READ<=0;
					  end
		    end
			 else begin
			    o_count <= o_count;
					o_increment_rowcounter<=0;
					o_column_done<=0;
					//o_rst_rowcounter_READ<=1;
					o_nextmode_READ<=0;
			 
			 end
		  end
		  
		  2'b01: begin 
		  if(o_count==0)begin
		   o_increment_rowcounter<=0;
			 o_count <= o_count+1'b1;
			 o_column_done<=0;
			 //o_rst_rowcounter_READ<=1; 
			 o_nextmode_READ<=0;
		    
		  end
			else  if(i_increment_column_READ )begin
			  if(o_count==i_Columns)begin
				o_increment_rowcounter<=0;
				o_count <= 0;
				o_column_done<=1;
				//o_rst_rowcounter_READ<=1;
				o_nextmode_READ<=0;
				end
				else begin
				o_count <=o_count+1'b1;
				o_increment_rowcounter<=0;
				//o_rst_rowcounter_READ<=0;
				o_column_done<=0;
				o_nextmode_READ<=0;
			   end  
			 end
			else begin
			  o_count<=o_count;
				//o_rst_rowcounter_READ<=1;
				o_column_done<=o_column_done;
				o_increment_rowcounter<=0;
				o_nextmode_READ<=0;
			end
		
		  end
		  
		  default: begin
				 o_count <= 0;
				 o_increment_rowcounter<=0;
				 o_column_done<=0;
				// o_rst_rowcounter_READ<=1;
				 o_nextmode_READ<=0;
			end
		endcase
		end
	    else begin
				o_count <= 0;
				o_increment_rowcounter<=0;
				o_column_done<=0;
			//	o_rst_rowcounter_READ<=1;
				o_nextmode_READ<=0;
		 end
       end

assign o_columnindex= o_count-1'b1; 

endmodule
