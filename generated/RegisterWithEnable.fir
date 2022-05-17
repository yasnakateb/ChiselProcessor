circuit RegisterWithEnable :
  module RegisterWithEnable :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<32>, flip enable : UInt<1>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[RegisterWithEnable.scala 12:23]
    reg <= io.in @[RegisterWithEnable.scala 13:9]
    io.out <= UInt<1>("h0") @[RegisterWithEnable.scala 14:12]
    when io.enable : @[RegisterWithEnable.scala 15:20]
      io.out <= reg @[RegisterWithEnable.scala 16:16]

