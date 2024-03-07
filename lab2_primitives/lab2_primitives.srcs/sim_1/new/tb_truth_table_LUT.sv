`timescale 1ns / 1ps                                                                                                 
//////////////////////////////////////////////////////////////////////////////////                                   
// Company:                                                                                                          
// Engineer:                                                                                                         
//                                                                                                                   
// Create Date: 26.02.2024 12:33:58                                                                                  
// Design Name:                                                                                                      
// Module Name: tb_truth_table_LUT                                                                                   
// Project Name:                                                                                                     
// Target Devices:                                                                                                   
// Tool Versions:                                                                                                    
// Description:                                                                                                      
//                                                                                                                   
// Dependencies:                                                                                                     
//                                                                                                                   
// Revision:                                                                                                         
// Revision 0.01 - File Created                                                                                      
// Additional Comments:                                                                                              
//                                                                                                                   
//////////////////////////////////////////////////////////////////////////////////                                   
                                                                                                                     
                                                                                                                     
module tb_truth_table_LUT();                                                                                         
                                                                                                                     
logic [3:0] A;                                                                                                       
logic [3:0] B;                                                                                                       
logic [3:0] C;                                                                                                       
logic [3:0] Y;      

logic [3:0] Y_ref;                                                                                                 
                                                                                                                     
truth_table_LUT DUT (                                                                                               
.a(A),                                                                                                               
.b(B),                                                                                                               
.c(C),                                                                                                               
.y(Y)                                                                                                                
);                                                                                                                   
assign Y_ref = A & B & C;
initial begin                                                                                                        
    #10                                                                                                              
    A = 4'b0000;                                                                                                     
    B = 4'b0000;                                                                                                     
    C = 4'b0000;                                                                                                     
    #10                                                                                                              
    A = 4'b0001;                                                                                                     
    B = 4'b0001;                                                                                                     
    C = 4'b0001;                                                                                                     
    #10                                                                                                              
    A = 4'b0010;                                                                                                     
    B = 4'b0010;                                                                                                     
    C = 4'b0010;     
    #10                
    $stop();                                                                                
end                                                                                                                  
endmodule              
