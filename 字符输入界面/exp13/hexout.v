module hexout (
    input en,
    input [3:0] data,
    output reg [6:0] hex
);
    reg [6:0] NUMS [15:0];
    initial begin
        NUMS[0] = 7'b1000000;
        NUMS[1] = 7'b1111001;
        NUMS[2] = 7'b0100100;
        NUMS[3] = 7'b0110000;
        NUMS[4] = 7'b0011001;
        NUMS[5] = 7'b0010010;
        NUMS[6] = 7'b0000010;
        NUMS[7] = 7'b1111000;
        NUMS[8] = 7'b0000000;
        NUMS[9] = 7'b0010000;
        NUMS[10] = 7'b0001000;
        NUMS[11] = 7'b0000011;
        NUMS[12] = 7'b1000110;
        NUMS[13] = 7'b0100001;
        NUMS[14] = 7'b0000110;
        NUMS[15] = 7'b0001110;
    end
    always @(data) begin
        if (en)
            hex = NUMS[data];
        else
            hex = 7'b1111111;
    end
endmodule