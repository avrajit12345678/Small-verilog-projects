module timer #(parameter maxTimerValue=26'd50000000)(
    input i_clk,
    input i_reset,
    output reg freqOut
);

reg [25:0] TimerValue; // Corrected the declaration with a semicolon

always @(posedge i_clk or posedge i_reset) begin
    if (i_reset)
        TimerValue <= 0;
    else if (TimerValue < maxTimerValue) // Corrected the maximum value
        TimerValue <= TimerValue + 1'b1;
    else
        TimerValue <= 26'd0;
end

always @(posedge i_clk or posedge i_reset) begin
    if (i_reset)
        freqOut <= 1'b0;
    else if (TimerValue == maxTimerValue) // Corrected the comparison value
        freqOut <= ~freqOut;
end

endmodule

