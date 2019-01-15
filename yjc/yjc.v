module yjc(CLOCK_27,SW,KEY,LEDG,LEDR,HEX7,HEX6,HEX5,HEX4,HEX2,HEX1,HEX0,HEX3);  //jc_yuan's perfect
//declare the port
input CLOCK_27;
input [17:0]SW;
input [3:0] KEY;
output [7:0] LEDG;
output [17:0]LEDR;
output [6:0] HEX7,HEX6,HEX5,HEX4,HEX2,HEX1,HEX0,HEX3;//HEX3 is for the state change
//declare the type of the port
wire [17:0]SW;
wire [3:0] KEY;//the key is posedge or negedge don't know
reg [7:0] LEDG;
reg [6:0] HEX7,HEX6,HEX5,HEX4,HEX2,HEX1,HEX0,HEX3;
//the meduim value and the state
reg [5:0] current_state;
reg [5:0] next_state;
reg [5:0] given_money,given_money_temp;
reg [5:0] need_money,need_money_temp;
reg [5:0] change_money;
//integer given_money;
//integer need_money;
//integer change_money;
//change for the clock
reg [23:0] sep_clk;
reg aft_clk;
//end change for the clock
//the parameter of value
parameter
        idle    = 6'b000001,
        choose  = 6'b000010,
        pay     = 6'b000100,
        pay_ok  = 6'b001000,
        deal_ok = 6'b010000,
        deal_not= 6'b100000;
parameter zero=7'b1000000,one=7'b1111001,two=7'b0100100,three=7'b0110000;
parameter four=7'b0011001,five=7'b0010010,six=7'b0000010,seven=7'b1111000;
parameter eight=7'b0000000,nine=7'b0010000;
//the change for clock
always @(posedge CLOCK_27 or negedge KEY[3])
  begin
   if(!KEY[3])
     begin
       sep_clk<=24'd0;
       aft_clk<=0;
     end
    else if(sep_clk==24'hffffff)
      begin
        sep_clk<=0;
        aft_clk<=!aft_clk;
      end
    else
      sep_clk<=sep_clk+1;
    
  end
always @(aft_clk)
  begin
    if(aft_clk==1)
      LEDG[3]=1;
    else
      LEDG[3]=0;
  end
//end the change for clock

//test the switch with the LED
assign LEDR=SW;
//stage one: the update of state
always @(posedge aft_clk or negedge KEY[0])
  begin
    if(!KEY[0])
      begin
        current_state<=idle;
      end
    else
      begin
        current_state<=next_state;
      end
  end
//stage two:the calculate of next_state
always @(*)
//always @(SW or current_state or given_money or need_money or change_money or KEY)
  begin
    case (current_state)
      idle:
        begin
          HEX3=zero;
          if(SW[1]|SW[2]|SW[0])
            next_state=choose;
          else
            next_state=idle;
        end
      choose:
        begin
           HEX3=one;
          if(SW[17])
            begin
              next_state=idle;
            end
          else
            begin
              next_state=pay;
            end
        end
      pay:
        begin
          HEX3=two;
          if(given_money>=need_money)
            begin
              next_state=pay_ok;
            end
          else if(SW[17])
            next_state=deal_not;
          else
            next_state=pay;
         end 
      pay_ok:      //only the money is enough then you can cancel to buy it,else it's wrong!!! 
        begin
          HEX3=three;
          if(SW[16])
            begin
              next_state=deal_ok;
            end
          else if(SW[17])
              next_state=deal_not;
          else
              next_state=pay_ok;
         end
      deal_not:
        begin
          HEX3=four;
          if(SW[15])
            next_state=idle;
          else
            next_state=deal_not;
        end 
      deal_ok:
        begin
          HEX3=five;
          if(SW[15])
            next_state=idle;
          else
            next_state=deal_ok;
         end
      default:
        begin
          HEX3=eight;
	      next_state=6'bxxxxxx;
        end
    endcase
  end
always @(posedge aft_clk or negedge KEY[0])
  begin
    if(!KEY[0])
      need_money_temp<=0;
    else if(SW[2])
      need_money_temp<=20;
    else if(SW[1])
      need_money_temp<=14;  
    else if(SW[0])
      need_money_temp<=10; 
    else
      need_money_temp<=need_money_temp;
   end
always @(posedge aft_clk or negedge KEY[0])  
  begin
    if(!KEY[0])
      given_money_temp<=0;
    else if(SW[10])
       given_money_temp<=given_money_temp+10;
    else if(SW[9])
       given_money_temp<=given_money_temp+5;
    else if(SW[8])
       given_money_temp<=given_money_temp+1;  
    else 
       given_money_temp<=given_money_temp;
  end
always @(posedge aft_clk or negedge KEY[0])
  begin
    if(!KEY[0])
      begin
        change_money<=0;
        given_money<=0;
        need_money<=0;
        LEDG[0]<=0;
        LEDG[7]<=0;
      end
    else
      begin
        case(current_state)
          idle:
            begin
              change_money<=0;
              given_money<=0;
              need_money<=0;
              LEDG[0]<=0;
              LEDG[7]<=0;
            end
          choose:
            begin
              need_money<=need_money_temp;
            end
          pay:
            begin
              given_money<=given_money_temp;
            end
          pay_ok:
            begin
              LEDG[0]<=1;
            end
          deal_not:
            begin
              change_money<=given_money_temp;
            end
          deal_ok:
            begin
              change_money<=given_money-need_money;
              LEDG[7]<=1;
              //LEDG[7]<=0;
            end
           default:
             begin
              change_money<=0;
              given_money<=0;
              need_money<=0;
              LEDG[0]<=0;
              LEDG[7]<=0;
            end  
       endcase
     end
  end
always @(given_money) 
  begin
    case (given_money)
            0:begin HEX5=zero;HEX4=zero; end
            1:begin HEX5=zero;HEX4=one; end
            2:begin HEX5=zero;HEX4=two; end
            3:begin HEX5=zero;HEX4=three; end
            4:begin HEX5=zero;HEX4=four; end
            5:begin HEX5=zero;HEX4=five; end
            6:begin HEX5=zero;HEX4=six; end
            7:begin HEX5=zero;HEX4=seven; end
            8:begin HEX5=zero;HEX4=eight; end
            9:begin HEX5=zero;HEX4=nine; end
            10:begin HEX5=one;HEX4=zero;end
            11:begin HEX5=one;HEX4=one; end
            12:begin HEX5=one;HEX4=two; end
            13:begin HEX5=one;HEX4=three; end
            14:begin HEX5=one;HEX4=four; end
            15:begin HEX5=one;HEX4=five; end
            16:begin HEX5=one;HEX4=six; end
            17:begin HEX5=one;HEX4=seven; end
            18:begin HEX5=one;HEX4=eight; end
            19:begin HEX5=one;HEX4=nine; end
            20:begin HEX5=two;HEX4=zero;end
            21:begin HEX5=two;HEX4=one;end
            22:begin HEX5=two;HEX4=two;end
            23:begin HEX5=two;HEX4=three;end
            24:begin HEX5=two;HEX4=four;end
            25:begin HEX5=two;HEX4=five;end
            default:begin HEX5=zero;HEX4=zero; end
          endcase  
   end
always @(change_money)
  begin
    case(change_money)
            0:begin HEX0=zero;HEX1=zero;HEX2=zero;end
            1:begin HEX0=one;HEX1=zero;HEX2=zero;end
            2:begin HEX0=two;HEX1=zero;HEX2=zero;end
            3:begin HEX0=three;HEX1=zero;HEX2=zero;end
            4:begin HEX0=four;HEX1=zero;HEX2=zero;end

            5:begin HEX0=zero;HEX1=one;HEX2=zero;end
            6:begin HEX0=one;HEX1=one;HEX2=zero;end
            7:begin HEX0=two;HEX1=one;HEX2=zero;end
            8:begin HEX0=three;HEX1=one;HEX2=zero;end
            9:begin HEX0=four;HEX1=one;HEX2=zero;end

            10:begin HEX0=zero;HEX1=zero;HEX2=one;end
            11:begin HEX0=one;HEX1=zero;HEX2=one;end
            12:begin HEX0=two;HEX1=zero;HEX2=one;end
            13:begin HEX0=three;HEX1=zero;HEX2=one;end
            14:begin HEX0=four;HEX1=zero;HEX2=one;end

            15:begin HEX0=zero;HEX1=one;HEX2=one;end
            16:begin HEX0=one;HEX1=one;HEX2=one;end
            17:begin HEX0=two;HEX1=one;HEX2=one;end
            18:begin HEX0=three;HEX1=one;HEX2=one;end
            19:begin HEX0=four;HEX1=one;HEX2=one;end
            20:begin HEX0=zero;HEX1=zero;HEX2=two;end
            default:begin HEX0=zero;HEX1=zero;HEX2=zero;end
     endcase 
   end
always @(need_money)
  begin
    if(need_money==20)//test if the need_money has the value  --ok
            begin HEX7=two;HEX6=zero;  end//20
         // else if(SW[1])
          else if(need_money==14)
            begin HEX7=one;HEX6=four;  end //14     5:0010010
         // else if(SW[0])
          else if(need_money==10)
            begin HEX7=one;HEX6=zero;   end
          else
            begin HEX7=zero;HEX6=zero;   end
        end
endmodule

                    
