module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire [15:0] sum1,sum2,sum3,sum4;
wire cout;
add16 test1 (.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum1),.cout(cout));
add16 test2 (.a(a[31:16]),.b(b[31:16]),.cin(0),.sum(sum2),.cout());
add16 test3 (.a(a[31:16]),.b(b[31:16]),.cin(1),.sum(sum3),.cout());
mux test4 (.a(sum2),.b(sum3),.sel(cout),.y(sum4));
assign sum = {sum4,sum1};
endmodule
module  mux(
input [15:0] a,b,
input sel,
output [15:0] y
);
assign y = sel ? b : a;
endmodule