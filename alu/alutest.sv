
module alutest;
    oper_t control;
    logic [7:0] Ain, Bin, Out;
    flags_t flags;


    alu dut(.control(control), .Ain(Ain), .Bin(Bin), .aluOut(Out), .aluFlags(flags));

    initial begin 
        $monitor("control Ain Bin Out flags = %b %b %b %b %b", control, Ain, Bin, Out, flags);
        for 
        control = ADD;
        #10 $finish;
    end

endmodule
