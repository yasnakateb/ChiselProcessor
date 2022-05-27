module Memory(
  input         clock,
  input         reset,
  input         io_MemWrite,
  input  [31:0] io_addr,
  input  [31:0] io_wd,
  output [31:0] io_rd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:255]; // @[Memory.scala 14:26]
  wire  ram_rdwrPort_r_en; // @[Memory.scala 14:26]
  wire [7:0] ram_rdwrPort_r_addr; // @[Memory.scala 14:26]
  wire [31:0] ram_rdwrPort_r_data; // @[Memory.scala 14:26]
  wire [31:0] ram_rdwrPort_w_data; // @[Memory.scala 14:26]
  wire [7:0] ram_rdwrPort_w_addr; // @[Memory.scala 14:26]
  wire  ram_rdwrPort_w_mask; // @[Memory.scala 14:26]
  wire  ram_rdwrPort_w_en; // @[Memory.scala 14:26]
  reg  ram_rdwrPort_r_en_pipe_0;
  reg [7:0] ram_rdwrPort_r_addr_pipe_0;
  assign ram_rdwrPort_r_en = ram_rdwrPort_r_en_pipe_0;
  assign ram_rdwrPort_r_addr = ram_rdwrPort_r_addr_pipe_0;
  assign ram_rdwrPort_r_data = ram[ram_rdwrPort_r_addr]; // @[Memory.scala 14:26]
  assign ram_rdwrPort_w_data = io_wd;
  assign ram_rdwrPort_w_addr = io_addr[7:0];
  assign ram_rdwrPort_w_mask = io_MemWrite;
  assign ram_rdwrPort_w_en = 1'h1 & io_MemWrite;
  assign io_rd = ram_rdwrPort_r_data; // @[Memory.scala 22:24 28:15]
  always @(posedge clock) begin
    if (ram_rdwrPort_w_en & ram_rdwrPort_w_mask) begin
      ram[ram_rdwrPort_w_addr] <= ram_rdwrPort_w_data; // @[Memory.scala 14:26]
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
  integer initvar;
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
  ram_rdwrPort_r_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  ram_rdwrPort_r_addr_pipe_0 = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("../../../rams_init_file.data", ram);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
