// Code your design here
module ram_single_port(
  output reg [7:0] q,
  input [7:0] data,
  input [5:0] read_addr,write_addr,
  input write_enable,clk
);
  reg [7:0] ram[63:0]; //64*8 bit ram
  // old data read and new data write
  always@(posedge clk)
    begin
      if(write_enable)
        ram[write_addr] <= data;
      q <= ram[read_addr];
    end
endmodule
