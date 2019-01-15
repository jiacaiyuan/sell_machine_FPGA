module leddisplay(num,hex);
//input clk;
input [5:0]num;
output [6:0] hex;
reg [6:0] hex;
always@(*)
  begin 
    case(num)
            0: hex = 7'b1000000;
            1: hex = 7'b1111001;
            2: hex = 7'b0100100;
            3: hex = 7'b0110000;
            4: hex = 7'b0011001;
            5: hex = 7'b0010010;
            6: hex = 7'b0000010;
            7: hex = 7'b1111000;
            8: hex = 7'b0000000;
            9: hex = 7'b0010000;
      default: hex = 7'b0000110; 
    endcase
   end
endmodule
  