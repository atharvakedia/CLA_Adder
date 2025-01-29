module PG_Generator (
  input [3:0] x,
  input [3:0] y,
  output [3:0] g,
  output [3:0] p
);
  assign p = ~ (x ^ y);
  assign g = (x | y);
endmodule

module LookAhead (
  input [3:0] g,
  input [3:0] p,
  input c_i,
  output [3:0] c_o,
  output P,
  output G
);
  wire g_0;
  wire g_1;
  wire g_2;
  wire p_0;
  wire p_1;
  wire p_2;
  wire p_3;
  wire P_temp;
  wire G_temp;
  assign g_0 = g[0];
  assign g_1 = g[1];
  assign g_2 = g[2];
  assign p_0 = p[0];
  assign p_1 = p[1];
  assign p_2 = p[2];
  assign p_3 = p[3];
  assign P_temp = (p_0 | p_1 | p_2 | p_3);
  assign G_temp = ((g_0 | p_1 | p_2 | p_3) & (g_1 | p_2 | p_3) & (p_3 | g_2) & g[3]);
  assign c_o[0] = ((p_0 | c_i) & g_0);
  assign c_o[1] = ((p_0 | p_1 | c_i) & (g_0 | p_1) & g_1);
  assign c_o[2] = ((p_2 | p_0 | c_i | p_1) & (g_0 | p_1 | p_2) & g_2 & (g_1 | p_2));
  assign c_o[3] = ((P_temp | c_i) & G_temp);
  assign P = P_temp;
  assign G = G_temp;
endmodule

module TwoLevelCLA (
  input [15:0] X,
  input [15:0] Y,
  input C_in,
  output C_out,
  output [15:0] S
);
  wire [3:0] s0;
  wire [3:0] s1;
  wire [3:0] s2;
  wire [3:0] s3;
  wire [3:0] s4;
  wire [3:0] s5;
  wire [3:0] s6;
  wire [3:0] s7;
  wire [3:0] s8;
  wire [3:0] s9;
  wire [3:0] s10;
  wire [3:0] s11;
  wire [3:0] s12;
  wire [3:0] s13;
  wire [3:0] s14;
  wire [3:0] s15;
  wire [3:0] s16;
  wire s17;
  wire s18;
  wire c_4;
  wire [3:0] s19;
  wire s20;
  wire s21;
  wire c_8;
  wire [3:0] s22;
  wire s23;
  wire s24;
  wire c_12;
  wire [3:0] s25;
  wire s26;
  wire s27;
  wire [15:0] s28;
  wire [15:0] s29;
  wire [3:0] s30;
  wire [3:0] s31;
  wire [3:0] s32;
  assign s0 = X[3:0];
  assign s1 = X[7:4];
  assign s2 = X[11:8];
  assign s3 = X[15:12];
  assign s4 = Y[3:0];
  assign s5 = Y[7:4];
  assign s6 = Y[11:8];
  assign s7 = Y[15:12];
  PG_Generator PG_Generator_i0 (
    .x( s0 ),
    .y( s4 ),
    .g( s8 ),
    .p( s9 )
  );
  PG_Generator PG_Generator_i1 (
    .x( s1 ),
    .y( s5 ),
    .g( s10 ),
    .p( s11 )
  );
  PG_Generator PG_Generator_i2 (
    .x( s2 ),
    .y( s6 ),
    .g( s12 ),
    .p( s13 )
  );
  PG_Generator PG_Generator_i3 (
    .x( s3 ),
    .y( s7 ),
    .g( s14 ),
    .p( s15 )
  );
  LookAhead LookAhead_i4 (
    .g( s8 ),
    .p( s9 ),
    .c_i( C_in ),
    .c_o( s16 ),
    .P( s17 ),
    .G( s18 )
  );
  assign s28[3:0] = s9;
  assign s28[7:4] = s11;
  assign s28[11:8] = s13;
  assign s28[15:12] = s15;
  LookAhead LookAhead_i5 (
    .g( s10 ),
    .p( s11 ),
    .c_i( c_4 ),
    .c_o( s19 ),
    .P( s20 ),
    .G( s21 )
  );
  LookAhead LookAhead_i6 (
    .g( s12 ),
    .p( s13 ),
    .c_i( c_8 ),
    .c_o( s22 ),
    .P( s23 ),
    .G( s24 )
  );
  LookAhead LookAhead_i7 (
    .g( s14 ),
    .p( s15 ),
    .c_i( c_12 ),
    .c_o( s25 ),
    .P( s26 ),
    .G( s27 )
  );
  assign S = ~ (s28 ^ s29);
  assign s29[0] = C_in;
  assign s29[1] = s16[0];
  assign s29[2] = s16[1];
  assign s29[3] = s16[2];
  assign s29[4] = s16[3];
  assign s29[5] = s19[0];
  assign s29[6] = s19[1];
  assign s29[7] = s19[2];
  assign s29[8] = s19[3];
  assign s29[9] = s22[0];
  assign s29[10] = s22[1];
  assign s29[11] = s22[2];
  assign s29[12] = s22[3];
  assign s29[13] = s25[0];
  assign s29[14] = s25[1];
  assign s29[15] = s25[2];
  LookAhead LookAhead_i8 (
    .g( s30 ),
    .p( s31 ),
    .c_i( C_in ),
    .c_o( s32 )
  );
  assign s31[0] = s17;
  assign s31[1] = s20;
  assign s31[2] = s23;
  assign s31[3] = s26;
  assign s30[0] = s18;
  assign s30[1] = s21;
  assign s30[2] = s24;
  assign s30[3] = s27;
  assign c_4 = s32[0];
  assign c_8 = s32[1];
  assign c_12 = s32[2];
  assign C_out = s32[3];
endmodule
