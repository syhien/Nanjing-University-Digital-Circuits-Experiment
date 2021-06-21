module randomcolor (
    input [7:0] ascii,
    output reg [11:0] q
);
initial begin
    q = 12'h101;
end

always @(ascii) begin
    q = {q[10:0], q[11] ^ q[10] ^ q[9] ^ q[3] ^ q[0]};
end

endmodule