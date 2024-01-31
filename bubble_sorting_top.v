`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/29 13:20:46
// Design Name: 
// Module Name: bubble_sorting_top
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


//module bubble_sorting_top#(parameter input_num = 7)
module bubble_sorting_top
(
    input clk,
    input rst,
    input [8*input_num-1:0]data_in,
    input cks_in,
    output [8*input_num-1:0]data_out,
    output [input_num:0]cks_out
    );
wire [8*input_num-1:0] dout[input_num:0];
wire cks[input_num:0];
wire [8*input_num-1:0]din[input_num:0];
parameter input_num=8;
//wire cks_out[input_num:0];
assign data_out = dout[input_num];
assign din[0] = data_in;
assign cks[0] = cks_in;

genvar i;
generate
    for(i=0; i<input_num+1; i=i+1) begin
        bubble_sorting
        #(.input_num(input_num))
        bs
        (
            .clk(clk),
            .rst(rst),
            .cks(cks[i]),
            .din(din[i]),
            .dout(dout[i]),
            .cks_out(cks_out[i])
        );
    end

    for(i=0; i<input_num; i=i+1) begin
        assign din[i+1] = dout[i];
        assign cks[i+1] = cks_out[i];
    end
endgenerate
endmodule
