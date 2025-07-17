`timescale 1ns / 1ps



module textbench;
//fir coef
parameter N1=8;
//input data word width
parameter N2=16;
//output data word width
parameter N3=32;
reg[N2-1:0] input_data;

reg CLK;
reg RST;
reg ENABLE;
reg [N2-1:0] data[99:0];
wire [N3-1:0] output_data;
wire [N2-1:0] sampleT;  
//calling the module 
fir_filter UUT(.input_data(input_data),
                .output_data(output_data),
                .CLK(CLK),
                .RST(RST),
                .ENABLE(ENABLE),
                .sampleT(sampleT));
 integer k;
 
 integer FILE1;
 //assiging clock
 always #10 CLK=~CLK;
 initial 
 begin
    k=0;
   //reading inout data 
    $readmemb("input.data",data);
    //creating variable for saving output later
    FILE1=$fopen("save.data","w");
    
    CLK=0;
    #20
    
    RST=1'b1;
    #40
    RST=1'b0;
    ENABLE=1'b1;
  
    input_data<=data[0];
    k=1;

end    

      always @(posedge CLK) begin
        //if k crosses all the inputs which is 100 then stop or else just keep on assigning each line of data to input_data every positive edge of the cycle
            if(k < 100)begin
                input_data<=data[k];
                k <= k+1;end
                
            if(k == 100)begin
                $fclose(FILE1);end
                
            $fwrite(FILE1, "%b\n", output_data);end

endmodule
