# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

# Python Script to Generate Verilog Test Cases for an 8-bit Carry-Skip Adder

import random

def generate_test_cases(filename, num_cases=1000):
    """
    Generates test cases for the 8-bit carry-skip adder and writes them to a file.
    :param filename: Name of the file to write the test cases.
    :param num_cases: Number of random test cases to generate.
    """
    with open(filename, 'w') as f:
        f.write("// Auto-generated test cases for 8-bit Carry-Skip Adder\n")
        f.write("module carry_skip_adder_tb;\n")
        f.write("    reg [7:0] A, B;\n")
        f.write("    reg Cin;\n")
        f.write("    wire [7:0] Sum;\n")
        f.write("    wire Cout;\n")
        f.write("\n")
        f.write("    carry_skip_adder uut (\n")
        f.write("        .A(A),\n")
        f.write("        .B(B),\n")
        f.write("        .Cin(Cin),\n")
        f.write("        .Sum(Sum),\n")
        f.write("        .Cout(Cout)\n")
        f.write("    );\n")
        f.write("\n")
        f.write("    initial begin\n")
        
        for _ in range(num_cases):
            A = random.randint(0, 255)
            B = random.randint(0, 255)
            Cin = random.randint(0, 1)
            f.write(f"        A = 8'b{A:08b}; B = 8'b{B:08b}; Cin = {Cin}; #10;\n")
            f.write(f"        $display(\"A: %b, B: %b, Cin: %b, Sum: %b, Cout: %b\", A, B, Cin, Sum, Cout);\n")
        
        f.write("        $finish;\n")
        f.write("    end\n")
        f.write("endmodule\n")

# Generate 1000 test cases in a Verilog testbench file
generate_test_cases("carry_skip_adder_tb.v", num_cases=1000)

