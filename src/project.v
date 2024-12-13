/*
 * Copyright (c) 2024 Temiloluwa Omomuwasan
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// 8-bit Carry-Skip Adder Design

module carry_skip_adder(
    input [7:0] A,   // 8-bit input A
    input [7:0] B,   // 8-bit input B
    input Cin,       // Carry input
    output [7:0] Sum, // 8-bit Sum
    output Cout       // Carry output
);
    wire [7:0] P, G; // Propagate and Generate signals
    wire [2:0] C;    // Intermediate carry signals

    // Generate and Propagate signals
    assign P = A ^ B; // Propagate: A XOR B
    assign G = A & B; // Generate: A AND B

    // Block-wise carry calculation (4-bit blocks)
    assign C[0] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
    assign C[1] = G[7] | (P[7] & G[6]) | (P[7] & P[6] & G[5]) | (P[7] & P[6] & P[5] & G[4]) | (P[7] & P[6] & P[5] & P[4] & C[0]);

    // Final carry out
    assign Cout = C[1];

    // Sum calculation
    assign Sum = P ^ {C[0], C[0], C[0], C[0], C[0], C[0], C[0], Cin};
endmodule
