module calculadora_sincrona(
    input wire [7:0] entrada,
    input wire [2:0] codigo,
    input wire clk,
    input wire rst,
    output reg [7:0] saida
);

    reg [7:0] acumulador;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            acumulador <= 8'd0;
            saida <= 8'd0;
        end else begin
            // valor padrão da saída
            saida <= 8'd0;

            case (codigo)
                3'b000: begin
                    // mostrar entrada
                    saida <= entrada;
                end
                3'b001: begin
                    // somar ao acumulador
                    acumulador <= acumulador + entrada;
                end
                3'b010: begin
                    // subtrair do acumulador
                    acumulador <= acumulador - entrada;
                end
                3'b011: begin
                    // mostrar acumulador
                    saida <= acumulador;
                end
                default: begin
                    // saída já foi zerada
                end
            endcase
        end
    end

endmodule
