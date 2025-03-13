module top_module (
    input clk,
    input [7:0] d,
    input [1:0] sel,
    output [7:0] q
);
  wire [7:0] q1, q2, q3;
  my_dff8 test1 (
      .clk(clk),
      .d  (d),
      .q  (q1)
  );
  my_dff8 test2 (
      .clk(clk),
      .d  (q1),
      .q  (q2)
  );
  my_dff8 test3 (
      .clk(clk),
      .d  (q2),
      .q  (q3)
  );
  mux test4 (
      .q1 (d),
      .q2 (q1),
      .q3 (q2),
      .q4 (q3),
      .q  (q),
      .sel(sel)
  );

endmodule
module mux (
    input [7:0] q1,
    q2,
    q3,
    q4,
    input [1:0] sel,
    output reg [7:0] q
);
  always @(*) begin
    case (sel)
      2'b00: q = q1;
      2'b01: q = q2;
      2'b10: q = q3;
      2'b11: q = q4;
    endcase
  end
endmodule
