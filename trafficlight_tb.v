`include "traffic.v"
module trafficlight_tb();

reg clk, reset;
wire s1_g, s1_r, s1_y, s2_g, s2_r, s2_y, s3_g, s3_r, s3_y, s4_g, s4_r, s4_y,  P1_r, P1_g, P2_r, P2_g, P3_r, P3_g, P4_r, P4_g;

traffic udp(.clk(clk), .reset(reset), .s1_g(s1_g), .s1_r(s1_r), .s1_y(s1_y), .s2_g(s2_g), .s2_r(s2_r), .s2_y(s2_y), .s3_g(s3_g), .s3_r(s3_r), .s3_y(s3_y),
           .s4_g(s4_g), .s4_r(s4_r), .s4_y(s4_y), .P1_r(P1_r), .P1_g(P1_g), .P2_r(P2_r), .P2_g(P2_g), .P3_r(P3_r), .P3_g(P3_g), .P4_r(P4_r), .P4_g(P4_g));

//traffic udp( clk, reset, s1_g, s1_r, s1_y, s2_g, s2_r, s2_y, s3_g, s3_r, s3_y, s4_g, s4_r, s4_y, P1_r, P1_g, P2_r, P2_g, P3_r, P3_g, P4_r, P4_g );

always #10 clk = ~clk;

initial begin
    
    $dumpfile("traffic.vcd");
    $dumpvars(0);
   /* clk = 1'b0;
    reset = 1'b0;
    forever #5 clk = ~ clk;*/
end

initial begin

$monitor("time=%g clk=%b reset=%b s1_g=%b s1_r=%b s1_y=%b s2_g=%b s2_r=%b s2_y=%b s3_g=%b s3_r=%b s3_y=%b s4_g=%b s4r=%b s4_y=%b P1_r=%b, P1_g=%b, P2_r=%b, P2_g=%b, P3_r=%b, P3_g=%b, P4_r=%b, P4_g=%b",clk,reset,s1_g, s1_r,s1_y,s2_g,s2_r, s2_y,s3_g, s3_r, s3_y,s4_g,s4_r,s4_y, P1_r, P1_g, P2_r, P2_g, P3_r, P3_g, P4_r, P4_g, $time);
 
        
        reset = 1'b0;
    #10 reset = 1'b1;
    #10 reset = 1'b0;
    
    
    
    #50 $finish;
end

endmodule
