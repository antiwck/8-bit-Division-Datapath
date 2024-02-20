module Division_tb;

reg  clk, start, load, shift, out;
reg  [7:0] divisor, dividend;
wire e;
wire [7:0] remainder, quotient;
wire [7:0] result_remainder, result_quotient;

Division div(
	.clk(clk),
	.start(start),
	.load(load),
	.shift(shift),
	.out(out),
	.divisor(divisor),
	.dividend(dividend),
	.e(e),
	.quotient(quotient),
	.remainder(remainder),
	.result_remainder(result_remainder),
	.result_quotient(result_quotient)
);


// Clock process
initial begin
	forever begin
		clk <= 0;
		#5000;
		clk <= 1;
		#5000;
	end
end 

// Start process
initial begin
	forever begin
		start <= 1;
		#10000;
		start <= 0;
		#250000;
	end
end

// Out process
initial begin
	forever begin
		out <= 0;
		#250000;
		out <= 1;
		#10000;
	end
end

// Load process
initial begin
	forever begin
		load <= 0;
		#20000;
		load <= 1;
		#20000;
		load <= 0;
		#10000;
		load <= 1;
		#20000;
		load <= 0;
		#10000;
		load <= 1;
		#20000;
		load <= 0;
		#10000;
		load <= 1;
		#20000;
		load <= 0;
		#10000;
		load <= 1;
		#20000;
		load <= 0;
		#10000;
		load <= 1;
		#20000;
		load <= 0;
		#10000;
		load <= 1;
		#20000;
		load <= 0;
		#10000;
		load <= 1;
		#20000;
		load <= 0;
		#10000;
	end
end

// Shift process
initial begin
	forever begin
		shift <= 0;
		#10000;
		shift <= 1;
		#10000;
		shift <= 0;
		#20000;
		shift <= 1;
		#10000;
		shift <= 0;
		#20000;
		shift <= 1;
		#10000;
		shift <= 0;
		#20000;
		shift <= 1;
		#10000;
		shift <= 0;
		#20000;
		shift <= 1;
		#10000;
		shift <= 0;
		#20000;
		shift <= 1;
		#10000;
		shift <= 0;
		#20000;
		shift <= 1;
		#10000;
		shift <= 0;
		#20000;
		shift <= 1;
		#10000;
		shift <= 0;
		#30000;
	end
end

// Test input
initial begin
	forever begin
		dividend = 7;
		divisor 	= 2;
		# 260000;
		dividend = 2;
		divisor 	= 2;
		# 260000;
		dividend = 8;
		divisor 	= 10;
		# 260000;
		# 260000;
		dividend = 32;
		divisor 	= 4;
		# 260000;
		dividend = 66;
		divisor 	= 5;
		# 260000;
	end
end

endmodule
