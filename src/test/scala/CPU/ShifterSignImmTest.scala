package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class ShifterSignImmTest extends AnyFlatSpec with ChiselScalatestTester {

    "ShifterSignImmTest test" should "pass" in {
        test(new ShifterSignImm()) { dut =>
            val a = 1.U(26.W)
            dut.io.sign_Imm.poke(a)
            dut.clock.step(1)
            println("Result: " + dut.io.shifted_Sign_Imm.peek().toString)
        }
    } 
}