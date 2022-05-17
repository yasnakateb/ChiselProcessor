circuit RegisterFile :
  module RegisterFile :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip src1 : UInt<5>, flip src2 : UInt<5>, flip src3 : UInt<5>, flip wd : UInt<32>, flip write_data : UInt<1>, rd1 : UInt<32>, rd2 : UInt<32>}

    reg registerFile : UInt<32>[32], clock with :
      reset => (UInt<1>("h0"), registerFile) @[RegisterFile.scala 16:27]
    io.rd1 <= registerFile[io.src1] @[RegisterFile.scala 17:12]
    io.rd2 <= registerFile[io.src2] @[RegisterFile.scala 18:12]
    when io.write_data : @[RegisterFile.scala 19:26]
      registerFile[io.src3] <= io.wd @[RegisterFile.scala 20:31]

