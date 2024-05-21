set_property -dict {PACKAGE_PIN H11 IOSTANDARD LVDS} [get_ports i_clk]
#phys_opt_design -aggressive_hold_fix
#phys_opt_design -hold_fix




create_clock -period 6.000 -name sys_clk_pin -waveform {0.000 3.000} -add [get_ports i_clk]
