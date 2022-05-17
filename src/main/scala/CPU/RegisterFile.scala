package CPU

import chisel3._

class RegisterFile extends Module {
    val io = IO(new Bundle {
        val src1 = Input(UInt(5.W))
        val src2 = Input(UInt(5.W))
        val src3 = Input(UInt(5.W))
        val wd = Input(UInt(32.W))
        val write_data = Input(Bool())
        val rd1 = Output(UInt(32.W))
        val rd2 = Output(UInt(32.W))
    })

    val registerFile = Reg(Vec(32, UInt (32.W)))
    io.rd1 := registerFile(io.src1)
    io.rd2 := registerFile(io.src2)
    when (io.write_data) { 
        registerFile(io.src3) := io.wd 
    } 
}

// Generate the Verilog code
object RegisterFileMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new RegisterFile(), Array("--target-dir", "generated"))
}