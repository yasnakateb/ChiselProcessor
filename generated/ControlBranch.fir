circuit ControlBranch :
  module ControlBranch :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip PCWrite : UInt<1>, flip Branch : UInt<1>, flip Zero : UInt<1>, PCEn : UInt<1>}

    node _io_PCEn_T = and(io.Zero, io.Branch) @[ControlBranch.scala 13:25]
    node _io_PCEn_T_1 = or(_io_PCEn_T, io.PCWrite) @[ControlBranch.scala 13:38]
    io.PCEn <= _io_PCEn_T_1 @[ControlBranch.scala 13:13]

