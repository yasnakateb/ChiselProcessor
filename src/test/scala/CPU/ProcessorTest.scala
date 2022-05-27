package CPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class ProcessorTest extends AnyFlatSpec with ChiselScalatestTester {

    "ProcessorTestt test" should "pass" in {
        test(new Processor()) { dut =>
            for(a <- 0 until 100){

                dut.clock.step(1)
                
            }
            
        }
    } 
}