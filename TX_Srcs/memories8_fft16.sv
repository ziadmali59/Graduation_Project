/*
Project        : NB-IOT UPLINK
Standard doc.  : 
Module name    : memories8_fft16
Dependancy     :
Design doc.    : 
References     : 
Description    : 8 memories
Owner          : Martina Magued
*/

module memories8_fft16
#(parameter 			                    DATA_WIDTH	=	16,   
                                            DOUBLE_DATA_WIDTH = 32,
                                            RAM_DEPTH = 2,
                                            ADD_SIZE = 1
)
(input logic                                i_clk_memories_fft16,
                                            i_rst_n,
                                            i_done_stage3_fft16,
                                      
                                            
input logic signed [DOUBLE_DATA_WIDTH-1:0]  i_data_memories_fft16 [7:0],   
input logic                                 i_rd_add_memories_fft16, 


input logic                                 i_wr_add_memories_fft16,
input logic                                 i_wr_en_memories_fft16,

input logic [5:0]                           i_a_rd_index_memories_fft16,   
input logic [5:0]                           i_b_rd_index_memories_fft16,
input logic [2:0]                           i_a_wr_index_memories_fft16,   
input logic [2:0]                           i_b_wr_index_memories_fft16,

input logic [1:0]                           i_num_stage3,
    
output logic signed [DOUBLE_DATA_WIDTH-1:0]  o_a_data_memories_fft16,
output logic signed [DOUBLE_DATA_WIDTH-1:0]  o_b_data_memories_fft16


);



// Individual enable signals for each memory instance

  logic [7:0] t_a_wr_mem_enable;
  logic [7:0] t_b_wr_mem_enable;
  logic [7:0] t_done_wr; 

  logic signed  [DOUBLE_DATA_WIDTH-1:0] memory_input  [7:0];
  
  logic signed [DOUBLE_DATA_WIDTH-1:0] memory_output [7:0]; 
 
  logic signed ta_rd_add;
  logic signed tb_rd_add;

always_comb
begin
if(i_wr_en_memories_fft16) 
    begin
       

                if(i_a_wr_index_memories_fft16==3'b000) 
                t_a_wr_mem_enable = 8'b00000001;

                else if(i_a_wr_index_memories_fft16==3'b001)
                t_a_wr_mem_enable = 8'b00000010; 

                else if(i_a_wr_index_memories_fft16==3'b010) 
                t_a_wr_mem_enable = 8'b00000100;

                else if(i_a_wr_index_memories_fft16==3'b011)
                t_a_wr_mem_enable = 8'b00001000; 

                else if(i_a_wr_index_memories_fft16==3'b010) 
                t_a_wr_mem_enable = 8'b00000100;

                else if(i_a_wr_index_memories_fft16==3'b100)
                t_a_wr_mem_enable = 8'b00010000; 

                else if(i_a_wr_index_memories_fft16==3'b101) 
                t_a_wr_mem_enable = 8'b00100000;

                else if(i_a_wr_index_memories_fft16==3'b110)
                t_a_wr_mem_enable = 8'b01000000; 

                else //(i_a_wr_index_memories_fft16==4'b0111) 
                t_a_wr_mem_enable = 8'b10000000;



/////////////////////////////bbbbbbbbbbb
                if(i_b_wr_index_memories_fft16==3'b000) 
                t_b_wr_mem_enable = 8'b00000001;

                else if(i_b_wr_index_memories_fft16==3'b001)
                t_b_wr_mem_enable = 8'b00000010; 

                else if(i_b_wr_index_memories_fft16==3'b010) 
                t_b_wr_mem_enable = 8'b00000100;

                else if(i_b_wr_index_memories_fft16==3'b011)
                t_b_wr_mem_enable = 8'b00001000; 

                else if(i_b_wr_index_memories_fft16==3'b010) 
                t_b_wr_mem_enable = 8'b00000100;

                else if(i_b_wr_index_memories_fft16==3'b100)
                t_b_wr_mem_enable = 8'b00010000; 

                else if(i_b_wr_index_memories_fft16==3'b101) 
                t_b_wr_mem_enable = 8'b00100000;

                else if(i_b_wr_index_memories_fft16==3'b110)
                t_b_wr_mem_enable = 8'b01000000; 

                else //(i_b_wr_index_memories_fft16==4'b0111) 
                t_b_wr_mem_enable = 8'b10000000;
    end 
    else begin

t_a_wr_mem_enable='0;
t_b_wr_mem_enable='0;
    end

end  




always_comb begin
    case (i_a_rd_index_memories_fft16)
        3'b000: o_a_data_memories_fft16 = memory_output[0];
        3'b001: o_a_data_memories_fft16 = memory_output[1];
        3'b010: o_a_data_memories_fft16 = memory_output[2];
        3'b011: o_a_data_memories_fft16 = memory_output[3];
        3'b100: o_a_data_memories_fft16 = memory_output[4];
        3'b101: o_a_data_memories_fft16 = memory_output[5];
        3'b110: o_a_data_memories_fft16 = memory_output[6];
        3'b111: o_a_data_memories_fft16 = memory_output[7];
      
        default: o_a_data_memories_fft16 = '0;  //8'b00000000; // Default value if none of the above cases match
    endcase
end


always_comb 
begin
    case (i_b_rd_index_memories_fft16)
        3'b000: o_b_data_memories_fft16 = memory_output[0];
        3'b001: o_b_data_memories_fft16 = memory_output[1];
        3'b010: o_b_data_memories_fft16 = memory_output[2];
        3'b011: o_b_data_memories_fft16 = memory_output[3];
        3'b100: o_b_data_memories_fft16 = memory_output[4];
        3'b101: o_b_data_memories_fft16 = memory_output[5];
        3'b110: o_b_data_memories_fft16 = memory_output[6];
        3'b111: o_b_data_memories_fft16 = memory_output[7];
      
        default: o_b_data_memories_fft16 = '0; // Default value if none of the above cases match
    endcase

end




//---------------------------------------------------


//if need to <<write in all memories>> or <<write in 2 memories only>>, the next lines will be valid, 
//as the data will be written in the memoryif it's enabled only
always_comb 
    begin
        memory_input[0] = i_data_memories_fft16 [0];    
        memory_input[1] = i_data_memories_fft16 [1];    
        memory_input[2] = i_data_memories_fft16 [2];    
        memory_input[3] = i_data_memories_fft16 [3];    
        memory_input[4] = i_data_memories_fft16 [4];    
        memory_input[5] = i_data_memories_fft16 [5];    
        memory_input[6] = i_data_memories_fft16 [6];    
        memory_input[7] = i_data_memories_fft16 [7];    

    

if(i_num_stage3==2'b01 && i_done_stage3_fft16) begin
ta_rd_add=0;
tb_rd_add=1;
end
else if(i_num_stage3==2'b10) begin
ta_rd_add=1; 
tb_rd_add=0;    
end
else
begin
ta_rd_add=i_rd_add_memories_fft16;
tb_rd_add=i_rd_add_memories_fft16;
end

end
ram_fft16 #( .DATA_WIDTH(DATA_WIDTH),.ADD_SIZE(ADD_SIZE),.DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH))  
    mem0 (  .i_clk_ram_fft16(  i_clk_memories_fft16 ),
            .i_wr_en_ram_fft16( t_a_wr_mem_enable[0] || t_b_wr_mem_enable[0] ),

            .i_data_ram_fft16( memory_input[0] ),
            .i_rd_add_ram_fft16(  ta_rd_add ),
            .i_wr_add_ram_fft16(  i_wr_add_memories_fft16),
            .o_data_ram_fft16( memory_output[0])    
        );


ram_fft16 #( .DATA_WIDTH(DATA_WIDTH), .ADD_SIZE(ADD_SIZE), .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH))  
    mem1 (  .i_clk_ram_fft16(  i_clk_memories_fft16 ),

            .i_wr_en_ram_fft16( t_a_wr_mem_enable[1] || t_b_wr_mem_enable[1] ),

            .i_data_ram_fft16( memory_input[1] ),
            .i_rd_add_ram_fft16( tb_rd_add),
            .i_wr_add_ram_fft16( i_wr_add_memories_fft16 ),
            .o_data_ram_fft16( memory_output[1])      
        );

ram_fft16 #( .DATA_WIDTH(DATA_WIDTH), .ADD_SIZE(ADD_SIZE),.DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)) 
    mem2 (  .i_clk_ram_fft16(  i_clk_memories_fft16 ),
      
            .i_wr_en_ram_fft16( t_a_wr_mem_enable[2] || t_b_wr_mem_enable[2] ),
   
            .i_data_ram_fft16( memory_input[2] ),
            .i_rd_add_ram_fft16(  ta_rd_add),
            .i_wr_add_ram_fft16( i_wr_add_memories_fft16 ),
            .o_data_ram_fft16( memory_output[2])    
        );

ram_fft16 #( .DATA_WIDTH(DATA_WIDTH), .ADD_SIZE(ADD_SIZE),.DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH))
    mem3 (  .i_clk_ram_fft16(  i_clk_memories_fft16 ),
            .i_wr_en_ram_fft16( t_a_wr_mem_enable[3] || t_b_wr_mem_enable[3] ),
            
            .i_data_ram_fft16( memory_input[3] ),
            .i_rd_add_ram_fft16(  tb_rd_add),
            .i_wr_add_ram_fft16( i_wr_add_memories_fft16 ),
            .o_data_ram_fft16( memory_output[3]) 
    );

ram_fft16 #( .DATA_WIDTH(DATA_WIDTH), .ADD_SIZE(ADD_SIZE),.DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)) 
    mem4 (  .i_clk_ram_fft16(  i_clk_memories_fft16 ),
            .i_wr_en_ram_fft16( t_a_wr_mem_enable[4] || t_b_wr_mem_enable[4] ),
            
            .i_data_ram_fft16( memory_input[4] ),
            .i_rd_add_ram_fft16(  ta_rd_add),
            .i_wr_add_ram_fft16( i_wr_add_memories_fft16 ),
            .o_data_ram_fft16( memory_output[4])    
        );

ram_fft16 #( .DATA_WIDTH(DATA_WIDTH), .ADD_SIZE(ADD_SIZE),.DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH))
    mem5 (  .i_clk_ram_fft16(  i_clk_memories_fft16 ),
            .i_wr_en_ram_fft16( t_a_wr_mem_enable[5] || t_b_wr_mem_enable[5] ),
           
            .i_data_ram_fft16( memory_input[5] ),
            .i_rd_add_ram_fft16( tb_rd_add),
            .i_wr_add_ram_fft16( i_wr_add_memories_fft16 ),
            .o_data_ram_fft16( memory_output[5])    
        );

ram_fft16 #( .DATA_WIDTH(DATA_WIDTH), .ADD_SIZE(ADD_SIZE),.DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)) 
    mem6 (  .i_clk_ram_fft16(  i_clk_memories_fft16 ),
            .i_wr_en_ram_fft16( t_a_wr_mem_enable[6] || t_b_wr_mem_enable[6] ),
            .i_data_ram_fft16( memory_input[6] ),
            .i_rd_add_ram_fft16( ta_rd_add),
            .i_wr_add_ram_fft16( i_wr_add_memories_fft16 ),
            .o_data_ram_fft16( memory_output[6])    
        );

ram_fft16 #( .DATA_WIDTH(DATA_WIDTH), .ADD_SIZE(ADD_SIZE),.DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)) 
    mem7 (  .i_clk_ram_fft16(  i_clk_memories_fft16 ),
            .i_wr_en_ram_fft16( t_a_wr_mem_enable[7] || t_b_wr_mem_enable[7] ),
            .i_data_ram_fft16( memory_input[7] ),
            .i_rd_add_ram_fft16( tb_rd_add),
            .i_wr_add_ram_fft16( i_wr_add_memories_fft16 ),
            .o_data_ram_fft16( memory_output[7])    
        );

endmodule




