package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class ControlBranchTest extends AnyFlatSpec with ChiselScalatestTester {

    "ControlBranchTest test" should "pass" in {
        test(new ControlBranch()) { dut =>
            val PCWrite = true.B
            val Branch = true.B
            val Zero = true.B
            dut.io.PCWrite.poke(PCWrite)
            dut.io.Branch.poke(Branch)
            dut.io.Zero.poke(Zero)
            dut.clock.step(1)
            println("Result: " + dut.io.PCEn.peek().toString)
        }
    } 
}