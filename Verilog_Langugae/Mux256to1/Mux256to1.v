//Create a 1-bit wide, 256-to-1 multiplexer. The 256 inputs are all packed into a single 256-bit input vector. sel=0 should select in[0], sel=1 selects bits in[1], sel=2 selects bits in[2], etc.
    module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output reg out );
    integer i;
 always @(*) begin
    out = in[sel]; // Chỉ cần lấy đúng bit tương ứng
end

endmodule
