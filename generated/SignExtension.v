module SignExtension(
  input         clock,
  input         reset,
  input  [15:0] io_immidiate,
  output [31:0] io_sign_Imm
);
  wire  sign = io_immidiate[15]; // @[SignExtension.scala 11:28]
  wire [16:0] _io_sign_Imm_T = {sign,io_immidiate}; // @[Cat.scala 31:58]
  assign io_sign_Imm = {{15'd0}, _io_sign_Imm_T}; // @[SignExtension.scala 12:17]
endmodule
