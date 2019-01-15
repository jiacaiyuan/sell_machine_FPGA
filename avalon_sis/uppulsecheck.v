module uppulsecheck(rst_n,clk,xin,flag);
input rst_n,clk,xin;
output flag;
reg xin_old;
wire flag;
always@(posedge clk or negedge rst_n)
 begin
  if (!rst_n)
      xin_old<=0;
  else
      xin_old<=xin;
 end

assign  flag=(xin&&(~xin_old));
endmodule
      