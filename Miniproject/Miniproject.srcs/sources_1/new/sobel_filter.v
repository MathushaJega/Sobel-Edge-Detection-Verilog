module sobel_filter(
    input clk,
    input [7:0] p0, p1, p2, p3, p4, p5, p6, p7, p8,
    output reg [7:0] edge_data
);
    integer gx, gy, abs_g;

    always @(posedge clk) begin
        // Horizontal gradient calculation 
        gx = (p2 + (p5 << 1) + p8) - (p0 + (p3 << 1) + p6);
        // Vertical gradient calculation 
        gy = (p0 + (p1 << 1) + p2) - (p6 + (p7 << 1) + p8);
        
        // Combine gradients 
        abs_g = (gx < 0 ? -gx : gx) + (gy < 0 ? -gy : gy);
        
        // Thresholding: if value > 255, make it 255 (white)
        edge_data <= (abs_g > 255) ? 8'hFF : abs_g[7:0];
    end
endmodule