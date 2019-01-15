module vendor3_top(
input clk,
input reset_n,
input chipselect,
input write,
input [31:0] writedata,
output wire [7:0] LEDG,
output wire [6:0] HEX0,
output wire [6:0] HEX1, 
output wire [6:0] HEX2,
output wire [6:0] HEX3,
output wire [6:0] HEX4,
output wire [6:0] HEX5,
output wire [6:0] HEX6,
output wire [6:0] HEX7
);
//reg sw_reg_selected;
reg [17:0] sw_reg;
/*always @ *
begin
	sw_reg_selected = 0;
	if (chipselect)
	begin
		sw_reg_selected = 1;
	end
	else
	begin
		sw_reg_selected = 0;
	end
end*/
always @ (posedge clk or negedge reset_n)
begin
	if (!reset_n)
		sw_reg <= 0;
	else
	begin
		//if (write & chipselect & sw_reg_selected)
		if (write & chipselect)
		begin
				sw_reg[17:0] <= writedata[17:0];
		end
	end
end
vendor3 vendor3_top(.KEY(reset_n),.CLOCK_50(clk),.SW(sw_reg),.HEX7(HEX7),.HEX6(HEX6),.HEX5(HEX5),
                    .HEX4(HEX4),.HEX2(HEX2),.HEX1(HEX1),.HEX0(HEX0),.HEX3(HEX3),.LEDG(LEDG));
endmodule