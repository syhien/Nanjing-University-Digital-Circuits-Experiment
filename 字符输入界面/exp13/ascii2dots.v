module ascii2dots (
    input [7:0] ascii,
    input [3:0] line,
    output [15:0] dots
);
    reg [11:0] myrom [4095:0];

initial begin
    $readmemh("C:/fpga/exp13/vga_font.txt", myrom, 0, 4095);
end
    
    assign dots = {2'b0, myrom[{ascii[7:0], line[3:0]}], 2'b0};

endmodule