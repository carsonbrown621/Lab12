// Implement binary state machine
module binary(
    input        w,
    input        clk,
    input        reset,
    output       z,
    output [2:0] state
);
    wire [2:0] State;
    wire [2:0] Next;

    // State A = 000, so every bit resets to 0
    dff zero(.Default(1'b0), .D(Next[0]), .clk(clk), .reset(reset), .Q(State[0]));
    dff one (.Default(1'b0), .D(Next[1]), .clk(clk), .reset(reset), .Q(State[1]));
    dff two (.Default(1'b0), .D(Next[2]), .clk(clk), .reset(reset), .Q(State[2]));

    // Output: z = 1 in C (010) or E (100)
    assign z = State[2] | (State[1] & ~State[0]);

    // Next state logic
    assign Next[2] = (w & State[2]) | (w & State[1] & State[0]);

    assign Next[1] = (State[1] & ~State[0])
                   | (~State[1] & State[0])
                   | (~State[2] & ~State[1] & w);

    assign Next[0] = (~State[1] & ~State[0] & ~w)
                   | (~State[2] & ~State[0] &  w)
                   | (~State[1] &  State[0] &  w)
                   | ( State[1] &  State[0] & ~w);

    assign state = State;
endmodule