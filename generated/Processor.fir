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

    wire sig_IntCause : UInt<1> @[Processor.scala 12:28]
    wire sig_CauseWrite : UInt<1> @[Processor.scala 13:30]
    wire sig_EPCWrite : UInt<1> @[Processor.scala 14:28]
    wire sig_MemWrite : UInt<1> @[Processor.scala 16:28]
    wire sig_IRWrite : UInt<1> @[Processor.scala 17:27]
    wire sig_RegDst : UInt<1> @[Processor.scala 18:26]
    wire sig_ALUSrcA : UInt<1> @[Processor.scala 19:27]
    wire sig_ALUControl : UInt<3> @[Processor.scala 20:30]
    wire sig_ALUSrcB : UInt<2> @[Processor.scala 21:27]
    wire sig_MemtoReg : UInt<2> @[Processor.scala 22:28]
    wire sig_IorD : UInt<1> @[Processor.scala 23:24]
    wire sig_RegWrite : UInt<1> @[Processor.scala 24:28]
    wire _Int_Cause : UInt<32> @[Processor.scala 25:26]
    wire _Pc_Prime : UInt<32> @[Processor.scala 29:25]
    wire _Adr : UInt<32> @[Processor.scala 30:20]
    wire _Rd : UInt<32> @[Processor.scala 31:19]
    wire _Instr : UInt<32> @[Processor.scala 32:22]
    wire _Data : UInt<32> @[Processor.scala 33:21]
    wire _A3 : UInt<5> @[Processor.scala 34:19]
    wire _Wd3 : UInt<32> @[Processor.scala 35:20]
    wire _Rd1 : UInt<132> @[Processor.scala 36:20]
    wire _Rd2 : UInt<32> @[Processor.scala 37:20]
    wire _Sign_Imm : UInt<32> @[Processor.scala 38:25]
    wire _Reg_A : UInt<32> @[Processor.scala 39:22]
    wire _Reg_B : UInt<32> @[Processor.scala 40:22]
    wire _Src_B : UInt<32> @[Processor.scala 42:22]
    wire _Alu_Result : UInt<32> @[Processor.scala 43:27]
    wire _Pc_Src : UInt<2> @[Processor.scala 44:23]
    wire _Pc_Jump : UInt<32> @[Processor.scala 45:24]
    wire _Pc_Jump_Prime : UInt<28> @[Processor.scala 46:30]
    wire _Alu_Out : UInt<32> @[Processor.scala 47:24]
    wire _over_flow : UInt<1> @[Processor.scala 48:26]
    _over_flow <= UInt<1>("h0") @[Processor.scala 50:16]
    wire _Sign_Imm_Shifted : UInt<32> @[Processor.scala 51:33]
    wire _Epc : UInt<32> @[Processor.scala 52:20]
    wire _C0 : UInt<32> @[Processor.scala 53:19]
    wire _Cause : UInt<32> @[Processor.scala 54:22]
    inst control_unit of ControlUnit @[Processor.scala 56:31]
    control_unit.clock <= clock
    control_unit.reset <= reset
    inst pc of RegisterWithEnable @[Processor.scala 57:21]
    pc.clock <= clock
    pc.reset <= reset
    inst control_branch of ControlBranch @[Processor.scala 58:33]
    control_branch.clock <= clock
    control_branch.reset <= reset
    inst epc of RegisterWithEnable_1 @[Processor.scala 59:23]
    epc.clock <= clock
    epc.reset <= reset
    inst cause of RegisterWithEnable_2 @[Processor.scala 60:24]
    cause.clock <= clock
    cause.reset <= reset
    inst memory of Memory @[Processor.scala 61:26]
    memory.clock <= clock
    memory.reset <= reset
    inst instr of RegisterWithEnable_3 @[Processor.scala 62:25]
    instr.clock <= clock
    instr.reset <= reset
    inst data of Register @[Processor.scala 63:24]
    data.clock <= clock
    data.reset <= reset
    inst register_file of RegisterFile @[Processor.scala 64:32]
    register_file.clock <= clock
    register_file.reset <= reset
    inst sign_extension of SignExtension @[Processor.scala 65:33]
    sign_extension.clock <= clock
    sign_extension.reset <= reset
    inst reg_a of Register_1 @[Processor.scala 66:25]
    reg_a.clock <= clock
    reg_a.reset <= reset
    inst reg_b of Register_2 @[Processor.scala 67:25]
    reg_b.clock <= clock
    reg_b.reset <= reset
    inst shifter of Shifter @[Processor.scala 68:26]
    shifter.clock <= clock
    shifter.reset <= reset
    inst alu of ALU @[Processor.scala 69:22]
    alu.clock <= clock
    alu.reset <= reset
    inst alu_out of Register_3 @[Processor.scala 70:27]
    alu_out.clock <= clock
    alu_out.reset <= reset
    inst shifter_sign_imm of ShifterSignImm @[Processor.scala 71:35]
    shifter_sign_imm.clock <= clock
    shifter_sign_imm.reset <= reset
    node _control_unit_io_instr_Opcode_T = bits(_Instr, 31, 26) @[Processor.scala 73:43]
    control_unit.io.instr_Opcode <= _control_unit_io_instr_Opcode_T @[Processor.scala 73:34]
    node _control_unit_io_instr_Function_T = bits(_Instr, 5, 0) @[Processor.scala 74:45]
    control_unit.io.instr_Function <= _control_unit_io_instr_Function_T @[Processor.scala 74:36]
    control_unit.io.over_flow <= _over_flow @[Processor.scala 75:31]
    sig_MemtoReg <= control_unit.io.MemtoReg @[Processor.scala 76:18]
    sig_RegDst <= control_unit.io.RegDst @[Processor.scala 77:16]
    sig_IorD <= control_unit.io.IorD @[Processor.scala 78:14]
    sig_ALUSrcB <= control_unit.io.ALUSrcB @[Processor.scala 79:17]
    sig_ALUSrcA <= control_unit.io.ALUSrcA @[Processor.scala 80:17]
    sig_IRWrite <= control_unit.io.IRWrite @[Processor.scala 81:17]
    sig_MemWrite <= control_unit.io.MemWrite @[Processor.scala 82:18]
    sig_RegWrite <= control_unit.io.RegWrite @[Processor.scala 83:18]
    sig_ALUControl <= control_unit.io.alu_Control @[Processor.scala 84:20]
    sig_IntCause <= control_unit.io.IntCause @[Processor.scala 85:18]
    sig_CauseWrite <= control_unit.io.CauseWrite @[Processor.scala 86:20]
    sig_EPCWrite <= control_unit.io.EPCWrite @[Processor.scala 87:18]
    io.state <= control_unit.io.state @[Processor.scala 88:14]
    _Pc_Src <= control_unit.io.PCSrc @[Processor.scala 89:13]
    epc.io.enable <= sig_EPCWrite @[Processor.scala 91:19]
    epc.io.in <= pc.io.out @[Processor.scala 92:15]
    _Epc <= epc.io.out @[Processor.scala 93:10]
    node __Int_Cause_T = mux(sig_IntCause, UInt<32>("h28"), UInt<32>("h30")) @[Processor.scala 95:22]
    _Int_Cause <= __Int_Cause_T @[Processor.scala 95:16]
    cause.io.enable <= sig_CauseWrite @[Processor.scala 97:21]
    cause.io.in <= _Int_Cause @[Processor.scala 98:17]
    _Cause <= cause.io.out @[Processor.scala 99:12]
    node __C0_T = bits(_Instr, 15, 11) @[Processor.scala 101:47]
    node __C0_T_1 = eq(__C0_T, UInt<5>("hd")) @[Processor.scala 101:55]
    node __C0_T_2 = bits(_Instr, 15, 11) @[Processor.scala 101:89]
    node __C0_T_3 = eq(__C0_T_2, UInt<5>("hd")) @[Processor.scala 101:97]
    node __C0_T_4 = mux(__C0_T_3, _Epc, UInt<2>("h0")) @[Mux.scala 101:16]
    node __C0_T_5 = mux(__C0_T_1, _Cause, __C0_T_4) @[Mux.scala 101:16]
    _C0 <= __C0_T_5 @[Processor.scala 101:9]
    node __Adr_T = mux(sig_IorD, _Alu_Out, pc.io.out) @[Processor.scala 103:16]
    _Adr <= __Adr_T @[Processor.scala 103:10]
    memory.io.MemWrite <= sig_MemWrite @[Processor.scala 105:24]
    memory.io.addr <= _Adr @[Processor.scala 106:20]
    memory.io.wd <= _Reg_B @[Processor.scala 107:18]
    _Rd <= memory.io.rd @[Processor.scala 108:9]
    instr.io.enable <= sig_IRWrite @[Processor.scala 110:21]
    instr.io.in <= _Rd @[Processor.scala 111:17]
    _Instr <= instr.io.out @[Processor.scala 112:12]
    data.io.in <= _Rd @[Processor.scala 114:16]
    _Data <= data.io.out @[Processor.scala 115:11]
    node __A3_T = bits(_Instr, 15, 11) @[Processor.scala 117:34]
    node __A3_T_1 = bits(_Instr, 20, 16) @[Processor.scala 117:49]
    node __A3_T_2 = mux(sig_RegDst, __A3_T, __A3_T_1) @[Processor.scala 117:15]
    _A3 <= __A3_T_2 @[Processor.scala 117:9]
    node __Wd3_T = eq(sig_MemtoReg, UInt<2>("h0")) @[Processor.scala 119:55]
    node __Wd3_T_1 = eq(sig_MemtoReg, UInt<2>("h1")) @[Processor.scala 119:97]
    node __Wd3_T_2 = eq(sig_MemtoReg, UInt<2>("h2")) @[Processor.scala 119:136]
    node __Wd3_T_3 = eq(sig_MemtoReg, UInt<2>("h3")) @[Processor.scala 119:173]
    node __Wd3_T_4 = mux(__Wd3_T_3, UInt<32>("h0"), UInt<32>("h0")) @[Mux.scala 101:16]
    node __Wd3_T_5 = mux(__Wd3_T_2, _C0, __Wd3_T_4) @[Mux.scala 101:16]
    node __Wd3_T_6 = mux(__Wd3_T_1, _Data, __Wd3_T_5) @[Mux.scala 101:16]
    node __Wd3_T_7 = mux(__Wd3_T, _Alu_Out, __Wd3_T_6) @[Mux.scala 101:16]
    _Wd3 <= __Wd3_T_7 @[Processor.scala 119:10]
    node _register_file_io_src1_T = bits(_Instr, 25, 21) @[Processor.scala 121:36]
    register_file.io.src1 <= _register_file_io_src1_T @[Processor.scala 121:27]
    node _register_file_io_src2_T = bits(_Instr, 20, 16) @[Processor.scala 122:36]
    register_file.io.src2 <= _register_file_io_src2_T @[Processor.scala 122:27]
    register_file.io.src3 <= _A3 @[Processor.scala 123:27]
    register_file.io.wd <= _Wd3 @[Processor.scala 124:25]
    register_file.io.write_data <= sig_RegWrite @[Processor.scala 125:33]
    _Rd1 <= register_file.io.rd1 @[Processor.scala 126:10]
    _Rd2 <= register_file.io.rd2 @[Processor.scala 127:10]
    node _sign_extension_io_immidiate_T = bits(_Instr, 15, 0) @[Processor.scala 129:42]
    sign_extension.io.immidiate <= _sign_extension_io_immidiate_T @[Processor.scala 129:33]
    _Sign_Imm <= sign_extension.io.sign_Imm @[Processor.scala 130:15]
    reg_a.io.in <= _Rd1 @[Processor.scala 132:17]
    _Reg_A <= reg_a.io.out @[Processor.scala 133:12]
    reg_b.io.in <= _Rd2 @[Processor.scala 135:17]
    _Reg_B <= reg_b.io.out @[Processor.scala 136:12]
    node __Src_B_T = eq(sig_ALUSrcB, UInt<2>("h0")) @[Processor.scala 138:56]
    node __Src_B_T_1 = eq(sig_ALUSrcB, UInt<2>("h1")) @[Processor.scala 138:95]
    node __Src_B_T_2 = eq(sig_ALUSrcB, UInt<2>("h2")) @[Processor.scala 138:137]
    node __Src_B_T_3 = eq(sig_ALUSrcB, UInt<2>("h3")) @[Processor.scala 138:179]
    node __Src_B_T_4 = mux(__Src_B_T_3, _Sign_Imm_Shifted, UInt<32>("h0")) @[Mux.scala 101:16]
    node __Src_B_T_5 = mux(__Src_B_T_2, _Sign_Imm, __Src_B_T_4) @[Mux.scala 101:16]
    node __Src_B_T_6 = mux(__Src_B_T_1, UInt<32>("h4"), __Src_B_T_5) @[Mux.scala 101:16]
    node __Src_B_T_7 = mux(__Src_B_T, _Reg_B, __Src_B_T_6) @[Mux.scala 101:16]
    _Src_B <= __Src_B_T_7 @[Processor.scala 138:12]
    shifter.io.sign_Imm <= _Sign_Imm @[Processor.scala 140:25]
    _Sign_Imm_Shifted <= shifter.io.shifted_Sign_Imm @[Processor.scala 141:23]
    pc.io.enable <= UInt<1>("h1") @[Processor.scala 144:18]
    pc.io.in <= _Pc_Prime @[Processor.scala 146:14]
    node __Pc_Jump_T = bits(pc.io.out, 31, 28) @[Processor.scala 147:26]
    node __Pc_Jump_T_1 = bits(_Pc_Jump_Prime, 27, 0) @[Processor.scala 147:51]
    node __Pc_Jump_T_2 = cat(__Pc_Jump_T, __Pc_Jump_T_1) @[Processor.scala 147:34]
    _Pc_Jump <= __Pc_Jump_T_2 @[Processor.scala 147:14]
    node _alu_io_SrcA_T = mux(sig_ALUSrcA, _Reg_A, pc.io.out) @[Processor.scala 149:23]
    alu.io.SrcA <= _alu_io_SrcA_T @[Processor.scala 149:17]
    alu.io.SrcB <= _Src_B @[Processor.scala 150:17]
    alu.io.ALUControl <= sig_ALUControl @[Processor.scala 151:23]
    _Alu_Result <= alu.io.ALUResult @[Processor.scala 152:17]
    _over_flow <= alu.io.over_flow @[Processor.scala 154:16]
    control_branch.io.PCWrite <= control_unit.io.PCWrite @[Processor.scala 156:31]
    control_branch.io.Branch <= control_unit.io.Branch @[Processor.scala 157:30]
    control_branch.io.Zero <= alu.io.Zero @[Processor.scala 159:28]
    alu_out.io.in <= _Alu_Result @[Processor.scala 161:19]
    _Alu_Out <= alu_out.io.out @[Processor.scala 162:14]
    node __Pc_Prime_T = eq(_Pc_Src, UInt<2>("h0")) @[Processor.scala 164:55]
    node __Pc_Prime_T_1 = eq(_Pc_Src, UInt<2>("h1")) @[Processor.scala 164:95]
    node __Pc_Prime_T_2 = eq(_Pc_Src, UInt<2>("h2")) @[Processor.scala 164:132]
    node __Pc_Prime_T_3 = eq(_Pc_Src, UInt<2>("h3")) @[Processor.scala 164:169]
    node __Pc_Prime_T_4 = mux(__Pc_Prime_T_3, UInt<32>("h80000180"), UInt<32>("h0")) @[Mux.scala 101:16]
    node __Pc_Prime_T_5 = mux(__Pc_Prime_T_2, _Pc_Jump, __Pc_Prime_T_4) @[Mux.scala 101:16]
    node __Pc_Prime_T_6 = mux(__Pc_Prime_T_1, _Alu_Out, __Pc_Prime_T_5) @[Mux.scala 101:16]
    node __Pc_Prime_T_7 = mux(__Pc_Prime_T, _Alu_Result, __Pc_Prime_T_6) @[Mux.scala 101:16]
    _Pc_Prime <= __Pc_Prime_T_7 @[Processor.scala 164:15]
    node _shifter_sign_imm_io_sign_Imm_T = bits(_Instr, 25, 0) @[Processor.scala 166:43]
    shifter_sign_imm.io.sign_Imm <= _shifter_sign_imm_io_sign_Imm_T @[Processor.scala 166:34]
    _Pc_Jump_Prime <= shifter_sign_imm.io.shifted_Sign_Imm @[Processor.scala 167:20]

