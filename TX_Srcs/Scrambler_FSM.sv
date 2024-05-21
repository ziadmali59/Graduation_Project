module Scrambler_FSM (
  input  logic  i_clk,
  input  logic  i_rst_n,
  input  logic  i_count_done,
  input  logic  i_Start_Scrambler,
  output logic	o_Preset,
  output logic  o_ValidOutput,
  output logic	o_Reset_Counter,
  output logic  o_DISABLE,
  output logic  o_DISABLE_Counter
  
);

 // Define your state enumeration
 typedef enum logic [1:0]  {
     STATE_INIT,
	 STATE_COUNT,
	 STATE_DISABLE,
	 STATE_VALID
  } state_t;
  
 state_t state_reg ,state_next;

  
always_comb begin
  case (state_reg)
    STATE_INIT: begin
        o_Preset = 1;
		o_Reset_Counter = 0;
		o_ValidOutput=0;
		o_DISABLE = 1;
		o_DISABLE_Counter=0;
		state_next = STATE_COUNT; 
		
	 end
	 STATE_COUNT: begin
	    o_Preset = 0;
		o_ValidOutput=0;
		o_DISABLE = 0;
		o_DISABLE_Counter=0;
		o_Reset_Counter = 1;
      if (i_count_done) begin
        state_next = STATE_DISABLE; 
		  end
		else begin
		  state_next =STATE_COUNT ; 
		  
      end
    end
    
	 STATE_DISABLE: begin
        o_DISABLE = 1;
        o_DISABLE_Counter=1;
		o_ValidOutput=0;
		o_Preset=0;
		o_Reset_Counter = 1;
      if (i_Start_Scrambler) begin
        state_next = STATE_VALID; 
         o_DISABLE = 0;
         o_DISABLE_Counter=1;
         o_ValidOutput = 1;
         o_Preset=0;
         o_Reset_Counter = 1; 
      end else if (!i_rst_n) begin
        state_next = STATE_INIT;  
      end
		else
		  state_next = STATE_DISABLE; 
    end
   
	STATE_VALID: begin
      o_DISABLE = 0;
      o_DISABLE_Counter=1;
      o_ValidOutput = 1;
	  o_Preset=0;
	  o_Reset_Counter = 1;
      if (!i_rst_n) begin
        state_next = STATE_INIT; 
		 end
		 else begin
		  state_next= STATE_VALID;
      end
    end
	default: begin
   state_next = STATE_INIT; 
	end
  endcase
 
end

  // Define your sequential logic
  always_ff @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
      state_reg <=STATE_INIT ;
    end
    else begin
      state_reg <= state_next;
    end
  end  
  
endmodule
