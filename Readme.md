# 8-bit Division
# The 8-bit division uses adder, registers and control to perform division between two 8-bit unsigned binary numbers.

The program is compiled in Intel Quartus Prime and run under the testbench to perform the functional computation.
The 8-bit division takes two 8-bit number in binary and divide the dividend by divisor to compute quotient and remainder.
The datapath consists of an 8-bit registers, a 17-bit shifter registers, an 8-bit adder and a control block.
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
  <img src="Sources/2. Control Signal.jpg"><br />
  Control Signal
</p>
<br />
Figure above shows that the division takes 260ns to complete.<br />
The clock is set at 5ns for low and high giving a total cycle duty of 10ns.<br /><br />

<br />
<p align="center">
  <img src="Sources/1. Circuit Design.jpg"><br />
  Datapath Design
</p>

<br />
<p align="center">
  <img src="Sources/3. Result 1.jpg"/><br />
  Result computation 1
</p>
First computation:<br />
Dividend  : 0000 0111 (7) <br />
Divisor   : 0000 0010 (2) <br />
Quotient  : 0000 0011 (3) <br />
Remainder : 0000 0001 (1) <br />
<br />

<br />
<p align="center">
  <img src="Sources/4. Result 2.jpg"/><br />
  Result computation 2
</p>
Second computation:<br />
Dividend  : 0000 0010 (2) <br />
Divisor   : 0000 0010 (2) <br />
Quotient  : 0000 0001 (1) <br />
Remainder : 0000 0000 (0) <br />
<br />

<br />
<p align="center">
  <img src="Sources/5. Result 3.jpg"/><br />
  Result computation 3
</p>
Third computation:<br />
Dividend  : 0000 1000 (8) <br />
Divisor   : 0000 1010 (10) <br />
Quotient  : 0000 0000 (0) <br />
Remainder : 0000 1000 (8) <br />
<br />

<br />
<p align="center">
  <img src="Sources/6. Result 4.jpg"/><br />
  Result computation 4
</p>
Fourth computation:<br />
Dividend  : 0010 0000 (32) <br />
Divisor   : 0000 0100 (4) <br />
Quotient  : 0000 1000 (8) <br />
Remainder : 0000 0000 (0) <br />
<br />

<br />
<p align="center">
  <img src="Sources/7. Result 5.jpg"/><br />
  Result computation 5
</p>
Fifth computation:<br />
Dividend  : 0000 0111 (66) <br />
Divisor   : 0000 0010 (5) <br />
Quotient  : 1000 0101 (13) <br />
Remainder : 0000 0001 (1) <br />
<br />
