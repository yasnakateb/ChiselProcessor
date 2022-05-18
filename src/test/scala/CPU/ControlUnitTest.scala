package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class ControlUnitTest extends AnyFlatSpec with ChiselScalatestTester {

    "ControlUnitTest test" should "pass" in {
        test(new ControlUnit()) { dut =>
            
            dut.io.instr_Opcode.poke("b000000".U)
            dut.io.instr_Function.poke("b100000".U)
            dut.clock.step(1)
            println("State: " + dut.io.state.peek().toString)
            println("SrcA: " + dut.io.ALUSrcA.peek().toString)
            println("SrcB: " + dut.io.ALUSrcB.peek().toString)
            
            dut.clock.step(1)
            println("State: " + dut.io.state.peek().toString)
            println("SrcA: " + dut.io.ALUSrcA.peek().toString)
            println("SrcB: " + dut.io.ALUSrcB.peek().toString)
            
            dut.clock.step(1)
            println("State: " + dut.io.state.peek().toString)
            dut.clock.step(1)
            println("State: " + dut.io.state.peek().toString)
            dut.clock.step(1)
            println("State: " + dut.io.state.peek().toString)
            dut.clock.step(1)
            println("State: " + dut.io.state.peek().toString)
            dut.clock.step(1)
            println("State: " + dut.io.state.peek().toString)

        }
    } 
}
