# 8-bit Division
# The 8-bit division uses adder, registers and control to perform division between two 8-bit unsigned binary numbers.

The program is compiled in Intel Quartus Prime and run under the testbench to perform the functional computation.
The 8-bit division takes two 8-bit number in binary and divide the dividend by divisor to compute quotient and remainder.
The datapath consists of an 8-bit registers, one 17-bit shifter registers, 8-bit adder and control.
<br /><br />
The algorithm of the datapath is as below: <br />
<pre>
Remainder  = 0000 0000
Quotient   = Dividend
Divisor    = Divisor
E          = 0
counter    = 0
while (counter < 8) {
    shift left (E, Remainder, Quotient)
    E, Remainder = Remainder - Divisor
    If E = 1 {
        Quotient[0] = 1
    }
    Else {
        E, Remainder = Remainder + Divisor
        Quotient[0] = 0
    } 
    counter = counter + 1
}
Output Quotient and Remainder
</pre>
<br />
<p align="center">
  <img src="Sources/1. Circuit Design.jpg"><br />
  Timing Analysis
</p>
<br />
Figure above shows that the multiplication takes 140ns to complete.<br />
The clock is set at 5ns for low and high giving a total cycle duty of 10ns.<br />
The start signal will be high for 17.5ns and low for 122.5ns to enable the loading of value into the registers and allowing the 4-bit adder to compute with the preloaded zero setting.<br />
The load and shift will follow next where the load will continue to load the adder output into the registers and shift will shift the registers data to the right by one bit.<br />
For each subsequenct computation, there will be a clock edge before load to allow adder to perform the neccesary computation.<br />
The last clock edge will be used to indicate the computation has completed and result will be projected.<br />
<br />
The timing for the dataflow is controlled by a clock signal and the loading of register is dependent on the rising clock edge.
<br />
<br />
<p align="center">
  <img src="Sources/Datapath design.png"><br />
  Datapath Design
</p>

<br />
<p align="center">
  <img src="Sources/Result1.png"/><br />
  Result computation 1
</p>
<br />
First computation:<br />
First number  : 1101 (13)<br />
Second number : 1011 (11)<br />
Result        : 10001111 (143)<br />

<br />
<p align="center">
  <img src="Sources/Result2.png"/><br />
  Result computation 2
</p>
<br />
Second computation:<br />
First number  : 1100 (12)<br />
Second number : 1000 (8)<br />
Result        : 01100000 (96)<br />
<br />

<br />
<p align="center">
  <img src="Sources/Result3.png"/><br />
  Result computation 3
</p>
<br />
Third computation:<br />
First number  : 0110 (6)<br />
Second number : 1100 (12)<br />
Result        : 01001000 (72)<br />
<br />
