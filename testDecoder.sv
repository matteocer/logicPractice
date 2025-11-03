module testDecoder; 
    logic [2:0] decoderIn;
    logic [7:0] decoderOut;

    dut(decoder(decoderIn, decoderIn));

    initial begin
        decoderIn = 3'b0;
        $monitor("time %b, decoderIn %b, decoderOut %b", $time, decoderIn, decoderOut)
        for (i = 3'b0; i < 4'b8; i = i + 1) begin
            decoderIn = i;
            #4
            if (decoderOut != {decoderIn[2] + decoderIn[1] + decoderOut[0]}) begin
                $display("Whoops decoderIn = %b, decoderOut = %b", decoderIn, decoderOut);
            end
        end
        $finish
    end
endmodule