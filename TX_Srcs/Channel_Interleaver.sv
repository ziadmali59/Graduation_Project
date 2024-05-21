module Channel_Interleaver #(
parameter int	MaximumRows = 480,
parameter int	MaximumColumns= 48,
parameter int 	Data_WIDTH=12,
parameter int  Nsc_max = 4,                  // Maximum Nsc value
parameter int  NRU_max = 4,                  // Maximum NRU value
parameter int  Qm_max = 4,                   // Maximum Qm value
parameter int  Nslots_max = 4 

)(
input  logic	i_serial_in,
input  logic 	i_clk,
input  logic    i_rst_n,
input  logic 	i_start,
input  logic	[Nsc_max-1:0] i_Nsc,              // Number of serving cells
input  logic 	[NRU_max-1:0] i_NRU,              // Number of resource units
input  logic 	[Qm_max-1:0]  i_Qm,               // Modulation order
input  logic 	[Nslots_max-1:0] i_Nslots,  
output logic 	o_channel_interleaver,
output logic    o_valid
);
//logic read_ptr;
logic o_valid_counter;
logic [Data_WIDTH-1:0]	O_RAM;
//logic [Data_WIDTH-1:0]	o_deserializer;
//logic valid_deserializer;
logic rst_counter_read;
logic rst_counter_write;
//logic enable_deserializer;
//logic enable_counters;
//logic WE;
logic [8:0]Number_Rows;
logic [5:0]Number_Columns;
logic READ_DONE;
logic WRITE_DONE;
//logic READ;
logic [14:0]index_write;
logic [14:0]index_read;
logic [14:0] index;
//logic valid_ram;
logic valid_serializer;
logic enable_serializer;
logic o_read_next;
logic en_RAM;
logic WE_RAM;
//logic o_valid_ptos;
//logic i_rst_n_deserializer;
logic o_valid_counter_read;
logic [11:0] y;
logic valid_received;

logic t_flag;
logic t_valid_serilizer;
//serial_to_parallel_Channel_Interleaver deserializer (
//  .i_clk(i_clk),
//  .i_serial_in(i_serial_in),
//  .i_start(i_start),
//  .i_rst_n(i_rst_n_deserializer),
//  .o_parallel_out(o_deserializer),
//  .o_data_received(valid_deserializer)  // Flag indicating all data received
//);
always@(posedge i_clk or negedge i_rst_n)
begin
if(~i_rst_n)
begin
    y <= 0;
end
else if (i_start)
    y <={{11{i_serial_in}},i_serial_in};
 end
 Channel_Interleaver_FSM FSM_interleaver (
.i_clk(i_clk),
.i_rst_n(i_rst_n),
.i_start(i_start),
.WRITE_DONE(WRITE_DONE),
.READ_DONE(READ_DONE),
.o_rst_counter_write(rst_counter_write),
.o_rst_counter_read(rst_counter_read),
//.o_rst_deserializer(i_rst_n_deserializer),
//.o_enable_counters(enable_counters),

//.o_READ(READ),	
.o_enable_RAM(en_RAM),
.o_enable_serializer(enable_serializer)

);



Lookup_table_Channel_Interleaver LUT(
.i_Nsc(i_Nsc),              // Number of serving cells
.i_NRU(i_NRU),              // Number of resource units
.i_Qm (i_Qm),               // Modulation order
.i_Nslots(i_Nslots),        // Number of slots
.o_rows(Number_Rows),       // Lookup table output
.o_columns(Number_Columns) 
);
Counter_Write_Channel_Interleaver Counter_Write(
.i_clk(i_clk),
.i_rst_n(rst_counter_write),
.i_Rows(Number_Rows),
.i_columns(Number_Columns),
.i_start(i_start),

//.i_serial_in(i_serial_in),
//.i_enable(enable_counters),
//.WE(WE),
//.READ(READ),
//.serializer_done(o_read_next),
.index(index_write),
.Write_done(WRITE_DONE),
//.READ_done(READ_DONE),
.o_valid(o_valid_counter)
);
Counter_READ_Channel_Interleaver Counter_READ(
.i_clk(i_clk),
.i_rst_n(rst_counter_read),
.i_Rows(Number_Rows),
.i_columns(Number_Columns),
.valid_received(valid_received),
//.i_valid_deserializer(valid_deserializer),
//.i_enable(enable_counters),
//.WE(WE),
//.READ(READ),
.serializer_done(o_read_next),
.index(index_read),
//.Write_done(WRITE_DONE),
.READ_done(READ_DONE),
.o_valid(o_valid_counter_read)
);

assign WE_RAM= i_start && o_valid_counter;
assign index=(rst_counter_write)?index_write:(rst_counter_read)?index_read:0;
RAM_Channel_Interleaver RAM
(
.i_clk(i_clk),
.en_RAM(en_RAM),
.WE_RAM(WE_RAM),
.i_deserializer(y),
.index(index),
.O_RAM(O_RAM)
// .read_pointer(read_ptr)
);
//assign valid_serializer=(O_RAM==RAM);

//always@(posedge i_clk) begin

//if(enable_serializer) begin
//o_valid=o_valid_ptos;
//end
//else begin
//o_valid=0;
//end
//end

serializer parallel_to_serial (
.i_clk(i_clk),
.i_rst_n(i_rst_n),
.i_enable(enable_serializer),
.i_data_in(O_RAM),
.i_valid(o_valid_counter_read),
.o_data_out(o_channel_interleaver),
.o_valid(t_valid_serilizer),
.flag(t_flag),
.o_done(o_read_next),
.valid_received(valid_received)
);

assign o_valid=(t_flag==1) ? t_valid_serilizer : 1'b0;
endmodule