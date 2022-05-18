module ControlUnit(
  input        clock,
  input        reset,
  input  [5:0] io_instr_Opcode,
  input  [5:0] io_instr_Function,
  input        io_over_flow,
  output [1:0] io_sig_MemtoReg,
  output       io_sig_RegDst,
  output       io_sig_IorD,
  output [1:0] io_sig_PCSrc,
  output [1:0] io_sig_ALUSrcB,
  output       io_sig_ALUSrcA,
  output       io_sig_IRWrite,
  output       io_sig_MemWrite,
  output       io_sig_PCWrite,
  output       io_sig_Branch,
  output       io_sig_RegWrite,
  output       io_sig_IntCause,
  output       io_sig_CauseWrite,
  output       io_sig_EPCWrite,
  output [3:0] io_state,
  output [2:0] io_alu_Control
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] stateReg; // @[ControlUnit.scala 66:28]
  wire  _T_3 = io_instr_Opcode == 6'h10; // @[ControlUnit.scala 79:41]
  wire  _T_6 = io_instr_Opcode == 6'h2b; // @[ControlUnit.scala 91:41]
  wire  _T_7 = io_instr_Opcode == 6'h23; // @[ControlUnit.scala 95:41]
  wire [3:0] _GEN_0 = _T_3 ? 4'he : 4'hc; // @[ControlUnit.scala 101:26 105:26 99:51]
  wire [3:0] _GEN_1 = io_instr_Opcode == 6'h23 ? 4'h2 : _GEN_0; // @[ControlUnit.scala 95:49 97:26]
  wire [3:0] _GEN_2 = io_instr_Opcode == 6'h2b ? 4'h2 : _GEN_1; // @[ControlUnit.scala 91:49 93:26]
  wire [3:0] _GEN_3 = io_instr_Opcode == 6'h0 ? 4'h6 : _GEN_2; // @[ControlUnit.scala 87:53 89:26]
  wire [3:0] _GEN_4 = io_instr_Opcode == 6'h4 ? 4'h8 : _GEN_3; // @[ControlUnit.scala 83:50 85:26]
  wire [3:0] _GEN_5 = io_instr_Opcode == 6'h10 ? 4'h9 : _GEN_4; // @[ControlUnit.scala 79:51 81:26]
  wire [3:0] _GEN_7 = _T_7 ? 4'h3 : stateReg; // @[ControlUnit.scala 114:49 116:26 66:28]
  wire [3:0] _GEN_8 = _T_6 ? 4'h5 : _GEN_7; // @[ControlUnit.scala 110:43 112:26]
  wire [3:0] _GEN_9 = io_over_flow ? 4'hd : 4'h7; // @[ControlUnit.scala 135:33 137:26 141:26]
  wire [3:0] _GEN_10 = 4'he == stateReg ? 4'h0 : stateReg; // @[ControlUnit.scala 182:22 68:23 66:28]
  wire [3:0] _GEN_11 = 4'hd == stateReg ? 4'h0 : _GEN_10; // @[ControlUnit.scala 177:22 68:23]
  wire [3:0] _GEN_12 = 4'hc == stateReg ? 4'h0 : _GEN_11; // @[ControlUnit.scala 172:22 68:23]
  wire [3:0] _GEN_13 = 4'hb == stateReg ? 4'h0 : _GEN_12; // @[ControlUnit.scala 167:22 68:23]
  wire [3:0] _GEN_14 = 4'ha == stateReg ? 4'h0 : _GEN_13; // @[ControlUnit.scala 162:22 68:23]
  wire [3:0] _GEN_15 = 4'h9 == stateReg ? 4'ha : _GEN_14; // @[ControlUnit.scala 157:22 68:23]
  wire [3:0] _GEN_16 = 4'h8 == stateReg ? 4'h0 : _GEN_15; // @[ControlUnit.scala 152:22 68:23]
  wire [3:0] _GEN_17 = 4'h7 == stateReg ? 4'h0 : _GEN_16; // @[ControlUnit.scala 147:22 68:23]
  wire [3:0] _GEN_18 = 4'h6 == stateReg ? _GEN_9 : _GEN_17; // @[ControlUnit.scala 68:23]
  wire [3:0] _GEN_19 = 4'h5 == stateReg ? 4'h0 : _GEN_18; // @[ControlUnit.scala 131:22 68:23]
  wire [3:0] _GEN_20 = 4'h4 == stateReg ? 4'h0 : _GEN_19; // @[ControlUnit.scala 126:22 68:23]
  wire [3:0] _GEN_21 = 4'h3 == stateReg ? 4'h4 : _GEN_20; // @[ControlUnit.scala 121:22 68:23]
  wire  _io_sig_ALUSrcA_T = stateReg == 4'h9; // @[ControlUnit.scala 192:37]
  wire  _io_sig_ALUSrcA_T_1 = stateReg == 4'h8; // @[ControlUnit.scala 192:63]
  wire  _io_sig_ALUSrcA_T_3 = stateReg == 4'h6; // @[ControlUnit.scala 192:89]
  wire  _io_sig_ALUSrcA_T_5 = stateReg == 4'h2; // @[ControlUnit.scala 192:115]
  wire  _io_sig_ALUSrcB_T = stateReg == 4'h0; // @[ControlUnit.scala 194:61]
  wire  _io_sig_ALUSrcB_T_1 = stateReg == 4'h1; // @[ControlUnit.scala 194:101]
  wire  _io_sig_ALUSrcB_T_4 = _io_sig_ALUSrcA_T | _io_sig_ALUSrcA_T_5; // @[ControlUnit.scala 194:155]
  wire [1:0] _io_sig_ALUSrcB_T_5 = _io_sig_ALUSrcB_T_4 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _io_sig_ALUSrcB_T_6 = _io_sig_ALUSrcB_T_1 ? 2'h3 : _io_sig_ALUSrcB_T_5; // @[Mux.scala 101:16]
  wire [1:0] _alu_Op_T_2 = _io_sig_ALUSrcA_T_3 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] alu_Op = _io_sig_ALUSrcA_T_1 ? 2'h1 : _alu_Op_T_2; // @[Mux.scala 101:16]
  wire  _io_sig_PCSrc_T = stateReg == 4'hc; // @[ControlUnit.scala 198:60]
  wire  _io_sig_PCSrc_T_1 = stateReg == 4'hd; // @[ControlUnit.scala 198:87]
  wire  _io_sig_PCSrc_T_2 = stateReg == 4'hc | stateReg == 4'hd; // @[ControlUnit.scala 198:74]
  wire  _io_sig_PCSrc_T_3 = stateReg == 4'hb; // @[ControlUnit.scala 198:130]
  wire [1:0] _io_sig_PCSrc_T_5 = _io_sig_ALUSrcA_T_1 ? 2'h1 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _io_sig_PCSrc_T_6 = _io_sig_PCSrc_T_3 ? 2'h2 : _io_sig_PCSrc_T_5; // @[Mux.scala 101:16]
  wire  _io_sig_RegDst_T = stateReg == 4'h7; // @[ControlUnit.scala 206:35]
  wire  _io_sig_MemtoReg_T = stateReg == 4'h4; // @[ControlUnit.scala 208:62]
  wire  _io_sig_MemtoReg_T_1 = stateReg == 4'he; // @[ControlUnit.scala 208:103]
  wire [1:0] _io_sig_MemtoReg_T_2 = _io_sig_MemtoReg_T_1 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _GEN_34 = {{1'd0}, alu_Op[1]}; // @[ControlUnit.scala 231:27]
  wire [2:0] _GEN_25 = 6'h26 == io_instr_Function ? 3'h5 : 3'h0; // @[ControlUnit.scala 221:20 233:34 261:32]
  wire [2:0] _GEN_26 = 6'h2a == io_instr_Function ? 3'h7 : _GEN_25; // @[ControlUnit.scala 233:34 256:32]
  wire [2:0] _GEN_27 = 6'h25 == io_instr_Function ? 3'h1 : _GEN_26; // @[ControlUnit.scala 233:34 251:32]
  wire [2:0] _GEN_28 = 6'h24 == io_instr_Function ? 3'h0 : _GEN_27; // @[ControlUnit.scala 233:34 246:32]
  wire [2:0] _GEN_29 = 6'h22 == io_instr_Function ? 3'h6 : _GEN_28; // @[ControlUnit.scala 233:34 241:32]
  wire [2:0] _GEN_30 = 6'h20 == io_instr_Function ? 3'h2 : _GEN_29; // @[ControlUnit.scala 233:34 236:32]
  wire [2:0] _GEN_31 = _GEN_34 == 2'h2 ? _GEN_30 : 3'h0; // @[ControlUnit.scala 221:20 231:36]
  wire [2:0] _GEN_32 = ~alu_Op[0] ? 3'h6 : _GEN_31; // @[ControlUnit.scala 227:36 229:24]
  assign io_sig_MemtoReg = _io_sig_MemtoReg_T ? 2'h1 : _io_sig_MemtoReg_T_2; // @[Mux.scala 101:16]
  assign io_sig_RegDst = stateReg == 4'h7; // @[ControlUnit.scala 206:35]
  assign io_sig_IorD = stateReg == 4'h5 | stateReg == 4'h3; // @[ControlUnit.scala 190:47]
  assign io_sig_PCSrc = _io_sig_PCSrc_T_2 ? 2'h3 : _io_sig_PCSrc_T_6; // @[Mux.scala 101:16]
  assign io_sig_ALUSrcB = _io_sig_ALUSrcB_T ? 2'h1 : _io_sig_ALUSrcB_T_6; // @[Mux.scala 101:16]
  assign io_sig_ALUSrcA = stateReg == 4'h9 | stateReg == 4'h8 | stateReg == 4'h6 | stateReg == 4'h2; // @[ControlUnit.scala 192:102]
  assign io_sig_IRWrite = stateReg == 4'h0; // @[ControlUnit.scala 200:36]
  assign io_sig_MemWrite = stateReg == 4'h5; // @[ControlUnit.scala 212:37]
  assign io_sig_PCWrite = _io_sig_ALUSrcB_T | _io_sig_PCSrc_T_3 | _io_sig_PCSrc_T | _io_sig_PCSrc_T_1; // @[ControlUnit.scala 202:124]
  assign io_sig_Branch = stateReg == 4'h8; // @[ControlUnit.scala 204:35]
  assign io_sig_RegWrite = _io_sig_MemtoReg_T | _io_sig_RegDst_T | stateReg == 4'ha | _io_sig_MemtoReg_T_1; // @[ControlUnit.scala 210:124]
  assign io_sig_IntCause = stateReg == 4'hc; // @[ControlUnit.scala 214:37]
  assign io_sig_CauseWrite = _io_sig_PCSrc_T | _io_sig_PCSrc_T_1; // @[ControlUnit.scala 216:54]
  assign io_sig_EPCWrite = _io_sig_PCSrc_T_3 | _io_sig_PCSrc_T; // @[ControlUnit.scala 218:52]
  assign io_state = stateReg; // @[ControlUnit.scala 220:14]
  assign io_alu_Control = alu_Op == 2'h0 ? 3'h2 : _GEN_32; // @[ControlUnit.scala 223:27 225:24]
  always @(posedge clock) begin
    if (reset) begin // @[ControlUnit.scala 66:28]
      stateReg <= 4'h0; // @[ControlUnit.scala 66:28]
    end else if (4'h0 == stateReg) begin // @[ControlUnit.scala 68:23]
      stateReg <= 4'h1; // @[ControlUnit.scala 71:22]
    end else if (4'h1 == stateReg) begin // @[ControlUnit.scala 68:23]
      if (io_instr_Opcode == 6'h2) begin // @[ControlUnit.scala 75:42]
        stateReg <= 4'hb; // @[ControlUnit.scala 77:26]
      end else begin
        stateReg <= _GEN_5;
      end
    end else if (4'h2 == stateReg) begin // @[ControlUnit.scala 68:23]
      stateReg <= _GEN_8;
    end else begin
      stateReg <= _GEN_21;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
