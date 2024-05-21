module Lookup_table_Channel_Interleaver #(
  parameter  int   Nsc_max = 4,                  // Maximum Nsc value
  parameter  int  NRU_max = 4,                  // Maximum NRU value
  parameter  int  Qm_max = 4,                   // Maximum Qm value
  parameter  int   Nslots_max = 4,               // Maximum Nslots value
  parameter int Rows_max = 9,                 // Maximum number of rows
  parameter int Columns_max = 6               // Maximum number of columns
) (
  input logic		[Nsc_max-1:0] i_Nsc,              // Number of serving cells
  input logic 		[NRU_max-1:0] i_NRU,              // Number of resource units
  input logic 		[Qm_max-1:0]  i_Qm,                // Modulation order
  input logic 		[Nslots_max-1:0] i_Nslots,        // Number of slots
  output logic 	[Rows_max-1:0] o_rows,            // Lookup table output
  output logic 	[Columns_max-1:0] o_columns  
);



always_comb begin
o_rows=i_Nsc *i_NRU *i_Qm;
o_columns=3'd6*i_Nslots;
end

endmodule

	 
	 
	 