`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:51:53 01/31/2025 
// Design Name: 
// Module Name:    non_restoring_division_module 
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
module non_restoring_division_module(
    input [4:0] D,
    input [1:0] d,
    output reg [4:0]q,
    output reg [4:0]rem
    );
	
	reg signed [4:0]A,Q;
	reg signed [4:0]d1;
	
	integer i;
	always@(*)begin
	A=4'b0;
	Q=D;
	d1={3'b000,d};
		for(i=0;i<5;i=i+1)begin
			if(A[4]==0) begin
				A={A[3:0],Q[4]};
				Q={Q[3:0],1'b0};
				
				A=A-d1;
			end
			else begin
				A={A[3:0],Q[4]};
				Q={Q[3:0],1'b0};
				
				A=A+d1;
			end
		
			if(A[4]==0)begin
				Q[0]=1;
			end
			else begin
				Q[0]=0;
			end
			
		end
		
		if(A[4]==1) begin
			A=A+d;
		end
		
		q=Q;
		rem=A;
		
	end
				
endmodule
