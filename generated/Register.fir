circuit Register :
  module Register :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<32>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Register.scala 11:23]
    reg <= io.in @[Register.scala 12:9]
    io.out <= reg @[Register.scala 13:12]

