circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip MemWrite : UInt<1>, flip addr : UInt<32>, flip wd : UInt<32>, rd : UInt<32>}

    smem ram : UInt<32> [256] @[Memory.scala 14:26]
    io.rd is invalid @[Memory.scala 20:11]
    node _rdwrPort_T = bits(io.addr, 7, 0) @[Memory.scala 21:23]
    infer mport rdwrPort = ram[_rdwrPort_T], clock @[Memory.scala 21:23]
    when io.MemWrite : @[Memory.scala 22:24]
      rdwrPort <= io.wd @[Memory.scala 24:18]
    else :
      io.rd <= rdwrPort @[Memory.scala 28:15]

