circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip sig_MemWrite : UInt<1>, flip addr : UInt<32>, flip wd : UInt<3>, rd : UInt<32>}

    smem ram : UInt<32> [256] @[Memory.scala 13:26]
    io.rd is invalid @[Memory.scala 14:11]
    node _rdwrPort_T = bits(io.addr, 7, 0) @[Memory.scala 15:23]
    infer mport rdwrPort = ram[_rdwrPort_T], clock @[Memory.scala 15:23]
    when io.sig_MemWrite : @[Memory.scala 16:28]
      rdwrPort <= io.wd @[Memory.scala 18:18]
    else :
      io.rd <= rdwrPort @[Memory.scala 22:15]

