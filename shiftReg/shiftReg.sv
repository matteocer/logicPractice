typedef enum logic[1:0] {
    SLL = 2'b00,
    SRL = 2'b01,
    SRA = 2'b10
} oper_t;

typedef struct packed {
    oper_t oper;
} srControl_t;

module shiftReg #(parameter W = 8)
    (input logic [W-1:0] in,
     input logic [W-1:0] shiftVal,
     input srControl_t shiftControl,
     output logic [W-1:0] shiftOut
    );

    genvar = 

