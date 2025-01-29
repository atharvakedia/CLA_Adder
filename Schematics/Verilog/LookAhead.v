module LookAhead (
  input [3:0] g,
  input [3:0] p,
  input C_i,
  output [3:0] C_o,
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
  assign C_o[0] = ((p_0 | C_i) & g_0);
  assign C_o[1] = ((p_0 | p_1 | C_i) & (g_0 | p_1) & g_1);
  assign C_o[2] = ((p_2 | p_0 | C_i | p_1) & (g_0 | p_1 | p_2) & g_2 & (g_1 | p_2));
  assign C_o[3] = ((P_temp | C_i) & G_temp);
  assign P = P_temp;
  assign G = G_temp;
endmodule
