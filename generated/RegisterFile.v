module RegisterFile(
  input         clock,
  input         reset,
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
      if (5'h0 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_0 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_1 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h2 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_2 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h3 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_3 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h4 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_4 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h5 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_5 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h6 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_6 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h7 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_7 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h8 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_8 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h9 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_9 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'ha == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_10 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'hb == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_11 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'hc == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_12 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'hd == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_13 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'he == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_14 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'hf == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_15 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h10 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_16 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h11 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_17 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h12 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_18 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h13 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_19 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h14 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_20 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h15 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_21 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h16 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_22 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h17 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_23 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h18 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_24 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h19 == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_25 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1a == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_26 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1b == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_27 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1c == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_28 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1d == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_29 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1e == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_30 <= io_wd; // @[RegisterFile.scala 20:31]
      end
    end
    if (io_write_data) begin // @[RegisterFile.scala 19:26]
      if (5'h1f == io_src3) begin // @[RegisterFile.scala 20:31]
        registerFile_31 <= io_wd; // @[RegisterFile.scala 20:31]
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
