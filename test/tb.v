`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
// Testbench for Carry-Skip Adder
module tb;
    reg [7:0] A, B;
    reg Cin;
    wire [7:0] Sum;
    wire Cout;

    carry_skip_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Test cases
        $display("Time\t A\t B\t Cin\t Sum\t Cout");

        A = 8'b00000001; B = 8'b00000001; Cin = 0; #10;
        $display("%d\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, Sum, Cout);

        A = 8'b11111111; B = 8'b00000001; Cin = 0; #10;
        $display("%d\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, Sum, Cout);

        A = 8'b10101010; B = 8'b01010101; Cin = 1; #10;
        $display("%d\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, Sum, Cout);

        A = 8'b11111111; B = 8'b11111111; Cin = 1; #10;
        $display("%d\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, Sum, Cout);

        $finish;
    end
endmodule
