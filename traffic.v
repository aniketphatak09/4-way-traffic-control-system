module traffic ( clk, reset, s1_g, s1_r, s1_y,s2_g, s2_r, s2_y,s3_g, s3_r, s3_y,s4_g, s4_r, s4_y, P1, P2,P3, P4,clk_out );
input clk;
input reset;

reg [2:0] state,nextstate;
reg [4:0] count;
reg [26:0] q;
 
  output clk_out;
  
output  reg s1_r;
output  reg s1_g;
output  reg s1_y;
output  reg s2_r;
output  reg s2_g;
output  reg s2_y;
output  reg s3_r;
output  reg s3_g;
output  reg s3_y;
output  reg s4_r;
output  reg s4_g;
output  reg s4_y;
output  reg P1;
output  reg P2;
output  reg P3;
output  reg P4;




parameter s0= 3'b000;

parameter s1= 3'b001;

parameter s2= 3'b010;
 
parameter s3= 3'b011;

parameter s4= 3'b100;

parameter s5= 3'b101;

parameter s6= 3'b111;
  
  assign clk_out =q[26];
  
always @ (posedge clk_out or posedge reset )
        begin 
        if(reset)
        begin 
        count<=0;
        state <= 0;
        end
        else 
        begin
        count<= count+1;
        state <= nextstate;
        end
        end
always @ (*) begin

case(state)
default: begin
         nextstate = s0;
            end 
      s0:
			begin 
				if (count==1)
				nextstate = s1;
				else nextstate = s0;
         end
     
      
      s1: 
			begin
				if (count==3)
				nextstate =s2;
				else nextstate =s1;
			end
      
      
       s2: 
      begin
     if (count==11)
      nextstate =s3;
    else
    nextstate =s2;
    end
      
      
       s3: 
      begin
     if (count==13)
      nextstate =s4;
    else
    nextstate =s3;
    end
    
    
       s4: 
      begin
     if (count==21)
      nextstate =s5;
    else
    nextstate =s4;
    end
    
    
        s5: 
        begin
      if (count==23)
       nextstate = s6;
       else
       nextstate = s5;
        end
    
         s6: 
         begin
         if (count==31)
         nextstate=s1;
         else
         nextstate =s6;
         end
    
endcase
end    
    
always @ (posedge clk)

begin 
  
case(state) 

  s0:begin
  s1_r<=1'b1;s2_r<=1'b1;s3_r<=1'b1;s4_r<=1'b1;
  s1_g<=1'b0;s2_g<=1'b0;s3_g<=1'b0;s4_g<=1'b0;
  s1_y<=1'b0;s2_y<=1'b0;s3_y<=1'b0;s4_y<=1'b0;
  P1<=1'b1; P2<=1'b1; P3<=1'b1; P4<=1'b1;
   end
        
   s1:begin
   s1_r<=1'b0;s2_r<=1'b1;s3_r<=1'b1;s4_r<=1'b1;
   s1_g<=1'b1;s2_g<=1'b0;s3_g<=1'b0;s4_g<=1'b0;
   s1_y<=1'b0;s2_y<=1'b0;s3_y<=1'b0;s4_y<=1'b0;
   P1<=1'b1; P2<=1'b0; P3<=1'b0; P4<=1'b0;
     end
        
    s2:begin
   s1_r<=1'b0;s2_r<=1'b0;s3_r<=1'b1;s4_r<=1'b1;
   s1_g<=1'b1;s2_g<=1'b1;s3_g<=1'b0;s4_g<=1'b0;
   s1_y<=1'b0;s2_y<=1'b0;s3_y<=1'b0;s4_y<=1'b0;
   P1<=1'b1; P2<=1'b1; P3<=1'b0; P4<=1'b0;
    end
        
      s3:begin
   s1_r<=1'b0;s2_r<=1'b0;s3_r<=1'b1;s4_r<=1'b1;
   s1_g<=1'b0;s2_g<=1'b0;s3_g<=1'b0;s4_g<=1'b0;
   s1_y<=1'b1;s2_y<=1'b1;s3_y<=1'b0;s4_y<=1'b0;
   P1<=1'b0; P2<=1'b1; P3<=1'b1; P4<=1'b0;
      end
      
           s4:begin
   s1_r<=1'b1;s2_r<=1'b1;s3_r<=1'b0;s4_r<=1'b0;
   s1_g<=1'b0;s2_g<=1'b0;s3_g<=1'b1;s4_g<=1'b1;
   s1_y<=1'b0;s2_y<=1'b0;s3_y<=1'b0;s4_y<=1'b0;
  
   P1<=1'b1; P2<=1'b1; P3<=1'b0; P4<=1'b0;
      end
      
      
     s5:begin
    s1_r<=1'b1;s2_r<=1'b1;s3_r<=1'b0;s4_r<=1'b0;
    s1_g<=1'b0;s2_g<=1'b0;s3_g<=1'b0;s4_g<=1'b0;
    s1_y<=1'b0;s2_y<=1'b0;s3_y<=1'b1;s4_y<=1'b1;
    P1<=1'b1; P2<=1'b1; P3<=1'b0; P4<=1'b0; 
       end
        
       s6:begin
    s1_r<=1'b1;s2_r<=1'b1;s3_r<=1'b1;s4_r<=1'b1;
    s1_g<=1'b0;s2_g<=1'b0;s3_g<=1'b0;s4_g<=1'b0;
    s1_y<=1'b0;s2_y<=1'b0;s3_y<=1'b0;s4_y<=1'b0;
    P1<=1'b1; P2<=1'b1; P3<=1'b1; P4<=1'b1; 
   end
      
endcase
 
end
    
always @(posedge clk or posedge reset) 
begin
	if (reset)
		q<=0;
	else 
		q<=q+1;
end

endmodule
	 
	 
//module clk_div (clk,rst,clk_out);
//input clk;
//input rst;
//output clk_out;
//
//reg [26:0] q;
//
//assign clk_out =q[26];
//
//always @(posedge clk or posedge rst) begin
//	if (rst)
//		q<=0;
//	else 
//		q<=q+1;
//end
//
//endmodule
//endmodule



