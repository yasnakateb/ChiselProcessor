circuit Processor :
  module ControlUnit :
    input clock : Clock
    input reset : Reset
    output io : { flip instr_Opcode : UInt<6>, flip instr_Function : UInt<6>, flip over_flow : UInt<1>, MemtoReg : UInt<2>, RegDst : UInt<1>, IorD : UInt<1>, PCSrc : UInt<2>, ALUSrcB : UInt<2>, ALUSrcA : UInt<1>, IRWrite : UInt<1>, MemWrite : UInt<1>, PCWrite : UInt<1>, Branch : UInt<1>, RegWrite : UInt<1>, IntCause : UInt<1>, CauseWrite : UInt<1>, EPCWrite : UInt<1>, state : UInt<4>, alu_Control : UInt<3>}

    reg stateReg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[ControlUnit.scala 64:28]
    node _T = eq(UInt<4>("h0"), stateReg) @[ControlUnit.scala 66:23]
    when _T : @[ControlUnit.scala 66:23]
      stateReg <= UInt<4>("h1") @[ControlUnit.scala 69:22]
    else :
      node _T_1 = eq(UInt<4>("h1"), stateReg) @[ControlUnit.scala 66:23]
      when _T_1 : @[ControlUnit.scala 66:23]
        node _T_2 = eq(io.instr_Opcode, UInt<6>("h2")) @[ControlUnit.scala 73:35]
        when _T_2 : @[ControlUnit.scala 73:42]
          stateReg <= UInt<4>("hb") @[ControlUnit.scala 75:26]
        else :
          node _T_3 = eq(io.instr_Opcode, UInt<6>("h10")) @[ControlUnit.scala 77:41]
          when _T_3 : @[ControlUnit.scala 77:51]
            stateReg <= UInt<4>("h9") @[ControlUnit.scala 79:26]
          else :
            node _T_4 = eq(io.instr_Opcode, UInt<6>("h4")) @[ControlUnit.scala 81:41]
            when _T_4 : @[ControlUnit.scala 81:50]
              stateReg <= UInt<4>("h8") @[ControlUnit.scala 83:26]
            else :
              node _T_5 = eq(io.instr_Opcode, UInt<6>("h0")) @[ControlUnit.scala 85:41]
              when _T_5 : @[ControlUnit.scala 85:53]
                stateReg <= UInt<4>("h6") @[ControlUnit.scala 87:26]
              else :
                node _T_6 = eq(io.instr_Opcode, UInt<6>("h2b")) @[ControlUnit.scala 89:41]
                when _T_6 : @[ControlUnit.scala 89:49]
                  stateReg <= UInt<4>("h2") @[ControlUnit.scala 91:26]
                else :
                  node _T_7 = eq(io.instr_Opcode, UInt<6>("h23")) @[ControlUnit.scala 93:41]
                  when _T_7 : @[ControlUnit.scala 93:49]
                    stateReg <= UInt<4>("h2") @[ControlUnit.scala 95:26]
                  else :
                    node _T_8 = eq(io.instr_Opcode, UInt<6>("h10")) @[ControlUnit.scala 97:41]
                    when _T_8 : @[ControlUnit.scala 97:51]
                      stateReg <= UInt<4>("he") @[ControlUnit.scala 99:26]
                    else :
                      stateReg <= UInt<4>("hc") @[ControlUnit.scala 103:26]
      else :
        node _T_9 = eq(UInt<4>("h2"), stateReg) @[ControlUnit.scala 66:23]
        when _T_9 : @[ControlUnit.scala 66:23]
          node _T_10 = eq(io.instr_Opcode, UInt<6>("h2b")) @[ControlUnit.scala 108:35]
          when _T_10 : @[ControlUnit.scala 108:43]
            stateReg <= UInt<4>("h5") @[ControlUnit.scala 110:26]
          else :
            node _T_11 = eq(io.instr_Opcode, UInt<6>("h23")) @[ControlUnit.scala 112:41]
            when _T_11 : @[ControlUnit.scala 112:49]
              stateReg <= UInt<4>("h3") @[ControlUnit.scala 114:26]
        else :
          node _T_12 = eq(UInt<4>("h3"), stateReg) @[ControlUnit.scala 66:23]
          when _T_12 : @[ControlUnit.scala 66:23]
            stateReg <= UInt<4>("h4") @[ControlUnit.scala 119:22]
          else :
            node _T_13 = eq(UInt<4>("h4"), stateReg) @[ControlUnit.scala 66:23]
            when _T_13 : @[ControlUnit.scala 66:23]
              stateReg <= UInt<4>("h0") @[ControlUnit.scala 124:22]
            else :
              node _T_14 = eq(UInt<4>("h5"), stateReg) @[ControlUnit.scala 66:23]
              when _T_14 : @[ControlUnit.scala 66:23]
                stateReg <= UInt<4>("h0") @[ControlUnit.scala 129:22]
              else :
                node _T_15 = eq(UInt<4>("h6"), stateReg) @[ControlUnit.scala 66:23]
                when _T_15 : @[ControlUnit.scala 66:23]
                  when io.over_flow : @[ControlUnit.scala 133:33]
                    stateReg <= UInt<4>("hd") @[ControlUnit.scala 135:26]
                  else :
                    stateReg <= UInt<4>("h7") @[ControlUnit.scala 139:26]
                else :
                  node _T_16 = eq(UInt<4>("h7"), stateReg) @[ControlUnit.scala 66:23]
                  when _T_16 : @[ControlUnit.scala 66:23]
                    stateReg <= UInt<4>("h0") @[ControlUnit.scala 145:22]
                  else :
                    node _T_17 = eq(UInt<4>("h8"), stateReg) @[ControlUnit.scala 66:23]
                    when _T_17 : @[ControlUnit.scala 66:23]
                      stateReg <= UInt<4>("h0") @[ControlUnit.scala 150:22]
                    else :
                      node _T_18 = eq(UInt<4>("h9"), stateReg) @[ControlUnit.scala 66:23]
                      when _T_18 : @[ControlUnit.scala 66:23]
                        stateReg <= UInt<4>("ha") @[ControlUnit.scala 155:22]
                      else :
                        node _T_19 = eq(UInt<4>("ha"), stateReg) @[ControlUnit.scala 66:23]
                        when _T_19 : @[ControlUnit.scala 66:23]
                          stateReg <= UInt<4>("h0") @[ControlUnit.scala 160:22]
                        else :
                          node _T_20 = eq(UInt<4>("hb"), stateReg) @[ControlUnit.scala 66:23]
                          when _T_20 : @[ControlUnit.scala 66:23]
                            stateReg <= UInt<4>("h0") @[ControlUnit.scala 165:22]
                          else :
                            node _T_21 = eq(UInt<4>("hc"), stateReg) @[ControlUnit.scala 66:23]
                            when _T_21 : @[ControlUnit.scala 66:23]
                              stateReg <= UInt<4>("h0") @[ControlUnit.scala 170:22]
                            else :
                              node _T_22 = eq(UInt<4>("hd"), stateReg) @[ControlUnit.scala 66:23]
                              when _T_22 : @[ControlUnit.scala 66:23]
                                stateReg <= UInt<4>("h0") @[ControlUnit.scala 175:22]
                              else :
                                node _T_23 = eq(UInt<4>("he"), stateReg) @[ControlUnit.scala 66:23]
                                when _T_23 : @[ControlUnit.scala 66:23]
                                  stateReg <= UInt<4>("h0") @[ControlUnit.scala 180:22]
    wire ALUOp : UInt<2> @[ControlUnit.scala 185:21]
    node _io_IorD_T = eq(stateReg, UInt<4>("h5")) @[ControlUnit.scala 187:30]
    node _io_IorD_T_1 = eq(stateReg, UInt<4>("h3")) @[ControlUnit.scala 187:56]
    node _io_IorD_T_2 = or(_io_IorD_T, _io_IorD_T_1) @[ControlUnit.scala 187:43]
    node _io_IorD_T_3 = mux(_io_IorD_T_2, UInt<1>("h1"), UInt<1>("h0")) @[ControlUnit.scala 187:19]
    io.IorD <= _io_IorD_T_3 @[ControlUnit.scala 187:13]
    node _io_ALUSrcA_T = eq(stateReg, UInt<4>("h9")) @[ControlUnit.scala 189:33]
    node _io_ALUSrcA_T_1 = eq(stateReg, UInt<4>("h8")) @[ControlUnit.scala 189:59]
    node _io_ALUSrcA_T_2 = or(_io_ALUSrcA_T, _io_ALUSrcA_T_1) @[ControlUnit.scala 189:46]
    node _io_ALUSrcA_T_3 = eq(stateReg, UInt<4>("h6")) @[ControlUnit.scala 189:85]
    node _io_ALUSrcA_T_4 = or(_io_ALUSrcA_T_2, _io_ALUSrcA_T_3) @[ControlUnit.scala 189:72]
    node _io_ALUSrcA_T_5 = eq(stateReg, UInt<4>("h2")) @[ControlUnit.scala 189:111]
    node _io_ALUSrcA_T_6 = or(_io_ALUSrcA_T_4, _io_ALUSrcA_T_5) @[ControlUnit.scala 189:98]
    node _io_ALUSrcA_T_7 = mux(_io_ALUSrcA_T_6, UInt<1>("h1"), UInt<1>("h0")) @[ControlUnit.scala 189:22]
    io.ALUSrcA <= _io_ALUSrcA_T_7 @[ControlUnit.scala 189:16]
    node _io_ALUSrcB_T = eq(stateReg, UInt<4>("h0")) @[ControlUnit.scala 191:57]
    node _io_ALUSrcB_T_1 = eq(stateReg, UInt<4>("h1")) @[ControlUnit.scala 191:97]
    node _io_ALUSrcB_T_2 = eq(stateReg, UInt<4>("h9")) @[ControlUnit.scala 191:138]
    node _io_ALUSrcB_T_3 = eq(stateReg, UInt<4>("h2")) @[ControlUnit.scala 191:164]
    node _io_ALUSrcB_T_4 = or(_io_ALUSrcB_T_2, _io_ALUSrcB_T_3) @[ControlUnit.scala 191:151]
    node _io_ALUSrcB_T_5 = mux(_io_ALUSrcB_T_4, UInt<2>("h2"), UInt<2>("h0")) @[Mux.scala 101:16]
    node _io_ALUSrcB_T_6 = mux(_io_ALUSrcB_T_1, UInt<2>("h3"), _io_ALUSrcB_T_5) @[Mux.scala 101:16]
    node _io_ALUSrcB_T_7 = mux(_io_ALUSrcB_T, UInt<2>("h1"), _io_ALUSrcB_T_6) @[Mux.scala 101:16]
    io.ALUSrcB <= _io_ALUSrcB_T_7 @[ControlUnit.scala 191:16]
    node _ALUOp_T = eq(stateReg, UInt<4>("h8")) @[ControlUnit.scala 193:52]
    node _ALUOp_T_1 = eq(stateReg, UInt<4>("h6")) @[ControlUnit.scala 193:92]
    node _ALUOp_T_2 = mux(_ALUOp_T_1, UInt<2>("h2"), UInt<2>("h0")) @[Mux.scala 101:16]
    node _ALUOp_T_3 = mux(_ALUOp_T, UInt<2>("h1"), _ALUOp_T_2) @[Mux.scala 101:16]
    ALUOp <= _ALUOp_T_3 @[ControlUnit.scala 193:11]
    node _io_PCSrc_T = eq(stateReg, UInt<4>("hc")) @[ControlUnit.scala 195:56]
    node _io_PCSrc_T_1 = eq(stateReg, UInt<4>("hd")) @[ControlUnit.scala 195:83]
    node _io_PCSrc_T_2 = or(_io_PCSrc_T, _io_PCSrc_T_1) @[ControlUnit.scala 195:70]
    node _io_PCSrc_T_3 = eq(stateReg, UInt<4>("hb")) @[ControlUnit.scala 195:126]
    node _io_PCSrc_T_4 = eq(stateReg, UInt<4>("h8")) @[ControlUnit.scala 195:168]
    node _io_PCSrc_T_5 = mux(_io_PCSrc_T_4, UInt<2>("h1"), UInt<2>("h0")) @[Mux.scala 101:16]
    node _io_PCSrc_T_6 = mux(_io_PCSrc_T_3, UInt<2>("h2"), _io_PCSrc_T_5) @[Mux.scala 101:16]
    node _io_PCSrc_T_7 = mux(_io_PCSrc_T_2, UInt<2>("h3"), _io_PCSrc_T_6) @[Mux.scala 101:16]
    io.PCSrc <= _io_PCSrc_T_7 @[ControlUnit.scala 195:14]
    node _io_IRWrite_T = eq(stateReg, UInt<4>("h0")) @[ControlUnit.scala 197:32]
    node _io_IRWrite_T_1 = mux(_io_IRWrite_T, UInt<1>("h1"), UInt<1>("h0")) @[ControlUnit.scala 197:22]
    io.IRWrite <= _io_IRWrite_T_1 @[ControlUnit.scala 197:16]
    node _io_PCWrite_T = eq(stateReg, UInt<4>("h0")) @[ControlUnit.scala 199:53]
    node _io_PCWrite_T_1 = eq(stateReg, UInt<4>("hb")) @[ControlUnit.scala 199:79]
    node _io_PCWrite_T_2 = or(_io_PCWrite_T, _io_PCWrite_T_1) @[ControlUnit.scala 199:66]
    node _io_PCWrite_T_3 = eq(stateReg, UInt<4>("hc")) @[ControlUnit.scala 199:106]
    node _io_PCWrite_T_4 = or(_io_PCWrite_T_2, _io_PCWrite_T_3) @[ControlUnit.scala 199:93]
    node _io_PCWrite_T_5 = eq(stateReg, UInt<4>("hd")) @[ControlUnit.scala 199:133]
    node _io_PCWrite_T_6 = or(_io_PCWrite_T_4, _io_PCWrite_T_5) @[ControlUnit.scala 199:120]
    node _io_PCWrite_T_7 = mux(_io_PCWrite_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Mux.scala 101:16]
    io.PCWrite <= _io_PCWrite_T_7 @[ControlUnit.scala 199:16]
    node _io_Branch_T = eq(stateReg, UInt<4>("h8")) @[ControlUnit.scala 201:31]
    node _io_Branch_T_1 = mux(_io_Branch_T, UInt<1>("h1"), UInt<1>("h0")) @[ControlUnit.scala 201:21]
    io.Branch <= _io_Branch_T_1 @[ControlUnit.scala 201:15]
    node _io_RegDst_T = eq(stateReg, UInt<4>("h7")) @[ControlUnit.scala 203:31]
    node _io_RegDst_T_1 = mux(_io_RegDst_T, UInt<1>("h1"), UInt<1>("h0")) @[ControlUnit.scala 203:21]
    io.RegDst <= _io_RegDst_T_1 @[ControlUnit.scala 203:15]
    node _io_MemtoReg_T = eq(stateReg, UInt<4>("h4")) @[ControlUnit.scala 205:58]
    node _io_MemtoReg_T_1 = eq(stateReg, UInt<4>("he")) @[ControlUnit.scala 205:99]
    node _io_MemtoReg_T_2 = mux(_io_MemtoReg_T_1, UInt<2>("h2"), UInt<2>("h0")) @[Mux.scala 101:16]
    node _io_MemtoReg_T_3 = mux(_io_MemtoReg_T, UInt<2>("h1"), _io_MemtoReg_T_2) @[Mux.scala 101:16]
    io.MemtoReg <= _io_MemtoReg_T_3 @[ControlUnit.scala 205:17]
    node _io_RegWrite_T = eq(stateReg, UInt<4>("h4")) @[ControlUnit.scala 207:54]
    node _io_RegWrite_T_1 = eq(stateReg, UInt<4>("h7")) @[ControlUnit.scala 207:80]
    node _io_RegWrite_T_2 = or(_io_RegWrite_T, _io_RegWrite_T_1) @[ControlUnit.scala 207:67]
    node _io_RegWrite_T_3 = eq(stateReg, UInt<4>("ha")) @[ControlUnit.scala 207:106]
    node _io_RegWrite_T_4 = or(_io_RegWrite_T_2, _io_RegWrite_T_3) @[ControlUnit.scala 207:93]
    node _io_RegWrite_T_5 = eq(stateReg, UInt<4>("he")) @[ControlUnit.scala 207:133]
    node _io_RegWrite_T_6 = or(_io_RegWrite_T_4, _io_RegWrite_T_5) @[ControlUnit.scala 207:120]
    node _io_RegWrite_T_7 = mux(_io_RegWrite_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Mux.scala 101:16]
    io.RegWrite <= _io_RegWrite_T_7 @[ControlUnit.scala 207:17]
    node _io_MemWrite_T = eq(stateReg, UInt<4>("h5")) @[ControlUnit.scala 209:33]
    node _io_MemWrite_T_1 = mux(_io_MemWrite_T, UInt<1>("h1"), UInt<1>("h0")) @[ControlUnit.scala 209:23]
    io.MemWrite <= _io_MemWrite_T_1 @[ControlUnit.scala 209:17]
    node _io_IntCause_T = eq(stateReg, UInt<4>("hc")) @[ControlUnit.scala 211:33]
    node _io_IntCause_T_1 = mux(_io_IntCause_T, UInt<1>("h1"), UInt<1>("h0")) @[ControlUnit.scala 211:23]
    io.IntCause <= _io_IntCause_T_1 @[ControlUnit.scala 211:17]
    node _io_CauseWrite_T = eq(stateReg, UInt<4>("hc")) @[ControlUnit.scala 213:36]
    node _io_CauseWrite_T_1 = eq(stateReg, UInt<4>("hd")) @[ControlUnit.scala 213:63]
    node _io_CauseWrite_T_2 = or(_io_CauseWrite_T, _io_CauseWrite_T_1) @[ControlUnit.scala 213:50]
    node _io_CauseWrite_T_3 = mux(_io_CauseWrite_T_2, UInt<1>("h1"), UInt<1>("h0")) @[ControlUnit.scala 213:25]
    io.CauseWrite <= _io_CauseWrite_T_3 @[ControlUnit.scala 213:19]
    node _io_EPCWrite_T = eq(stateReg, UInt<4>("hb")) @[ControlUnit.scala 215:34]
    node _io_EPCWrite_T_1 = eq(stateReg, UInt<4>("hc")) @[ControlUnit.scala 215:61]
    node _io_EPCWrite_T_2 = or(_io_EPCWrite_T, _io_EPCWrite_T_1) @[ControlUnit.scala 215:48]
    node _io_EPCWrite_T_3 = mux(_io_EPCWrite_T_2, UInt<1>("h1"), UInt<1>("h0")) @[ControlUnit.scala 215:23]
    io.EPCWrite <= _io_EPCWrite_T_3 @[ControlUnit.scala 215:17]
    io.state <= stateReg @[ControlUnit.scala 217:14]
    io.alu_Control <= UInt<3>("h0") @[ControlUnit.scala 218:20]
    node _T_24 = eq(ALUOp, UInt<1>("h0")) @[ControlUnit.scala 220:17]
    when _T_24 : @[ControlUnit.scala 220:26]
      io.alu_Control <= UInt<3>("h2") @[ControlUnit.scala 222:24]
    else :
      node _T_25 = bits(ALUOp, 0, 0) @[ControlUnit.scala 224:22]
      node _T_26 = eq(_T_25, UInt<1>("h0")) @[ControlUnit.scala 224:26]
      when _T_26 : @[ControlUnit.scala 224:35]
        io.alu_Control <= UInt<3>("h6") @[ControlUnit.scala 226:24]
      else :
        node _T_27 = bits(ALUOp, 1, 1) @[ControlUnit.scala 228:22]
        node _T_28 = eq(_T_27, UInt<2>("h2")) @[ControlUnit.scala 228:26]
        when _T_28 : @[ControlUnit.scala 228:35]
          node _T_29 = eq(UInt<6>("h20"), io.instr_Function) @[ControlUnit.scala 230:34]
          when _T_29 : @[ControlUnit.scala 230:34]
            io.alu_Control <= UInt<3>("h2") @[ControlUnit.scala 233:32]
          else :
            node _T_30 = eq(UInt<6>("h22"), io.instr_Function) @[ControlUnit.scala 230:34]
            when _T_30 : @[ControlUnit.scala 230:34]
              io.alu_Control <= UInt<3>("h6") @[ControlUnit.scala 238:32]
            else :
              node _T_31 = eq(UInt<6>("h24"), io.instr_Function) @[ControlUnit.scala 230:34]
              when _T_31 : @[ControlUnit.scala 230:34]
                io.alu_Control <= UInt<3>("h0") @[ControlUnit.scala 243:32]
              else :
                node _T_32 = eq(UInt<6>("h25"), io.instr_Function) @[ControlUnit.scala 230:34]
                when _T_32 : @[ControlUnit.scala 230:34]
                  io.alu_Control <= UInt<3>("h1") @[ControlUnit.scala 248:32]
                else :
                  node _T_33 = eq(UInt<6>("h2a"), io.instr_Function) @[ControlUnit.scala 230:34]
                  when _T_33 : @[ControlUnit.scala 230:34]
                    io.alu_Control <= UInt<3>("h7") @[ControlUnit.scala 253:32]
                  else :
                    node _T_34 = eq(UInt<6>("h26"), io.instr_Function) @[ControlUnit.scala 230:34]
                    when _T_34 : @[ControlUnit.scala 230:34]
                      io.alu_Control <= UInt<3>("h5") @[ControlUnit.scala 258:32]

  module RegisterWithEnable :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, flip enable : UInt<1>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[RegisterWithEnable.scala 12:23]
    reg <= io.in @[RegisterWithEnable.scala 13:9]
    io.out <= UInt<1>("h0") @[RegisterWithEnable.scala 14:12]
    when io.enable : @[RegisterWithEnable.scala 15:20]
      io.out <= reg @[RegisterWithEnable.scala 17:16]

  module ControlBranch :
    input clock : Clock
    input reset : Reset
    output io : { flip PCWrite : UInt<1>, flip Branch : UInt<1>, flip Zero : UInt<1>, PCEn : UInt<1>}

    node _io_PCEn_T = and(io.Zero, io.Branch) @[ControlBranch.scala 13:25]
    node _io_PCEn_T_1 = or(_io_PCEn_T, io.PCWrite) @[ControlBranch.scala 13:38]
    io.PCEn <= _io_PCEn_T_1 @[ControlBranch.scala 13:13]

  module RegisterWithEnable_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, flip enable : UInt<1>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[RegisterWithEnable.scala 12:23]
    reg <= io.in @[RegisterWithEnable.scala 13:9]
    io.out <= UInt<1>("h0") @[RegisterWithEnable.scala 14:12]
    when io.enable : @[RegisterWithEnable.scala 15:20]
      io.out <= reg @[RegisterWithEnable.scala 17:16]

  module RegisterWithEnable_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, flip enable : UInt<1>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[RegisterWithEnable.scala 12:23]
    reg <= io.in @[RegisterWithEnable.scala 13:9]
    io.out <= UInt<1>("h0") @[RegisterWithEnable.scala 14:12]
    when io.enable : @[RegisterWithEnable.scala 15:20]
      io.out <= reg @[RegisterWithEnable.scala 17:16]

  module Memory :
    input clock : Clock
    input reset : Reset
    output io : { flip MemWrite : UInt<1>, flip addr : UInt<32>, flip wd : UInt<32>, rd : UInt<32>}

    smem ram : UInt<32> [256] @[Memory.scala 13:26]
    io.rd is invalid @[Memory.scala 14:11]
    node _rdwrPort_T = bits(io.addr, 7, 0) @[Memory.scala 15:23]
    infer mport rdwrPort = ram[_rdwrPort_T], clock @[Memory.scala 15:23]
    when io.MemWrite : @[Memory.scala 16:24]
      rdwrPort <= io.wd @[Memory.scala 18:18]
    else :
      io.rd <= rdwrPort @[Memory.scala 22:15]

  module RegisterWithEnable_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, flip enable : UInt<1>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[RegisterWithEnable.scala 12:23]
    reg <= io.in @[RegisterWithEnable.scala 13:9]
    io.out <= UInt<1>("h0") @[RegisterWithEnable.scala 14:12]
    when io.enable : @[RegisterWithEnable.scala 15:20]
      io.out <= reg @[RegisterWithEnable.scala 17:16]

  module Register :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Register.scala 11:23]
    reg <= io.in @[Register.scala 12:9]
    io.out <= reg @[Register.scala 13:12]

  module RegisterFile :
    input clock : Clock
    input reset : Reset
    output io : { flip src1 : UInt<5>, flip src2 : UInt<5>, flip src3 : UInt<5>, flip wd : UInt<32>, flip write_data : UInt<1>, rd1 : UInt<32>, rd2 : UInt<32>}

    reg registerFile : UInt<32>[32], clock with :
      reset => (UInt<1>("h0"), registerFile) @[RegisterFile.scala 16:27]
    io.rd1 <= registerFile[io.src1] @[RegisterFile.scala 17:12]
    io.rd2 <= registerFile[io.src2] @[RegisterFile.scala 18:12]
    when io.write_data : @[RegisterFile.scala 19:26]
      registerFile[io.src3] <= io.wd @[RegisterFile.scala 21:31]

  module SignExtension :
    input clock : Clock
    input reset : Reset
    output io : { flip immidiate : UInt<16>, sign_Imm : UInt<32>}

    node sign_bit = bits(io.immidiate, 15, 15) @[SignExtension.scala 11:32]
    wire ways_vector : UInt<1>[16] @[SignExtension.scala 12:27]
    ways_vector[0] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[1] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[2] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[3] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[4] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[5] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[6] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[7] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[8] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[9] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[10] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[11] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[12] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[13] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[14] <= sign_bit @[SignExtension.scala 15:22]
    ways_vector[15] <= sign_bit @[SignExtension.scala 15:22]
    node sign_bits_lo_lo_lo = cat(ways_vector[1], ways_vector[0]) @[SignExtension.scala 17:33]
    node sign_bits_lo_lo_hi = cat(ways_vector[3], ways_vector[2]) @[SignExtension.scala 17:33]
    node sign_bits_lo_lo = cat(sign_bits_lo_lo_hi, sign_bits_lo_lo_lo) @[SignExtension.scala 17:33]
    node sign_bits_lo_hi_lo = cat(ways_vector[5], ways_vector[4]) @[SignExtension.scala 17:33]
    node sign_bits_lo_hi_hi = cat(ways_vector[7], ways_vector[6]) @[SignExtension.scala 17:33]
    node sign_bits_lo_hi = cat(sign_bits_lo_hi_hi, sign_bits_lo_hi_lo) @[SignExtension.scala 17:33]
    node sign_bits_lo = cat(sign_bits_lo_hi, sign_bits_lo_lo) @[SignExtension.scala 17:33]
    node sign_bits_hi_lo_lo = cat(ways_vector[9], ways_vector[8]) @[SignExtension.scala 17:33]
    node sign_bits_hi_lo_hi = cat(ways_vector[11], ways_vector[10]) @[SignExtension.scala 17:33]
    node sign_bits_hi_lo = cat(sign_bits_hi_lo_hi, sign_bits_hi_lo_lo) @[SignExtension.scala 17:33]
    node sign_bits_hi_hi_lo = cat(ways_vector[13], ways_vector[12]) @[SignExtension.scala 17:33]
    node sign_bits_hi_hi_hi = cat(ways_vector[15], ways_vector[14]) @[SignExtension.scala 17:33]
    node sign_bits_hi_hi = cat(sign_bits_hi_hi_hi, sign_bits_hi_hi_lo) @[SignExtension.scala 17:33]
    node sign_bits_hi = cat(sign_bits_hi_hi, sign_bits_hi_lo) @[SignExtension.scala 17:33]
    node sign_bits = cat(sign_bits_hi, sign_bits_lo) @[SignExtension.scala 17:33]
    node _io_sign_Imm_T = cat(sign_bits, io.immidiate) @[Cat.scala 31:58]
    io.sign_Imm <= _io_sign_Imm_T @[SignExtension.scala 18:17]

  module Register_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Register.scala 11:23]
    reg <= io.in @[Register.scala 12:9]
    io.out <= reg @[Register.scala 13:12]

  module Register_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Register.scala 11:23]
    reg <= io.in @[Register.scala 12:9]
    io.out <= reg @[Register.scala 13:12]

  module Shifter :
    input clock : Clock
    input reset : Reset
    output io : { flip sign_Imm : UInt<32>, shifted_Sign_Imm : UInt<32>}

    node _io_shifted_Sign_Imm_T = shl(io.sign_Imm, 2) @[Shifter.scala 11:40]
    io.shifted_Sign_Imm <= _io_shifted_Sign_Imm_T @[Shifter.scala 11:25]

  module ALU :
    input clock : Clock
    input reset : Reset
    output io : { flip SrcA : UInt<32>, flip SrcB : UInt<32>, flip ALUControl : UInt<3>, ALUResult : UInt<32>, Zero : UInt<1>, over_flow : UInt<1>}

    io.ALUResult <= UInt<1>("h0") @[ALU.scala 26:18]
    node _T = eq(io.ALUControl, UInt<3>("h0")) @[ALU.scala 27:25]
    when _T : @[ALU.scala 27:34]
      node _io_ALUResult_T = and(io.SrcA, io.SrcB) @[ALU.scala 29:31]
      io.ALUResult <= _io_ALUResult_T @[ALU.scala 29:20]
    else :
      node _T_1 = eq(io.ALUControl, UInt<3>("h1")) @[ALU.scala 31:32]
      when _T_1 : @[ALU.scala 31:40]
        node _io_ALUResult_T_1 = or(io.SrcA, io.SrcB) @[ALU.scala 33:31]
        io.ALUResult <= _io_ALUResult_T_1 @[ALU.scala 33:20]
      else :
        node _T_2 = eq(io.ALUControl, UInt<3>("h2")) @[ALU.scala 35:32]
        when _T_2 : @[ALU.scala 35:41]
          node _io_ALUResult_T_2 = add(io.SrcA, io.SrcB) @[ALU.scala 37:31]
          node _io_ALUResult_T_3 = tail(_io_ALUResult_T_2, 1) @[ALU.scala 37:31]
          io.ALUResult <= _io_ALUResult_T_3 @[ALU.scala 37:20]
        else :
          node _T_3 = eq(io.ALUControl, UInt<3>("h5")) @[ALU.scala 39:32]
          when _T_3 : @[ALU.scala 39:41]
            node _io_ALUResult_T_4 = xor(io.SrcA, io.SrcB) @[ALU.scala 41:31]
            io.ALUResult <= _io_ALUResult_T_4 @[ALU.scala 41:20]
          else :
            node _T_4 = eq(io.ALUControl, UInt<3>("h6")) @[ALU.scala 43:32]
            when _T_4 : @[ALU.scala 43:41]
              node _io_ALUResult_T_5 = sub(io.SrcA, io.SrcB) @[ALU.scala 45:31]
              node _io_ALUResult_T_6 = tail(_io_ALUResult_T_5, 1) @[ALU.scala 45:31]
              io.ALUResult <= _io_ALUResult_T_6 @[ALU.scala 45:20]
            else :
              io.ALUResult <= UInt<32>("h0") @[ALU.scala 49:20]
    node _io_Zero_T = eq(io.ALUResult, UInt<1>("h0")) @[ALU.scala 52:33]
    node _io_Zero_T_1 = mux(_io_Zero_T, UInt<1>("h1"), UInt<1>("h0")) @[ALU.scala 52:19]
    io.Zero <= _io_Zero_T_1 @[ALU.scala 52:13]
    io.over_flow <= UInt<1>("h0") @[ALU.scala 55:18]

  module Register_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, out : UInt<32>}

    reg reg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[Register.scala 11:23]
    reg <= io.in @[Register.scala 12:9]
    io.out <= reg @[Register.scala 13:12]

  module ShifterSignImm :
    input clock : Clock
    input reset : Reset
    output io : { flip sign_Imm : UInt<26>, shifted_Sign_Imm : UInt<28>}

    node _io_shifted_Sign_Imm_T = cat(io.sign_Imm, UInt<2>("h0")) @[ShifterSignImm.scala 11:40]
    io.shifted_Sign_Imm <= _io_shifted_Sign_Imm_T @[ShifterSignImm.scala 11:25]

  module Processor :
    input clock : Clock
    input reset : UInt<1>
    output io : { state : UInt<4>}

    inst control_unit of ControlUnit @[Processor.scala 11:31]
    control_unit.clock <= clock
    control_unit.reset <= reset
    inst pc of RegisterWithEnable @[Processor.scala 12:21]
    pc.clock <= clock
    pc.reset <= reset
    inst control_branch of ControlBranch @[Processor.scala 13:33]
    control_branch.clock <= clock
    control_branch.reset <= reset
    inst epc of RegisterWithEnable_1 @[Processor.scala 14:23]
    epc.clock <= clock
    epc.reset <= reset
    inst cause of RegisterWithEnable_2 @[Processor.scala 15:24]
    cause.clock <= clock
    cause.reset <= reset
    inst memory of Memory @[Processor.scala 16:26]
    memory.clock <= clock
    memory.reset <= reset
    inst instr of RegisterWithEnable_3 @[Processor.scala 17:25]
    instr.clock <= clock
    instr.reset <= reset
    inst data of Register @[Processor.scala 18:24]
    data.clock <= clock
    data.reset <= reset
    inst register_file of RegisterFile @[Processor.scala 19:32]
    register_file.clock <= clock
    register_file.reset <= reset
    inst sign_extension of SignExtension @[Processor.scala 20:33]
    sign_extension.clock <= clock
    sign_extension.reset <= reset
    inst reg_a of Register_1 @[Processor.scala 21:25]
    reg_a.clock <= clock
    reg_a.reset <= reset
    inst reg_b of Register_2 @[Processor.scala 22:25]
    reg_b.clock <= clock
    reg_b.reset <= reset
    inst shifter of Shifter @[Processor.scala 23:26]
    shifter.clock <= clock
    shifter.reset <= reset
    inst alu of ALU @[Processor.scala 24:22]
    alu.clock <= clock
    alu.reset <= reset
    inst alu_out of Register_3 @[Processor.scala 25:27]
    alu_out.clock <= clock
    alu_out.reset <= reset
    inst shifter_sign_imm of ShifterSignImm @[Processor.scala 26:35]
    shifter_sign_imm.clock <= clock
    shifter_sign_imm.reset <= reset
    pc.io.enable <= control_branch.io.PCEn @[Processor.scala 28:18]
    node _memory_io_addr_T = mux(control_unit.io.IorD, alu_out.io.out, pc.io.out) @[Processor.scala 29:26]
    memory.io.addr <= _memory_io_addr_T @[Processor.scala 29:20]
    memory.io.MemWrite <= control_unit.io.MemWrite @[Processor.scala 31:24]
    memory.io.wd <= reg_b.io.out @[Processor.scala 32:18]
    instr.io.in <= memory.io.rd @[Processor.scala 33:17]
    instr.io.enable <= control_unit.io.IRWrite @[Processor.scala 34:21]
    reg _Instr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Processor.scala 39:26]
    _Instr <= instr.io.out @[Processor.scala 41:12]
    node _control_unit_io_instr_Opcode_T = bits(_Instr, 31, 26) @[Processor.scala 43:43]
    control_unit.io.instr_Opcode <= _control_unit_io_instr_Opcode_T @[Processor.scala 43:34]
    node _control_unit_io_instr_Function_T = bits(_Instr, 5, 0) @[Processor.scala 44:45]
    control_unit.io.instr_Function <= _control_unit_io_instr_Function_T @[Processor.scala 44:36]
    control_unit.io.over_flow <= alu.io.over_flow @[Processor.scala 45:31]
    io.state <= control_unit.io.state @[Processor.scala 59:14]
    epc.io.enable <= control_unit.io.EPCWrite @[Processor.scala 62:19]
    epc.io.in <= pc.io.out @[Processor.scala 63:15]
    cause.io.enable <= control_unit.io.CauseWrite @[Processor.scala 68:21]
    node _cause_io_in_T = mux(control_unit.io.IntCause, UInt<32>("h28"), UInt<32>("h30")) @[Processor.scala 69:23]
    cause.io.in <= _cause_io_in_T @[Processor.scala 69:17]
    _Instr <= instr.io.out @[Processor.scala 72:12]
    node __C0_T = bits(_Instr, 15, 11) @[Processor.scala 73:50]
    node __C0_T_1 = eq(__C0_T, UInt<5>("hd")) @[Processor.scala 73:58]
    node __C0_T_2 = bits(_Instr, 15, 11) @[Processor.scala 73:98]
    node __C0_T_3 = eq(__C0_T_2, UInt<5>("hd")) @[Processor.scala 73:106]
    node __C0_T_4 = mux(__C0_T_3, epc.io.out, UInt<2>("h0")) @[Mux.scala 101:16]
    node _C0 = mux(__C0_T_1, cause.io.out, __C0_T_4) @[Mux.scala 101:16]
    memory.io.MemWrite <= control_unit.io.MemWrite @[Processor.scala 77:24]
    node _memory_io_addr_T_1 = mux(control_unit.io.IorD, alu_out.io.out, pc.io.out) @[Processor.scala 78:26]
    memory.io.addr <= _memory_io_addr_T_1 @[Processor.scala 78:20]
    memory.io.wd <= reg_b.io.out @[Processor.scala 79:18]
    instr.io.enable <= control_unit.io.IRWrite @[Processor.scala 82:21]
    instr.io.in <= memory.io.rd @[Processor.scala 83:17]
    data.io.in <= memory.io.rd @[Processor.scala 86:16]
    node _register_file_io_src1_T = bits(_Instr, 25, 21) @[Processor.scala 93:36]
    register_file.io.src1 <= _register_file_io_src1_T @[Processor.scala 93:27]
    node _register_file_io_src2_T = bits(_Instr, 20, 16) @[Processor.scala 94:36]
    register_file.io.src2 <= _register_file_io_src2_T @[Processor.scala 94:27]
    node _register_file_io_src3_T = bits(_Instr, 15, 11) @[Processor.scala 95:64]
    node _register_file_io_src3_T_1 = bits(_Instr, 20, 16) @[Processor.scala 95:79]
    node _register_file_io_src3_T_2 = mux(control_unit.io.RegDst, _register_file_io_src3_T, _register_file_io_src3_T_1) @[Processor.scala 95:33]
    register_file.io.src3 <= _register_file_io_src3_T_2 @[Processor.scala 95:27]
    node _register_file_io_wd_T = eq(control_unit.io.MemtoReg, UInt<2>("h0")) @[Processor.scala 96:82]
    node _register_file_io_wd_T_1 = eq(control_unit.io.MemtoReg, UInt<2>("h1")) @[Processor.scala 96:142]
    node _register_file_io_wd_T_2 = eq(control_unit.io.MemtoReg, UInt<2>("h2")) @[Processor.scala 96:199]
    node _register_file_io_wd_T_3 = eq(control_unit.io.MemtoReg, UInt<2>("h3")) @[Processor.scala 96:248]
    node _register_file_io_wd_T_4 = mux(_register_file_io_wd_T_3, UInt<32>("h0"), UInt<32>("h0")) @[Mux.scala 101:16]
    node _register_file_io_wd_T_5 = mux(_register_file_io_wd_T_2, _C0, _register_file_io_wd_T_4) @[Mux.scala 101:16]
    node _register_file_io_wd_T_6 = mux(_register_file_io_wd_T_1, data.io.out, _register_file_io_wd_T_5) @[Mux.scala 101:16]
    node _register_file_io_wd_T_7 = mux(_register_file_io_wd_T, alu_out.io.out, _register_file_io_wd_T_6) @[Mux.scala 101:16]
    register_file.io.wd <= _register_file_io_wd_T_7 @[Processor.scala 96:25]
    register_file.io.write_data <= control_unit.io.RegWrite @[Processor.scala 97:33]
    node _sign_extension_io_immidiate_T = bits(_Instr, 15, 0) @[Processor.scala 101:42]
    sign_extension.io.immidiate <= _sign_extension_io_immidiate_T @[Processor.scala 101:33]
    reg_a.io.in <= register_file.io.rd1 @[Processor.scala 104:17]
    reg_b.io.in <= register_file.io.rd2 @[Processor.scala 107:17]
    shifter.io.sign_Imm <= sign_extension.io.sign_Imm @[Processor.scala 112:25]
    pc.io.enable <= UInt<1>("h1") @[Processor.scala 116:18]
    node __Pc_Jump_T = bits(pc.io.out, 31, 28) @[Processor.scala 119:29]
    node __Pc_Jump_T_1 = bits(shifter_sign_imm.io.shifted_Sign_Imm, 27, 0) @[Processor.scala 119:54]
    node _Pc_Jump = cat(__Pc_Jump_T, __Pc_Jump_T_1) @[Processor.scala 119:37]
    node _pc_io_in_T = eq(control_unit.io.PCSrc, UInt<2>("h0")) @[Processor.scala 121:68]
    node _pc_io_in_T_1 = eq(control_unit.io.PCSrc, UInt<2>("h1")) @[Processor.scala 121:127]
    node _pc_io_in_T_2 = eq(control_unit.io.PCSrc, UInt<2>("h2")) @[Processor.scala 121:184]
    node _pc_io_in_T_3 = eq(control_unit.io.PCSrc, UInt<2>("h3")) @[Processor.scala 121:235]
    node _pc_io_in_T_4 = mux(_pc_io_in_T_3, UInt<32>("h80000180"), UInt<32>("h0")) @[Mux.scala 101:16]
    node _pc_io_in_T_5 = mux(_pc_io_in_T_2, _Pc_Jump, _pc_io_in_T_4) @[Mux.scala 101:16]
    node _pc_io_in_T_6 = mux(_pc_io_in_T_1, alu_out.io.out, _pc_io_in_T_5) @[Mux.scala 101:16]
    node _pc_io_in_T_7 = mux(_pc_io_in_T, alu.io.ALUResult, _pc_io_in_T_6) @[Mux.scala 101:16]
    pc.io.in <= _pc_io_in_T_7 @[Processor.scala 121:14]
    node _alu_io_SrcA_T = mux(control_unit.io.ALUSrcA, reg_a.io.out, pc.io.out) @[Processor.scala 125:23]
    alu.io.SrcA <= _alu_io_SrcA_T @[Processor.scala 125:17]
    node _alu_io_SrcB_T = eq(control_unit.io.ALUSrcB, UInt<2>("h0")) @[Processor.scala 126:73]
    node _alu_io_SrcB_T_1 = eq(control_unit.io.ALUSrcB, UInt<2>("h1")) @[Processor.scala 126:130]
    node _alu_io_SrcB_T_2 = eq(control_unit.io.ALUSrcB, UInt<2>("h2")) @[Processor.scala 126:184]
    node _alu_io_SrcB_T_3 = eq(control_unit.io.ALUSrcB, UInt<2>("h3")) @[Processor.scala 126:255]
    node _alu_io_SrcB_T_4 = mux(_alu_io_SrcB_T_3, shifter.io.shifted_Sign_Imm, UInt<32>("h0")) @[Mux.scala 101:16]
    node _alu_io_SrcB_T_5 = mux(_alu_io_SrcB_T_2, sign_extension.io.sign_Imm, _alu_io_SrcB_T_4) @[Mux.scala 101:16]
    node _alu_io_SrcB_T_6 = mux(_alu_io_SrcB_T_1, UInt<32>("h4"), _alu_io_SrcB_T_5) @[Mux.scala 101:16]
    node _alu_io_SrcB_T_7 = mux(_alu_io_SrcB_T, reg_b.io.out, _alu_io_SrcB_T_6) @[Mux.scala 101:16]
    alu.io.SrcB <= _alu_io_SrcB_T_7 @[Processor.scala 126:17]
    alu.io.ALUControl <= control_unit.io.alu_Control @[Processor.scala 127:23]
    control_branch.io.PCWrite <= control_unit.io.PCWrite @[Processor.scala 132:31]
    control_branch.io.Branch <= control_unit.io.Branch @[Processor.scala 133:30]
    control_branch.io.Zero <= alu.io.Zero @[Processor.scala 135:28]
    alu_out.io.in <= alu.io.ALUResult @[Processor.scala 137:19]
    node _shifter_sign_imm_io_sign_Imm_T = bits(_Instr, 25, 0) @[Processor.scala 142:43]
    shifter_sign_imm.io.sign_Imm <= _shifter_sign_imm_io_sign_Imm_T @[Processor.scala 142:34]

