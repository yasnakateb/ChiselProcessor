module ShifterSignImm(
  input         clock,
  input         reset,
  input  [25:0] io_sign_Imm,
  output [27:0] io_shifted_Sign_Imm
);
  wire [26:0] _io_shifted_Sign_Imm_T = {io_sign_Imm,1'h0}; // @[ShifterSignImm.scala 11:40]
  assign io_shifted_Sign_Imm = {{1'd0}, _io_shifted_Sign_Imm_T}; // @[ShifterSignImm.scala 11:25]
endmodule
