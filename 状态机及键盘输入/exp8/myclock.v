module myclock (clock50, clockhz);
    input clock50;
    output reg clockhz;
    integer clock_count;
    
    initial begin
        clockhz = 0;
        clock_count = 0;
    end

    always @(posedge clock50) begin
        if(clock_count == 1) begin
            clock_count <= 0;
            clockhz <= ~clockhz;
        end
        else
            clock_count <= clock_count + 1;
    end
endmodule