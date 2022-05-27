module ControlUnit(
  input        clock,
  input        reset,
  input  [5:0] io_instr_Opcode,
  input  [5:0] io_instr_Function,
  output [1:0] io_MemtoReg,
  output       io_RegDst,
  output       io_IorD,
  output [1:0] io_PCSrc,
  output [1:0] io_ALUSrcB,
  output       io_ALUSrcA,
  output       io_IRWrite,
  output       io_MemWrite,
  output       io_RegWrite,
  output       io_IntCause,
  output       io_CauseWrite,
  output       io_EPCWrite,
  output [3:0] io_state,
  output [2:0] io_alu_Control
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] stateReg; // @[ControlUnit.scala 64:28]
  wire  _T_3 = io_instr_Opcode == 6'h10; // @[ControlUnit.scala 77:41]
  wire  _T_6 = io_instr_Opcode == 6'h2b; // @[ControlUnit.scala 89:41]
  wire  _T_7 = io_instr_Opcode == 6'h23; // @[ControlUnit.scala 93:41]
  wire [3:0] _GEN_0 = _T_3 ? 4'he : 4'hc; // @[ControlUnit.scala 103:26 97:51 99:26]
  wire [3:0] _GEN_1 = io_instr_Opcode == 6'h23 ? 4'h2 : _GEN_0; // @[ControlUnit.scala 93:49 95:26]
  wire [3:0] _GEN_2 = io_instr_Opcode == 6'h2b ? 4'h2 : _GEN_1; // @[ControlUnit.scala 89:49 91:26]
  wire [3:0] _GEN_3 = io_instr_Opcode == 6'h0 ? 4'h6 : _GEN_2; // @[ControlUnit.scala 85:53 87:26]
  wire [3:0] _GEN_4 = io_instr_Opcode == 6'h4 ? 4'h8 : _GEN_3; // @[ControlUnit.scala 81:50 83:26]
  wire [3:0] _GEN_5 = io_instr_Opcode == 6'h10 ? 4'h9 : _GEN_4; // @[ControlUnit.scala 77:51 79:26]
  wire [3:0] _GEN_7 = _T_7 ? 4'h3 : stateReg; // @[ControlUnit.scala 112:49 114:26 64:28]
  wire [3:0] _GEN_8 = _T_6 ? 4'h5 : _GEN_7; // @[ControlUnit.scala 108:43 110:26]
  wire [3:0] _GEN_10 = 4'he == stateReg ? 4'h0 : stateReg; // @[ControlUnit.scala 180:22 66:23 64:28]
  wire [3:0] _GEN_11 = 4'hd == stateReg ? 4'h0 : _GEN_10; // @[ControlUnit.scala 175:22 66:23]
  wire [3:0] _GEN_12 = 4'hc == stateReg ? 4'h0 : _GEN_11; // @[ControlUnit.scala 170:22 66:23]
  wire [3:0] _GEN_13 = 4'hb == stateReg ? 4'h0 : _GEN_12; // @[ControlUnit.scala 165:22 66:23]
  wire [3:0] _GEN_14 = 4'ha == stateReg ? 4'h0 : _GEN_13; // @[ControlUnit.scala 160:22 66:23]
  wire [3:0] _GEN_15 = 4'h9 == stateReg ? 4'ha : _GEN_14; // @[ControlUnit.scala 155:22 66:23]
  wire [3:0] _GEN_16 = 4'h8 == stateReg ? 4'h0 : _GEN_15; // @[ControlUnit.scala 150:22 66:23]
  wire [3:0] _GEN_17 = 4'h7 == stateReg ? 4'h0 : _GEN_16; // @[ControlUnit.scala 145:22 66:23]
  wire [3:0] _GEN_18 = 4'h6 == stateReg ? 4'h7 : _GEN_17; // @[ControlUnit.scala 66:23]
  wire [3:0] _GEN_19 = 4'h5 == stateReg ? 4'h0 : _GEN_18; // @[ControlUnit.scala 129:22 66:23]
  wire [3:0] _GEN_20 = 4'h4 == stateReg ? 4'h0 : _GEN_19; // @[ControlUnit.scala 124:22 66:23]
  wire [3:0] _GEN_21 = 4'h3 == stateReg ? 4'h4 : _GEN_20; // @[ControlUnit.scala 119:22 66:23]
  wire  _io_ALUSrcA_T = stateReg == 4'h9; // @[ControlUnit.scala 189:33]
  wire  _io_ALUSrcA_T_1 = stateReg == 4'h8; // @[ControlUnit.scala 189:59]
  wire  _io_ALUSrcA_T_3 = stateReg == 4'h6; // @[ControlUnit.scala 189:85]
  wire  _io_ALUSrcA_T_5 = stateReg == 4'h2; // @[ControlUnit.scala 189:111]
  wire  _io_ALUSrcB_T = stateReg == 4'h0; // @[ControlUnit.scala 191:57]
  wire  _io_ALUSrcB_T_1 = stateReg == 4'h1; // @[ControlUnit.scala 191:97]
  wire  _io_ALUSrcB_T_4 = _io_ALUSrcA_T | _io_ALUSrcA_T_5; // @[ControlUnit.scala 191:151]
  wire [1:0] _io_ALUSrcB_T_5 = _io_ALUSrcB_T_4 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _io_ALUSrcB_T_6 = _io_ALUSrcB_T_1 ? 2'h3 : _io_ALUSrcB_T_5; // @[Mux.scala 101:16]
  wire [1:0] _ALUOp_T_2 = _io_ALUSrcA_T_3 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] ALUOp = _io_ALUSrcA_T_1 ? 2'h1 : _ALUOp_T_2; // @[Mux.scala 101:16]
  wire  _io_PCSrc_T = stateReg == 4'hc; // @[ControlUnit.scala 195:56]
  wire  _io_PCSrc_T_1 = stateReg == 4'hd; // @[ControlUnit.scala 195:83]
  wire  _io_PCSrc_T_2 = stateReg == 4'hc | stateReg == 4'hd; // @[ControlUnit.scala 195:70]
  wire  _io_PCSrc_T_3 = stateReg == 4'hb; // @[ControlUnit.scala 195:126]
  wire [1:0] _io_PCSrc_T_5 = _io_ALUSrcA_T_1 ? 2'h1 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _io_PCSrc_T_6 = _io_PCSrc_T_3 ? 2'h2 : _io_PCSrc_T_5; // @[Mux.scala 101:16]
  wire  _io_RegDst_T = stateReg == 4'h7; // @[ControlUnit.scala 203:31]
  wire  _io_MemtoReg_T = stateReg == 4'h4; // @[ControlUnit.scala 205:58]
  wire  _io_MemtoReg_T_1 = stateReg == 4'he; // @[ControlUnit.scala 205:99]
  wire [1:0] _io_MemtoReg_T_2 = _io_MemtoReg_T_1 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _GEN_34 = {{1'd0}, ALUOp[1]}; // @[ControlUnit.scala 228:26]
  wire [2:0] _GEN_25 = 6'h26 == io_instr_Function ? 3'h5 : 3'h0; // @[ControlUnit.scala 218:20 230:34 258:32]
  wire [2:0] _GEN_26 = 6'h2a == io_instr_Function ? 3'h7 : _GEN_25; // @[ControlUnit.scala 230:34 253:32]
  wire [2:0] _GEN_27 = 6'h25 == io_instr_Function ? 3'h1 : _GEN_26; // @[ControlUnit.scala 230:34 248:32]
  wire [2:0] _GEN_28 = 6'h24 == io_instr_Function ? 3'h0 : _GEN_27; // @[ControlUnit.scala 230:34 243:32]
  wire [2:0] _GEN_29 = 6'h22 == io_instr_Function ? 3'h6 : _GEN_28; // @[ControlUnit.scala 230:34 238:32]
  wire [2:0] _GEN_30 = 6'h20 == io_instr_Function ? 3'h2 : _GEN_29; // @[ControlUnit.scala 230:34 233:32]
  wire [2:0] _GEN_31 = _GEN_34 == 2'h2 ? _GEN_30 : 3'h0; // @[ControlUnit.scala 218:20 228:35]
  wire [2:0] _GEN_32 = ~ALUOp[0] ? 3'h6 : _GEN_31; // @[ControlUnit.scala 224:35 226:24]
  assign io_MemtoReg = _io_MemtoReg_T ? 2'h1 : _io_MemtoReg_T_2; // @[Mux.scala 101:16]
  assign io_RegDst = stateReg == 4'h7; // @[ControlUnit.scala 203:31]
  assign io_IorD = stateReg == 4'h5 | stateReg == 4'h3; // @[ControlUnit.scala 187:43]
  assign io_PCSrc = _io_PCSrc_T_2 ? 2'h3 : _io_PCSrc_T_6; // @[Mux.scala 101:16]
  assign io_ALUSrcB = _io_ALUSrcB_T ? 2'h1 : _io_ALUSrcB_T_6; // @[Mux.scala 101:16]
  assign io_ALUSrcA = stateReg == 4'h9 | stateReg == 4'h8 | stateReg == 4'h6 | stateReg == 4'h2; // @[ControlUnit.scala 189:98]
  assign io_IRWrite = stateReg == 4'h0; // @[ControlUnit.scala 197:32]
  assign io_MemWrite = stateReg == 4'h5; // @[ControlUnit.scala 209:33]
  assign io_RegWrite = _io_MemtoReg_T | _io_RegDst_T | stateReg == 4'ha | _io_MemtoReg_T_1; // @[ControlUnit.scala 207:120]
  assign io_IntCause = stateReg == 4'hc; // @[ControlUnit.scala 211:33]
  assign io_CauseWrite = _io_PCSrc_T | _io_PCSrc_T_1; // @[ControlUnit.scala 213:50]
  assign io_EPCWrite = _io_PCSrc_T_3 | _io_PCSrc_T; // @[ControlUnit.scala 215:48]
  assign io_state = stateReg; // @[ControlUnit.scala 217:14]
  assign io_alu_Control = ALUOp == 2'h0 ? 3'h2 : _GEN_32; // @[ControlUnit.scala 220:26 222:24]
  always @(posedge clock) begin
    if (reset) begin // @[ControlUnit.scala 64:28]
      stateReg <= 4'h0; // @[ControlUnit.scala 64:28]
    end else if (4'h0 == stateReg) begin // @[ControlUnit.scala 66:23]
      stateReg <= 4'h1; // @[ControlUnit.scala 69:22]
    end else if (4'h1 == stateReg) begin // @[ControlUnit.scala 66:23]
      if (io_instr_Opcode == 6'h2) begin // @[ControlUnit.scala 73:42]
        stateReg <= 4'hb; // @[ControlUnit.scala 75:26]
      end else begin
        stateReg <= _GEN_5;
      end
    end else if (4'h2 == stateReg) begin // @[ControlUnit.scala 66:23]
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
module RegisterWithEnable(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  input         io_enable,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[RegisterWithEnable.scala 12:23]
  assign io_out = io_enable ? reg_ : 32'h0; // @[RegisterWithEnable.scala 14:12 15:20 17:16]
  always @(posedge clock) begin
    if (reset) begin // @[RegisterWithEnable.scala 12:23]
      reg_ <= 32'h0; // @[RegisterWithEnable.scala 12:23]
    end else begin
      reg_ <= io_in; // @[RegisterWithEnable.scala 13:9]
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
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Memory(
  input         clock,
  input         io_MemWrite,
  input  [31:0] io_addr,
  input  [31:0] io_wd,
  output [31:0] io_rd
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:255]; // @[Memory.scala 13:26]
  wire  ram_rdwrPort_r_en; // @[Memory.scala 13:26]
  wire [7:0] ram_rdwrPort_r_addr; // @[Memory.scala 13:26]
  wire [31:0] ram_rdwrPort_r_data; // @[Memory.scala 13:26]
  wire [31:0] ram_rdwrPort_w_data; // @[Memory.scala 13:26]
  wire [7:0] ram_rdwrPort_w_addr; // @[Memory.scala 13:26]
  wire  ram_rdwrPort_w_mask; // @[Memory.scala 13:26]
  wire  ram_rdwrPort_w_en; // @[Memory.scala 13:26]
  reg  ram_rdwrPort_r_en_pipe_0;
  reg [7:0] ram_rdwrPort_r_addr_pipe_0;
  assign ram_rdwrPort_r_en = ram_rdwrPort_r_en_pipe_0;
  assign ram_rdwrPort_r_addr = ram_rdwrPort_r_addr_pipe_0;
  assign ram_rdwrPort_r_data = ram[ram_rdwrPort_r_addr]; // @[Memory.scala 13:26]
  assign ram_rdwrPort_w_data = io_wd;
  assign ram_rdwrPort_w_addr = io_addr[7:0];
  assign ram_rdwrPort_w_mask = io_MemWrite;
  assign ram_rdwrPort_w_en = 1'h1 & io_MemWrite;
  assign io_rd = ram_rdwrPort_r_data; // @[Memory.scala 16:24 22:15]
  always @(posedge clock) begin
    if (ram_rdwrPort_w_en & ram_rdwrPort_w_mask) begin
      ram[ram_rdwrPort_w_addr] <= ram_rdwrPort_w_data; // @[Memory.scala 13:26]
    end
    ram_rdwrPort_r_en_pipe_0 <= 1'h1 & ~io_MemWrite;
    if (1'h1 & ~io_MemWrite) begin
      ram_rdwrPort_r_addr_pipe_0 <= io_addr[7:0];
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_rdwrPort_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_rdwrPort_r_addr_pipe_0 = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Register(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[Register.scala 11:23]
  assign io_out = reg_; // @[Register.scala 13:12]
  always @(posedge clock) begin
    if (reset) begin // @[Register.scala 11:23]
      reg_ <= 32'h0; // @[Register.scala 11:23]
    end else begin
      reg_ <= io_in; // @[Register.scala 12:9]
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
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RegisterFile(
  input         clock,
  input  [4:0]  io_src1,
  input  [4:0]  io_src2,
  input  [4:0]  io_src3,
  input  [31:0] io_wd,
  input         io_write_data,
  output [31:0] io_rd1,
  output [31:0] io_rd2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] registerFile_0; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_1; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_2; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_3; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_4; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_5; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_6; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_7; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_8; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_9; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_10; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_11; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_12; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_13; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_14; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_15; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_16; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_17; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_18; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_19; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_20; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_21; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_22; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_23; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_24; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_25; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_26; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_27; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_28; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_29; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_30; // @[RegisterFile.scala 16:27]
  reg [31:0] registerFile_31; // @[RegisterFile.scala 16:27]
  wire [31:0] _GEN_1 = 5'h1 == io_src1 ? registerFile_1 : registerFile_0; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_2 = 5'h2 == io_src1 ? registerFile_2 : _GEN_1; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_3 = 5'h3 == io_src1 ? registerFile_3 : _GEN_2; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_4 = 5'h4 == io_src1 ? registerFile_4 : _GEN_3; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_5 = 5'h5 == io_src1 ? registerFile_5 : _GEN_4; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_6 = 5'h6 == io_src1 ? registerFile_6 : _GEN_5; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_7 = 5'h7 == io_src1 ? registerFile_7 : _GEN_6; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_8 = 5'h8 == io_src1 ? registerFile_8 : _GEN_7; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_9 = 5'h9 == io_src1 ? registerFile_9 : _GEN_8; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_10 = 5'ha == io_src1 ? registerFile_10 : _GEN_9; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_11 = 5'hb == io_src1 ? registerFile_11 : _GEN_10; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_12 = 5'hc == io_src1 ? registerFile_12 : _GEN_11; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_13 = 5'hd == io_src1 ? registerFile_13 : _GEN_12; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_14 = 5'he == io_src1 ? registerFile_14 : _GEN_13; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_15 = 5'hf == io_src1 ? registerFile_15 : _GEN_14; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_16 = 5'h10 == io_src1 ? registerFile_16 : _GEN_15; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_17 = 5'h11 == io_src1 ? registerFile_17 : _GEN_16; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_18 = 5'h12 == io_src1 ? registerFile_18 : _GEN_17; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_19 = 5'h13 == io_src1 ? registerFile_19 : _GEN_18; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_20 = 5'h14 == io_src1 ? registerFile_20 : _GEN_19; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_21 = 5'h15 == io_src1 ? registerFile_21 : _GEN_20; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_22 = 5'h16 == io_src1 ? registerFile_22 : _GEN_21; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_23 = 5'h17 == io_src1 ? registerFile_23 : _GEN_22; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_24 = 5'h18 == io_src1 ? registerFile_24 : _GEN_23; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_25 = 5'h19 == io_src1 ? registerFile_25 : _GEN_24; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_26 = 5'h1a == io_src1 ? registerFile_26 : _GEN_25; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_27 = 5'h1b == io_src1 ? registerFile_27 : _GEN_26; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_28 = 5'h1c == io_src1 ? registerFile_28 : _GEN_27; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_29 = 5'h1d == io_src1 ? registerFile_29 : _GEN_28; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_30 = 5'h1e == io_src1 ? registerFile_30 : _GEN_29; // @[RegisterFile.scala 17:{12,12}]
  wire [31:0] _GEN_33 = 5'h1 == io_src2 ? registerFile_1 : registerFile_0; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_34 = 5'h2 == io_src2 ? registerFile_2 : _GEN_33; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_35 = 5'h3 == io_src2 ? registerFile_3 : _GEN_34; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_36 = 5'h4 == io_src2 ? registerFile_4 : _GEN_35; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_37 = 5'h5 == io_src2 ? registerFile_5 : _GEN_36; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_38 = 5'h6 == io_src2 ? registerFile_6 : _GEN_37; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_39 = 5'h7 == io_src2 ? registerFile_7 : _GEN_38; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_40 = 5'h8 == io_src2 ? registerFile_8 : _GEN_39; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_41 = 5'h9 == io_src2 ? registerFile_9 : _GEN_40; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_42 = 5'ha == io_src2 ? registerFile_10 : _GEN_41; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_43 = 5'hb == io_src2 ? registerFile_11 : _GEN_42; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_44 = 5'hc == io_src2 ? registerFile_12 : _GEN_43; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_45 = 5'hd == io_src2 ? registerFile_13 : _GEN_44; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_46 = 5'he == io_src2 ? registerFile_14 : _GEN_45; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_47 = 5'hf == io_src2 ? registerFile_15 : _GEN_46; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_48 = 5'h10 == io_src2 ? registerFile_16 : _GEN_47; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_49 = 5'h11 == io_src2 ? registerFile_17 : _GEN_48; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_50 = 5'h12 == io_src2 ? registerFile_18 : _GEN_49; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_51 = 5'h13 == io_src2 ? registerFile_19 : _GEN_50; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_52 = 5'h14 == io_src2 ? registerFile_20 : _GEN_51; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_53 = 5'h15 == io_src2 ? registerFile_21 : _GEN_52; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_54 = 5'h16 == io_src2 ? registerFile_22 : _GEN_53; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_55 = 5'h17 == io_src2 ? registerFile_23 : _GEN_54; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_56 = 5'h18 == io_src2 ? registerFile_24 : _GEN_55; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_57 = 5'h19 == io_src2 ? registerFile_25 : _GEN_56; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_58 = 5'h1a == io_src2 ? registerFile_26 : _GEN_57; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_59 = 5'h1b == io_src2 ? registerFile_27 : _GEN_58; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_60 = 5'h1c == io_src2 ? registerFile_28 : _GEN_59; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_61 = 5'h1d == io_src2 ? registerFile_29 : _GEN_60; // @[RegisterFile.scala 18:{12,12}]
  wire [31:0] _GEN_62 = 5'h1e == io_src2 ? registerFile_30 : _GEN_61; // @[RegisterFile.scala 18:{12,12}]
  assign io_rd1 = 5'h1f == io_src1 ? registerFile_31 : _GEN_30; // @[RegisterFile.scala 17:{12,12}]
  assign io_rd2 = 5'h1f == io_src2 ? registerFile_31 : _GEN_62; // @[RegisterFile.scala 18:{12,12}]
  always @(posedge clock) begin
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h0 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_0 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_1 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h2 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_2 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h3 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_3 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h4 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_4 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h5 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_5 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h6 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_6 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h7 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_7 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h8 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_8 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h9 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_9 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'ha == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_10 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'hb == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_11 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'hc == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_12 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'hd == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_13 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'he == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_14 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'hf == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_15 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h10 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_16 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h11 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_17 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h12 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_18 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h13 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_19 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h14 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_20 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h15 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_21 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h16 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_22 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h17 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_23 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h18 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_24 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h19 == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_25 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1a == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_26 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1b == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_27 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1c == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_28 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1d == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_29 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1e == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_30 <= io_wd; // @[RegisterFile.scala 21:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1f == io_src3) begin // @[RegisterFile.scala 21:31]
        registerFile_31 <= io_wd; // @[RegisterFile.scala 21:31]
      end
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
  registerFile_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  registerFile_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  registerFile_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  registerFile_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  registerFile_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  registerFile_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  registerFile_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  registerFile_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  registerFile_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  registerFile_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  registerFile_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  registerFile_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  registerFile_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  registerFile_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  registerFile_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  registerFile_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  registerFile_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  registerFile_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  registerFile_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  registerFile_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  registerFile_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  registerFile_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  registerFile_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  registerFile_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  registerFile_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  registerFile_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  registerFile_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  registerFile_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  registerFile_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  registerFile_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  registerFile_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  registerFile_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SignExtension(
  input  [15:0] io_immidiate,
  output [31:0] io_sign_Imm
);
  wire  sign_bit = io_immidiate[15]; // @[SignExtension.scala 11:32]
  wire [7:0] sign_bits_lo = {sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit}; // @[SignExtension.scala 17:33]
  wire [15:0] sign_bits = {sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bit,sign_bits_lo}; // @[SignExtension.scala 17:33]
  assign io_sign_Imm = {sign_bits,io_immidiate}; // @[Cat.scala 31:58]
endmodule
module Shifter(
  input  [31:0] io_sign_Imm,
  output [31:0] io_shifted_Sign_Imm
);
  wire [33:0] _io_shifted_Sign_Imm_T = {io_sign_Imm, 2'h0}; // @[Shifter.scala 11:40]
  assign io_shifted_Sign_Imm = _io_shifted_Sign_Imm_T[31:0]; // @[Shifter.scala 11:25]
endmodule
module ALU(
  input  [31:0] io_SrcA,
  input  [31:0] io_SrcB,
  input  [2:0]  io_ALUControl,
  output [31:0] io_ALUResult
);
  wire [31:0] _io_ALUResult_T = io_SrcA & io_SrcB; // @[ALU.scala 29:31]
  wire [31:0] _io_ALUResult_T_1 = io_SrcA | io_SrcB; // @[ALU.scala 33:31]
  wire [31:0] _io_ALUResult_T_3 = io_SrcA + io_SrcB; // @[ALU.scala 37:31]
  wire [31:0] _io_ALUResult_T_4 = io_SrcA ^ io_SrcB; // @[ALU.scala 41:31]
  wire [31:0] _io_ALUResult_T_6 = io_SrcA - io_SrcB; // @[ALU.scala 45:31]
  wire [31:0] _GEN_0 = io_ALUControl == 3'h6 ? _io_ALUResult_T_6 : 32'h0; // @[ALU.scala 43:41 45:20 49:20]
  wire [31:0] _GEN_1 = io_ALUControl == 3'h5 ? _io_ALUResult_T_4 : _GEN_0; // @[ALU.scala 39:41 41:20]
  wire [31:0] _GEN_2 = io_ALUControl == 3'h2 ? _io_ALUResult_T_3 : _GEN_1; // @[ALU.scala 35:41 37:20]
  wire [31:0] _GEN_3 = io_ALUControl == 3'h1 ? _io_ALUResult_T_1 : _GEN_2; // @[ALU.scala 31:40 33:20]
  assign io_ALUResult = io_ALUControl == 3'h0 ? _io_ALUResult_T : _GEN_3; // @[ALU.scala 27:34 29:20]
endmodule
module ShifterSignImm(
  input  [25:0] io_sign_Imm,
  output [27:0] io_shifted_Sign_Imm
);
  assign io_shifted_Sign_Imm = {io_sign_Imm,2'h0}; // @[ShifterSignImm.scala 11:40]
endmodule
module Processor(
  input        clock,
  input        reset,
  output [3:0] io_state
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  control_unit_clock; // @[Processor.scala 11:31]
  wire  control_unit_reset; // @[Processor.scala 11:31]
  wire [5:0] control_unit_io_instr_Opcode; // @[Processor.scala 11:31]
  wire [5:0] control_unit_io_instr_Function; // @[Processor.scala 11:31]
  wire [1:0] control_unit_io_MemtoReg; // @[Processor.scala 11:31]
  wire  control_unit_io_RegDst; // @[Processor.scala 11:31]
  wire  control_unit_io_IorD; // @[Processor.scala 11:31]
  wire [1:0] control_unit_io_PCSrc; // @[Processor.scala 11:31]
  wire [1:0] control_unit_io_ALUSrcB; // @[Processor.scala 11:31]
  wire  control_unit_io_ALUSrcA; // @[Processor.scala 11:31]
  wire  control_unit_io_IRWrite; // @[Processor.scala 11:31]
  wire  control_unit_io_MemWrite; // @[Processor.scala 11:31]
  wire  control_unit_io_RegWrite; // @[Processor.scala 11:31]
  wire  control_unit_io_IntCause; // @[Processor.scala 11:31]
  wire  control_unit_io_CauseWrite; // @[Processor.scala 11:31]
  wire  control_unit_io_EPCWrite; // @[Processor.scala 11:31]
  wire [3:0] control_unit_io_state; // @[Processor.scala 11:31]
  wire [2:0] control_unit_io_alu_Control; // @[Processor.scala 11:31]
  wire  pc_clock; // @[Processor.scala 12:21]
  wire  pc_reset; // @[Processor.scala 12:21]
  wire [31:0] pc_io_in; // @[Processor.scala 12:21]
  wire  pc_io_enable; // @[Processor.scala 12:21]
  wire [31:0] pc_io_out; // @[Processor.scala 12:21]
  wire  epc_clock; // @[Processor.scala 14:23]
  wire  epc_reset; // @[Processor.scala 14:23]
  wire [31:0] epc_io_in; // @[Processor.scala 14:23]
  wire  epc_io_enable; // @[Processor.scala 14:23]
  wire [31:0] epc_io_out; // @[Processor.scala 14:23]
  wire  cause_clock; // @[Processor.scala 15:24]
  wire  cause_reset; // @[Processor.scala 15:24]
  wire [31:0] cause_io_in; // @[Processor.scala 15:24]
  wire  cause_io_enable; // @[Processor.scala 15:24]
  wire [31:0] cause_io_out; // @[Processor.scala 15:24]
  wire  memory_clock; // @[Processor.scala 16:26]
  wire  memory_io_MemWrite; // @[Processor.scala 16:26]
  wire [31:0] memory_io_addr; // @[Processor.scala 16:26]
  wire [31:0] memory_io_wd; // @[Processor.scala 16:26]
  wire [31:0] memory_io_rd; // @[Processor.scala 16:26]
  wire  instr_clock; // @[Processor.scala 17:25]
  wire  instr_reset; // @[Processor.scala 17:25]
  wire [31:0] instr_io_in; // @[Processor.scala 17:25]
  wire  instr_io_enable; // @[Processor.scala 17:25]
  wire [31:0] instr_io_out; // @[Processor.scala 17:25]
  wire  data_clock; // @[Processor.scala 18:24]
  wire  data_reset; // @[Processor.scala 18:24]
  wire [31:0] data_io_in; // @[Processor.scala 18:24]
  wire [31:0] data_io_out; // @[Processor.scala 18:24]
  wire  register_file_clock; // @[Processor.scala 19:32]
  wire [4:0] register_file_io_src1; // @[Processor.scala 19:32]
  wire [4:0] register_file_io_src2; // @[Processor.scala 19:32]
  wire [4:0] register_file_io_src3; // @[Processor.scala 19:32]
  wire [31:0] register_file_io_wd; // @[Processor.scala 19:32]
  wire  register_file_io_write_data; // @[Processor.scala 19:32]
  wire [31:0] register_file_io_rd1; // @[Processor.scala 19:32]
  wire [31:0] register_file_io_rd2; // @[Processor.scala 19:32]
  wire [15:0] sign_extension_io_immidiate; // @[Processor.scala 20:33]
  wire [31:0] sign_extension_io_sign_Imm; // @[Processor.scala 20:33]
  wire  reg_a_clock; // @[Processor.scala 21:25]
  wire  reg_a_reset; // @[Processor.scala 21:25]
  wire [31:0] reg_a_io_in; // @[Processor.scala 21:25]
  wire [31:0] reg_a_io_out; // @[Processor.scala 21:25]
  wire  reg_b_clock; // @[Processor.scala 22:25]
  wire  reg_b_reset; // @[Processor.scala 22:25]
  wire [31:0] reg_b_io_in; // @[Processor.scala 22:25]
  wire [31:0] reg_b_io_out; // @[Processor.scala 22:25]
  wire [31:0] shifter_io_sign_Imm; // @[Processor.scala 23:26]
  wire [31:0] shifter_io_shifted_Sign_Imm; // @[Processor.scala 23:26]
  wire [31:0] alu_io_SrcA; // @[Processor.scala 24:22]
  wire [31:0] alu_io_SrcB; // @[Processor.scala 24:22]
  wire [2:0] alu_io_ALUControl; // @[Processor.scala 24:22]
  wire [31:0] alu_io_ALUResult; // @[Processor.scala 24:22]
  wire  alu_out_clock; // @[Processor.scala 25:27]
  wire  alu_out_reset; // @[Processor.scala 25:27]
  wire [31:0] alu_out_io_in; // @[Processor.scala 25:27]
  wire [31:0] alu_out_io_out; // @[Processor.scala 25:27]
  wire [25:0] shifter_sign_imm_io_sign_Imm; // @[Processor.scala 26:35]
  wire [27:0] shifter_sign_imm_io_shifted_Sign_Imm; // @[Processor.scala 26:35]
  reg [31:0] _Instr; // @[Processor.scala 39:26]
  wire  __C0_T_1 = _Instr[15:11] == 5'hd; // @[Processor.scala 73:58]
  wire [31:0] __C0_T_4 = __C0_T_1 ? epc_io_out : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _C0 = __C0_T_1 ? cause_io_out : __C0_T_4; // @[Mux.scala 101:16]
  wire  _register_file_io_wd_T = control_unit_io_MemtoReg == 2'h0; // @[Processor.scala 96:82]
  wire  _register_file_io_wd_T_1 = control_unit_io_MemtoReg == 2'h1; // @[Processor.scala 96:142]
  wire  _register_file_io_wd_T_2 = control_unit_io_MemtoReg == 2'h2; // @[Processor.scala 96:199]
  wire [31:0] _register_file_io_wd_T_5 = _register_file_io_wd_T_2 ? _C0 : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _register_file_io_wd_T_6 = _register_file_io_wd_T_1 ? data_io_out : _register_file_io_wd_T_5; // @[Mux.scala 101:16]
  wire [27:0] __Pc_Jump_T_1 = shifter_sign_imm_io_shifted_Sign_Imm; // @[Processor.scala 119:54]
  wire [31:0] _Pc_Jump = {pc_io_out[31:28],__Pc_Jump_T_1}; // @[Processor.scala 119:37]
  wire  _pc_io_in_T = control_unit_io_PCSrc == 2'h0; // @[Processor.scala 121:68]
  wire  _pc_io_in_T_1 = control_unit_io_PCSrc == 2'h1; // @[Processor.scala 121:127]
  wire  _pc_io_in_T_2 = control_unit_io_PCSrc == 2'h2; // @[Processor.scala 121:184]
  wire  _pc_io_in_T_3 = control_unit_io_PCSrc == 2'h3; // @[Processor.scala 121:235]
  wire [31:0] _pc_io_in_T_4 = _pc_io_in_T_3 ? 32'h80000180 : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _pc_io_in_T_5 = _pc_io_in_T_2 ? _Pc_Jump : _pc_io_in_T_4; // @[Mux.scala 101:16]
  wire [31:0] _pc_io_in_T_6 = _pc_io_in_T_1 ? alu_out_io_out : _pc_io_in_T_5; // @[Mux.scala 101:16]
  wire  _alu_io_SrcB_T = control_unit_io_ALUSrcB == 2'h0; // @[Processor.scala 126:73]
  wire  _alu_io_SrcB_T_1 = control_unit_io_ALUSrcB == 2'h1; // @[Processor.scala 126:130]
  wire  _alu_io_SrcB_T_2 = control_unit_io_ALUSrcB == 2'h2; // @[Processor.scala 126:184]
  wire  _alu_io_SrcB_T_3 = control_unit_io_ALUSrcB == 2'h3; // @[Processor.scala 126:255]
  wire [31:0] _alu_io_SrcB_T_4 = _alu_io_SrcB_T_3 ? shifter_io_shifted_Sign_Imm : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_SrcB_T_5 = _alu_io_SrcB_T_2 ? sign_extension_io_sign_Imm : _alu_io_SrcB_T_4; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_SrcB_T_6 = _alu_io_SrcB_T_1 ? 32'h4 : _alu_io_SrcB_T_5; // @[Mux.scala 101:16]
  ControlUnit control_unit ( // @[Processor.scala 11:31]
    .clock(control_unit_clock),
    .reset(control_unit_reset),
    .io_instr_Opcode(control_unit_io_instr_Opcode),
    .io_instr_Function(control_unit_io_instr_Function),
    .io_MemtoReg(control_unit_io_MemtoReg),
    .io_RegDst(control_unit_io_RegDst),
    .io_IorD(control_unit_io_IorD),
    .io_PCSrc(control_unit_io_PCSrc),
    .io_ALUSrcB(control_unit_io_ALUSrcB),
    .io_ALUSrcA(control_unit_io_ALUSrcA),
    .io_IRWrite(control_unit_io_IRWrite),
    .io_MemWrite(control_unit_io_MemWrite),
    .io_RegWrite(control_unit_io_RegWrite),
    .io_IntCause(control_unit_io_IntCause),
    .io_CauseWrite(control_unit_io_CauseWrite),
    .io_EPCWrite(control_unit_io_EPCWrite),
    .io_state(control_unit_io_state),
    .io_alu_Control(control_unit_io_alu_Control)
  );
  RegisterWithEnable pc ( // @[Processor.scala 12:21]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_in(pc_io_in),
    .io_enable(pc_io_enable),
    .io_out(pc_io_out)
  );
  RegisterWithEnable epc ( // @[Processor.scala 14:23]
    .clock(epc_clock),
    .reset(epc_reset),
    .io_in(epc_io_in),
    .io_enable(epc_io_enable),
    .io_out(epc_io_out)
  );
  RegisterWithEnable cause ( // @[Processor.scala 15:24]
    .clock(cause_clock),
    .reset(cause_reset),
    .io_in(cause_io_in),
    .io_enable(cause_io_enable),
    .io_out(cause_io_out)
  );
  Memory memory ( // @[Processor.scala 16:26]
    .clock(memory_clock),
    .io_MemWrite(memory_io_MemWrite),
    .io_addr(memory_io_addr),
    .io_wd(memory_io_wd),
    .io_rd(memory_io_rd)
  );
  RegisterWithEnable instr ( // @[Processor.scala 17:25]
    .clock(instr_clock),
    .reset(instr_reset),
    .io_in(instr_io_in),
    .io_enable(instr_io_enable),
    .io_out(instr_io_out)
  );
  Register data ( // @[Processor.scala 18:24]
    .clock(data_clock),
    .reset(data_reset),
    .io_in(data_io_in),
    .io_out(data_io_out)
  );
  RegisterFile register_file ( // @[Processor.scala 19:32]
    .clock(register_file_clock),
    .io_src1(register_file_io_src1),
    .io_src2(register_file_io_src2),
    .io_src3(register_file_io_src3),
    .io_wd(register_file_io_wd),
    .io_write_data(register_file_io_write_data),
    .io_rd1(register_file_io_rd1),
    .io_rd2(register_file_io_rd2)
  );
  SignExtension sign_extension ( // @[Processor.scala 20:33]
    .io_immidiate(sign_extension_io_immidiate),
    .io_sign_Imm(sign_extension_io_sign_Imm)
  );
  Register reg_a ( // @[Processor.scala 21:25]
    .clock(reg_a_clock),
    .reset(reg_a_reset),
    .io_in(reg_a_io_in),
    .io_out(reg_a_io_out)
  );
  Register reg_b ( // @[Processor.scala 22:25]
    .clock(reg_b_clock),
    .reset(reg_b_reset),
    .io_in(reg_b_io_in),
    .io_out(reg_b_io_out)
  );
  Shifter shifter ( // @[Processor.scala 23:26]
    .io_sign_Imm(shifter_io_sign_Imm),
    .io_shifted_Sign_Imm(shifter_io_shifted_Sign_Imm)
  );
  ALU alu ( // @[Processor.scala 24:22]
    .io_SrcA(alu_io_SrcA),
    .io_SrcB(alu_io_SrcB),
    .io_ALUControl(alu_io_ALUControl),
    .io_ALUResult(alu_io_ALUResult)
  );
  Register alu_out ( // @[Processor.scala 25:27]
    .clock(alu_out_clock),
    .reset(alu_out_reset),
    .io_in(alu_out_io_in),
    .io_out(alu_out_io_out)
  );
  ShifterSignImm shifter_sign_imm ( // @[Processor.scala 26:35]
    .io_sign_Imm(shifter_sign_imm_io_sign_Imm),
    .io_shifted_Sign_Imm(shifter_sign_imm_io_shifted_Sign_Imm)
  );
  assign io_state = control_unit_io_state; // @[Processor.scala 59:14]
  assign control_unit_clock = clock;
  assign control_unit_reset = reset;
  assign control_unit_io_instr_Opcode = _Instr[31:26]; // @[Processor.scala 43:43]
  assign control_unit_io_instr_Function = _Instr[5:0]; // @[Processor.scala 44:45]
  assign pc_clock = clock;
  assign pc_reset = reset;
  assign pc_io_in = _pc_io_in_T ? alu_io_ALUResult : _pc_io_in_T_6; // @[Mux.scala 101:16]
  assign pc_io_enable = 1'h1; // @[Processor.scala 116:18]
  assign epc_clock = clock;
  assign epc_reset = reset;
  assign epc_io_in = pc_io_out; // @[Processor.scala 63:15]
  assign epc_io_enable = control_unit_io_EPCWrite; // @[Processor.scala 62:19]
  assign cause_clock = clock;
  assign cause_reset = reset;
  assign cause_io_in = control_unit_io_IntCause ? 32'h28 : 32'h30; // @[Processor.scala 69:23]
  assign cause_io_enable = control_unit_io_CauseWrite; // @[Processor.scala 68:21]
  assign memory_clock = clock;
  assign memory_io_MemWrite = control_unit_io_MemWrite; // @[Processor.scala 77:24]
  assign memory_io_addr = control_unit_io_IorD ? alu_out_io_out : pc_io_out; // @[Processor.scala 78:26]
  assign memory_io_wd = reg_b_io_out; // @[Processor.scala 79:18]
  assign instr_clock = clock;
  assign instr_reset = reset;
  assign instr_io_in = memory_io_rd; // @[Processor.scala 83:17]
  assign instr_io_enable = control_unit_io_IRWrite; // @[Processor.scala 82:21]
  assign data_clock = clock;
  assign data_reset = reset;
  assign data_io_in = memory_io_rd; // @[Processor.scala 86:16]
  assign register_file_clock = clock;
  assign register_file_io_src1 = _Instr[25:21]; // @[Processor.scala 93:36]
  assign register_file_io_src2 = _Instr[20:16]; // @[Processor.scala 94:36]
  assign register_file_io_src3 = control_unit_io_RegDst ? _Instr[15:11] : _Instr[20:16]; // @[Processor.scala 95:33]
  assign register_file_io_wd = _register_file_io_wd_T ? alu_out_io_out : _register_file_io_wd_T_6; // @[Mux.scala 101:16]
  assign register_file_io_write_data = control_unit_io_RegWrite; // @[Processor.scala 97:33]
  assign sign_extension_io_immidiate = _Instr[15:0]; // @[Processor.scala 101:42]
  assign reg_a_clock = clock;
  assign reg_a_reset = reset;
  assign reg_a_io_in = register_file_io_rd1; // @[Processor.scala 104:17]
  assign reg_b_clock = clock;
  assign reg_b_reset = reset;
  assign reg_b_io_in = register_file_io_rd2; // @[Processor.scala 107:17]
  assign shifter_io_sign_Imm = sign_extension_io_sign_Imm; // @[Processor.scala 112:25]
  assign alu_io_SrcA = control_unit_io_ALUSrcA ? reg_a_io_out : pc_io_out; // @[Processor.scala 125:23]
  assign alu_io_SrcB = _alu_io_SrcB_T ? reg_b_io_out : _alu_io_SrcB_T_6; // @[Mux.scala 101:16]
  assign alu_io_ALUControl = control_unit_io_alu_Control; // @[Processor.scala 127:23]
  assign alu_out_clock = clock;
  assign alu_out_reset = reset;
  assign alu_out_io_in = alu_io_ALUResult; // @[Processor.scala 137:19]
  assign shifter_sign_imm_io_sign_Imm = _Instr[25:0]; // @[Processor.scala 142:43]
  always @(posedge clock) begin
    if (reset) begin // @[Processor.scala 39:26]
      _Instr <= 32'h0; // @[Processor.scala 39:26]
    end else begin
      _Instr <= instr_io_out; // @[Processor.scala 72:12]
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
  _Instr = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
