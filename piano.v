module piano(
input i_clk,
input i_reset,
input k1,
input k2,
input k3,
input k4,
output reg speaker
);
wire freq4k;
wire freq8k;
wire freq16k;
wire freq32k;
timer #(.maxTimerValue(25000))t1(
    .i_clk(i_clk),
    .i_reset(~k1),
    .freqOut(freq4k)
);
timer #(.maxTimerValue(12500))t2(
    .i_clk(i_clk),
    .i_reset(~k2),
    .freqOut(freq8k)
);
timer #(.maxTimerValue(6250))t3(
    .i_clk(i_clk),
    .i_reset(~k3),
    .freqOut(freq16k)
);
timer #(.maxTimerValue(3125))t4(
    .i_clk(i_clk),
    .i_reset(~k4),
    .freqOut(freq32k)
);
always @(*)
begin
	if(k1)
		speaker<=freq4k;
	else if (k2)
		speaker<=freq8k;
	else if(k3)
		speaker<=freq16k;
	else if(k4)
		speaker<=freq32k;
	else
		speaker=1'b0;
end

endmodule