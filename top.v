module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and onehot state machines
    wire       oh_z, bin_z;
    wire [4:0] oh_state;   // {E, D, C, B, A}
    wire [2:0] bin_state;

    onehot oh(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(oh_z),
        .state(oh_state)
    );

    binary bin(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(bin_z),
        .state(bin_state)
    );

    assign led[0]   = oh_z;       // Onehot Z
    assign led[1]   = bin_z;      // Binary Z
    assign led[6:2] = oh_state;   // led2=A, led3=B, led4=C, led5=D, led6=E
    assign led[9:7] = bin_state;  // Binary state, led9 = MSB

endmodule