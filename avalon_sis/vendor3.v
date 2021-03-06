module vendor3(
  input   KEY,                               //rst_n
  input   CLOCK_50,                             //clk,
  input   [17:0]SW,            // KEY1,KEY2,KEY3,                 //sw10 drink_10,sw14 drink_14,sw15 drink_20,                              //cancel,
  output  wire [6:0] HEX7,HEX6,                  //total_money,
  output  wire [6:0] HEX5,HEX4,                  //return_money,
  output  wire [6:0] HEX2,                       //return_yiyuan_number,  
  output  wire [6:0] HEX1,                       //return_fivejiao_number,
  output  wire [6:0] HEX0,                       //return_yijiao_number,
  output  wire [6:0] HEX3,                        //cs
  output  reg  [7:0] LEDG                         
  );
 // final output
  reg  [5:0] drink_price;
  reg  [5:0] total_money;
  reg  [5:0] return_money;
  reg  [5:0] return_yiyuan_number;
  reg  [5:0] return_fivejiao_number;
  reg  [5:0] return_yijiao_number;
  
  
 //temp varial
  reg     [5:0]cs; 
  reg     [5:0]ns;  
  reg     [5:0]total_money_temp;
  reg     [5:0]drink_price_temp;
  reg     [5:0]return_money_temp;
  reg     [5:0]tmshi;
  reg     [5:0]tmge;
  reg     [5:0]dmshi;
  reg     [5:0]dmge;
  wire    SW0C,SW1C,SW2C,SW8C,SW9C,SW10C;
  
  
 //initial  LEDG[1]=CLOCK_50;
 
  
  
  parameter 
            idle          = 6'b000001 , //1
            pay           = 6'b000010 , //2
            pay_ok        = 6'b000011 , //3
            deal_ok       = 6'b000100 , //4
            no_buy        = 6'b000101 ; //5
///////////////////////////////
////////////////////////////////////////////////////////
///////////   generate pulse         //////////////
///////////////////////////////////////////////////////
  uppulsecheck    S0(KEY,CLOCK_50,SW[0],SW0C);
  uppulsecheck    S1(KEY,CLOCK_50,SW[1],SW1C);
  uppulsecheck    S2(KEY,CLOCK_50,SW[2],SW2C);
  uppulsecheck    S8(KEY,CLOCK_50,SW[8],SW8C);
  uppulsecheck    S9(KEY,CLOCK_50,SW[9],SW9C);
  uppulsecheck    S10(KEY,CLOCK_50,SW[10],SW10C);
  
////////////////////////////////////////////////////////////
             
  always@(posedge CLOCK_50 or negedge KEY)
    begin
       if (!KEY)
         cs <= idle;
       else 
         cs <= ns;
    end
///////////////////////  switch state///////////////////////////
  always@(*)
    begin
      if(!KEY)
          ns =idle;
      else  
          case(cs)
            idle:
              begin
                 if ({SW0C,SW1C,SW2C}) 
                      ns=pay;
                 else
                      ns=idle;
               end
             pay:
               begin
                 if  (SW[17])
                     ns=no_buy;
                //else if({SW8C,SW9C,SW10C})
                     //  begin
                 else  if(total_money >= drink_price)
                           ns=pay_ok;
                          else
                           ns=pay;   
                  end        
             /*     else if (total_money >= drink_price)
                  
                      ns=pay_ok;
                  else 
                      ns=pay;  
               end */
            pay_ok:
               begin
                 if  (SW[17])
                      ns=no_buy;
                 else if (SW[16])
                      ns=deal_ok;
                 else  
                      ns=pay_ok;
                end
           deal_ok:
                begin
                 if  (SW[17])
                     ns=no_buy;
                 else if(SW[15])
                     ns=idle;
                 else
                     ns=deal_ok;
                 end
           no_buy:
                 begin
                   if (SW[15]) 
                     ns=idle;
                   else
                     ns=no_buy;
                 end
           default:
                     ns=cs;
          endcase
   end
///////////////// //////////////  
   always@(posedge CLOCK_50 or negedge KEY)
   begin
     if (!KEY)
        begin
        drink_price  <=0;
        total_money  <=0;
        return_money <=0;
        LEDG[0]      <=0;
        LEDG [7]     <=0;
        end
        
     else 
      begin
       case(cs)
        idle:  begin
                drink_price  <=drink_price_temp;
                total_money  <=0;
                return_money <=0;
                LEDG[0]      <=0;
                LEDG[7]      <=0; 
                end  
                  
        pay:  begin
                
                total_money  <= total_money_temp;        
               end
             
        pay_ok: begin
                return_money <=total_money-drink_price;
                LEDG[0]<=1;
                end
                
        deal_ok:
                LEDG[7]<=1;

        no_buy:
                return_money<=total_money;
        default:begin
                total_money  =0;
                return_money =0;
                drink_price  =0;
                LEDG[0]      =0;
                LEDG[7]      =0; 
       
                end                  
         endcase
       end
       
    end
 ////////////////////////////////////////////////////////////       
   
   
 
 //////////////choose drink type serve for idle/////////////  
  always@(*)
      begin
        if (!KEY)
            drink_price_temp   = 0;
        else if(SW0C)
            drink_price_temp   = 10;
        else if(SW1C)
            drink_price_temp   = 14;
        else if(SW2C)
            drink_price_temp   = 20;     
        else
            drink_price_temp   = 0;           
       end
     
/////////////input money and calculate the total_money***************//
 // always@({SW8C,SW9C,SW10C})
 always@(posedge CLOCK_50 or negedge KEY)
    begin
        if(!KEY)
            total_money_temp <= 0; 
         else if(SW8C) 
            total_money_temp <= total_money_temp+1;
         else if(SW9C) 
            total_money_temp <= total_money_temp+5;
         else if(SW10C) 
            total_money_temp <= total_money_temp+10;
         else
          
            total_money_temp <= total_money_temp;
         
      end 
      
  
//////////////////////////////////////////return money///////////////////////////
   /*always@(posedge CLOCK_50 or negedge KEY[1])
     begin
        if (!KEY[1])
          return_money_temp = 0;
        else if(total_money_temp>=drink_price_temp)
               return_money_temp = total_money_temp-drink_price_temp;
        else
               return_money_temp = 0;  
    end*/
/////////////////////////////////////// return the number of 1 yuan,5 jiao, 1 jiao//////////////////////////////// 
  always@(return_money)
      begin
        if (!KEY)
          begin
            return_yiyuan_number    = 0; 
            return_fivejiao_number  =  0;
            return_yijiao_number    =  0;
          end 
       else  if(return_money>=0) 
             begin
               return_yiyuan_number    =  return_money/10; 
               return_fivejiao_number  =  (return_money%10)/5;
               return_yijiao_number    =  (return_money%10)%5;
            end
        else
             begin
               return_yiyuan_number    = 0; 
               return_fivejiao_number  = 0;
               return_yijiao_number    = 0;
             end
          end   
  
/////////////////////////////display in shumaguan////////////////////
  always@(total_money)
   begin
    tmge  = total_money%10;
    tmshi = total_money/10;
   end 
 always@(drink_price)
   begin
    dmge  = drink_price%10;
    dmshi = drink_price/10;
   end
   // fenpin     clk_fenpin(CLOCK_50,KEY[1],CLKF);  
    leddisplay dpm1(dmshi,HEX7);
    leddisplay dpm2(dmge,HEX6);
    leddisplay tm1(tmshi,HEX5);
    leddisplay tm2(tmge,HEX4);
    leddisplay current_state (cs,HEX3); 
    leddisplay ryyn(return_yiyuan_number,HEX2);
    leddisplay rwjn(return_fivejiao_number,HEX1);
    leddisplay ryjn(return_yijiao_number,HEX0);
endmodule
          
          
       
   

               
           
          
        
         
  
  