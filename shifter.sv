module shifter(
    input  [3:0] a,          
    input  [1:0] b,         
    output [6:0] y           
);
    reg [6:0] temp;

    always @(*) begin
        case (b)
            2'b00: temp = {3'b000, a};       
            2'b01: temp = {2'b00, a, 1'b0};  
            2'b10: temp = {1'b0, a, 2'b00};  
            2'b11: temp = {a, 3'b000};       
            default: temp = 7'b0000000;      
        endcase
    end

    assign y = temp;  
endmodule

