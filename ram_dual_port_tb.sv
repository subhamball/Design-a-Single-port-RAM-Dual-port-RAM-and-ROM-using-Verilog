// Code your testbench here
// or browse Examples
module ram_dual_port_tb;
  
  reg [7:0] data_a,data_b; //input data
  reg [5:0] addr_a,addr_b; // port a, port b
  reg we_a,we_b;// enable signal for port a and port b
  reg clk;
  wire [7:0] q_a,q_b; //output data at port a and port b
  
  ram_dual_port rdp(.q_a(q_a),.q_b(q_b),.data_a(data_a),.data_b(data_b),.addr_a(addr_a),.addr_b(addr_b),.we_a(we_a),.we_b(we_b),.clk(clk));
  
  initial begin
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
  initial begin
    clk = 1'b1;
    
    data_a = 8'h33;
    addr_a = 6'h01;
    
    data_b = 8'h44;
    addr_b = 6'h02;
    
    we_a = 1'b1;
    we_b = 1'b1;
    #10;
    
    data_a = 8'h55;
    addr_a = 6'h03;
    addr_b = 6'h01;
    we_b = 1'b0;
    #10;
    
    addr_a = 6'h02;
    addr_b = 6'h03;
    we_a = 1'b0;
    #10;
    
    addr_a = 6'h01;
    data_b = 8'h77;
    addr_b = 6'h02;
    we_b = 1'b1;
    #30 $finish;
  end
endmodule
      
    
    
    
    
    
  
  
