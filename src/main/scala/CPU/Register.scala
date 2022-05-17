package CPU

import chisel3._

class Register extends Module {
    val io = IO(new Bundle {
        val in = Input(UInt(32.W))
        val out = Output(UInt(32.W))
    })

    val reg = RegInit (0.U)
    reg := io.in
    io.out := reg
}

// Generate the Verilog code
object RegisterMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Register(), Array("--target-dir", "generated"))
}