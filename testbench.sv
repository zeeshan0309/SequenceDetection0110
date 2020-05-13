// Code your testbench here
// or browse Examples

module t_seq_detect;
  wire y;
  reg in, clk, rst;
  
  seq_detect M_UUT(y, in, clk, rst);
  
  always
    #5 clk = ~clk;
  
  initial
    begin
      $dumpfile("waveSeq.vcd");
      $dumpvars(0, y, in, clk, rst);
      $monitor($time," clk= %b , rst=%b, in= %b , output= %b ", clk, rst, in, y);
      clk=1'b0; in=1'b0; rst=1'b1;
      #2 rst=1'b0;
      #10 in=1'b1;
      #20 in=1'b0;
      #10 in=1'b1;
      #30 in=1'b0;
      #10 in=1'b1;
      #10 in=1'b0;
      #10 in=1'b1;
      #20 in=1'b0;
      #10 in=1'b1;
      #10 rst=1'b1;
      #10 rst=1'b0; in=1'b0;
      #10 in=1'b1;
      #20 in=1'b0;
      #60 $finish;
    end
endmodule