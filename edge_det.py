import cv2
import numpy as np
horse = cv2.imread('horse.png', cv2.IMREAD_GRAYSCALE)
resized = cv2.resize(horse, (100, 100))
cv2.imshow("resized_image",resized)
cv2.waitKey(0)
with open('image_data.txt', 'w') as f:
    for row in resized:
        for pixel in row:
            f.write(f"{pixel:02x}\n")        
sobelx = cv2.Sobel(resized, cv2.CV_64F, 1, 0, ksize=3)
sobely = cv2.Sobel(resized, cv2.CV_64F, 0, 1, ksize=3)   
sobel_combined = np.sqrt(sobelx**2 + sobely**2)    
sobel_final = np.uint8(np.absolute(sobel_combined))
cv2.imwrite('reference_output.jpg', sobel_final)
    
