/* 
This is a X-to-X^2 decoder model
*/


module decoder # (
    parameter OUTPUT_WIDTH = 8, 
    parameter INPUT_WIDTH = $clog2(OUTPUT_WIDTH)
  )(
    input logic [INPUT_WIDTH-1:0] decoderIn,
    output logic [OUTPUT_WIDTH-1:0]  decoderOut
  );

    always_comb begin
        decoderOut = 0;
        decoderOut[decoderIn] = 1'b1;
    end

endmodule   