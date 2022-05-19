package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SignExtensionTest extends AnyFlatSpec with ChiselScalatestTester {

    "SignExtensionTest test" should "pass" in {
        test(new SignExtension()) { dut =>
            val immidiate = "b1111_1111_1111_1111".U(16.W)
            dut.io.immidiate.poke(immidiate)
            dut.clock.step(1)
            println("Result: " + dut.io.sign_Imm.peek().toBinaryString)
        }
    } 
}