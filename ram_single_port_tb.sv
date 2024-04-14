// Code your testbench here
// or browse Examples
module ram_single_port_tb;
  
  reg [7:0] data;
  reg [5:0] read_addr,write_addr;
  reg write_enable,clk;
  wire [7:0] q;
  
  ram_single_port rsp(.q(q),.data(data),.read_addr(read_addr),.write_addr(write_addr),.write_enable(write_enable),.clk(clk));
  
  initial begin
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
  initial begin
    clk = 1'b1;
    data = 8'h00;
    write_addr = 6'd0;
    read_addr = 6'd0;
    #10;
    
    data = 8'h01;
    write_addr = 6'd1;
    write_enable = 1'b1;
    #10;
    
    data = 8'h02;
    write_addr = 6'd2;
    #10;
    
    read_addr = 6'd1;
    write_enable = 1'b0;
    #10;
    
    read_addr = 6'd2;
    #10;
    
    data = 8'h03;
    write_addr = 6'd3;
    write_enable = 1'b1;
    #10;
    
    read_addr = 6'd3;
    write_enable = 1'b0;
    #10;
    
  #50 $finish;
  end
  
endmodule
    
    
  
  
