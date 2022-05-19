module SignExtension(
  input         clock,
  input         reset,
  input  [15:0] io_immidiate,
  output [31:0] io_sign_Imm
);
  wire  sign_bit = io_immidiate[15]; // @[SignExtension.scala 11:32]
  wire [7:0] sign_bits_lo = {sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit}; // @[SignExtension.scala 17:33]
  wire [15:0] sign_bits = {sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bits_lo}; // @[SignExtension.scala 17:33]
  assign io_sign_Imm = {sign_bits,io_immidiate}; // @[Cat.scala 31:58]
endmodule
