module example_1
(
	input i_switch_1,
	input i_switch_2,
	input i_switch_3,
	input i_switch_4,
	output o_led_1,
	output o_led_2,
	output o_led_3,
	output o_led_4
);

assign	o_led_4 = i_switch_1;
assign	o_led_3 = i_switch_2 | i_switch_1;
assign	o_led_2 = i_switch_3 | i_switch_1;
assign	o_led_1 = i_switch_4 | i_switch_1;

endmodule
