circuit SignExtension :
  module SignExtension :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip immidiate : UInt<16>, sign_Imm : UInt<32>}

    node sign = bits(io.immidiate, 15, 15) @[SignExtension.scala 11:28]
    node _io_sign_Imm_T = cat(sign, io.immidiate) @[Cat.scala 31:58]
    io.sign_Imm <= _io_sign_Imm_T @[SignExtension.scala 12:17]

