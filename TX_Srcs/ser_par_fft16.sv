/*module ser_par_fft16
#(parameter DATA_WIDTH = 16,  
           DOUBLE_DATA_WIDTH = 32,
           DEPTH=34
)
(
    input wire clk,                                      
    input wire i_rst_n,                                 
    input logic signed [DOUBLE_DATA_WIDTH-1:0] i1_data,  
    input logic signed [DOUBLE_DATA_WIDTH-1:0] i2_data,  
    output logic signed [DOUBLE_DATA_WIDTH-1:0] o_data [DEPTH-1:0]  //dummy row needed
);

//logic [3:0] counter = 4'b0000;                  // Counter to track serial input bits
logic [$clog2(DEPTH)-1:0] counter = 0; 
logic signed [DOUBLE_DATA_WIDTH-1:0] shift_reg [DEPTH-1:0]; // Shift register to store parallel output


initial begin
    counter <= '0;
            for (int i = 0; i < DEPTH; i++) begin
            shift_reg[i] = '0;
        end
end
// Counter process to increment by 2
always_ff @(posedge clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        counter <= '0; // Reset counter
    end else begin
        if (DEPTH==18) begin
        if (counter == DEPTH - 5'b00010)
        counter<= DEPTH-5'b10;
        else
        counter <= counter + 5'b00010; // Increment counter by 2
        end
        else  begin
        if (counter == DEPTH - 6'b000010)
        counter<= DEPTH-6'b000010;
        else
        counter <= counter + 6'b000010; // Increment counter by 2
        end


    end
end

// Shift and output process
always_ff @(posedge clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        // Reset shift register
        for (int i = 0; i < DEPTH; i++) begin
            shift_reg[i] = '0;
        end
    end else begin
        // Shift in serial input bits
        if (counter < DEPTH-1) begin
            shift_reg[counter]   <= i1_data;
            shift_reg[counter+1] <= i2_data;
        end
    end
end

// Output parallel data when counter reaches 15 (after 15 clock cycles)
always_comb begin
    if (counter == DEPTH-2) begin // If counter > 14
        for (int i = 0; i < DEPTH; i++) begin
            o_data[i] = shift_reg[i];
        end
    end else begin
        for (int i = 0; i < DEPTH; i++) begin
            o_data[i] = '0;
        end
    end
    o_data[DEPTH-1]='0;
end

endmodule*/

module ser_par_fft16
#(
    parameter DATA_WIDTH = 16,
    parameter DOUBLE_DATA_WIDTH = 32,
    parameter DEPTH = 34
)
(
    input wire clk,
    input wire i_rst_n,
    input logic signed [DOUBLE_DATA_WIDTH-1:0] i1_data,
    input logic signed [DOUBLE_DATA_WIDTH-1:0] i2_data,
    output logic signed [DOUBLE_DATA_WIDTH-1:0] o_data [DEPTH-1:0]
);

logic [$clog2(DEPTH)-1:0] counter = 0;
//logic signed [DOUBLE_DATA_WIDTH-1:0] shift_reg [DEPTH];

always_ff @(posedge clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        counter <= '0;
        for (int i = 0; i < DEPTH; i++) begin
            //shift_reg[i] = '0;
            o_data[i]='0;
        end

    end else begin
        if (counter == DEPTH-2) begin
            counter <= counter;//'0;
        end else begin
            counter <= counter + 2;
        end
        if (counter < DEPTH-1) begin
           // shift_reg
           o_data[counter]   <= i1_data;
           // shift_reg
           o_data[counter+1] <= i2_data;
        end
    end
end


//assign o_data[DEPTH-1]='0;
//assign o_data = (counter == DEPTH-2) ? shift_reg : '0;
/*always_comb begin
    if (counter == DEPTH-2) begin // If counter > 14
        for (int i = 0; i < DEPTH; i++) begin
            o_data[i] = shift_reg[i];
        end
    end else begin
        for (int i = 0; i < DEPTH; i++) begin
            o_data[i] = '0;
        end
    end
end*/
endmodule
