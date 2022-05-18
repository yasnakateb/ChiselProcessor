package CPU

import chisel3._

class ControlBranch extends Module {
    val io = IO(new Bundle {
        val PCWrite = Input(Bool())      
        val Branch = Input(Bool())      
        val Zero = Input(Bool())      
        val PCEn = Output(Bool())      
    })

    io.PCEn := (io.Zero & io.Branch) | io.PCWrite
}

// Generate the Verilog code
object ControlBranchMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ControlBranch(), Array("--target-dir", "generated"))
}