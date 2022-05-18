package CPU

import chisel3._

class ShifterSignImm extends Module {
    val io = IO(new Bundle {
        val sign_Imm = Input(UInt(26.W))
        val shifted_Sign_Imm = Output(UInt(28.W))     
    })
    
    io.shifted_Sign_Imm := io.sign_Imm ## "b00".U(2.W)
}

// Generate the Verilog code
object ShifterSignImmMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ShifterSignImm(), Array("--target-dir", "generated"))
}