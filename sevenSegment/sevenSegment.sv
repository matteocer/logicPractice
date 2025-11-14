module top (
    input logic clk,
    input logic rst,
    output logic [6:0] displayOutput
    );
    
    logic [3:0] state;

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= 4'd0;
        end
        else begin
            case (state)
                4'd0:    state <= 4'd1;
                4'd1:    state <= 4'd2;
                4'd2:    state <= 4'd3;
                4'd3:    state <= 4'd4;
                4'd4:    state <= 4'd5;
                4'd5:    state <= 4'd6;
                4'd6:    state <= 4'd7;
                4'd7:    state <= 4'd8;
                4'd8:    state <= 4'd9;
                4'd9:    state <= 4'd0;
                default: state <= 4'd0;
            endcase
        end
    end
    
    always_comb begin
        case (state)
            4'd0:    displayOutput = 7'b0111111;
            4'd1:    displayOutput = 7'b0000110;
            4'd2:    displayOutput = 7'b1011011;
            4'd3:    displayOutput = 7'b1001111;
            4'd4:    displayOutput = 7'b1100110;
            4'd5:    displayOutput = 7'b1101101;
            4'd6:    displayOutput = 7'b1111101;
            4'd7:    displayOutput = 7'b0000111;
            4'd8:    displayOutput = 7'b1111111;
            4'd9:    displayOutput = 7'b1101111;
        endcase
    end

endmodule
