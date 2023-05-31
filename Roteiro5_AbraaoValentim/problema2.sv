module contador_sincrono (
  input logic clk, reset, entrada,
  output logic [3:0] saida
);

  always_ff @(posedge clk) begin
    if (reset)
      saida <= 4'd0;
    else if (entrada && saida == 4'd0)
      saida <= 4'd1;
    else if (entrada && saida == 4'd1)
      saida <= 4'd2;
    else if (entrada && saida == 4'd2)
      saida <= 4'd4;
    else if (entrada && saida == 4'd4)
      saida <= 4'd8;
    else if (entrada && saida == 4'd8)
      saida <= 4'd1;
  end

endmodule