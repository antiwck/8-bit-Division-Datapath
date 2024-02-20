// For divisor
module divisorReg #(parameter n = 8) (
	input start, clk, e, sub,
	input [n-1:0] divis,
	output [n-1:0] ndivis
);

reg [n-1:0] Reg;

always @(posedge clk) begin
	if (start) begin
		Reg <= ~divis + 1;
	end
	else if (sub) begin
		Reg <= ~divis + 1;
	end 
	else if (e) begin
		Reg <= ~divis + 1;
	end 
	else begin
		Reg <= divis;
	end
end

assign ndivis = Reg[n-1:0];

endmodule

//-------------------------------------------------------------------------
// For dividend
module dividendReg #(parameter n = 8) (
	input start, load, shift, clk,
	input [n-1:0] divid, sum,
	input carryIn,
	output e,
	output [n-1:0] remainder, quotient
);

reg [n*2:0] Reg;

always @(posedge clk) begin
	if (start) begin
		Reg <= {{n+1{1'b0}}, divid};
	end
	else if (load) begin
		if (e) begin
			Reg <= {Reg[n*2-1:1], 1'b1};
		end
		else begin
			Reg <= {carryIn, sum, Reg[n-1:1], 1'b0};
		end
	end
	else if (shift) begin
		Reg <= {Reg[n*2-1:0], 1'b0};
	end
end

assign e				= Reg[n*2];
assign remainder 	= Reg[n*2-1:n];
assign quotient 	= Reg[n-1:0];

endmodule

//-------------------------------------------------------------------------
// For addition
module fullAdder #(parameter n = 8) (
	input [n-1:0] a, b,
	output carryOut,
	output [n-1:0] sum
);
reg [n-1:0] sumReg, carryReg;

always @* begin
	sumReg = a + b;
	carryReg = ((a[7] & b[7]) | (b[7] & ~sum[7]) | (a[7] & ~sum[7])) ? 1 : 0;
end
	
assign sum = sumReg;
assign carryOut = carryReg;

endmodule


//-------------------------------------------------------------------------
// Division Datapath
module Division #(parameter n = 8) (
	input clk, start, load, shift, out,
	input [n-1:0] divisor, dividend,
	output e,
	output [n-1:0] quotient, remainder,
	output [n-1:0] result_remainder, result_quotient
);

wire [n-1:0] line1, line2, line3, line5;
wire line4, line6;
wire [n-1:0] lineTmp1, lineTmp2, lineTmp3;
wire lineTmp4, lineTmp6;
reg  [n-1:0] result_remaind, result_quo;


divisorReg dvsr(
	.start(start),
	.clk(clk),
	.e(lineTmp6),
	.sub(shift),
	.divis(divisor),
	.ndivis(line1)
);

dividendReg dvdr(
	.start(start),
	.load(load),
	.shift(shift),
	.clk(clk),
	.divid(dividend),
	.sum(lineTmp2),
	.carryIn(lineTmp4),
	.e(line6),
	.remainder(line3),
	.quotient(line5)
);

fullAdder fa(
	.a(lineTmp1),
	.b(lineTmp3),
	.carryOut(line4),
	.sum(line2)
);

assign e 			= line6;
assign remainder 	= line3;
assign quotient	= line5;

assign lineTmp1 = line1;
assign lineTmp2 = line2;
assign lineTmp3 = line3;
assign lineTmp4 = line4;
assign lineTmp6 = line6;

always @* begin
	if (out) begin
		result_remaind = line3;
		result_quo = line5;
	end
	else begin
		result_remaind = {n{1'bz}};
		result_quo = {n{1'bz}};
	end
end


assign result_remainder = result_remaind;
assign result_quotient 	= result_quo;

endmodule
