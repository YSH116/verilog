module CLA_4bit(A, B, Cin, S, Cout);
	
	parameter n = 4;
	input [n - 1: 0] A, B;
	input Cin;
	
	output [n - 1: 0] S;
	output Cout;

	wire [3:0] G,P,C;
	
	//Generate function
  	assign G = A & B;
  	//Propagate
  	assign P = A ^ B;
  	//Computation of carry bits
  	assign C[0] = Cin;
  	assign C[1] = G[0] | (P[0] & C[0]);
  	assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
  	assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
  	//Compute Cout and S
  	assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
  	assign S = P ^ C;

endmodule

module Adder_16bit(A, B, Cin, S, Cout);

	parameter n = 16;
	parameter m = 4;

	input [n - 1: 0] A, B;
	input Cin;
	
	output [n - 1: 0] S;
	output Cout;
	
	//Please refer to P32 of slides.
	wire C4, C8, C12;
	wire [m - 1: 0] S0_3, S4_7, S8_11, S12_15;
	// assign S = 
	
	CLA_4bit cla0(A[3:0], B[3:0], Cin, S0_3, C4);
	CLA_4bit cla1(A[7:4], B[7:4], C4, S4_7, C8);
	CLA_4bit cla2(A[11:8], B[11:8], C8, S8_11, C12);
	CLA_4bit cla3(A[15:12], B[15:12], C12, S12_15, Cout);
	
endmodule

module ALU(A, B, Cin, Mode, Y, Cout, Overflow);

	//Initialize the parameter.
	parameter n = 16;
	parameter m = 4;
	
	//Declare inputs.
	input [n - 1: 0] A, B;
	input Cin;
	input [m - 1: 0] Mode;	
	
	//Declare outputs.
	output reg [n - 1: 0] Y;
	output reg Cout;
	output reg Overflow;
	
	//You can add whatever wire or reg variables if you want.
	
	always@(*)begin
		case(Mode)
			//Logical shift A left by 1-bit.
			4'd0: begin
				Y = A << 1’b1;
			end
			//Arithmetic shift A left by 1-bit.
			4'd1: begin
			end
			//Logical shift A right by 1-bit.
			4'd2: begin
			end
			//Arithmetic shift A right by 1-bit.
			4'd3: begin
			end
			//Add two numbers with cla.
			//Don't forget the Cout and Overflow.
			//Make use of CLA_16bit module.
			4'd4: begin
			end
			//Subtract B from A.
			//Don't forget the Cout and Overflow.
			//Make use of CLA_16bit module.
			4'd5: begin
			end
			//and
			4'd6: begin
			end
			//or
			4'd7: begin
			end
			//not A
			4'd8: begin
			end
			//xor
			4'd9: begin
			end
			//xnor
			4'd10: begin
			end
			//nor
			4'd11: begin
			end
			//binary to one-hot
			4'd12: begin
			end
			//A
			4'd13: begin
			end
			//B
			4'd14: begin
			end
			//find first one from left
			4'd15: begin
			end
			//default is necessary
			default: begin
			end
		endcase
	end
	
endmodule


















