package CPU

import chisel3._
import chisel3.util._

class SignExtension extends Module {
    val io = IO(new Bundle {
        val immidiate = Input(UInt(16.W))
        val sign_Imm = Output(UInt(32.W))
    })
    val sign_bit = io.immidiate(15)
    val ways_vector = Wire(Vec(16, Bool()))

    for (i <- 0 until 16) {
      ways_vector(i) := sign_bit
    }
    val sign_bits = ways_vector.asUInt
    io.sign_Imm := Cat(sign_bits, io.immidiate)
}

// Generate the Verilog code
object SignExtensionMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new SignExtension(), Array("--target-dir", "generated"))
}