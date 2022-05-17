package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class RegisterTest extends AnyFlatSpec with ChiselScalatestTester {

    "RegisterTest test" should "pass" in {
        test(new Register()) { dut =>
            val in = 5
            dut.io.in.poke(in.U)
            dut.clock.step(1)
            println("Output: " + dut.io.out.peek().toString)
        }
    } 
}