package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class ShifterTest extends AnyFlatSpec with ChiselScalatestTester {

    "ShifterTest test" should "pass" in {
        test(new Shifter()) { dut =>
            val a = 1.U(32.W)
            dut.io.sign_Imm.poke(a)
            dut.clock.step(1)
            println("Result: " + dut.io.shifted_Sign_Imm.peek().toString)
        }
    } 
}