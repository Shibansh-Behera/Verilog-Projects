`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:23:17 04/04/2025 
// Design Name: 
// Module Name:    detect101_110 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module detect101_110(
    input x,
    input rst,
    input clk,
    output reg z
    );
	 localparam [1:0] reset=0, got1=1, got10=2,got11=3;
	 
	 reg [1:0] current;
	 reg [1:0] prev;
	 
	 initial begin
		 if(x) current=got1;
		 else current=reset;
	 end
	 
	 always@(posedge clk)begin
		 case(current)
				reset: begin
					prev=current;
					//current= x? got1:current;
					if (x==1)begin current=got1;z=1'b0;end
					else z=1'b0;
				end
				got1:begin
					prev=current;
					//current=x? got11:got10;
					if(x==1) begin  current=got11;z=1'b0;end
					else begin current=got10;z=1'b0; end
				end
				got10:begin
					prev=current;
					//current=x? got1:reset;
					if(x==1)begin current=got1;z=1'b1;end
					else begin current=reset;z=1'b0; end
				end
				got11:begin
					prev=current;
					//current=x? current:reset;
					if (x==1)begin current=current;z=1'b0; end
					else begin current=got10; z=1'b1;end
				end
		 endcase
		 //z=((current==got1)&&(prev==got10))||((current==reset)&&(prev==got11))? 1:0;
		 //if((current==got1)&&(prev==got10))z=1;
		 //else if((current==reset)&&(prev==got11))z=1;
		 //else z=0;
		 
	 end
	 
endmodule
