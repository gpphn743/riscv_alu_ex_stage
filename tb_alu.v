`timescale 1ns/1ps

module tb_alu;

    reg  [31:0] a;
    reg  [31:0] b;
    reg  [3:0]  alu_sel;

    wire [31:0] result;
    wire zero;

    alu uut (
        .a(a),
        .b(b),
        .alu_sel(alu_sel),
        .result(result),
        .zero(zero)
    );

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

    initial begin
        // R-type
	// a = rs1, b = rs2

        // ADD
        a = 32'd5;  b = 32'd3;  alu_sel = ALU_ADD;
        #10;
        // SUB
        a = 32'd5;  b = 32'd3;  alu_sel = ALU_SUB;
        #10;
        // AND
        a = 32'hF0F0_F0F0;  b = 32'h0FF0_0FF0;  alu_sel = ALU_AND;
        #10;
        // OR
        a = 32'hF0F0_F0F0;  b = 32'h0FF0_0FF0;  alu_sel = ALU_OR;
        #10;
        // XOR
        a = 32'hF0F0_F0F0;  b = 32'h0FF0_0FF0;  alu_sel = ALU_XOR;
        #10;
        // SLL
        a = 32'h0000_0001;  b = 32'd4;  alu_sel = ALU_SLL;
        #10;
        // SRL
        a = 32'h8000_0000;  b = 32'd1;  alu_sel = ALU_SRL;
        #10;
        // SRA
        a = 32'h8000_0000;  b = 32'd1;  alu_sel = ALU_SRA;
        #10;
        // SLT
        a = 32'hFFFF_FFFF;  b = 32'd1;  alu_sel = ALU_SLT;
        #10;
        // SLTU
        a = 32'd1;  b = 32'd2;  alu_sel = ALU_SLTU;
        #10;

//
//        // I-type
//        // a = rs1, b = immediate
//
//        // ADDI
//        a = 32'd10;  b = 32'd9;  alu_sel = ALU_ADD;
//        #10;
//        // ANDI
//        a = 32'hF0F0_F0F0;  b = 32'h0FF0_0FF0;  alu_sel = ALU_AND;
//        #10;
//        // ORI
//        a = 32'hF0F0_F0F0;  b = 32'h0FF0_0FF0;  alu_sel = ALU_OR;
//        #10;
//        // XORI
//        a = 32'hF0F0_F0F0;  b = 32'h0FF0_0FF0;  alu_sel = ALU_XOR;
//        #10;
//        // SLLI
//        a = 32'h0000_0001;  b = 32'd4;  alu_sel = ALU_SLL;
//        #10;
//        // SRLI
//        a = 32'h8000_0000;  b = 32'd1;  alu_sel = ALU_SRL;
//        #10;
//        // SRAI
//        a = 32'h8000_0000;  b = 32'd1;  alu_sel = ALU_SRA;
//        #10;
//        // SLTI
//        a = 32'hFFFF_FFFF;  b = 32'd1;  alu_sel = ALU_SLT;
//        #10;
//
//        // Load
//        // a = rs1, b = immediate; address = base (rs1) + offset
//        // LW
//        a = 32'd100;  b = 32'd16;  alu_sel = ALU_ADD;
//        #10;
//        // LB
//        a = 32'd200;  b = 32'd4;  alu_sel = ALU_ADD;
//        #10;
//        // LH
//        a = 32'd300;  b = 32'd12;  alu_sel = ALU_ADD;
//        #10;
//
//	//JALR
//	// a = rs1, b = imm
//	a = 32'd10; b = 32'd24; alu_sel = ALU_ADD;
//
//
//        // S-type
//        // a = rs1, b = immediate; address = base (rs1) + offset
//
//        // SW
//        a = 32'd400;  b = 32'd20;  alu_sel = ALU_ADD;
//        #10;
//        // SB
//        a = 32'd500;  b = 32'd8;  alu_sel = ALU_ADD;
//        #10;
//        // SH
//        a = 32'd600;  b = 32'd2;  alu_sel = ALU_ADD;
//        #10;
//
//        // B-type
//	// a = rs1, b = rs2
//        // BEQ
//        a = 32'd15;  b = 32'd15;  alu_sel = ALU_SUB;
//        #10;
//        // BNE
//        a = 32'd7;  b = 32'd9;  alu_sel = ALU_SUB;
//        #10;
//        // BLT
//        a = 32'd1;  b = 32'd2;  alu_sel = ALU_SLT;
//        #10;
//        // BLTU
//        a = 32'd1;  b = 32'd2;  alu_sel = ALU_SLTU;
//        #10;
//
//
//        // U-type
//	// a = rd, b = imm
//        // AUIPC : pc + imm
//        a = 32'd1000;  b = 32'd200;  alu_sel = ALU_ADD;
//        #10;
//        // LUI : imm << 12
//        a = 32'd0;  b = 32'h1234_5000;  alu_sel = ALU_ADD;
//        #10;
//
//	
//	// J-type
//	//JAL
//	// a = pc, b = offset
//	a = 32'd10; b = 32'd24; alu_sel = ALU_ADD;
//	

        $stop;
    end

endmodule