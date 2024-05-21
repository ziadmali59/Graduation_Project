module Resource_Mapper_FSM(
input  logic i_WRITE_done,
input  logic i_clk,
input  logic i_rst_n,
input  logic i_FFT_Valid,
input  logic [2:0]i_Number_Repetition,
input  logic [2:0]repetition_count,
output logic o_enable_counter,
output logic o_rst_counter,
output logic o_enable_RAM,
output logic o_rst_data_provider,
output logic repetition_valid,
output logic o_Stop_FFT
);

enum logic [1:0] {
    IDLE,
    WRITE,
    READ
  } state, next_state;

always_ff @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
      state <= IDLE;
    end else begin
      state <= next_state;  // State update remains here
    end
end

always_comb begin
    case (state)  // Use unique case for clarity and safety
        IDLE: begin 
            o_rst_counter = 0;
            o_enable_counter = 0;
            o_enable_RAM = 0;
            o_Stop_FFT = 0;
            repetition_valid =0 ;
            o_rst_data_provider = 0;
            if(i_FFT_Valid) begin
                next_state = WRITE;
                o_rst_data_provider = 1;
                o_enable_RAM = 1;
                o_Stop_FFT = 0;
                o_rst_counter = 1;
                o_enable_counter = 1;
                repetition_valid = 0;
            end else begin
                next_state = IDLE;
            end
        end
        WRITE: begin
                           
            o_rst_data_provider = 1;
            o_enable_RAM = 1;
            o_Stop_FFT = 0;
            o_rst_counter = 1;
            o_enable_counter = 1;
            repetition_valid = 0;
            if(i_WRITE_done && i_Number_Repetition==3'b0) begin
                next_state = WRITE;
            end else if(i_WRITE_done)begin
                next_state = READ;
            end
            else begin
                next_state = WRITE;
            end
        end
        READ: begin
            o_rst_data_provider = 0;
            o_enable_RAM = 1;
            o_enable_counter = 1;
            o_rst_counter = 1;
            o_Stop_FFT = 1;
            repetition_valid = 1;
            if(i_WRITE_done) begin
                if(i_Number_Repetition == repetition_count-1) begin
                    next_state = IDLE;
                end else begin
                    next_state = READ;
                end
            end else begin
                next_state = READ;
            end
        end
        default: begin 
            o_rst_counter = 0;
            o_enable_counter = 0;
            o_enable_RAM = 0;
            o_Stop_FFT = 0;
            repetition_valid =0 ;
            o_rst_data_provider = 0;
            if(i_FFT_Valid) begin
                next_state = WRITE;
            end else begin
                next_state = IDLE;
            end
        end
    endcase
end
endmodule
