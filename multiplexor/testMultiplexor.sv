`timescale 1ns/1ps

module testMuliplexor;
    localparam int INPUT_WIDTH = 8;
    localparam int SELECT_WIDTH = $clog2(INPUT_WIDTH);

    logic [INPUT_WIDTH-1:0] multiplexorIn = '1;
    logic [SELECT_WIDTH-1:0] multiplexorSel = '0;
    logic multiplexorOut;

    multiplexor #(INPUT_WIDTH, SELECT_WIDTH) dut (.*);

    initial begin
        $monitor("in = %b, sel = %b, out = %b", multiplexorIn, multiplexorSel, multiplexorOut);
        for (int i=0; i < INPUT_WIDTH; i += 1) begin
            #4;
            multiplexorSel = i;
        end
        $finish;
    end

endmodule