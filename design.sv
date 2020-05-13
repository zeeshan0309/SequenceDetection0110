// Code your design here

module seq_detect(output y, input in, clk, rst);  //searching for "0110"
  reg y;
  reg [0:1] ps, ns ;  //ps- present state ns- next state
  parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;  //parameters for state;
  
  always@(ps, in, rst) begin     //block for assignment of states based upon input;
    if(rst) begin
      ps = S0;
    end else begin
      case(ps)
        S0: begin			//S0: seen "nothing" state;
          ns = in?S0:S1;
        end
        S1: begin			//S1: seen "0" state;
          ns = in?S2:S1;
        end
        S2: begin			//S2: seen "01" state;
          ns = in?S3:S1;
        end
        S3: begin			//S3: seen "011" state;
          ns = in?S0:S1;
        end
        default: begin
          ns = S0;
        end
      endcase
    end
  end
 
  
  always@(posedge clk, posedge rst) begin     //assignment of states and output in sync with clock;
    ps <= ns;
    y <= ({ps,~in}==3'b111)?1:0;
  end
endmodule