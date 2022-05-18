package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class MemoryTest extends AnyFlatSpec with ChiselScalatestTester {

    "MemoryTestt test" should "pass" in {
        test(new Memory()) { dut =>
            val addr = 0.U(32.W)
            var sig_MemWrite = true.B
            val wd = 8.U(32.W)
            dut.io.addr.poke(addr)
            dut.io.MemWrite.poke(sig_MemWrite)
            dut.io.wd.poke(wd)
            println("wd: " + dut.io.wd.peek().toString)
            //sig_MemWrite = false.B
            //dut.io.sig_MemWrite.poke(sig_MemWrite)
            dut.clock.step(1)
            dut.clock.step(1)
            dut.clock.step(1)
            sig_MemWrite = false.B
            dut.io.MemWrite.poke(sig_MemWrite)
            println("wd: " + dut.io.wd.peek().toString)
            println("Mem(0): " + dut.io.rd.peek().toString)
        }
    } 
}