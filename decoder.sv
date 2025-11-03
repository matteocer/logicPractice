/* 
This is a X-to-X^2 decoder model
*/


module decoder # (
    parameter OUTPUT_WIDTH = 8, 
    parameter INPUT_WIDTH = $clog2(OUTPUT_WIDTH)
  )(
    input  [OUTPUT_WIDTH-1:0] decoderIn,
    output [INPUT_WIDTH-1:0]  decoderOut
  );

    always_comb begin
        for (int i = 0; i < OUTPUT_WIDTH; i++) begin
            if (i == decoderIn) decoderOut[i] = 1'b1;
            else                decoderOut[i] = 1'b0;
        end
    end

endmodule   