module ControlBranch(
  input   clock,
  input   reset,
  input   io_PCWrite,
  input   io_Branch,
  input   io_Zero,
  output  io_PCEn
);
  assign io_PCEn = io_Zero & io_Branch | io_PCWrite; // @[ControlBranch.scala 13:38]
endmodule
