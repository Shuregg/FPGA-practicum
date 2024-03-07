`timescale1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
//Company:
//Engineer:
//
//CreateDate:26.02.202411:56:57
//DesignName:
//ModuleName:truth_table_LUT2
//ProjectName:
//TargetDevices:
//ToolVersions:
//Description:
//
//Dependencies:
//
//Revision:
//Revision0.01-FileCreated
//AdditionalComments:
//
//////////////////////////////////////////////////////////////////////////////////

//y[3:0]=a[3:0]&b[3:0]&c[3:0]

moduletruth_table_LUT(
input   logic   [3:0]   a,
input   logic   [3:0]   b,
input   logic   [3:0]   c,
output  logic   [3:0]   y
);
LUT3#(
.INIT(8'b0000_0001)//SpecifyLUTContents
)LUT3_inst0(
    .O(y[0]),//LUTgeneraloutput
    .I0(a[0]),//LUTinput
    .I1(b[0]),//LUTinput
    .I2(c[0])//LUTinput
);
LUT3#(
.INIT(8'b0000_0001)//SpecifyLUTContent
)LUT3_inst1(
    .O(y[1]),//LUTgeneraloutputendmodule
    .I0(a[1]),//LUTinput
    .I1(b[1]),//LUTinput
    .I2(c[1])//LUTinput
);
LUT3#(
.INIT(8'b0000_0001)//SpecifyLUTContent
)LUT3_inst2(
    .O(y[2]),//LUTgeneraloutput
    .I0(a[2]),//LUTinput
    .I1(b[2]),//LUTinput
    .I2(c[2])//LUTinput
);
LUT3#(
.INIT(8'b0000_0001)//SpecifyLUTContent
)LUT3_inst3(
.O(y[3]),//LUTgeneraloutput
.I0(a[3]),//LUTinput
.I1(b[3]),//LUTinput
.I2(c[3])//LUTinput
);

endmodule

`timescale1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
//Company:
//Engineer:
//
//CreateDate:26.02.202412:33:58
//DesignName:
//ModuleName:tb_truth_table_LUT
//ProjectName:
//TargetDevices:
//ToolVersions:
//Description:
//
//Dependencies:
//
//Revision:
//Revision0.01-FileCreated
//AdditionalComments:
//
//////////////////////////////////////////////////////////////////////////////////


moduletb_truth_table_LUT();

logic[3:0]A;
logic[3:0]B;
logic[3:0]C;
logic[3:0]Y;

truth_table_LUT2DUT(
.a(A),
.b(B),
.c(C),
.y(Y)
);
initialbegin
#10
A=4'b0000;
B=4'b0000;
C=4'b0000;
#10
A=4'b0001;
B=4'b0001;
C=4'b0001;
#10
A=4'b0010;
B=4'b0010;
C=4'b0010;
end
endmodule