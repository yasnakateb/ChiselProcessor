package CPU

import chisel3._
 
class Memory extends Module {
    val io = IO(new Bundle {
        val sig_MemWrite = Input(Bool())
        val addr = Input(UInt(32.W))
        val wd = Input(UInt(32.W))
        val rd = Output(UInt(32.W))
    })

    val ram = SyncReadMem(256, UInt(32.W))
    io.rd := DontCare
    val rdwrPort = ram(io.addr)
    when (io.sig_MemWrite) {
        
        rdwrPort := io.wd
    
    }.otherwise { 

        io.rd := rdwrPort 

    }    
}

// Generate the Verilog code
object MemoryMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Memory(), Array("--target-dir", "generated"))
}
