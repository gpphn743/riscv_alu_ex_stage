module alu (
    input  [31:0] rs1,
    input  [31:0] rs2,
    input  [3:0]  alu_sel,
    output reg [31:0] result,
    output zero
);

    // ALU select
    localparam ALU_ADD  = 4'b0000;
    localparam ALU_SUB  = 4'b0001;
    localparam ALU_AND  = 4'b0010;
    localparam ALU_OR   = 4'b0011;
    localparam ALU_XOR  = 4'b0100;
    localparam ALU_SLL  = 4'b0101;
    localparam ALU_SRL  = 4'b0110;
    localparam ALU_SRA  = 4'b0111;
    localparam ALU_SLT  = 4'b1000;
    localparam ALU_SLTU = 4'b1001;
//    localparam ALU_ADDI = 4'b1001;
//    localparam ALU_ANDI = 4'b1001;
//    localparam ALU_ORI  = 4'b1001;
//    localparam ALU_SLLI = 4'b1001;
//    localparam ALU_SRLI = 4'b1001;
//    localparam ALU_SRAI = 4'b1001;
//    localparam ALU_SLTI = 4'b1001;
//    localparam ALU_SLTIU= 4'b1001;
//    localparam ALU_SLTU = 4'b1001;


    always @(*) begin
        case (alu_sel)
            ALU_ADD:  result = rs1 + rs2;
            ALU_SUB:  result = rs1 - rs2;
            ALU_AND:  result = rs1 & rs2;
            ALU_OR:   result = rs1 | rs2;
            ALU_XOR:  result = rs1 ^ rs2;
            ALU_SLL:  result = rs1 << rs2[4:0];
            ALU_SRL:  result = rs1 >> rs2[4:0];
            ALU_SRA:  result = $signed(rs1) >>> rs2[4:0];
            ALU_SLT:  result = ($signed(rs1) < $signed(rs2)) ? 32'b1 : 32'b0;
            ALU_SLTU: result = (rs1 < rs2) ? 32'b1 : 32'b0;
            default:  result = 32'b0;
        endcase
    end

    assign zero = (result == 32'b0);

endmodule
