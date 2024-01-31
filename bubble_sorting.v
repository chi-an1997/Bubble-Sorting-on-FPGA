`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/23 14:50:04
// Design Name: 
// Module Name: bubble_sorting
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bubble_sorting
#(parameter input_num = 4)
(
input clk,
input rst,
input cks,
input [input_num*8-1:0]din,
output reg [input_num*8-1:0]dout,
output reg cks_out
    );
//parameter input_num = 4;
integer i;
reg [input_num*8-1:0]data_in;

always@(posedge clk) begin
    if(rst) begin
        data_in <= 0;
        dout <=0;
    end
    else begin
        data_in <= din;
    end
end

always@(posedge clk) begin
cks_out= cks+1'b1;
if(input_num[0]==1) begin
    if(cks==0) begin
        for(i=input_num-1; i>1; i=i-2) begin
                dout[8*i+:8] <= (data_in[8*i+:8] > data_in[8*(i-1)+:8]) ? data_in[8*(i-1)+:8] : data_in[8*i+:8];
                dout[8*(i-1)+:8] <= (data_in[8*i+:8] > data_in[8*(i-1)+:8]) ? data_in[8*i+:8] : data_in[8*(i-1)+:8];
                dout[7:0] <= data_in[7:0];
        end
    end
    else if(cks==1) begin
        for(i=input_num-2; i>0; i=i-2) begin
                dout[8*i+:8] <= (data_in[8*i+:8] > data_in[8*(i-1)+:8]) ? data_in[8*(i-1)+:8] : data_in[8*i+:8];
                dout[8*(i-1)+:8] <= (data_in[8*i+:8] > data_in[8*(i-1)+:8]) ? data_in[8*i+:8] : data_in[8*(i-1)+:8];
                dout[8*input_num-1:8*(input_num-1)] <= data_in[8*input_num-1:8*(input_num-1)];
        end
    end
end
else begin
    if(cks==0) begin
        for(i=input_num-1; i>0; i=i-2) begin
                dout[8*i+:8] <= (data_in[8*i+:8] > data_in[8*(i-1)+:8]) ? data_in[8*(i-1)+:8] : data_in[8*i+:8];
                dout[8*(i-1)+:8] <= (data_in[8*i+:8] > data_in[8*(i-1)+:8]) ? data_in[8*i+:8] : data_in[8*(i-1)+:8];
        end
        
    end
    else if(cks==1) begin
        for(i=input_num-2; i>1; i=i-2) begin
                dout[8*i+:8] <= (data_in[8*i+:8] > data_in[8*(i-1)+:8]) ? data_in[8*(i-1)+:8] : data_in[8*i+:8];
                dout[8*(i-1)+:8] <= (data_in[8*i+:8] > data_in[8*(i-1)+:8]) ? data_in[8*i+:8] : data_in[8*(i-1)+:8];
                dout[7:0] <= data_in[7:0];
                dout[8*input_num-1:8*(input_num-1)] <= data_in[8*input_num-1:8*(input_num-1)];
        end
    end
end
end
endmodule
