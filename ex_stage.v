module ex_stage (
    input  [31:0] rs1,
    input  [31:0] rs2,
    input  [31:0] imm,
    input  [31:0] pc,

    input  [3:0]  alu_sel,
    input         a_sel,   // 0: rs1, 1: pc
    input         b_sel,   // 0: rs2, 1: imm

    output [31:0] alu_result,
    output        zero,
    output [31:0] pc_next
);

    wire [31:0] op_a;
    wire [31:0] op_b;

    assign op_a = (a_sel) ? pc  : rs1;
    assign op_b = (b_sel) ? imm : rs2;

    alu alu (
        .rs1(op_a),
        .rs2(op_b),
        .alu_sel(alu_sel),
        .result(alu_result),
        .zero(zero)
    );

    assign pc_next = pc + imm;

endmodule
