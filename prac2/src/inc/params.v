////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2019, Nigel Topham, All rights reserved.
//
// This is an unpublished, proprietary work of Nigel Topham and is fully
// protected under copyright law. You may not disclose or distribute this file
// or any information contained herein except persuant to a valid written
// license from Nigel Topham.
//
// The entire notice above must be reproduced on all authorized copies.
//
////////////////////////////////////////////////////////////////////////////////
//
// Description:    localparam definitions for RISC-V core
// 
// Dependencies:   None
// 
////////////////////////////////////////////////////////////////////////////////

// Set the ALU_MODULE macro to the name of your ALU top-level module (e.g. alu)
// from Practical assignment 1, if you want to use your own module
//
//`define           ALU_MODULE         rv32im_alu_0
`define           ALU_MODULE         alu

// Set the HEX_FILE localparam to the name of the hex file containing the test
// program (deps_test.hex) or the Mandlebrot benchmark program (mbrot.hex)
//
localparam        HEX_FILE         = "deps_test.hex";
// localparam        HEX_FILE         = "mbrot.hex";


// ============== Do not edit any definitions below this line ==================

localparam        ROM_WIDTH        = 32; // 4 bytes per  ROM (ICCM) word
localparam        ROM_ADDR_BITS    = 13; // 8KB bytes of ROM (ICCM)
localparam        MEM_DCCM_SEL     = 13; // bit 13 -> RAM (DCCM) vs ROM (ICCM)
localparam        ROM_WORD_BITS    = 11; // bits in the ROM (ICCM) index

localparam        XLEN             = 32;

localparam [1:0]  HALT_MODE        = 2'b00;
localparam [1:0]  RUN_MODE         = 2'b01;
localparam [1:0]  STEP_C_MODE      = 2'b10;
localparam [1:0]  STEP_I_MODE      = 2'b11;

localparam [1:0]  U_PRIV           = 2'b00;
localparam [1:0]  S_PRIV           = 2'b01;
localparam [1:0]  RESERVED_PRIV    = 2'b10;
localparam [1:0]  M_PRIV           = 2'b11;

localparam [4:0]  OP_R_FORMAT      = 5'b01100;
localparam [4:0]  OP_I_FORMAT      = 5'b00100;
localparam [4:0]  JR_I_FORMAT      = 5'b11001;
localparam [4:0]  JR_U_FORMAT      = 5'b11011;
localparam [4:0]  BR_S_FORMAT      = 5'b11000;
localparam [4:0]  SYS_I_FORMAT     = 5'b11100;
localparam [4:0]  LU_I_FORMAT      = 5'b01101;
localparam [4:0]  AU_I_FORMAT      = 5'b00101;
localparam [4:0]  LW_I_FORMAT      = 5'b00000;
localparam [4:0]  SW_S_FORMAT      = 5'b01000;

localparam [3:0]  ALU_OPC_ADD      = 4'b0000;
localparam [3:0]  ALU_OPC_SUB      = 4'b1000;
localparam [3:0]  ALU_OPC_SLL      = 4'b0001;
localparam [3:0]  ALU_OPC_SLT      = 4'b0010;
localparam [3:0]  ALU_OPC_SLTU     = 4'b0011;
localparam [3:0]  ALU_OPC_XOR      = 4'b0100;
localparam [3:0]  ALU_OPC_SRL      = 4'b0101;
localparam [3:0]  ALU_OPC_SRA      = 4'b1101;
localparam [3:0]  ALU_OPC_OR       = 4'b0110;
localparam [3:0]  ALU_OPC_AND      = 4'b0111;

localparam [2:0]  M32_OPC_MUL      = 3'b000;
localparam [2:0]  M32_OPC_MULH     = 3'b001;
localparam [2:0]  M32_OPC_MULHSU   = 3'b010;
localparam [2:0]  M32_OPC_MULHU    = 3'b011;
localparam [2:0]  M32_OPC_DIV      = 3'b100;
localparam [2:0]  M32_OPC_DIVU     = 3'b101;
localparam [2:0]  M32_OPC_REM      = 3'b110;
localparam [2:0]  M32_OPC_REMU     = 3'b111;

localparam [2:0]  BEQ_OPC          = 3'b000;
localparam [2:0]  BNE_OPC          = 3'b001;
localparam [2:0]  BLT_OPC          = 3'b100;
localparam [2:0]  BGE_OPC          = 3'b101;
localparam [2:0]  BLTU_OPC         = 3'b110;
localparam [2:0]  BGEU_OPC         = 3'b111;

localparam [2:0]  F3_UNUSED_0      = 3'b000;
localparam [2:0]  F3_UNUSED_1      = 3'b001;
localparam [2:0]  F3_UNUSED_2      = 3'b010;
localparam [2:0]  F3_UNUSED_3      = 3'b011;
localparam [2:0]  F3_UNUSED_4      = 3'b100;
localparam [2:0]  F3_UNUSED_5      = 3'b101;
localparam [2:0]  F3_UNUSED_6      = 3'b110;
localparam [2:0]  F3_UNUSED_7      = 3'b111;

localparam [2:0]  SYS_PRIV_OP      = 3'b000;
localparam [2:0]  SYS_CSR_RW_OP    = 3'b001;
localparam [2:0]  SYS_CSR_RS_OP    = 3'b010;
localparam [2:0]  SYS_CSR_RC_OP    = 3'b011;

localparam [11:0] PRIV_ECALL_OP    = 12'd0;
localparam [11:0] PRIV_EBREAK_OP   = 12'd1;

localparam [2:0]  LB_OPC           = 3'b000;
localparam [2:0]  LH_OPC           = 3'b001;
localparam [2:0]  LW_OPC           = 3'b010;
localparam [2:0]  LD_OPC           = 3'b011;
localparam [2:0]  LBU_OPC          = 3'b100;
localparam [2:0]  LHU_OPC          = 3'b101;
localparam [2:0]  LWU_OPC          = 3'b110;

localparam [2:0]  SB_OPC           = 3'b000;
localparam [2:0]  SH_OPC           = 3'b001;
localparam [2:0]  SW_OPC           = 3'b010;
localparam [2:0]  SD_OPC           = 3'b011;

localparam [4:0]  X0_REG           = 5'd0;
localparam [4:0]  X1_REG           = 5'd1;

localparam [31:0] RESET_VECTOR     = 30'h00000000;
localparam [31:0] EXCPN_VECTOR     = 30'h00000080;
localparam [31:0] INT_VECTOR       = 30'h00000081;

localparam [2:0]  BPU_NO_PRED      = 3'b000;
localparam [2:0]  BPU_BRANCH       = 3'b100;
localparam [2:0]  BPU_JUMP         = 3'b101;
localparam [2:0]  BPU_CALL         = 3'b110;
localparam [2:0]  BPU_RETURN       = 3'b111;

localparam [11:0] CSR_COREID       = 12'hF14;
localparam [11:0] CSR_NUMCORES     = 12'hFC1;
localparam [11:0] CSR_LEDS         = 12'h7C1;
localparam [11:0] CSR_SSD          = 12'h7C2;
//
localparam [11:0] CSR_PX_ADDR      = 12'h7C4;
localparam [11:0] CSR_PX_DOUT      = 12'h7C5;
localparam [11:0] CSR_PX_DIN       = 12'h7C6;
localparam [11:0] CSR_PX_CMD       = 12'h7C7;
//
localparam [11:0] CSR_SWITCHES     = 12'hFC2;
localparam [11:0] CSR_BUTTONS      = 12'hFC3;

localparam [11:0] CSR_USTATUS      = 12'h000;
localparam [11:0] CSR_UEI          = 12'h004;
localparam [11:0] CSR_UTVEC        = 12'h005;
localparam [11:0] CSR_USCRATCH     = 12'h040;
localparam [11:0] CSR_UEPC         = 12'h041;
localparam [11:0] CSR_UCAUSE       = 12'h042;
localparam [11:0] CSR_UTVAL        = 12'h043;
localparam [11:0] CSR_UIP          = 12'h044;
localparam [11:0] CSR_FFLAGS       = 12'h001;
localparam [11:0] CSR_FRM          = 12'h002;
localparam [11:0] CSR_FCSR         = 12'h003;

localparam [11:0] CSR_CYCLE        = 12'hC00;
localparam [11:0] CSR_TIME         = 12'hC01;
localparam [11:0] CSR_INSTRET      = 12'hC02;
localparam [11:0] CSR_PM_CTR3      = 12'hC03;
localparam [11:0] CSR_PM_CTR4      = 12'hC04;
localparam [11:0] CSR_PM_CTR5      = 12'hC05;
localparam [11:0] CSR_PM_CTR6      = 12'hC06;
localparam [11:0] CSR_PM_CTR7      = 12'hC07;
localparam [11:0] CSR_PM_CTR8      = 12'hC08;
localparam [11:0] CSR_PM_CTR9      = 12'hC09;
localparam [11:0] CSR_PM_CTR10     = 12'hC0A;
localparam [11:0] CSR_PM_CTR11     = 12'hC0B;
localparam [11:0] CSR_PM_CTR12     = 12'hC0C;
localparam [11:0] CSR_PM_CTR13     = 12'hC0D;
localparam [11:0] CSR_PM_CTR14     = 12'hC0E;
localparam [11:0] CSR_PM_CTR15     = 12'hC0F;
localparam [11:0] CSR_PM_CTR16     = 12'hC10;
localparam [11:0] CSR_PM_CTR17     = 12'hC11;
localparam [11:0] CSR_PM_CTR18     = 12'hC12;
localparam [11:0] CSR_PM_CTR19     = 12'hC13;
localparam [11:0] CSR_PM_CTR20     = 12'hC14;
localparam [11:0] CSR_PM_CTR21     = 12'hC15;
localparam [11:0] CSR_PM_CTR22     = 12'hC16;
localparam [11:0] CSR_PM_CTR23     = 12'hC17;
localparam [11:0] CSR_PM_CTR24     = 12'hC18;
localparam [11:0] CSR_PM_CTR25     = 12'hC19;
localparam [11:0] CSR_PM_CTR26     = 12'hC1A;
localparam [11:0] CSR_PM_CTR27     = 12'hC1B;
localparam [11:0] CSR_PM_CTR28     = 12'hC1C;
localparam [11:0] CSR_PM_CTR29     = 12'hC1D;
localparam [11:0] CSR_PM_CTR30     = 12'hC1E;
localparam [11:0] CSR_PM_CTR31     = 12'hC1F;

localparam [11:0] CSR_CYCLEH       = 12'hC80;
localparam [11:0] CSR_TIMEH        = 12'hC81;
localparam [11:0] CSR_INSTRETH     = 12'hC82;
localparam [11:0] CSR_PM_CTR3H     = 12'hC83;
localparam [11:0] CSR_PM_CTR4H     = 12'hC84;
localparam [11:0] CSR_PM_CTR5H     = 12'hC85;
localparam [11:0] CSR_PM_CTR6H     = 12'hC86;
localparam [11:0] CSR_PM_CTR7H     = 12'hC87;
localparam [11:0] CSR_PM_CTR8H     = 12'hC88;
localparam [11:0] CSR_PM_CTR9H     = 12'hC89;
localparam [11:0] CSR_PM_CTR10H    = 12'hC8A;
localparam [11:0] CSR_PM_CTR11H    = 12'hC8B;
localparam [11:0] CSR_PM_CTR12H    = 12'hC8C;
localparam [11:0] CSR_PM_CTR13H    = 12'hC8D;
localparam [11:0] CSR_PM_CTR14H    = 12'hC8E;
localparam [11:0] CSR_PM_CTR15H    = 12'hC8F;
localparam [11:0] CSR_PM_CTR16H    = 12'hC90;
localparam [11:0] CSR_PM_CTR17H    = 12'hC91;
localparam [11:0] CSR_PM_CTR18H    = 12'hC92;
localparam [11:0] CSR_PM_CTR19H    = 12'hC93;
localparam [11:0] CSR_PM_CTR20H    = 12'hC94;
localparam [11:0] CSR_PM_CTR21H    = 12'hC95;
localparam [11:0] CSR_PM_CTR22H    = 12'hC96;
localparam [11:0] CSR_PM_CTR23H    = 12'hC97;
localparam [11:0] CSR_PM_CTR24H    = 12'hC98;
localparam [11:0] CSR_PM_CTR25H    = 12'hC99;
localparam [11:0] CSR_PM_CTR26H    = 12'hC9A;
localparam [11:0] CSR_PM_CTR27H    = 12'hC9B;
localparam [11:0] CSR_PM_CTR28H    = 12'hC9C;
localparam [11:0] CSR_PM_CTR29H    = 12'hC9D;
localparam [11:0] CSR_PM_CTR30H    = 12'hC9E;
localparam [11:0] CSR_PM_CTR31H    = 12'hC9F;

localparam [11:0] CSR_SSTATUS      = 12'h100;
localparam [11:0] CSR_SEI          = 12'h104;
localparam [11:0] CSR_STVEC        = 12'h105;
localparam [11:0] CSR_SCOUNTEREN   = 12'h106;
localparam [11:0] CSR_SSCRATCH     = 12'h140;
localparam [11:0] CSR_SEPC         = 12'h141;
localparam [11:0] CSR_SCAUSE       = 12'h142;
localparam [11:0] CSR_STVAL        = 12'h143;
localparam [11:0] CSR_SIP          = 12'h144;
localparam [11:0] CSR_SATP         = 12'h180;

localparam [11:0] CSR_MSTATUS      = 12'h300;
localparam [11:0] CSR_MISA         = 12'h301;
localparam [11:0] CSR_MEDELEG      = 12'h302;
localparam [11:0] CSR_MIDELEG      = 12'h303;
localparam [11:0] CSR_MEI          = 12'h304;
localparam [11:0] CSR_MTVEC        = 12'h305;
localparam [11:0] CSR_MCOUNTEREN   = 12'h306;
localparam [11:0] CSR_MSCRATCH     = 12'h340;
localparam [11:0] CSR_MEPC         = 12'h341;
localparam [11:0] CSR_MCAUSE       = 12'h342;
localparam [11:0] CSR_MTVAL        = 12'h343;
localparam [11:0] CSR_MIP          = 12'h344;

localparam [11:0] CSR_PMPCFG0      = 12'h3A0;
localparam [11:0] CSR_PMPCFG1      = 12'h3A1;
localparam [11:0] CSR_PMPCFG2      = 12'h3A2;
localparam [11:0] CSR_PMPCFG3      = 12'h3A3;

localparam [11:0] CSR_PMPADDR0     = 12'h3B0;
localparam [11:0] CSR_PMPADDR1     = 12'h3B1;
localparam [11:0] CSR_PMPADDR2     = 12'h3B2;
localparam [11:0] CSR_PMPADDR3     = 12'h3B3;
localparam [11:0] CSR_PMPADDR4     = 12'h3B4;
localparam [11:0] CSR_PMPADDR5     = 12'h3B5;
localparam [11:0] CSR_PMPADDR6     = 12'h3B6;
localparam [11:0] CSR_PMPADDR7     = 12'h3B7;
localparam [11:0] CSR_PMPADDR8     = 12'h3B8;
localparam [11:0] CSR_PMPADDR9     = 12'h3B9;
localparam [11:0] CSR_PMPADDR10    = 12'h3BA;
localparam [11:0] CSR_PMPADDR11    = 12'h3BB;
localparam [11:0] CSR_PMPADDR12    = 12'h3BC;
localparam [11:0] CSR_PMPADDR13    = 12'h3BD;
localparam [11:0] CSR_PMPADDR14    = 12'h3BE;
localparam [11:0] CSR_PMPADDR15    = 12'h3BF;

localparam [11:0] CSR_MCYCLE       = 12'hB00;
localparam [11:0] CSR_MTIME        = 12'hB01;
localparam [11:0] CSR_MINSTRET     = 12'hB02;
localparam [11:0] CSR_PM_MCTR3     = 12'hB03;
localparam [11:0] CSR_PM_MCTR4     = 12'hB04;
localparam [11:0] CSR_PM_MCTR5     = 12'hB05;
localparam [11:0] CSR_PM_MCTR6     = 12'hB06;
localparam [11:0] CSR_PM_MCTR7     = 12'hB07;
localparam [11:0] CSR_PM_MCTR8     = 12'hB08;
localparam [11:0] CSR_PM_MCTR9     = 12'hB09;
localparam [11:0] CSR_PM_MCTR10    = 12'hB0A;
localparam [11:0] CSR_PM_MCTR11    = 12'hB0B;
localparam [11:0] CSR_PM_MCTR12    = 12'hB0C;
localparam [11:0] CSR_PM_MCTR13    = 12'hB0D;
localparam [11:0] CSR_PM_MCTR14    = 12'hB0E;
localparam [11:0] CSR_PM_MCTR15    = 12'hB0F;
localparam [11:0] CSR_PM_MCTR16    = 12'hB10;
localparam [11:0] CSR_PM_MCTR17    = 12'hB11;
localparam [11:0] CSR_PM_MCTR18    = 12'hB12;
localparam [11:0] CSR_PM_MCTR19    = 12'hB13;
localparam [11:0] CSR_PM_MCTR20    = 12'hB14;
localparam [11:0] CSR_PM_MCTR21    = 12'hB15;
localparam [11:0] CSR_PM_MCTR22    = 12'hB16;
localparam [11:0] CSR_PM_MCTR23    = 12'hB17;
localparam [11:0] CSR_PM_MCTR24    = 12'hB18;
localparam [11:0] CSR_PM_MCTR25    = 12'hB19;
localparam [11:0] CSR_PM_MCTR26    = 12'hB1A;
localparam [11:0] CSR_PM_MCTR27    = 12'hB1B;
localparam [11:0] CSR_PM_MCTR28    = 12'hB1C;
localparam [11:0] CSR_PM_MCTR29    = 12'hB1D;
localparam [11:0] CSR_PM_MCTR30    = 12'hB1E;
localparam [11:0] CSR_PM_MCTR31    = 12'hB1F;

localparam [11:0] CSR_MCYCLEH      = 12'hB80;
localparam [11:0] CSR_MTIMEH       = 12'hB81;
localparam [11:0] CSR_MINSTRETH    = 12'hB82;
localparam [11:0] CSR_PM_MCTR3H    = 12'hB83;
localparam [11:0] CSR_PM_MCTR4H    = 12'hB84;
localparam [11:0] CSR_PM_MCTR5H    = 12'hB85;
localparam [11:0] CSR_PM_MCTR6H    = 12'hB86;
localparam [11:0] CSR_PM_MCTR7H    = 12'hB87;
localparam [11:0] CSR_PM_MCTR8H    = 12'hB88;
localparam [11:0] CSR_PM_MCTR9H    = 12'hB89;
localparam [11:0] CSR_PM_MCTR10H   = 12'hB8A;
localparam [11:0] CSR_PM_MCTR11H   = 12'hB8B;
localparam [11:0] CSR_PM_MCTR12H   = 12'hB8C;
localparam [11:0] CSR_PM_MCTR13H   = 12'hB8D;
localparam [11:0] CSR_PM_MCTR14H   = 12'hB8E;
localparam [11:0] CSR_PM_MCTR15H   = 12'hB8F;
localparam [11:0] CSR_PM_MCTR16H   = 12'hB90;
localparam [11:0] CSR_PM_MCTR17H   = 12'hB91;
localparam [11:0] CSR_PM_MCTR18H   = 12'hB92;
localparam [11:0] CSR_PM_MCTR19H   = 12'hB93;
localparam [11:0] CSR_PM_MCTR20H   = 12'hB94;
localparam [11:0] CSR_PM_MCTR21H   = 12'hB95;
localparam [11:0] CSR_PM_MCTR22H   = 12'hB96;
localparam [11:0] CSR_PM_MCTR23H   = 12'hB97;
localparam [11:0] CSR_PM_MCTR24H   = 12'hB98;
localparam [11:0] CSR_PM_MCTR25H   = 12'hB99;
localparam [11:0] CSR_PM_MCTR26H   = 12'hB9A;
localparam [11:0] CSR_PM_MCTR27H   = 12'hB9B;
localparam [11:0] CSR_PM_MCTR28H   = 12'hB9C;
localparam [11:0] CSR_PM_MCTR29H   = 12'hB9D;
localparam [11:0] CSR_PM_MCTR30H   = 12'hB9E;
localparam [11:0] CSR_PM_MCTR31H   = 12'hB9F;

localparam [11:0] CSR_PM_EVENT3    = 12'h323;
localparam [11:0] CSR_PM_EVENT4    = 12'h324;
localparam [11:0] CSR_PM_EVENT5    = 12'h325;
localparam [11:0] CSR_PM_EVENT6    = 12'h326;
localparam [11:0] CSR_PM_EVENT7    = 12'h327;
localparam [11:0] CSR_PM_EVENT8    = 12'h328;
localparam [11:0] CSR_PM_EVENT9    = 12'h329;
localparam [11:0] CSR_PM_EVENT10   = 12'h32A;
localparam [11:0] CSR_PM_EVENT11   = 12'h32B;
localparam [11:0] CSR_PM_EVENT12   = 12'h32C;
localparam [11:0] CSR_PM_EVENT13   = 12'h32D;
localparam [11:0] CSR_PM_EVENT14   = 12'h32E;
localparam [11:0] CSR_PM_EVENT15   = 12'h32F;
localparam [11:0] CSR_PM_EVENT16   = 12'h330;
localparam [11:0] CSR_PM_EVENT17   = 12'h331;
localparam [11:0] CSR_PM_EVENT18   = 12'h332;
localparam [11:0] CSR_PM_EVENT19   = 12'h333;
localparam [11:0] CSR_PM_EVENT20   = 12'h334;
localparam [11:0] CSR_PM_EVENT21   = 12'h335;
localparam [11:0] CSR_PM_EVENT22   = 12'h336;
localparam [11:0] CSR_PM_EVENT23   = 12'h337;
localparam [11:0] CSR_PM_EVENT24   = 12'h338;
localparam [11:0] CSR_PM_EVENT25   = 12'h339;
localparam [11:0] CSR_PM_EVENT26   = 12'h33A;
localparam [11:0] CSR_PM_EVENT27   = 12'h33B;
localparam [11:0] CSR_PM_EVENT28   = 12'h33C;
localparam [11:0] CSR_PM_EVENT29   = 12'h33D;
localparam [11:0] CSR_PM_EVENT30   = 12'h33e;
localparam [11:0] CSR_PM_EVENT31   = 12'h33F;

localparam [11:0] CSR_TSELECT      = 12'h7A0;
localparam [11:0] CSR_TDATA1       = 12'h7A1;
localparam [11:0] CSR_TDATA2       = 12'h7A2;
localparam [11:0] CSR_TDATA3       = 12'h7A3;

localparam [11:0] CSR_DCSR         = 12'h7B0;
localparam [11:0] CSR_DPC          = 12'h7B1;
localparam [11:0] CSR_DSCRATCH     = 12'h7B2;

localparam [3:0]  PM_CYC_UNKNOWN   = 4'd0;
localparam [3:0]  PM_CYC_USE_LD    = 4'd1;
localparam [3:0]  PM_CYC_USE_CSR   = 4'd2;
localparam [3:0]  PM_CYC_WAIT_DIV  = 4'd3;
localparam [3:0]  PM_CYC_BP_MISS   = 4'd4;

localparam [4:0]  PM_SEL_NOTHING   = 5'd0;   // no event selected for counting
localparam [4:0]  PM_SEL_USE_LD    = 5'd1;   // load-use stall cycles
localparam [4:0]  PM_SEL_USE_CSR   = 5'd2;   // CSRR-use stall cycles
localparam [4:0]  PM_SEL_WAIT_DIV  = 5'd3;   // cycles stalling for DIV
localparam [4:0]  PM_SEL_BPM_CYC   = 5'd4;   // cycles due to branch mispredictions
localparam [4:0]  PM_SEL_BPM_EVT   = 5'd5;   // number of branch mispredictions (BMs)
localparam [4:0]  PM_SEL_BR_EVT    = 5'd6;   // number of conditional branches
localparam [4:0]  PM_SEL_JMP_EVT   = 5'd7;   // number of jumps
localparam [4:0]  PM_SEL_CTI_EVT   = 5'd8;   // number of control transfers (all types)
localparam [4:0]  PM_SEL_CALL_EVT  = 5'd9;   // number of function calls
localparam [4:0]  PM_SEL_RETN_EVT  = 5'd10;  // number of fundtion returs
localparam [4:0]  PM_SEL_BCM_EVT   = 5'd11;  // BMs due to branch cache misses
localparam [4:0]  PM_SEL_BTM_EVT   = 5'd12;  // BMs due to incorrect target prediction
localparam [4:0]  PM_SEL_MPD_EVT   = 5'd13;  // BMs due to incorrect outcome prediction
localparam [4:0]  PM_SEL_RAS_EVT   = 5'd14;  // BMs due to return-target misprediction
localparam [4:0]  PM_SEL_BBM_EVT   = 5'd15;  // BMs due to incorrect branch type prediction
