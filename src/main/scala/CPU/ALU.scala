package CPU

import chisel3._

object ALU
{
    def AND = 0.U(3.W)  //000
    def OR  = 1.U(3.W)  //001
    def ADD = 2.U(3.W)  //010
    def XOR = 5.U(3.W)  //101
    def SUB = 6.U(3.W)  //110
}

import ALU._
 
class ALU extends Module {
    val io = IO(new Bundle {
        val SrcA = Input(UInt(32.W))
        val SrcB = Input(UInt(32.W))
        val ALUControl = Input(UInt(3.W))
        val ALUResult = Output(UInt(32.W))
        val Zero = Output(Bool())      
    })

    io.ALUResult := 0.U 
    when (io.ALUControl === AND) {
      io.ALUResult := io.SrcA & io.SrcB                            //AND 
    } .elsewhen (io.ALUControl === OR) {
      io.ALUResult := io.SrcA | io.SrcB                            //OR
    } .elsewhen (io.ALUControl === ADD) {
      io.ALUResult := io.SrcA + io.SrcB                            //ADD
    } .elsewhen (io.ALUControl === XOR) {
      io.ALUResult := io.SrcA ^ io.SrcB                            //XOR
    } .elsewhen (io.ALUControl === SUB) {
      io.ALUResult := io.SrcA - io.SrcB                            //SUB
    } .otherwise { 
      io.ALUResult :=  0.U(32.W)                                   //Default
    }
    io.Zero := Mux(io.ALUResult === 0.U, true.B, false.B)
}

// Generate the Verilog code
object ALUMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ALU(), Array("--target-dir", "generated"))
}
