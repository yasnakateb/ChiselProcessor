package CPU

import chisel3._

class Shifter extends Module {
    val io = IO(new Bundle {
        val sign_Imm = Input(UInt(32.W))
        val shifted_Sign_Imm = Output(UInt(32.W))     
    })

    io.shifted_Sign_Imm := io.sign_Imm << 2    
}

// Generate the Verilog code
object ShifterMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Shifter(), Array("--target-dir", "generated"))
}