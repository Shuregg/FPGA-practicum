`timescale 1ns / 1ps
// y[3:0] = a[3:0] & b[3:0] & c[3:0]

module truth_table_LUT(
    input   logic [3:0] a,
    input   logic [3:0] b,
    input   logic [3:0] c,
    output  logic [3:0] y
    );
    
LUT3 #(
 .INIT(8'b1000_0000) // Specify LUT Contents
) LUT3_inst0 (
 .O(y[0]), // LUT general output
 .I0(a[0]), // LUT input
 .I1(b[0]), // LUT input
 .I2(c[0]) // LUT input
);

LUT3 #(                             
 .INIT(8'b1000_0000) // Specify LUT Content
) LUT3_inst1 (                       
 .O(y[1]), // LUT general output       endmodule
 .I0(a[1]), // LUT input              
 .I1(b[1]), // LUT input              
 .I2(c[1]) // LUT input               
);
                       
LUT3 #(                             
 .INIT(8'b1000_0000) // Specify LUT Content
) LUT3_inst2 (                       
 .O(y[2]), // LUT general output       
 .I0(a[2]), // LUT input              
 .I1(b[2]), // LUT input              
 .I2(c[2]) // LUT input               
);

LUT3 #(                             
 .INIT(8'b1000_0000) // Specify LUT Content
) LUT3_inst3 (                       
 .O(y[3]), // LUT general output       
 .I0(a[3]), // LUT input              
 .I1(b[3]), // LUT input              
 .I2(c[3]) // LUT input               
);
endmodule