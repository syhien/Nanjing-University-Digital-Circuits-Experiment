module keyboard(
	input en,
	input clk,
	input ps2_clk,
	input ps2_data,
	output reg pressing,
	output reg [7:0] q
);

//inner signals
wire overflow;
wire [7:0] asdata;
wire [7:0] data;
//reg [7:0] cnt = 0;
wire ready;
reg nextdata_n = 0;
reg flag = 0;


//initial



//outer modules called
toASCII t1(.data(data), .asdata(asdata));


ps2_keyboard k1(.clk(clk),.clrn(1),.ps2_clk(ps2_clk),
	.ps2_data(ps2_data),.data(data),.ready(ready),
	.nextdata_n(nextdata_n),.overflow(overflow));/**/


always @ (posedge clk)
begin
	if(en && ready && nextdata_n == 1'b1)
	begin
		nextdata_n <= 0;
		if(flag == 1)
		begin
			q <= 8'h00;
			flag <= 0;
			pressing <= 0;
		end
		else if(data == 8'hf0) begin
			flag <= 1;
		end
		else
		begin
			pressing <= 1;
			q <= asdata;
		end
	end
	else begin 
		q <= q;
		nextdata_n <= 1;
	end;
end


endmodule 