package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class RegisterWithEnableTest extends AnyFlatSpec with ChiselScalatestTester {

    "RegisterWithEnableTest test" should "pass" in {
        test(new RegisterWithEnable()) { dut =>
            val in = 5
            dut.io.in.poke(in.U)
            dut.clock.step(1)
            println("Output: " + dut.io.out.peek().toString)
            val enable = true
            dut.io.enable.poke(enable.B)
            dut.clock.step(1)
            println("Output: " + dut.io.out.peek().toString)
        }
    } 
}