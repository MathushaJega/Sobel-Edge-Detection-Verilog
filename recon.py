import numpy as np
import cv2
import os

# Get the directory where the script is located
script_dir = os.path.dirname(__file__)
file_path = os.path.join(script_dir, 'output_edge.txt')

try:
    with open(file_path, 'r') as f:
        # This handles the decimal numbers in your file
        pixels = [int(line.strip()) for line in f if line.strip()]

    pixel_array = np.array(pixels, dtype=np.uint8)

    # CHANGE: Use 98x98 because the 3x3 kernel reduces the border
    if len(pixel_array) == 9604:
        image_reconstructed = pixel_array.reshape((98, 98))
        cv2.imwrite(os.path.join(script_dir, 'verilog_reconstructed.png'), image_reconstructed)
        print("Success: verilog_reconstructed.png created (98x98)!")
    else:
        print(f"Error: Unexpected data size {len(pixel_array)}")

except Exception as e:
    print(f"An error occurred: {e}")