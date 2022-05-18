package CPU

import chisel3._
import chisel3 .util._
import scala.annotation.switch

object STATES
{
    def STATE_0  = 0.U(4.W)  
    def STATE_1  = 1.U(4.W)  
    def STATE_2  = 2.U(4.W)  
    def STATE_3  = 3.U(4.W)  
    def STATE_4  = 4.U(4.W)  
    def STATE_5  = 5.U(4.W)  
    def STATE_6  = 6.U(4.W)  
    def STATE_7  = 7.U(4.W)  
    def STATE_8  = 8.U(4.W)  
    def STATE_9  = 9.U(4.W)  
    def STATE_10 = 10.U(4.W)  
    def STATE_11 = 11.U(4.W)  
    def STATE_12 = 12.U(4.W)  
    def STATE_13 = 13.U(4.W)  
    def STATE_14 = 14.U(4.W)  
}

object TYPES
{
    def R_TYPE = "b000000".U(6.W)
    def LW     = "b100011".U(6.W)
    def SW     = "b101011".U(6.W)
    def BEQ    = "b000100".U(6.W)
    def ADDI   = "b010000".U(6.W)
    def J      = "b000010".U(6.W)
    def MFC0   = "b010000".U(6.W)
}

import STATES._
import TYPES._
 
class ControlUnit extends Module {
    val io = IO(new Bundle {
        val instr_Opcode   = Input(UInt(6.W))
        val instr_Function = Input(UInt(6.W))
        val over_flow  = Input(Bool())
        val MemtoReg = Output(UInt(2.W))
        val RegDst = Output(Bool())   
        val IorD = Output(Bool())   
        val PCSrc = Output(UInt(2.W))
        val ALUSrcB = Output(UInt(2.W))
        val ALUSrcA = Output(Bool())   
        val IRWrite = Output(Bool())   
        val MemWrite = Output(Bool())   
        val PCWrite = Output(Bool())   
        val Branch = Output(Bool())   
        val RegWrite = Output(Bool())   
        val IntCause = Output(Bool())   
        val CauseWrite = Output(Bool())   
        val EPCWrite = Output(Bool())   
        val state = Output(UInt(4.W))
        val alu_Control = Output(UInt(3.W))
    })

    // The state register
    val stateReg = RegInit (0.U)
    // Next state logic
    switch (stateReg) {
        is (STATE_0) {
            
            stateReg := STATE_1
            
        }
        is (STATE_1) {
            when (io.instr_Opcode === J) {

                stateReg := STATE_11

            }.elsewhen (io.instr_Opcode === ADDI) {

                stateReg := STATE_9

            }.elsewhen (io.instr_Opcode === BEQ) {

                stateReg := STATE_8

            }.elsewhen (io.instr_Opcode === R_TYPE) {

                stateReg := STATE_6

            }.elsewhen (io.instr_Opcode === SW) {

                stateReg := STATE_2

            }.elsewhen (io.instr_Opcode === LW) {

                stateReg := STATE_2

            }.elsewhen (io.instr_Opcode === MFC0) {

                stateReg := STATE_14

            }.otherwise  {

                stateReg := STATE_12

            }
        }
        is (STATE_2) {
            when (io.instr_Opcode === SW) {

                stateReg := STATE_5

            }.elsewhen (io.instr_Opcode === LW) {

                stateReg := STATE_3
            }
        }
        is (STATE_3) {
            
            stateReg := STATE_4
            
        }
        is (STATE_4) {

            stateReg := STATE_0

        }
        is (STATE_5) {

            stateReg := STATE_0

        }
        is (STATE_6) {
            when (io.over_flow) {

                stateReg := STATE_13

            }.otherwise {

                stateReg := STATE_7

            }
        }
        is (STATE_7) {
            
            stateReg := STATE_0 

        }
        is (STATE_8) {
            
            stateReg := STATE_0 

        }
        is (STATE_9) {
            
            stateReg := STATE_10 

        }
        is (STATE_10) {
            
            stateReg := STATE_0 

        }
        is (STATE_11) {
            
            stateReg := STATE_0 

        }
        is (STATE_12) {
            
            stateReg := STATE_0 

        }
        is (STATE_13) {
            
            stateReg := STATE_0 

        }
        is (STATE_14) {
            
            stateReg := STATE_0 

        }

    }

    val ALUOp = Wire(UInt(2.W))

    io.IorD := Mux((stateReg === STATE_5) || (stateReg === STATE_3), true.B, false.B)

    io.ALUSrcA := Mux((stateReg === STATE_9) || (stateReg === STATE_8) || (stateReg === STATE_6) || (stateReg === STATE_2), true.B, false.B)

    io.ALUSrcB := MuxCase("b00".U(2.W), Array((stateReg === STATE_0) -> "b01".U(2.W), (stateReg === STATE_1) -> "b11".U(2.W), ((stateReg === STATE_9) || (stateReg === STATE_2)) -> "b10".U(2.W)))

    ALUOp := MuxCase("b00".U(2.W), Array((stateReg === STATE_8) -> "b01".U(2.W), (stateReg === STATE_6) -> "b10".U(2.W)))

    io.PCSrc := MuxCase("b00".U(2.W), Array(((stateReg === STATE_12) || (stateReg === STATE_13)) ->  "b11".U(2.W), (stateReg === STATE_11) ->  "b10".U(2.W), (stateReg === STATE_8) ->  "b01".U(2.W))) 

    io.IRWrite := Mux(stateReg === STATE_0, true.B, false.B)

    io.PCWrite := MuxCase(false.B, Array(((stateReg === STATE_0) || (stateReg === STATE_11) || (stateReg === STATE_12) || (stateReg === STATE_13)) -> true.B)) 

    io.Branch := Mux(stateReg === STATE_8, true.B, false.B)

    io.RegDst := Mux(stateReg === STATE_7, true.B, false.B)

    io.MemtoReg := MuxCase("b00".U(2.W), Array((stateReg === STATE_4) ->  "b01".U(2.W), (stateReg === STATE_14) ->  "b10".U(2.W))) 

    io.RegWrite := MuxCase(false.B, Array(((stateReg === STATE_4) || (stateReg === STATE_7) || (stateReg === STATE_10) || (stateReg === STATE_14)) -> true.B)) 

    io.MemWrite := Mux(stateReg === STATE_5, true.B, false.B)

    io.IntCause := Mux(stateReg === STATE_12, true.B, false.B)

    io.CauseWrite := Mux((stateReg === STATE_12) || (stateReg === STATE_13), true.B, false.B)

    io.EPCWrite := Mux((stateReg === STATE_11) || (stateReg === STATE_12), true.B, false.B)

    io.state := stateReg
    io.alu_Control := "b000".U(3.W)

    when (ALUOp === 0.U) {

        io.alu_Control := "b010".U(3.W)          //Add

    }.elsewhen (ALUOp(0) === 0.U) {

        io.alu_Control := "b110".U(3.W)          //Sub

    }.elsewhen (ALUOp(1) === 2.U) {

        switch(io.instr_Function){
            is("b100000".U(6.W)){

                io.alu_Control := "b010".U(3.W) //Add 

            }
            is("b100010".U(6.W)){

                io.alu_Control := "b110".U(3.W) //Sub
                
            }
            is("b100100".U(6.W)){

                io.alu_Control := "b000".U(3.W) //And
                
            }
            is("b100101".U(6.W)){

                io.alu_Control := "b001".U(3.W) //Or
                
            }
            is("b101010".U(6.W)){

                io.alu_Control := "b111".U(3.W) //SLT
                
            }
            is("b100110".U(6.W)){

                io.alu_Control := "b101".U(3.W) //Xor
                
            }
        }   
    }
}

// Generate the Verilog code
object ControlUnitMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ControlUnit(), Array("--target-dir", "generated"))
}