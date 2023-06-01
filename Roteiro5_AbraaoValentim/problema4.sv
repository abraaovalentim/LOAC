//professora, em vez de colocar os numeros como 1, 2 e 3, coloquei como um binario com 3 bits, ja que sao lampadas que acendem, na minha cabeça faz sentido lampada1 = 001, lampada2 = 010 e lampada3 = 100
module DetectorSequencia (
  input logic clk, reset,
  input logic [2:0] lampadas,
  output logic alarme
);
  enum logic [2:0] {reseted, lamp1, lamp2, lamp3} state;
  logic alarmou;
  
  always_ff @(posedge clk) begin
    if (reset) begin
      alarmou <= 0;
      state <= reseted;
      end else
    unique case (state)
      reseted:
        if (lampadas == 3'b001)
          state <= lamp1;
      else 
        state <= reseted;
      lamp1:
        if (lampadas == 3'b010)
          state <= lamp2;
      else 
        state <= reseted;
      lamp2:
        if (lampadas == 3'b100) begin
          state <= lamp3;
          alarmou <= 1;
          end else 
        state <= reseted;
      lamp3:
        if (alarmou == 1) begin
          state <= reseted;
          alarmou <= 0;
          end else 
        state <= reseted;
    endcase
  end
  	always_comb alarme <= alarmou;
endmodule
