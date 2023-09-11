module part3 (A, B, Function, ALUOut);
    parameter N = 4;
    input logic [N-1:0] A;
    input logic [N-1:0] B;
    input logic [1:0] Function;
    output logic [2*N-1:0] ALUOut; // signal set by always_comb block
    
    always_comb // declare always_comb block
    begin
        case(Function)
        0: ALUOut = A + B;
        1: ALUOut = |A | |B;
        2: ALUOut = &A & &B; 
        3: ALUOut = {A[N-1:0], B[N-1:0]};
        default : ALUOut = 0;
        endcase
    end
endmodule