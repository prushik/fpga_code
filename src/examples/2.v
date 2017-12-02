module example_2
(
	input i_clk,
	input i_switch_1,
	input i_switch_2,
	input i_switch_3,
	input i_switch_4,
	output o_segment1_a,
	output o_segment1_b,
	output o_segment1_c,
	output o_segment1_d,
	output o_segment1_e,
	output o_segment1_f,
	output o_segment1_g,
	output o_segment2_a,
	output o_segment2_b,
	output o_segment2_c,
	output o_segment2_d,
	output o_segment2_e,
	output o_segment2_f,
	output o_segment2_g
);

reg [7:0] num = 7'h00;
reg [7:0] seg_1;
reg [7:0] seg_2;

//wire w_segment1_a;
//wire w_segment1_b;
//wire w_segment1_c;
//wire w_segment1_d;
//wire w_segment1_e;
//wire w_segment1_f;
//wire w_segment1_g;
//wire w_segment2_a;
//wire w_segment2_b;
//wire w_segment2_c;
//wire w_segment2_d;
//wire w_segment2_e;
//wire w_segment2_f;
//wire w_segment2_g;


always @(posedge i_clk)
begin
	num = 7'h00;
	if (i_switch_1 == 1'b1)
		num = num + 1;
	if (i_switch_2 == 1'b1)
		num = num + 2;
	if (i_switch_3 == 1'b1)
		num = num + 4;
	if (i_switch_4 == 1'b1)
		num = num + 8;
end

bin_to_7seg inst
(
	.in_byte(num),
	.out_seg1(seg_1),
	.out_seg2(seg_2)
);

assign o_segment1_a = seg_1[0];
assign o_segment1_b = seg_1[1];
assign o_segment1_c = seg_1[2];
assign o_segment1_d = seg_1[3];
assign o_segment1_e = seg_1[4];
assign o_segment1_f = seg_1[5];
assign o_segment1_g = seg_2[6];
assign o_segment2_a = seg_2[0];
assign o_segment2_b = seg_2[1];
assign o_segment2_c = seg_2[2];
assign o_segment2_d = seg_2[3];
assign o_segment2_e = seg_2[4];
assign o_segment2_f = seg_2[5];
assign o_segment2_g = seg_2[6];

endmodule
