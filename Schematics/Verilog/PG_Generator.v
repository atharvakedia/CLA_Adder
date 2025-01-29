module PG_Generator (
  input [3:0] x,
  input [3:0] y,
  output [3:0] g,
  output [3:0] p
);
  assign p = ~ (x ^ y);
  assign g = (x | y);
endmodule
