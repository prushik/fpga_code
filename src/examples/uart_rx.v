module uart_rx
#(
	parameter clks_per_bit = 217 // (25mhz (fpga clock) / 115200 (baudrate))
)
(
	input		i_clock,
	input		i_rx_uart,
	output		o_rx_dv,
	output [7:0]o_rx_byte
);

parameter	clks_mid_bit	= 108;
reg	[7:0]	r_cycle_count	= 8'h00;
reg	[2:0]	r_index			= 3'h0;
reg			r_dv			= 0;
reg	[7:0]	r_rx_byte		= 8'h00;
reg	[2:0]	r_state			= 0;

always @(posedge i_clock)
begin
	case (r_state)
		0:
		begin
			r_dv <= 0;
			r_cycle_count <= 0;
			r_index <= 0;

			if (i_rx_uart == 0) // Start bit is LOW
				r_state <= 1;
		end
		1:
		begin
			r_cycle_count <= r_cycle_count + 1;
			if (r_cycle_count == clks_mid_bit)
			begin
				if (i_rx_uart == 0)
				begin
					r_cycle_count <= 0;
					r_state <= 2;
				end
				else
					r_state = 0;
			end
		end
		2:
		begin
			r_cycle_count <= r_cycle_count + 1;
			if (r_cycle_count == clks_per_bit)
			begin
				r_cycle_count <= 0;
				r_rx_byte[r_index] <= i_rx_uart;
				if (r_index == 7)
					r_state = 3;
				r_index <= r_index + 1;
			end
		end
		3:
		begin
			r_cycle_count <= r_cycle_count + 1;
			if (r_cycle_count == clks_per_bit)
			begin
				r_cycle_count	<= 0;
				r_dv			<= 1;
				r_state			<= 4;
			end
		end
		4:
		begin
			r_dv	<= 0;
			r_state	<= 0;
		end
	endcase
end

assign o_rx_dv   = r_dv;
assign o_rx_byte = r_rx_byte;

endmodule
