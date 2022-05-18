module Memory(
  input         clock,
  input         reset,
  input         io_sig_MemWrite,
  input  [31:0] io_addr,
  input  [2:0]  io_wd,
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
  assign ram_rdwrPort_w_data = {{29'd0}, io_wd};
  assign ram_rdwrPort_w_addr = io_addr[7:0];
  assign ram_rdwrPort_w_mask = io_sig_MemWrite;
  assign ram_rdwrPort_w_en = 1'h1 & io_sig_MemWrite;
  assign io_rd = ram_rdwrPort_r_data; // @[Memory.scala 16:28 22:15]
  always @(posedge clock) begin
    if (ram_rdwrPort_w_en & ram_rdwrPort_w_mask) begin
      ram[ram_rdwrPort_w_addr] <= ram_rdwrPort_w_data; // @[Memory.scala 13:26]
    end
    ram_rdwrPort_r_en_pipe_0 <= 1'h1 & ~io_sig_MemWrite;
    if (1'h1 & ~io_sig_MemWrite) begin
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
