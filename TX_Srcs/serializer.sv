module serializer (
    input		logic		i_clk,
    input		logic		i_rst_n,
	input       logic       i_enable,
    input 		logic       [11:0]i_data_in,
    output 		logic       o_data_out,
	input       logic       i_valid,
    output 		logic 	    o_valid,
    output    logic       flag,
	output		logic       o_done,
	output      logic       valid_received
);
  logic [11:0] data_reg;
  logic [3:0] count;
  //logic flag;
  always_ff @(posedge i_clk or negedge i_rst_n)begin
    if (!i_rst_n) begin
      data_reg <= 12'b0;
      count    <= 0;
      o_done   <= 1'b0;
	  o_valid  <= 1'b0; 
	  flag<=0;
	  valid_received<=0;
    end else if(!i_enable )begin
	   data_reg<= 12'b0;
       count   <= 0;
       o_done  <= 1'b0;
	   o_valid <= 1'b0; 
	   valid_received<=0;
	 end
	 else if( count==0 && i_valid &&flag )begin
    data_reg <= i_data_in;
    count    <= count + 1'b1;
    o_done   <= 1;
    o_valid  <= 1'b1; 
    valid_received<=1;
    end
	  else if( count==0 && i_valid  )begin
      data_reg <= i_data_in;
      count    <= count + 1'b1;
      o_done   <= 0;
	  o_valid  <= 1'b1; 
	  valid_received<=1;
     end

     else if( count==0  &&flag )begin
     //data_reg <= i_data_in;
     count    <= count;
     o_done   <= 1;
     o_valid  <= 1'b0; 
     valid_received<=0;
      end
     
    else if(count ==0 && !flag)begin
    count<=count;
    o_done<=0;
    o_valid<=0;
    valid_received<=0;
    end
   
    else if(count==4'd12) begin//
	   o_valid  <= 1'b0; //
	   o_done   <=1;
	   count<=0;
	   flag<=1;
	   valid_received<=0;
	  
	   
	  
//	   if(i_valid)begin
//        count <= 0;
//        o_done <= 1'b1;
//		o_valid <= 1'b0; 
//	   end	
//		else begin
//		count<=count;
//		o_done<=1'b1;
//		o_valid <= 1'b0;
//		end
	
	 end
	 else begin
	   data_reg <= data_reg >> 1;
	   o_valid  <= 1'b1; 
	   count    <= count + 1'b1;
       o_done   <=0;
       valid_received<=0;
      // flag<=1;
	 end
  end

  assign o_data_out = o_valid == 1? data_reg[0] :1'b0;

endmodule