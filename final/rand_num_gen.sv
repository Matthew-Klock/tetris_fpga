module fibonacci_lfsr(
  input  clk,
  input  reset,

  output [2:0] data
);
logic [2:0] data_in ;
//wire feedback = data_in[2] ^ data_in[1] ;


always_ff @ (posedge clk)
  begin
//  if (reset) 
//    data_in <= 3'hf;
//  else
//    data_in <= {data_in[1:0], feedback} ;

  if (reset) 
    data_in <= 3'h0;
  else
    data_in <= data_in+1 ;
  end

  assign data =  (data_in == 3'b111) ? 3'b110 : data_in;
 
endmodule