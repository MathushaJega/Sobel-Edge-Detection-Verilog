`timescale 1ns / 1ps

module sobel_tb;
    reg clk;
    reg [7:0] mem [0:9999]; // Holds a 100x100 image
    reg [7:0] p0, p1, p2, p3, p4, p5, p6, p7, p8;
    wire [7:0] edge_out;
    integer file, i, j;

    // Connect to your Sobel Brain
    sobel_filter uut (
        .clk(clk),
        .p0(p0), .p1(p1), .p2(p2),
        .p3(p3), .p4(p4), .p5(p5),
        .p6(p6), .p7(p7), .p8(p8),
        .edge_data(edge_out)
    );

    initial begin
        clk = 0;
        // 1. Read the horse image numbers
        $readmemh("image_data.txt", mem); 
        
        // 2. Open a file to save the result
        file = $fopen("output_edge.txt", "w");
        
        // 3. Loop through the pixels (simplified 3x3 window)
        for (i = 1; i < 99; i = i + 1) begin
            for (j = 1; j < 99; j = j + 1) begin
                // Feed the 9 pixels around the center
                p0 <= mem[(i-1)*100 + (j-1)]; p1 <= mem[(i-1)*100 + j]; p2 <= mem[(i-1)*100 + (j+1)];
                p3 <= mem[i*100 + (j-1)];     p4 <= mem[i*100 + j];     p5 <= mem[i*100 + (j+1)];
                p6 <= mem[(i+1)*100 + (j-1)]; p7 <= mem[(i+1)*100 + j]; p8 <= mem[(i+1)*100 + (j+1)];
                
                #10; // Wait a tiny bit
                $fwrite(file, "%d\n", edge_out); // Save the edge pixel
            end
        end
        
        $fclose(file);
        $finish;
    end

    always #5 clk = ~clk; // Make the clock tick
endmodule