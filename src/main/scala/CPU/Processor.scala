package CPU

import chisel3._
import chisel3.util._
 
class Processor extends Module {
    val io = IO(new Bundle {
        val state = Output(UInt(4.W))  
    })

    val control_unit = Module (new ControlUnit())
    val pc = Module (new RegisterWithEnable())
    val control_branch = Module (new ControlBranch())
    val epc  = Module (new RegisterWithEnable())
    val cause = Module (new RegisterWithEnable())
    val memory  = Module (new Memory())
    val instr  = Module (new RegisterWithEnable())
    val data  = Module (new Register())
    val register_file = Module (new RegisterFile())
    val sign_extension = Module (new SignExtension())
    val reg_a  = Module (new Register())
    val reg_b  = Module (new Register())
    val shifter = Module (new Shifter())
    val alu = Module (new ALU())
    val alu_out  = Module (new Register())
    val shifter_sign_imm = Module (new ShifterSignImm())
    
    pc.io.enable := control_branch.io.PCEn
    memory.io.addr := Mux(control_unit.io.IorD, alu_out.io.out, pc.io.out)

    memory.io.MemWrite := control_unit.io.MemWrite
    memory.io.wd := reg_b.io.out 
    instr.io.in := memory.io.rd
    instr.io.enable := control_unit.io.IRWrite
    // _Rd := memory.io.rd
    
    // instr.io.enable := sig_IRWrite
    // instr.io.in := _Rd
    val _Instr = RegInit (0.U(32.W)) 

    _Instr := instr.io.out 

    control_unit.io.instr_Opcode := _Instr(31,26)
    control_unit.io.instr_Function := _Instr(5,0)
    control_unit.io.over_flow := alu.io.over_flow 
    // sig_MemtoReg := control_unit.io.MemtoReg
    // sig_RegDst := control_unit.io.RegDst
    // sig_IorD := control_unit.io.IorD
    // sig_ALUSrcB := control_unit.io.ALUSrcB 
    // sig_ALUSrcA := control_unit.io.ALUSrcA
    //sig_IRWrite := control_unit.io.IRWrite
    // sig_MemWrite := control_unit.io.MemWrite
    // sig_RegWrite := control_unit.io.RegWrite 
    // sig_ALUControl := control_unit.io.alu_Control
    // sig_IntCause := control_unit.io.IntCause
    // sig_CauseWrite := control_unit.io.CauseWrite
    // sig_EPCWrite := control_unit.io.EPCWrite

    io.state := control_unit.io.state
    // _Pc_Src := control_unit.io.PCSrc
    
    epc.io.enable := control_unit.io.EPCWrite
    epc.io.in := pc.io.out
    // _Epc := epc.io.out 

    // _Int_Cause := Mux(control_unit.io.IntCause, "h28".U(32.W), "h30".U(32.W))
    
    cause.io.enable := control_unit.io.CauseWrite
    cause.io.in := Mux(control_unit.io.IntCause, "h28".U(32.W), "h30".U(32.W))
    
    // _Cause := cause.io.out
    _Instr := instr.io.out 
    val _C0 = MuxCase("b00".U(2.W), Array((_Instr(15,11) === 13.U(5.W)) ->  cause.io.out, (_Instr(15,11) === 13.U(5.W)) ->  epc.io.out ))
    
    // _Adr 

    memory.io.MemWrite := control_unit.io.MemWrite
    memory.io.addr := Mux(control_unit.io.IorD, alu_out.io.out, pc.io.out)
    memory.io.wd := reg_b.io.out 
    // _Rd := memory.io.rd
    
    instr.io.enable := control_unit.io.IRWrite
    instr.io.in := memory.io.rd
    
    
    data.io.in := memory.io.rd
    // _Data := data.io.out 

    // _A3 := Mux(sig_RegDst, _Instr(15,11), _Instr(20,16))

    // _Wd3 := MuxCase("b0".U(32.W), Array((control_unit.io.MemtoReg === 0.U(2.W)) ->  _Alu_Out, (control_unit.io.MemtoReg === 1.U(2.W)) ->  _Data, (control_unit.io.MemtoReg === 2.U(2.W)) ->  _C0, (control_unit.io.MemtoReg === 3.U(2.W)) ->  0.U(32.W)))

    register_file.io.src1 := _Instr(25,21)
    register_file.io.src2 := _Instr(20,16)
    register_file.io.src3 := Mux(control_unit.io.RegDst, _Instr(15,11), _Instr(20,16))
    register_file.io.wd := MuxCase("b0".U(32.W), Array((control_unit.io.MemtoReg === 0.U(2.W)) ->  alu_out.io.out, (control_unit.io.MemtoReg === 1.U(2.W)) ->  data.io.out, (control_unit.io.MemtoReg === 2.U(2.W)) ->  _C0, (control_unit.io.MemtoReg === 3.U(2.W)) ->  0.U(32.W)))
    register_file.io.write_data := control_unit.io.RegWrite 
    // _Rd1 := register_file.io.rd1 
    // _Rd2 := register_file.io.rd2 

    sign_extension.io.immidiate := _Instr(15,0)
    // _Sign_Imm := sign_extension.io.sign_Imm
    
    reg_a.io.in := register_file.io.rd1 
    // _Reg_A := reg_a.io.out 
    
    reg_b.io.in := register_file.io.rd2 
    // _Reg_B := reg_b.io.out 

    // _Src_B := MuxCase("b0".U(32.W), Array((sig_ALUSrcB === 0.U(2.W)) ->  _Reg_B, (sig_ALUSrcB === 1.U(2.W)) ->  4.U(32.W), (sig_ALUSrcB === 2.U(2.W)) ->  _Sign_Imm, (sig_ALUSrcB === 3.U(2.W)) ->  shifter.io.shifted_Sign_Imm))
    
    shifter.io.sign_Imm := sign_extension.io.sign_Imm
    // _Sign_Imm_Shifted := shifter.io.shifted_Sign_Imm

    // pc.io.enable <> control_branch.io.PCEn
    pc.io.enable := true.B
    val _Pc_Jump_Prime = shifter_sign_imm.io.shifted_Sign_Imm

    val _Pc_Jump = pc.io.out(31,28) ## _Pc_Jump_Prime(27,0)

    pc.io.in := MuxCase("b0".U(32.W), Array((control_unit.io.PCSrc === 0.U(2.W)) ->  alu.io.ALUResult, (control_unit.io.PCSrc === 1.U(2.W)) ->  alu_out.io.out, (control_unit.io.PCSrc === 2.U(2.W)) ->  _Pc_Jump, (control_unit.io.PCSrc === 3.U(2.W)) ->  "h80000180".U(32.W)))

    
    
    alu.io.SrcA := Mux(control_unit.io.ALUSrcA, reg_a.io.out, pc.io.out) 
    alu.io.SrcB := MuxCase("b0".U(32.W), Array((control_unit.io.ALUSrcB === 0.U(2.W)) ->  reg_b.io.out, (control_unit.io.ALUSrcB === 1.U(2.W)) ->  4.U(32.W), (control_unit.io.ALUSrcB === 2.U(2.W)) ->  sign_extension.io.sign_Imm, (control_unit.io.ALUSrcB === 3.U(2.W)) ->  shifter.io.shifted_Sign_Imm))
    alu.io.ALUControl := control_unit.io.alu_Control
    //_Alu_Result := alu.io.ALUResult
    
    // _over_flow := alu.io.over_flow 

    control_branch.io.PCWrite := control_unit.io.PCWrite 
    control_branch.io.Branch := control_unit.io.Branch

    control_branch.io.Zero := alu.io.Zero 
    
    alu_out.io.in := alu.io.ALUResult
    // _Alu_Out := alu_out.io.out 

    // _Pc_Prime := MuxCase("b0".U(32.W), Array((control_unit.io.PCSrc === 0.U(2.W)) ->  _Alu_Result, (control_unit.io.PCSrc === 1.U(2.W)) ->  _Alu_Out, (control_unit.io.PCSrc === 2.U(2.W)) ->  _Pc_Jump, (control_unit.io.PCSrc === 3.U(2.W)) ->  "h80000180".U(32.W)))

    shifter_sign_imm.io.sign_Imm := _Instr(25,0)
    
}

// Generate the Verilog code
object ProcessorMain extends App {
    println("Generating the hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Processor(), Array("--target-dir", "generated"))
}