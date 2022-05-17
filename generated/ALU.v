module ALU(
  input         clock,
  input         reset,
  input  [31:0] io_SrcA,
  input  [31:0] io_SrcB,
  input  [2:0]  io_ALUControl,
  output [31:0] io_ALUResult,
  output        io_Zero
);
  wire [31:0] _io_ALUResult_T = io_SrcA & io_SrcB; // @[ALU.scala 27:31]
  wire [31:0] _io_ALUResult_T_1 = io_SrcA | io_SrcB; // @[ALU.scala 29:31]
  wire [31:0] _io_ALUResult_T_3 = io_SrcA + io_SrcB; // @[ALU.scala 31:31]
  wire [31:0] _io_ALUResult_T_4 = io_SrcA ^ io_SrcB; // @[ALU.scala 33:31]
  wire [31:0] _io_ALUResult_T_6 = io_SrcA - io_SrcB; // @[ALU.scala 35:31]
  wire [31:0] _GEN_0 = io_ALUControl == 3'h6 ? _io_ALUResult_T_6 : 32'h0; // @[ALU.scala 34:41 35:20 37:20]
  wire [31:0] _GEN_1 = io_ALUControl == 3'h5 ? _io_ALUResult_T_4 : _GEN_0; // @[ALU.scala 32:41 33:20]
  wire [31:0] _GEN_2 = io_ALUControl == 3'h2 ? _io_ALUResult_T_3 : _GEN_1; // @[ALU.scala 30:41 31:20]
  wire [31:0] _GEN_3 = io_ALUControl == 3'h1 ? _io_ALUResult_T_1 : _GEN_2; // @[ALU.scala 28:40 29:20]
  assign io_ALUResult = io_ALUControl == 3'h0 ? _io_ALUResult_T : _GEN_3; // @[ALU.scala 26:34 27:20]
  assign io_Zero = io_ALUResult == 32'h0; // @[ALU.scala 39:33]
endmodule
