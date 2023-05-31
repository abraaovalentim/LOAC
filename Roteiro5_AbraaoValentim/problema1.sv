module contador_sincrono_hexadecimal (
  input logic clk, reset, count_direction,
  output logic [3:0] saida
);

  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      saida <= 4'h0;
    else begin 
      if (count_direction)
      	saida <= saida + 1;
    else
      saida <= saida - 1;
  end
  end

endmodule
