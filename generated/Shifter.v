module Shifter(
  input         clock,
  input         reset,
  input  [31:0] io_sign_Imm,
  output [31:0] io_shifted_Sign_Imm
);
  wire [33:0] _io_shifted_Sign_Imm_T = {io_sign_Imm, 2'h0}; // @[Shifter.scala 11:40]
  assign io_shifted_Sign_Imm = _io_shifted_Sign_Imm_T[31:0]; // @[Shifter.scala 11:25]
endmodule
