package CPU

import chisel3._
import chisel3.util._

class SignExtension extends Module {
    val io = IO(new Bundle {
        val immidiate = Input(UInt(16.W))
        val sign_Imm = Output(UInt(32.W))
    })
    val sign_bit = Wire(UInt (1.W))
    val slot = Vec(80).fill{sign_bit}
    
    
    io.sign_Imm := 0.U
}

// Generate the Verilog code
object SignExtensionMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new SignExtension(), Array("--target-dir", "generated"))
}