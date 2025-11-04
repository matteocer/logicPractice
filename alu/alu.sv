/* 
This is an 8-bit ALU with Addition (ADD), Subtraction (SUB), AND, OR capabilities. 
Outputs flags for overlow and zero values.
*/

typedef enum logic[1:0] {
    ADD = 2'b00,
    SUB = 2'b01,
    CAND = 2'b10,
    COR  =  2'b11
} oper_t;

typedef struct packed {
    oper_t     oper;
} aluControl_t;

typedef struct packed {
    logic overflow;
    logic zero;
} flags_t;

module alu # (
    parameter W = 8
  )( 
    input aluControl_t control,
    input logic[W-1:0] Ain, Bin,
    output logic[W-1:0] aluOut,
    output flags_t aluFlags
  );

    logic[W:0] out;

    always_comb begin
        aluFlags.overflow = 1'b0;
        case (control.oper)
            ADD: out = Ain + Bin;
            SUB: out = Ain - Bin;
            CAND: out = Ain & Bin;
            COR:  out = Ain | Bin;
            default: out = W'b0;
        endcase

        aluFlags.overflow = out[W];
        aluOut = out[W-1:0];
        aluFlags.zero = (out[W-1:0] == 8'b0) ? 1'b1 : 1'b0;

    end
endmodule


