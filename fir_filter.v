`timescale 1ns / 1ps
module fir_filter(input_data,CLK,RST,ENABLE,output_data,sampleT);
//fir coef
parameter N1=8;
//input data word width
parameter N2=16;
//output data word width
parameter N3=32;

// this array is used to store the coef = 0.125 in binary
wire signed [N1-1:0] b[0:7];

assign b[0]=8'b00010000;
assign b[1]=8'b00010000;
assign b[2]=8'b00010000;
assign b[3]=8'b00010000;
assign b[4]=8'b00010000;
assign b[5]=8'b00010000;
assign b[6]=8'b00010000;
assign b[7]=8'b00010000;
// creating inputs,wires and outputs for the module
input signed [N2-1:0] input_data;
output signed [N2-1:0] sampleT;
input CLK;
input RST;
input ENABLE;
output signed [N3-1:0] output_data;

reg signed [N3-1:0] output_data_reg;
reg signed [N2-1:0] samples[0:6];
//herer we implement the fir filter function if reset is 1 then all the smaples are directly made 0
  //else if enable is 1 and reset is 0 we implement the assignment
always @(posedge CLK)begin
    if(RST==1'b1)begin
        samples[0]<=0;
        samples[1]<=0;
        samples[2]<=0;
        samples[3]<=0;
        samples[4]<=0;
        samples[5]<=0;
        samples[6]<=0;
        samples[7]<=0;
        output_data_reg<=0; 
        end
    if(ENABLE==1'b1&& RST==1'b0)begin
        output_data_reg<=b[0]*input_data
            +b[1]*samples[0]
            +b[2]*samples[1]
            +b[3]*samples[2]
            +b[4]*samples[3]
            +b[5]*samples[4]
            +b[6]*samples[5]
            +b[7]*samples[6];
        samples[0]<=input_data;
        samples[1]<=samples[0];
        samples[2]<=samples[1];
        samples[3]<=samples[2];
        samples[4]<=samples[3];
        samples[5]<=samples[4];
        samples[6]<=samples[5];
        samples[7]<=samples[6];
        end
end
  //updating the output and sampleT
assign output_data=output_data_reg;
assign sampleT=samples[0];        
endmodule
