# Sobel Edge Detection Filter (Verilog HDL)

This project implements a **Sobel Edge Detection Filter** using **Verilog HDL**, designed for FPGA-based image processing. It demonstrates a complete hardware design flow—from high-level algorithm benchmarking in Python to RTL simulation and output verification in Xilinx Vivado.

## Project Overview

The system processes a  grayscale image by applying a  sliding window convolution. By calculating the horizontal () and vertical () gradients, the hardware identifies intensity changes in the pixel data to extract the edges of the input image.

## Features

* **Hardware-Based Convolution:** Efficiently implements  Sobel kernels ( and ) in Verilog.
* **High-Level Verification:** Includes a Python "Golden Model" to generate reference benchmarks and verify hardware accuracy.
* **Data Reconstruction:** Provides Python scripts to convert raw Verilog simulation data back into visual images for proof of functionality.
* **Optimized Logic:** Features thresholding and gradient magnitude approximation suitable for real-time digital systems.

## Project Workflow

1. **Pre-processing:** A Python script converts a standard image into a grayscale pixel matrix (`image_data.txt`).
2. **Hardware Simulation:** The Verilog testbench streams pixel data into the Sobel module within the **Vivado Design Suite**.
3. **Data Extraction:** The simulation generates an `output_edge.txt` file containing the edge-detected pixel values.
4. **Post-processing:** A reconstruction script validates the hardware output by rendering the final edge-detected image.

## Tools Used

* **Verilog HDL:** For the core Sobel filter logic and testbench.
* **Xilinx Vivado:** For behavioral simulation and waveform analysis.
* **Python (OpenCV/NumPy/Matplotlib):** For image-to-text conversion, benchmark generation, and visual reconstruction.

