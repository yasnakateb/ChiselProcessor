package CPU

import chisel3._

class RegisterWithEnable extends Module {
    val io = IO(new Bundle {
        val in = Input(UInt(32.W))
        val enable = Input(Bool())
        val out = Output(UInt(32.W))
    })

    val reg = RegInit (0.U)
    reg := io.in
    io.out := 0.U
    when(io.enable){

        io.out := reg
        
    }
}

// Generate the Verilog code
object RegisterWithEnableMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new RegisterWithEnable(), Array("--target-dir", "generated"))
}