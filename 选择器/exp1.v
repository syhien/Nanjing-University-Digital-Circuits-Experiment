module exp1 (
    y,x0,x1,x2,x3,f
);
    input [1:0] y,x0,x1,x2,x3;
    output reg [1:0] f;
    always @(y or x0 or x1 or x2 or x3) begin
        case (y)
            0: f=x0;
            1: f=x1;
            2: f=x2;
            3: f=x3;
            default: f=2'b00;
        endcase
    end

endmodule