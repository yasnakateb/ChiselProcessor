package CPU

import chisel3._
import chisel3.util._
 
class Processor extends Module {
    val io = IO(new Bundle {
        val state = Output(UInt(4.W))  
    })

    val sig_Branch = Wire(Bool())
    val sig_IntCause = Wire(Bool())
    val sig_CauseWrite = Wire(Bool())
    val sig_EPCWrite = Wire(Bool())
    val sig_PCWrite = Wire(Bool())
    val sig_MemWrite = Wire(Bool())
    val sig_IRWrite = Wire(Bool())
    val sig_RegDst = Wire(Bool())
    val sig_ALUSrcA = Wire(Bool())
    val sig_ALUControl = Wire(UInt(3.W))
    val sig_ALUSrcB = Wire(UInt(2.W))
    val sig_MemtoReg = Wire(UInt(2.W))
    val sig_IorD = Wire(Bool())  
    val sig_RegWrite = Wire(Bool())  
    val _Int_Cause = Wire(UInt(32.W))      
    val _Zero = Wire(Bool())
    val _Pc_En = Wire(Bool()) 
    val _Pc = Wire(UInt(32.W)) 
    val _Pc_Prime = Wire(UInt(32.W))     
    val _Adr = Wire(UInt(32.W))
    val _Rd = Wire(UInt(32.W))
    val _Instr = Wire(UInt(32.W))
    val _Data = Wire(UInt(32.W))
    val _A3 = Wire(UInt(5.W))
    val _Wd3 = Wire(UInt(32.W))
    val _Rd1 = Wire(UInt(132.W))
    val _Rd2 = Wire(UInt(32.W))
    val _Sign_Imm = Wire(UInt(32.W))
    val _Reg_A = Wire(UInt(32.W))
    val _Reg_B = Wire(UInt(32.W))
    val _Src_A = Wire(UInt(32.W)) 
    val _Src_B = Wire(UInt(32.W))
    val _Alu_Result = Wire(UInt(32.W))
    val _Pc_Src = Wire(UInt(2.W))
    val _Pc_Jump = Wire(UInt(32.W))
    val _Pc_Jump_Prime = Wire(UInt(28.W))
    val _Alu_Out = Wire(UInt(32.W))
    val _over_flow = Wire(Bool())
    // Fix over flow
    _over_flow := false.B
    val _Sign_Imm_Shifted = Wire(UInt(32.W))
    val _Epc = Wire(UInt(32.W))
    val _C0 = Wire(UInt(32.W))
    val _Cause = Wire(UInt(32.W))

    _Pc_Jump := _Pc(31,28) ## _Pc_Jump_Prime(27,0)
    
    val control_unit = Module (new ControlUnit())

    control_unit.io.instr_Opcode := _Instr(31,26)
    control_unit.io.instr_Function := _Instr(5,0)
    control_unit.io.over_flow := _over_flow
    sig_MemtoReg := control_unit.io.MemtoReg
    sig_RegDst := control_unit.io.RegDst
    sig_IorD := control_unit.io.IorD
    sig_ALUSrcB := control_unit.io.ALUSrcB 
    sig_ALUSrcA := control_unit.io.ALUSrcA
    sig_IRWrite := control_unit.io.IRWrite
    sig_MemWrite := control_unit.io.MemWrite
    sig_PCWrite := control_unit.io.PCWrite
    sig_Branch := control_unit.io.Branch
    sig_RegWrite := control_unit.io.RegWrite 
    sig_ALUControl := control_unit.io.alu_Control
    sig_IntCause := control_unit.io.IntCause
    sig_CauseWrite := control_unit.io.CauseWrite
    sig_EPCWrite := control_unit.io.EPCWrite
    io.state := control_unit.io.state
    _Pc_Src := control_unit.io.PCSrc

    val pc = Module (new RegisterWithEnable())
    pc.io.enable := _Pc_En
    pc.io.in := _Pc_Prime
    _Pc := pc.io.out

    val epc  = Module (new RegisterWithEnable())
    epc.io.enable := sig_EPCWrite
    epc.io.in := _Pc
    _Epc := epc.io.out 

    _Int_Cause := Mux(sig_IntCause, "h28".U(32.W), "h30".U(32.W))

    val cause = Module (new RegisterWithEnable())
    pc.io.enable := sig_CauseWrite
    pc.io.in := _Int_Cause
    _Cause := pc.io.out

    _C0 := MuxCase("b00".U(2.W), Array((_Instr(15,11) === 13.U(5.W)) ->  _Cause, (_Instr(15,11) === 13.U(5.W)) ->  _Epc))
    
    _Adr := Mux(sig_IorD, _Alu_Out, _Pc)

    val memory  = Module (new Memory())
    memory.io.MemWrite := sig_MemWrite
    memory.io.addr := _Adr
    memory.io.wd := _Reg_B
    _Rd := memory.io.rd

    val instr  = Module (new RegisterWithEnable())
    instr.io.enable := sig_IRWrite
    instr.io.in := _Rd
    _Instr := instr.io.out 

    val data  = Module (new Register())
    data.io.in := _Rd
    _Data := data.io.out 

    _A3 := Mux(sig_RegDst, _Instr(15,11), _Instr(20,16))

    _Wd3 := MuxCase("b00".U(2.W), Array((sig_MemtoReg === 0.U(2.W)) ->  _Alu_Out, (sig_MemtoReg === 1.U(2.W)) ->  _Data, (sig_MemtoReg === 2.U(2.W)) ->  _C0, (sig_MemtoReg === 3.U(2.W)) ->  0.U(32.W)))

    val register_file = Module (new RegisterFile())

    register_file.io.src1 := _Instr(25,21)
    register_file.io.src2 := _Instr(20,16)
    register_file.io.src3 := _A3
    register_file.io.wd := _Wd3
    register_file.io.write_data := sig_RegWrite
    _Rd1 := register_file.io.rd1 
    _Rd1 := register_file.io.rd2 

    
}

// Generate the Verilog code
object ProcessorMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Processor(), Array("--target-dir", "generated"))
}
