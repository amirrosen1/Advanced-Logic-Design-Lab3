module comb (
    input  logic [1:0] a, 
    input  logic [1:0] b,        
    output logic out       
);
    assign out = |a & |b;

endmodule
