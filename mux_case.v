 module mux_case (
	clk_in,
	clk_1s,
	rst,
  sel_i,
  df,
  df_0,
  ed,
  q_o
);

 input clk_in,rst,clk_1s;
 input df,df_0,ed;
 output [1:0] sel_i;
 output q_o;

 reg q_o;
 reg[1:0] sel=0;

 always@(posedge clk_in or negedge rst or negedge ed)
 begin
	if (rst==0)
		begin
			sel=0;
		end
	else
		begin
			case (sel)
			0: 
					if (df==1)
						sel<=2'b01;
					else if(ed==0)
						sel<=2'b10;
					else
						begin
						q_o<=1'b0;
						sel<=2'b00;
					end
		  1:
				if (df==1)
					begin
					sel<=2'b01;
					q_o<=1'b0;
					end
				else
					sel<=2'b00;
		  2 : 
						if (df_0==1)
						begin
							q_o<=1'b0;
								sel<=2'b11;
							end
						else
							begin
								sel<=2'b10;
								q_o=clk_1s;
						end

		  3 :
						if (df_0==0)
							begin
								sel<=2'b00;
							end
						else
							begin
								q_o<=1'b0;
								sel<=2'b11;
						end
	  endcase
	end
 end
 assign sel_i = sel;
endmodule 