`timescale 1ns/1ps


module testDecoder; 
    localparam OUTPUT_WIDTH = 8;
    localparam INPUT_WIDTH = $clog2(OUTPUT_WIDTH);
    logic [INPUT_WIDTH-1:0] decoderIn;
    logic [OUTPUT_WIDTH-1:0] decoderOut;

    decoder #(OUTPUT_WIDTH, INPUT_WIDTH) dut (decoderIn, decoderOut);

    logic [INPUT_WIDTH-1:0] outputSum;

    initial begin
        decoderIn = 3'b0;
        $monitor("decoderIn %b, decoderOut %b", decoderIn, decoderOut);
        for (int i = 'b0; i < OUTPUT_WIDTH; i += 1) begin
            decoderIn = i;
            outputSum = 3'b0;
            #4;
            for (int j = 'b0; j < OUTPUT_WIDTH; j += 1)
                if (decoderOut[j] == 1'b1) outputSum += j;
            if (decoderIn != outputSum) begin
                $display("Whoops decoderIn = %b, decoderOut = %b, outputSum = %b", decoderIn, decoderOut, outputSum);
            end
        end
        #4;
        $finish;
    end
endmodule