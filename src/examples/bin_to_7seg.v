module bin_to_7seg
(
	input [7:0] in_byte,
	output reg [7:0] out_seg1,
	output reg [7:0] out_seg2
);

always @(*)
begin
	case(in_byte[3:0])
		4'h0:    out_seg1 = 8'h7E;
		4'h1:    out_seg1 = 8'h30;
		4'h2:    out_seg1 = 8'h6D;
		4'h3:    out_seg1 = 8'h79;
		4'h4:    out_seg1 = 8'h33;
		4'h5:    out_seg1 = 8'h5B;
		4'h6:    out_seg1 = 8'h5F;
		4'h7:    out_seg1 = 8'h70;
		4'h8:    out_seg1 = 8'h7F;
		4'h9:    out_seg1 = 8'h7B;
		4'ha:    out_seg1 = 8'h77;
		4'hb:    out_seg1 = 8'h1F;
		4'hc:    out_seg1 = 8'h4E;
		4'hd:    out_seg1 = 8'h3D;
		4'he:    out_seg1 = 8'h4F;
		4'hf:    out_seg1 = 8'h47;
		default: out_seg1 = 8'h00;
	endcase
	case(in_byte[7:4])
		4'h0:    out_seg2 = 8'h7E;
		4'h1:    out_seg2 = 8'h30;
		4'h2:    out_seg2 = 8'h6D;
		4'h3:    out_seg2 = 8'h79;
		4'h4:    out_seg2 = 8'h33;
		4'h5:    out_seg2 = 8'h5B;
		4'h6:    out_seg2 = 8'h5F;
		4'h7:    out_seg2 = 8'h70;
		4'h8:    out_seg2 = 8'h7F;
		4'h9:    out_seg2 = 8'h7B;
		4'ha:    out_seg2 = 8'h77;
		4'hb:    out_seg2 = 8'h1F;
		4'hc:    out_seg2 = 8'h4E;
		4'hd:    out_seg2 = 8'h3D;
		4'he:    out_seg2 = 8'h4F;
		4'hf:    out_seg2 = 8'h47;
		default: out_seg2 = 8'h00;
	endcase
end

endmodule
