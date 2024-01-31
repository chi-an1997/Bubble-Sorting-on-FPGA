`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/24 10:03:55
// Design Name: 
// Module Name: bubble_sorting_tb
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


module bubble_sorting_tb();
reg clk;
reg rst;
reg [8*3-1:0]data_in;
reg cks_in;
wire cks[8:0];
//wire [8*7-1:0]din[7:0];
wire [8-1:0]dout_1;
wire [8-1:0]dout_2;
wire [8-1:0]dout_3;
wire [8-1:0]dout_4;
wire [8-1:0]dout_5;
wire [8-1:0]dout_6;
wire [8-1:0]dout_7;
wire [8-1:0]dout_8;
wire [8*3-1:0] data_out;
wire [8*3-1:0] dout[8:0];
wire [8:0]cks_out;
assign dout_1=data_out[7:0];
assign dout_2=data_out[15:8];
assign dout_3=data_out[23:16];
assign dout_4=data_out[31:24];
assign dout_5=data_out[39:32];
assign dout_6=data_out[47:40];
assign dout_7=data_out[55:48];
assign dout_8=data_out[63:56];
//parameter input_num = 7;

bubble_sorting_top 
#(.input_num(3))
bst
(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .cks_in(cks_in),
    .data_out(data_out),
    .cks_out(cks_out)
);

initial begin
    clk=0;
    rst=0;
    #10
    rst=1;
    //#20
    //in_valid = 1;
    #10
    rst=0;
    #10
    //data_in={8'd185, 8'd99, 8'd225, 8'd7, 8'd39, 8'd20, 8'd116, 8'd55};
    data_in={8'd185, 8'd99, 8'd225};
    cks_in=1'b0;
end

always #10 clk=~clk;

endmodule
