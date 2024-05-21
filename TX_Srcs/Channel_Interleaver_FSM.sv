module Channel_Interleaver_FSM (
input logic		i_clk,
input logic		i_rst_n,
input logic		i_start,
input logic		WRITE_DONE,
input logic		READ_DONE,
output logic	o_rst_counter_write,
output logic    o_rst_counter_read,
//output logic	o_rst_deserializer,
//output logic	o_enable_counters,
//output logic	o_WE,
//output logic	o_READ,
output logic   o_enable_RAM,
output logic   o_enable_serializer


);


enum logic [1:0] {
    IDLE,
    WRITE,
    Dummy,

    READ
  } state, next_state;
  
    always_ff @(posedge i_clk, negedge i_rst_n) begin
    if (!i_rst_n) begin
      state <= IDLE;
    end else begin
      state <= next_state;  // State update remains here
        end
    end
	 

 always_comb begin
         case (state)  // Use unique case for clarity and safety
          IDLE: begin 
              o_rst_counter_write<=0;
              o_rst_counter_read<=0;
              //o_WE<=0;
              //o_READ<=0;
              //o_enable_counters<=0;
              //o_rst_deserializer<=0;
              o_enable_RAM<=0;
              o_enable_serializer<=0;
              if(i_start)begin
                 next_state<=WRITE;
               end
               else begin
                next_state<=IDLE;
              end
           end
          WRITE: begin
              o_enable_RAM<=1;
              //o_rst_deserializer<=1;
              //o_WE<=1;
              //o_READ<=0;
              o_rst_counter_write<=1;
              o_rst_counter_read<=0;
              //o_enable_counters<=1;
              o_enable_serializer<=0;
              if(WRITE_DONE)
              next_state<=Dummy;
              else
              next_state<=WRITE;
              end
          Dummy: begin
            o_enable_RAM<=1;
            //o_rst_deserializer<=0;
            o_rst_counter_read<=0;
            o_enable_serializer<=0;
            o_rst_counter_write<=0;
            next_state<=READ;
          end  
//          Dummy2: begin
//            o_enable_RAM<=1;
//            o_rst_deserializer<=0;
//            o_rst_counter_read<=0;
//            o_enable_serializer<=0;
//            o_rst_counter_write<=0;
//            next_state<=Dummy3;//READ;
//          end    
//         Dummy3: begin
//            o_enable_RAM<=1;
//            o_rst_deserializer<=0;
//            o_rst_counter_read<=0;
//            o_enable_serializer<=0;
//            o_rst_counter_write<=0;
//            next_state<=Dummy4;
//          end
//          Dummy4: begin
//             o_enable_RAM<=1;
//             o_rst_deserializer<=0;
//             o_rst_counter_read<=0;
//             o_enable_serializer<=0;
//             o_rst_counter_write<=0;
//             next_state<=READ;
//           end
          READ:begin
          
              o_enable_RAM<=1;
             // o_WE<=0;
              o_enable_serializer<=1;
              //o_READ<=1;
              //o_rst_deserializer<=0;
              //o_enable_counters<=1;
              o_rst_counter_write<=0;
              o_rst_counter_read<=1;
              if(READ_DONE)begin
              next_state<=IDLE;
              end
              else begin
              next_state<=READ;
              end
              
          end
          
               default: begin 
              //o_rst_counters<=0;
              //o_WE<=0;
              //o_READ<=0;
              //o_enable_counters<=0;
              o_rst_counter_write<=0;
              o_rst_counter_read<=0;
              //o_rst_deserializer<=0;
              o_enable_RAM<=0;
              o_enable_serializer<=0;
              if(i_start)begin
                 next_state<=WRITE;
               end
               else begin
                next_state<=IDLE;
              end
           end
          
          
          endcase
     end
 endmodule