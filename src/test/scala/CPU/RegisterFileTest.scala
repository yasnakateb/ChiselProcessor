package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class RegisterFileTest extends AnyFlatSpec with ChiselScalatestTester {

    "RegisterFileTest test" should "pass" in {
        test(new RegisterFile()) { dut =>
            val wd = 5
            val src3 = 12
            val write_data = true
            val src1 = 12
            dut.io.wd.poke(wd.U)
            dut.io.src3.poke(src3.U)
            dut.io.write_data.poke(write_data.B)
            dut.clock.step(1)
            dut.clock.step(1)
            dut.io.write_data.poke(false.B)
            dut.io.src1.poke(src1.U)
            dut.clock.step(1)
            dut.clock.step(1)
            println("Src1: " + dut.io.rd1.peek().toString)
        }
    } 
}