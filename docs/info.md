<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Overview

The carry-skip adder (CSA) is an optimized version of a ripple-carry adder. It reduces the delay caused by carry propagation by introducing carry-skip logic. This approach divides the input bits into smaller blocks, allowing the carry to "skip" over blocks that do not need propagation, thereby improving the overall performance.

Working Principle

Generate (G) and Propagate (P) Signals:

G[i] = A[i] & B[i] (Generate signal: when both bits are 1, carry is generated).

P[i] = A[i] ^ B[i] (Propagate signal: when bits differ, carry is propagated).

Block-wise Carry Calculation:

The input bits are divided into smaller blocks (e.g., two 4-bit blocks for an 8-bit design).

Each block computes the carry-out using the generate and propagate signals.

If a carry does not propagate through an entire block, the skip logic bypasses intermediate calculations, reducing delay.

Final Sum and Carry-Out:

The sum is calculated as Sum[i] = P[i] ^ Carry[i-1].

The final carry-out is determined from the last block.

Design Features

Modularity: The design is divided into logical blocks, making it easy to scale.

Efficiency: By skipping unnecessary carry propagation, delay is reduced.

Versatility: The design can adapt to different block sizes for performance optimization.

## How to test

Tests Workflow Outputs

Testbench Details

The testbench verifies the adder functionality through:

Basic Tests: Validating simple additions (e.g., 0x03 + 0x05).

Boundary Cases: Checking edge cases like all 1s or 0s.

Carry-Skip Scenarios: Stress-testing the skip mechanism.

Randomized Tests: Using 1000 random test cases for robustness.

Test Results

tb.vcd Artifact: The waveform file generated from simulation will demonstrate:

Input signals (A, B, Cin).

Intermediate signals (G, P, carry-out).

Output signals (Sum, Cout).

Simulation Status and Images:

Screenshots of waveforms to highlight carry-skip efficiency.

## External hardware

List external hardware used in your project (e.g. PMOD, LED display, etc), if any
