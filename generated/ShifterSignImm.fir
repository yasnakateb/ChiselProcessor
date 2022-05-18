circuit ShifterSignImm :
  module ShifterSignImm :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip sign_Imm : UInt<26>, shifted_Sign_Imm : UInt<28>}

    node _io_shifted_Sign_Imm_T = cat(io.sign_Imm, UInt<1>("h0")) @[ShifterSignImm.scala 11:40]
    io.shifted_Sign_Imm <= _io_shifted_Sign_Imm_T @[ShifterSignImm.scala 11:25]

