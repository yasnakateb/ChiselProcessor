circuit Shifter :
  module Shifter :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip sign_Imm : UInt<32>, shifted_Sign_Imm : UInt<32>}

    node _io_shifted_Sign_Imm_T = shl(io.sign_Imm, 2) @[Shifter.scala 11:40]
    io.shifted_Sign_Imm <= _io_shifted_Sign_Imm_T @[Shifter.scala 11:25]

