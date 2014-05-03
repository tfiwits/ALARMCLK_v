module ClockDivider(clk,rst,Pulse,Clkout,counterOut);

parameter Divider =6;
parameter Bitwidth = 4;
//parameter DividerP = Divider+1;
//parameter HalfDivider = Divider/2;
// input/ output
input clk,rst;
output Pulse,Clkout;
output [3:0] counterOut;
// properties
wire clk,rst;
wire [3:0] counterOut;
reg Pulse,Clkout; // reg, save value
reg [Bitwidth-1:0] Counter;
wire [Bitwidth-1:0] HalfDivider;

assign HalfDivider = (Divider >>1);  // shift right size one bit =  divided 2
assign counterOut[3:0] = Counter[3:0];

always @(posedge clk or posedge ~rst)
	begin
		if(rst==0)
		begin
			Pulse =0;
			Counter =0;
			Clkout =0;
		end
		else
		begin
			Counter = Counter+1;
			case (Counter)
				Divider:
				begin
					Clkout =0;
					Counter =0;
					Pulse =1;
				end
				HalfDivider:
				begin
					Clkout =1;
				end
				default:
				begin
					Pulse =0;
				end
			endcase
		end
	end
endmodule
