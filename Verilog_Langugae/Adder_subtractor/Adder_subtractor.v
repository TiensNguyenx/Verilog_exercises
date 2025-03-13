module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
wire cout;
wire [15:0] sum1,sum2;
wire [32:0] muxb1;
mux mux1(.a(b),.sub(sub),.y(muxb1));
add16 test1 (.a(a[15:0]),.b(muxb1[15:0]),.cin(sub),.sum(sum1),.cout(cout));
add16 test2 (.a(a[31:16]),.b(muxb1[31:16]),.cin(cout),.sum(sum2),.cout());
assign sum = {sum2,sum1};
endmodule
module mux(
input [32:0] a,
input sub,
output [32:0] y
);
assign y = sub ? ~a : a;
endmodule
