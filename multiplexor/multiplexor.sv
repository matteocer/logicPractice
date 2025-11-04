module multiplexor #(
    parameter INPUT_WIDTH = 8,
    parameter SELECT_WIDTH = $clog2(INPUT_WIDTH)
 ) (
    input logic [INPUT_WIDTH-1:0] multiplexorIn,
    input logic [SELECT_WIDTH-1:0] multiplexorSel,
    output logic multiplexorOut
 );


    assign multiplexorOut = multiplexorIn[multiplexorSel];


endmodule

