package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class ALUTest extends AnyFlatSpec with ChiselScalatestTester {

    "ALUTest test" should "pass" in {
        test(new ALU()) { dut =>
            var SrcA = 5
            var SrcB = 12
            var ALUControl = 2
            dut.io.SrcA.poke(SrcA.U)
            dut.io.SrcB.poke(SrcB.U)
            dut.io.ALUControl.poke(ALUControl.U)
            dut.clock.step(1)
            println("Result: " + dut.io.ALUResult.peek().toString)
            SrcA = 12
            ALUControl = 6
            dut.io.SrcA.poke(SrcA.U)
            dut.io.ALUControl.poke(ALUControl.U)
            dut.clock.step(1)
            println("Result: " + dut.io.ALUResult.peek().toString)
            println("Zero flag: " + dut.io.Zero.peek().toString)

        }
    } 
}