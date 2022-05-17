circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip SrcA : UInt<32>, flip SrcB : UInt<32>, flip ALUControl : UInt<3>, ALUResult : UInt<32>, Zero : UInt<1>}

    io.ALUResult <= UInt<1>("h0") @[ALU.scala 25:18]
    node _T = eq(io.ALUControl, UInt<3>("h0")) @[ALU.scala 26:25]
    when _T : @[ALU.scala 26:34]
      node _io_ALUResult_T = and(io.SrcA, io.SrcB) @[ALU.scala 27:31]
      io.ALUResult <= _io_ALUResult_T @[ALU.scala 27:20]
    else :
      node _T_1 = eq(io.ALUControl, UInt<3>("h1")) @[ALU.scala 28:32]
      when _T_1 : @[ALU.scala 28:40]
        node _io_ALUResult_T_1 = or(io.SrcA, io.SrcB) @[ALU.scala 29:31]
        io.ALUResult <= _io_ALUResult_T_1 @[ALU.scala 29:20]
      else :
        node _T_2 = eq(io.ALUControl, UInt<3>("h2")) @[ALU.scala 30:32]
        when _T_2 : @[ALU.scala 30:41]
          node _io_ALUResult_T_2 = add(io.SrcA, io.SrcB) @[ALU.scala 31:31]
          node _io_ALUResult_T_3 = tail(_io_ALUResult_T_2, 1) @[ALU.scala 31:31]
          io.ALUResult <= _io_ALUResult_T_3 @[ALU.scala 31:20]
        else :
          node _T_3 = eq(io.ALUControl, UInt<3>("h5")) @[ALU.scala 32:32]
          when _T_3 : @[ALU.scala 32:41]
            node _io_ALUResult_T_4 = xor(io.SrcA, io.SrcB) @[ALU.scala 33:31]
            io.ALUResult <= _io_ALUResult_T_4 @[ALU.scala 33:20]
          else :
            node _T_4 = eq(io.ALUControl, UInt<3>("h6")) @[ALU.scala 34:32]
            when _T_4 : @[ALU.scala 34:41]
              node _io_ALUResult_T_5 = sub(io.SrcA, io.SrcB) @[ALU.scala 35:31]
              node _io_ALUResult_T_6 = tail(_io_ALUResult_T_5, 1) @[ALU.scala 35:31]
              io.ALUResult <= _io_ALUResult_T_6 @[ALU.scala 35:20]
            else :
              io.ALUResult <= UInt<32>("h0") @[ALU.scala 37:20]
    node _io_Zero_T = eq(io.ALUResult, UInt<1>("h0")) @[ALU.scala 39:33]
    node _io_Zero_T_1 = mux(_io_Zero_T, UInt<1>("h1"), UInt<1>("h0")) @[ALU.scala 39:19]
    io.Zero <= _io_Zero_T_1 @[ALU.scala 39:13]

