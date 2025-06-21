`timescale 1ns/1ns

module power_on (
    input  logic resetb,       // Active-low reset
    input  logic clk,          // Clock signal
    input  logic power_good,   // Power-good signal
    output logic enable         // Enable signal
);

    logic [4:0] counter;        // Counter for 300 ns delay

    // Enable signal is asserted when the counter reaches 0
    assign enable = (counter == 0);

    // Counter logic
    always_ff @(posedge clk or negedge resetb) begin
        if (~resetb) begin
            counter <= 5'd30; // Reset counter to initial value
        end else if (~power_good) begin
            counter <= 5'd30; // Reset counter when power_good is deasserted
        end else if (counter != 0) begin
            counter <= counter - 1'b1; // Decrement counter when enabled is not set
        end
    end

endmodule // power_on
