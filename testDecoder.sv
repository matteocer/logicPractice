module testDecoder 
    input  [2:0] decoderIn;
    output [7:0] decoderOut;

    dut(decoder(.*));

    initial begin
        $monitor( )
        $finish
    end
endModule