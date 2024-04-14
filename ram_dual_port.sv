// Code your design here
module ram_dual_port(
  output reg [7:0] q_a, q_b,
  input [7:0] data_a,data_b,
  input [5:0] addr_a,addr_b,
  input we_a,we_b,clk
);
  
  reg [7:0] ram[63:0];//64*8 bit ram
  //port a
  always@(posedge clk)
    begin
      if(we_a)
        ram[addr_a] <= data_a;
      q_a <= ram[addr_b];
    end
  //port b
  always@(posedge clk)
    begin
      if(we_b)
        ram[addr_b] <= data_b;
      q_a <= ram[addr_a];
    end
endmodule
    
