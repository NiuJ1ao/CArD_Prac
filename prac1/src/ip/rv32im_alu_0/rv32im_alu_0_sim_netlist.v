// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Oct  1 19:54:02 2019
// Host        : bilbo running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/nigel/Documents/svn_roots/computerdesign/CARD_Practicals_2019/Practical_1/prac1/proj/CARD_P1.srcs/sources_1/ip/rv32im_alu_0/rv32im_alu_0_sim_netlist.v
// Design      : rv32im_alu_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rv32im_alu_0,rv32im_alu,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "rv32im_alu,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module rv32im_alu_0
   (exe_sel_pc_r,
    alu_result,
    exe_alu_opc_r,
    exe_pc_r,
    exe_reg1_r,
    exe_src2_r);
  input exe_sel_pc_r;
  output [31:0]alu_result;
  input [3:0]exe_alu_opc_r;
  input [31:0]exe_pc_r;
  input [31:0]exe_reg1_r;
  input [31:0]exe_src2_r;

  wire [31:0]alu_result;
  wire [3:0]exe_alu_opc_r;
  wire [31:0]exe_pc_r;
  wire [31:0]exe_reg1_r;
  wire exe_sel_pc_r;
  wire [31:0]exe_src2_r;

  (* black_box = "1" *) 
  rv32im_alu_0_alu inst
       (.alu_result(alu_result),
        .exe_alu_opc_r(exe_alu_opc_r),
        .exe_pc_r(exe_pc_r),
        .exe_reg1_r(exe_reg1_r),
        .exe_sel_pc_r(exe_sel_pc_r),
        .exe_src2_r(exe_src2_r));
endmodule

(* ALU_OPC_ADD = "4'b0000" *) (* ALU_OPC_AND = "4'b0111" *) (* ALU_OPC_OR = "4'b0110" *) 
(* ALU_OPC_SLL = "4'b0001" *) (* ALU_OPC_SLT = "4'b0010" *) (* ALU_OPC_SLTU = "4'b0011" *) 
(* ALU_OPC_SRA = "4'b1101" *) (* ALU_OPC_SRL = "4'b0101" *) (* ALU_OPC_SUB = "4'b1000" *) 
(* ALU_OPC_XOR = "4'b0100" *) (* AU_I_FORMAT = "5'b00101" *) (* BEQ_OPC = "3'b000" *) 
(* BGEU_OPC = "3'b111" *) (* BGE_OPC = "3'b101" *) (* BLTU_OPC = "3'b110" *) 
(* BLT_OPC = "3'b100" *) (* BNE_OPC = "3'b001" *) (* BPU_BRANCH = "3'b100" *) 
(* BPU_CALL = "3'b110" *) (* BPU_JUMP = "3'b101" *) (* BPU_NO_PRED = "3'b000" *) 
(* BPU_RETURN = "3'b111" *) (* BR_S_FORMAT = "5'b11000" *) (* CSR_BUTTONS = "12'b111111000011" *) 
(* CSR_COREID = "12'b111100010100" *) (* CSR_CYCLE = "12'b110000000000" *) (* CSR_CYCLEH = "12'b110010000000" *) 
(* CSR_DCSR = "12'b011110110000" *) (* CSR_DPC = "12'b011110110001" *) (* CSR_DSCRATCH = "12'b011110110010" *) 
(* CSR_FCSR = "12'b000000000011" *) (* CSR_FFLAGS = "12'b000000000001" *) (* CSR_FRM = "12'b000000000010" *) 
(* CSR_INSTRET = "12'b110000000010" *) (* CSR_INSTRETH = "12'b110010000010" *) (* CSR_LEDS = "12'b011111000001" *) 
(* CSR_MCAUSE = "12'b001101000010" *) (* CSR_MCOUNTEREN = "12'b001100000110" *) (* CSR_MCYCLE = "12'b101100000000" *) 
(* CSR_MCYCLEH = "12'b101110000000" *) (* CSR_MEDELEG = "12'b001100000010" *) (* CSR_MEI = "12'b001100000100" *) 
(* CSR_MEPC = "12'b001101000001" *) (* CSR_MIDELEG = "12'b001100000011" *) (* CSR_MINSTRET = "12'b101100000010" *) 
(* CSR_MINSTRETH = "12'b101110000010" *) (* CSR_MIP = "12'b001101000100" *) (* CSR_MISA = "12'b001100000001" *) 
(* CSR_MSCRATCH = "12'b001101000000" *) (* CSR_MSTATUS = "12'b001100000000" *) (* CSR_MTIME = "12'b101100000001" *) 
(* CSR_MTIMEH = "12'b101110000001" *) (* CSR_MTVAL = "12'b001101000011" *) (* CSR_MTVEC = "12'b001100000101" *) 
(* CSR_NUMCORES = "12'b111111000001" *) (* CSR_PMPADDR0 = "12'b001110110000" *) (* CSR_PMPADDR1 = "12'b001110110001" *) 
(* CSR_PMPADDR10 = "12'b001110111010" *) (* CSR_PMPADDR11 = "12'b001110111011" *) (* CSR_PMPADDR12 = "12'b001110111100" *) 
(* CSR_PMPADDR13 = "12'b001110111101" *) (* CSR_PMPADDR14 = "12'b001110111110" *) (* CSR_PMPADDR15 = "12'b001110111111" *) 
(* CSR_PMPADDR2 = "12'b001110110010" *) (* CSR_PMPADDR3 = "12'b001110110011" *) (* CSR_PMPADDR4 = "12'b001110110100" *) 
(* CSR_PMPADDR5 = "12'b001110110101" *) (* CSR_PMPADDR6 = "12'b001110110110" *) (* CSR_PMPADDR7 = "12'b001110110111" *) 
(* CSR_PMPADDR8 = "12'b001110111000" *) (* CSR_PMPADDR9 = "12'b001110111001" *) (* CSR_PMPCFG0 = "12'b001110100000" *) 
(* CSR_PMPCFG1 = "12'b001110100001" *) (* CSR_PMPCFG2 = "12'b001110100010" *) (* CSR_PMPCFG3 = "12'b001110100011" *) 
(* CSR_PM_CTR10 = "12'b110000001010" *) (* CSR_PM_CTR10H = "12'b110010001010" *) (* CSR_PM_CTR11 = "12'b110000001011" *) 
(* CSR_PM_CTR11H = "12'b110010001011" *) (* CSR_PM_CTR12 = "12'b110000001100" *) (* CSR_PM_CTR12H = "12'b110010001100" *) 
(* CSR_PM_CTR13 = "12'b110000001101" *) (* CSR_PM_CTR13H = "12'b110010001101" *) (* CSR_PM_CTR14 = "12'b110000001110" *) 
(* CSR_PM_CTR14H = "12'b110010001110" *) (* CSR_PM_CTR15 = "12'b110000001111" *) (* CSR_PM_CTR15H = "12'b110010001111" *) 
(* CSR_PM_CTR16 = "12'b110000010000" *) (* CSR_PM_CTR16H = "12'b110010010000" *) (* CSR_PM_CTR17 = "12'b110000010001" *) 
(* CSR_PM_CTR17H = "12'b110010010001" *) (* CSR_PM_CTR18 = "12'b110000010010" *) (* CSR_PM_CTR18H = "12'b110010010010" *) 
(* CSR_PM_CTR19 = "12'b110000010011" *) (* CSR_PM_CTR19H = "12'b110010010011" *) (* CSR_PM_CTR20 = "12'b110000010100" *) 
(* CSR_PM_CTR20H = "12'b110010010100" *) (* CSR_PM_CTR21 = "12'b110000010101" *) (* CSR_PM_CTR21H = "12'b110010010101" *) 
(* CSR_PM_CTR22 = "12'b110000010110" *) (* CSR_PM_CTR22H = "12'b110010010110" *) (* CSR_PM_CTR23 = "12'b110000010111" *) 
(* CSR_PM_CTR23H = "12'b110010010111" *) (* CSR_PM_CTR24 = "12'b110000011000" *) (* CSR_PM_CTR24H = "12'b110010011000" *) 
(* CSR_PM_CTR25 = "12'b110000011001" *) (* CSR_PM_CTR25H = "12'b110010011001" *) (* CSR_PM_CTR26 = "12'b110000011010" *) 
(* CSR_PM_CTR26H = "12'b110010011010" *) (* CSR_PM_CTR27 = "12'b110000011011" *) (* CSR_PM_CTR27H = "12'b110010011011" *) 
(* CSR_PM_CTR28 = "12'b110000011100" *) (* CSR_PM_CTR28H = "12'b110010011100" *) (* CSR_PM_CTR29 = "12'b110000011101" *) 
(* CSR_PM_CTR29H = "12'b110010011101" *) (* CSR_PM_CTR3 = "12'b110000000011" *) (* CSR_PM_CTR30 = "12'b110000011110" *) 
(* CSR_PM_CTR30H = "12'b110010011110" *) (* CSR_PM_CTR31 = "12'b110000011111" *) (* CSR_PM_CTR31H = "12'b110010011111" *) 
(* CSR_PM_CTR3H = "12'b110010000011" *) (* CSR_PM_CTR4 = "12'b110000000100" *) (* CSR_PM_CTR4H = "12'b110010000100" *) 
(* CSR_PM_CTR5 = "12'b110000000101" *) (* CSR_PM_CTR5H = "12'b110010000101" *) (* CSR_PM_CTR6 = "12'b110000000110" *) 
(* CSR_PM_CTR6H = "12'b110010000110" *) (* CSR_PM_CTR7 = "12'b110000000111" *) (* CSR_PM_CTR7H = "12'b110010000111" *) 
(* CSR_PM_CTR8 = "12'b110000001000" *) (* CSR_PM_CTR8H = "12'b110010001000" *) (* CSR_PM_CTR9 = "12'b110000001001" *) 
(* CSR_PM_CTR9H = "12'b110010001001" *) (* CSR_PM_EVENT10 = "12'b001100101010" *) (* CSR_PM_EVENT11 = "12'b001100101011" *) 
(* CSR_PM_EVENT12 = "12'b001100101100" *) (* CSR_PM_EVENT13 = "12'b001100101101" *) (* CSR_PM_EVENT14 = "12'b001100101110" *) 
(* CSR_PM_EVENT15 = "12'b001100101111" *) (* CSR_PM_EVENT16 = "12'b001100110000" *) (* CSR_PM_EVENT17 = "12'b001100110001" *) 
(* CSR_PM_EVENT18 = "12'b001100110010" *) (* CSR_PM_EVENT19 = "12'b001100110011" *) (* CSR_PM_EVENT20 = "12'b001100110100" *) 
(* CSR_PM_EVENT21 = "12'b001100110101" *) (* CSR_PM_EVENT22 = "12'b001100110110" *) (* CSR_PM_EVENT23 = "12'b001100110111" *) 
(* CSR_PM_EVENT24 = "12'b001100111000" *) (* CSR_PM_EVENT25 = "12'b001100111001" *) (* CSR_PM_EVENT26 = "12'b001100111010" *) 
(* CSR_PM_EVENT27 = "12'b001100111011" *) (* CSR_PM_EVENT28 = "12'b001100111100" *) (* CSR_PM_EVENT29 = "12'b001100111101" *) 
(* CSR_PM_EVENT3 = "12'b001100100011" *) (* CSR_PM_EVENT30 = "12'b001100111110" *) (* CSR_PM_EVENT31 = "12'b001100111111" *) 
(* CSR_PM_EVENT4 = "12'b001100100100" *) (* CSR_PM_EVENT5 = "12'b001100100101" *) (* CSR_PM_EVENT6 = "12'b001100100110" *) 
(* CSR_PM_EVENT7 = "12'b001100100111" *) (* CSR_PM_EVENT8 = "12'b001100101000" *) (* CSR_PM_EVENT9 = "12'b001100101001" *) 
(* CSR_PM_MCTR10 = "12'b101100001010" *) (* CSR_PM_MCTR10H = "12'b101110001010" *) (* CSR_PM_MCTR11 = "12'b101100001011" *) 
(* CSR_PM_MCTR11H = "12'b101110001011" *) (* CSR_PM_MCTR12 = "12'b101100001100" *) (* CSR_PM_MCTR12H = "12'b101110001100" *) 
(* CSR_PM_MCTR13 = "12'b101100001101" *) (* CSR_PM_MCTR13H = "12'b101110001101" *) (* CSR_PM_MCTR14 = "12'b101100001110" *) 
(* CSR_PM_MCTR14H = "12'b101110001110" *) (* CSR_PM_MCTR15 = "12'b101100001111" *) (* CSR_PM_MCTR15H = "12'b101110001111" *) 
(* CSR_PM_MCTR16 = "12'b101100010000" *) (* CSR_PM_MCTR16H = "12'b101110010000" *) (* CSR_PM_MCTR17 = "12'b101100010001" *) 
(* CSR_PM_MCTR17H = "12'b101110010001" *) (* CSR_PM_MCTR18 = "12'b101100010010" *) (* CSR_PM_MCTR18H = "12'b101110010010" *) 
(* CSR_PM_MCTR19 = "12'b101100010011" *) (* CSR_PM_MCTR19H = "12'b101110010011" *) (* CSR_PM_MCTR20 = "12'b101100010100" *) 
(* CSR_PM_MCTR20H = "12'b101110010100" *) (* CSR_PM_MCTR21 = "12'b101100010101" *) (* CSR_PM_MCTR21H = "12'b101110010101" *) 
(* CSR_PM_MCTR22 = "12'b101100010110" *) (* CSR_PM_MCTR22H = "12'b101110010110" *) (* CSR_PM_MCTR23 = "12'b101100010111" *) 
(* CSR_PM_MCTR23H = "12'b101110010111" *) (* CSR_PM_MCTR24 = "12'b101100011000" *) (* CSR_PM_MCTR24H = "12'b101110011000" *) 
(* CSR_PM_MCTR25 = "12'b101100011001" *) (* CSR_PM_MCTR25H = "12'b101110011001" *) (* CSR_PM_MCTR26 = "12'b101100011010" *) 
(* CSR_PM_MCTR26H = "12'b101110011010" *) (* CSR_PM_MCTR27 = "12'b101100011011" *) (* CSR_PM_MCTR27H = "12'b101110011011" *) 
(* CSR_PM_MCTR28 = "12'b101100011100" *) (* CSR_PM_MCTR28H = "12'b101110011100" *) (* CSR_PM_MCTR29 = "12'b101100011101" *) 
(* CSR_PM_MCTR29H = "12'b101110011101" *) (* CSR_PM_MCTR3 = "12'b101100000011" *) (* CSR_PM_MCTR30 = "12'b101100011110" *) 
(* CSR_PM_MCTR30H = "12'b101110011110" *) (* CSR_PM_MCTR31 = "12'b101100011111" *) (* CSR_PM_MCTR31H = "12'b101110011111" *) 
(* CSR_PM_MCTR3H = "12'b101110000011" *) (* CSR_PM_MCTR4 = "12'b101100000100" *) (* CSR_PM_MCTR4H = "12'b101110000100" *) 
(* CSR_PM_MCTR5 = "12'b101100000101" *) (* CSR_PM_MCTR5H = "12'b101110000101" *) (* CSR_PM_MCTR6 = "12'b101100000110" *) 
(* CSR_PM_MCTR6H = "12'b101110000110" *) (* CSR_PM_MCTR7 = "12'b101100000111" *) (* CSR_PM_MCTR7H = "12'b101110000111" *) 
(* CSR_PM_MCTR8 = "12'b101100001000" *) (* CSR_PM_MCTR8H = "12'b101110001000" *) (* CSR_PM_MCTR9 = "12'b101100001001" *) 
(* CSR_PM_MCTR9H = "12'b101110001001" *) (* CSR_SATP = "12'b000110000000" *) (* CSR_SCAUSE = "12'b000101000010" *) 
(* CSR_SCOUNTEREN = "12'b000100000110" *) (* CSR_SEI = "12'b000100000100" *) (* CSR_SEPC = "12'b000101000001" *) 
(* CSR_SIP = "12'b000101000100" *) (* CSR_SSCRATCH = "12'b000101000000" *) (* CSR_SSD = "12'b011111000010" *) 
(* CSR_SSTATUS = "12'b000100000000" *) (* CSR_STVAL = "12'b000101000011" *) (* CSR_STVEC = "12'b000100000101" *) 
(* CSR_SWITCHES = "12'b111111000010" *) (* CSR_TDATA1 = "12'b011110100001" *) (* CSR_TDATA2 = "12'b011110100010" *) 
(* CSR_TDATA3 = "12'b011110100011" *) (* CSR_TIME = "12'b110000000001" *) (* CSR_TIMEH = "12'b110010000001" *) 
(* CSR_TSELECT = "12'b011110100000" *) (* CSR_UCAUSE = "12'b000001000010" *) (* CSR_UEI = "12'b000000000100" *) 
(* CSR_UEPC = "12'b000001000001" *) (* CSR_UIP = "12'b000001000100" *) (* CSR_USCRATCH = "12'b000001000000" *) 
(* CSR_USTATUS = "12'b000000000000" *) (* CSR_UTVAL = "12'b000001000011" *) (* CSR_UTVEC = "12'b000000000101" *) 
(* EXCPN_VECTOR = "128" *) (* F3_UNUSED_0 = "3'b000" *) (* F3_UNUSED_1 = "3'b001" *) 
(* F3_UNUSED_2 = "3'b010" *) (* F3_UNUSED_3 = "3'b011" *) (* F3_UNUSED_4 = "3'b100" *) 
(* F3_UNUSED_5 = "3'b101" *) (* F3_UNUSED_6 = "3'b110" *) (* F3_UNUSED_7 = "3'b111" *) 
(* HALT_MODE = "2'b00" *) (* INT_VECTOR = "129" *) (* JR_I_FORMAT = "5'b11001" *) 
(* JR_U_FORMAT = "5'b11011" *) (* LBU_OPC = "3'b100" *) (* LB_OPC = "3'b000" *) 
(* LD_OPC = "3'b011" *) (* LHU_OPC = "3'b101" *) (* LH_OPC = "3'b001" *) 
(* LU_I_FORMAT = "5'b01101" *) (* LWU_OPC = "3'b110" *) (* LW_I_FORMAT = "5'b00000" *) 
(* LW_OPC = "3'b010" *) (* M32_OPC_DIV = "3'b100" *) (* M32_OPC_DIVU = "3'b101" *) 
(* M32_OPC_MUL = "3'b000" *) (* M32_OPC_MULH = "3'b001" *) (* M32_OPC_MULHSU = "3'b010" *) 
(* M32_OPC_MULHU = "3'b011" *) (* M32_OPC_REM = "3'b110" *) (* M32_OPC_REMU = "3'b111" *) 
(* M_PRIV = "2'b11" *) (* OP_I_FORMAT = "5'b00100" *) (* OP_R_FORMAT = "5'b01100" *) 
(* ORIG_REF_NAME = "alu" *) (* PM_CYC_BP_MISS = "4'b0100" *) (* PM_CYC_UNKNOWN = "4'b0000" *) 
(* PM_CYC_USE_CSR = "4'b0010" *) (* PM_CYC_USE_LD = "4'b0001" *) (* PM_CYC_WAIT_DIV = "4'b0011" *) 
(* PM_SEL_BBM_EVT = "5'b01111" *) (* PM_SEL_BCM_EVT = "5'b01011" *) (* PM_SEL_BPM_CYC = "5'b00100" *) 
(* PM_SEL_BPM_EVT = "5'b00101" *) (* PM_SEL_BR_EVT = "5'b00110" *) (* PM_SEL_BTM_EVT = "5'b01100" *) 
(* PM_SEL_CALL_EVT = "5'b01001" *) (* PM_SEL_CTI_EVT = "5'b01000" *) (* PM_SEL_JMP_EVT = "5'b00111" *) 
(* PM_SEL_MPD_EVT = "5'b01101" *) (* PM_SEL_NOTHING = "5'b00000" *) (* PM_SEL_RAS_EVT = "5'b01110" *) 
(* PM_SEL_RETN_EVT = "5'b01010" *) (* PM_SEL_USE_CSR = "5'b00010" *) (* PM_SEL_USE_LD = "5'b00001" *) 
(* PM_SEL_WAIT_DIV = "5'b00011" *) (* PRIV_EBREAK_OP = "12'b000000000001" *) (* PRIV_ECALL_OP = "12'b000000000000" *) 
(* RESERVED_PRIV = "2'b10" *) (* RESET_VECTOR = "0" *) (* RUN_MODE = "2'b01" *) 
(* SB_OPC = "3'b000" *) (* SD_OPC = "3'b011" *) (* SH_OPC = "3'b001" *) 
(* STEP_C_MODE = "2'b10" *) (* STEP_I_MODE = "2'b11" *) (* SW_OPC = "3'b010" *) 
(* SW_S_FORMAT = "5'b01000" *) (* SYS_CSR_RC_OP = "3'b011" *) (* SYS_CSR_RS_OP = "3'b010" *) 
(* SYS_CSR_RW_OP = "3'b001" *) (* SYS_I_FORMAT = "5'b11100" *) (* SYS_PRIV_OP = "3'b000" *) 
(* S_PRIV = "2'b01" *) (* U_PRIV = "2'b00" *) (* X0_REG = "5'b00000" *) 
(* X1_REG = "5'b00001" *) (* XLEN = "32" *) 
module rv32im_alu_0_alu
   (exe_sel_pc_r,
    alu_result,
    exe_alu_opc_r,
    exe_pc_r,
    exe_reg1_r,
    exe_src2_r);
  input exe_sel_pc_r;
  output [31:0]alu_result;
  input [3:0]exe_alu_opc_r;
  input [31:0]exe_pc_r;
  input [31:0]exe_reg1_r;
  input [31:0]exe_src2_r;

  wire [31:0]alu_result;
  wire [31:0]alu_result_OBUF;
  wire \alu_result_OBUF[0]_inst_i_10_n_1 ;
  wire \alu_result_OBUF[0]_inst_i_10_n_2 ;
  wire \alu_result_OBUF[0]_inst_i_10_n_3 ;
  wire \alu_result_OBUF[0]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_13_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_13_n_1 ;
  wire \alu_result_OBUF[0]_inst_i_13_n_2 ;
  wire \alu_result_OBUF[0]_inst_i_13_n_3 ;
  wire \alu_result_OBUF[0]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_15_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_16_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_17_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_18_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_19_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_20_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_21_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_22_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_22_n_1 ;
  wire \alu_result_OBUF[0]_inst_i_22_n_2 ;
  wire \alu_result_OBUF[0]_inst_i_22_n_3 ;
  wire \alu_result_OBUF[0]_inst_i_23_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_24_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_25_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_26_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_27_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_28_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_29_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_30_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_31_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_32_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_32_n_1 ;
  wire \alu_result_OBUF[0]_inst_i_32_n_2 ;
  wire \alu_result_OBUF[0]_inst_i_32_n_3 ;
  wire \alu_result_OBUF[0]_inst_i_33_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_34_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_35_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_36_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_37_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_38_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_39_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_40_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_41_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_41_n_1 ;
  wire \alu_result_OBUF[0]_inst_i_41_n_2 ;
  wire \alu_result_OBUF[0]_inst_i_41_n_3 ;
  wire \alu_result_OBUF[0]_inst_i_42_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_43_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_44_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_45_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_46_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_47_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_48_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_49_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_50_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_50_n_1 ;
  wire \alu_result_OBUF[0]_inst_i_50_n_2 ;
  wire \alu_result_OBUF[0]_inst_i_50_n_3 ;
  wire \alu_result_OBUF[0]_inst_i_51_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_52_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_53_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_54_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_55_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_56_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_57_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_58_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_59_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_59_n_1 ;
  wire \alu_result_OBUF[0]_inst_i_59_n_2 ;
  wire \alu_result_OBUF[0]_inst_i_59_n_3 ;
  wire \alu_result_OBUF[0]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_60_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_61_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_62_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_63_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_64_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_65_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_66_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_67_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_68_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_69_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_70_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_71_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_72_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_73_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_74_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_75_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_76_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_77_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_78_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_79_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_80_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_81_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_82_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_83_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[0]_inst_i_9_n_1 ;
  wire \alu_result_OBUF[0]_inst_i_9_n_2 ;
  wire \alu_result_OBUF[0]_inst_i_9_n_3 ;
  wire \alu_result_OBUF[10]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[10]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[10]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[10]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[10]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[10]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[10]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[10]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[10]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_13_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_15_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_16_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_17_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_18_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_19_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_20_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_21_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_6_n_1 ;
  wire \alu_result_OBUF[11]_inst_i_6_n_2 ;
  wire \alu_result_OBUF[11]_inst_i_6_n_3 ;
  wire \alu_result_OBUF[11]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[11]_inst_i_9_n_1 ;
  wire \alu_result_OBUF[11]_inst_i_9_n_2 ;
  wire \alu_result_OBUF[11]_inst_i_9_n_3 ;
  wire \alu_result_OBUF[12]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[12]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[12]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[12]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[12]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[12]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[12]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[12]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[12]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[12]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[13]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[14]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_13_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_15_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_16_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_17_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_18_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_19_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_20_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_21_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_6_n_1 ;
  wire \alu_result_OBUF[15]_inst_i_6_n_2 ;
  wire \alu_result_OBUF[15]_inst_i_6_n_3 ;
  wire \alu_result_OBUF[15]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[15]_inst_i_9_n_1 ;
  wire \alu_result_OBUF[15]_inst_i_9_n_2 ;
  wire \alu_result_OBUF[15]_inst_i_9_n_3 ;
  wire \alu_result_OBUF[16]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[16]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[17]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[18]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_13_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_15_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_16_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_17_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_18_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_19_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_20_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_21_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_22_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_23_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_6_n_1 ;
  wire \alu_result_OBUF[19]_inst_i_6_n_2 ;
  wire \alu_result_OBUF[19]_inst_i_6_n_3 ;
  wire \alu_result_OBUF[19]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[19]_inst_i_9_n_1 ;
  wire \alu_result_OBUF[19]_inst_i_9_n_2 ;
  wire \alu_result_OBUF[19]_inst_i_9_n_3 ;
  wire \alu_result_OBUF[1]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[1]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[1]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[1]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[1]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[1]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[1]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[1]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[1]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[1]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[20]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[21]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[22]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_13_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_15_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_16_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_17_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_18_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_19_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_20_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_21_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_6_n_1 ;
  wire \alu_result_OBUF[23]_inst_i_6_n_2 ;
  wire \alu_result_OBUF[23]_inst_i_6_n_3 ;
  wire \alu_result_OBUF[23]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[23]_inst_i_9_n_1 ;
  wire \alu_result_OBUF[23]_inst_i_9_n_2 ;
  wire \alu_result_OBUF[23]_inst_i_9_n_3 ;
  wire \alu_result_OBUF[24]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[24]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[24]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[24]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[24]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[24]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[24]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[24]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[24]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[24]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[25]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[26]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[26]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[26]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[26]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[26]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[26]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[26]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[26]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[26]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_13_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_15_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_16_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_17_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_18_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_19_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_20_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_21_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_6_n_1 ;
  wire \alu_result_OBUF[27]_inst_i_6_n_2 ;
  wire \alu_result_OBUF[27]_inst_i_6_n_3 ;
  wire \alu_result_OBUF[27]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[27]_inst_i_9_n_1 ;
  wire \alu_result_OBUF[27]_inst_i_9_n_2 ;
  wire \alu_result_OBUF[27]_inst_i_9_n_3 ;
  wire \alu_result_OBUF[28]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[28]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[28]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[28]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[28]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[28]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[28]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[28]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[28]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[28]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[29]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[29]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[29]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[29]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[29]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[29]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[29]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[29]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[29]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[2]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[2]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[2]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[2]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[2]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[2]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[2]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[2]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_13_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[30]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_12_n_1 ;
  wire \alu_result_OBUF[31]_inst_i_12_n_2 ;
  wire \alu_result_OBUF[31]_inst_i_12_n_3 ;
  wire \alu_result_OBUF[31]_inst_i_13_n_1 ;
  wire \alu_result_OBUF[31]_inst_i_13_n_2 ;
  wire \alu_result_OBUF[31]_inst_i_13_n_3 ;
  wire \alu_result_OBUF[31]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_15_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_16_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_17_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_18_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_19_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_20_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_21_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_22_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_23_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_24_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_25_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_26_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_27_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_28_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_29_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[31]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_13_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_15_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_16_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_17_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_18_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_19_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_6_n_1 ;
  wire \alu_result_OBUF[3]_inst_i_6_n_2 ;
  wire \alu_result_OBUF[3]_inst_i_6_n_3 ;
  wire \alu_result_OBUF[3]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[3]_inst_i_9_n_1 ;
  wire \alu_result_OBUF[3]_inst_i_9_n_2 ;
  wire \alu_result_OBUF[3]_inst_i_9_n_3 ;
  wire \alu_result_OBUF[4]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[4]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[4]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[4]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[4]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[4]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[4]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[4]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[5]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[5]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[5]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[5]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[5]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[5]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[5]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[5]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[6]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[6]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[6]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[6]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[6]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[6]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[6]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[6]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_12_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_13_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_14_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_15_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_16_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_17_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_18_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_19_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_20_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_6_n_1 ;
  wire \alu_result_OBUF[7]_inst_i_6_n_2 ;
  wire \alu_result_OBUF[7]_inst_i_6_n_3 ;
  wire \alu_result_OBUF[7]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[7]_inst_i_9_n_1 ;
  wire \alu_result_OBUF[7]_inst_i_9_n_2 ;
  wire \alu_result_OBUF[7]_inst_i_9_n_3 ;
  wire \alu_result_OBUF[8]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[8]_inst_i_11_n_0 ;
  wire \alu_result_OBUF[8]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[8]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[8]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[8]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[8]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[8]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[8]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[8]_inst_i_9_n_0 ;
  wire \alu_result_OBUF[9]_inst_i_10_n_0 ;
  wire \alu_result_OBUF[9]_inst_i_2_n_0 ;
  wire \alu_result_OBUF[9]_inst_i_3_n_0 ;
  wire \alu_result_OBUF[9]_inst_i_4_n_0 ;
  wire \alu_result_OBUF[9]_inst_i_5_n_0 ;
  wire \alu_result_OBUF[9]_inst_i_6_n_0 ;
  wire \alu_result_OBUF[9]_inst_i_7_n_0 ;
  wire \alu_result_OBUF[9]_inst_i_8_n_0 ;
  wire \alu_result_OBUF[9]_inst_i_9_n_0 ;
  wire [31:0]data0;
  wire [31:0]data1;
  wire data3;
  wire data4;
  wire [3:0]exe_alu_opc_r;
  wire [3:0]exe_alu_opc_r_IBUF;
  wire [31:0]exe_pc_r;
  wire [31:0]exe_pc_r_IBUF;
  wire [31:0]exe_reg1_r;
  wire [31:0]exe_reg1_r_IBUF;
  wire exe_sel_pc_r;
  wire exe_sel_pc_r_IBUF;
  wire [31:0]exe_src2_r;
  wire [31:0]exe_src2_r_IBUF;
  wire [3:0]\NLW_alu_result_OBUF[0]_inst_i_10_O_UNCONNECTED ;
  wire [3:0]\NLW_alu_result_OBUF[0]_inst_i_13_O_UNCONNECTED ;
  wire [3:0]\NLW_alu_result_OBUF[0]_inst_i_22_O_UNCONNECTED ;
  wire [3:0]\NLW_alu_result_OBUF[0]_inst_i_32_O_UNCONNECTED ;
  wire [3:0]\NLW_alu_result_OBUF[0]_inst_i_41_O_UNCONNECTED ;
  wire [3:0]\NLW_alu_result_OBUF[0]_inst_i_50_O_UNCONNECTED ;
  wire [3:0]\NLW_alu_result_OBUF[0]_inst_i_59_O_UNCONNECTED ;
  wire [3:0]\NLW_alu_result_OBUF[0]_inst_i_9_O_UNCONNECTED ;
  wire [3:3]\NLW_alu_result_OBUF[31]_inst_i_12_CO_UNCONNECTED ;
  wire [3:3]\NLW_alu_result_OBUF[31]_inst_i_13_CO_UNCONNECTED ;

  OBUF \alu_result_OBUF[0]_inst 
       (.I(alu_result_OBUF[0]),
        .O(alu_result[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFEFEEE)) 
    \alu_result_OBUF[0]_inst_i_1 
       (.I0(\alu_result_OBUF[0]_inst_i_2_n_0 ),
        .I1(\alu_result_OBUF[0]_inst_i_3_n_0 ),
        .I2(\alu_result_OBUF[31]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[0]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[0]_inst_i_5_n_0 ),
        .I5(\alu_result_OBUF[0]_inst_i_6_n_0 ),
        .O(alu_result_OBUF[0]));
  CARRY4 \alu_result_OBUF[0]_inst_i_10 
       (.CI(\alu_result_OBUF[0]_inst_i_22_n_0 ),
        .CO({data3,\alu_result_OBUF[0]_inst_i_10_n_1 ,\alu_result_OBUF[0]_inst_i_10_n_2 ,\alu_result_OBUF[0]_inst_i_10_n_3 }),
        .CYINIT(1'b0),
        .DI({\alu_result_OBUF[0]_inst_i_23_n_0 ,\alu_result_OBUF[0]_inst_i_24_n_0 ,\alu_result_OBUF[0]_inst_i_25_n_0 ,\alu_result_OBUF[0]_inst_i_26_n_0 }),
        .O(\NLW_alu_result_OBUF[0]_inst_i_10_O_UNCONNECTED [3:0]),
        .S({\alu_result_OBUF[0]_inst_i_27_n_0 ,\alu_result_OBUF[0]_inst_i_28_n_0 ,\alu_result_OBUF[0]_inst_i_29_n_0 ,\alu_result_OBUF[0]_inst_i_30_n_0 }));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[0]_inst_i_11 
       (.I0(\alu_result_OBUF[0]_inst_i_31_n_0 ),
        .I1(\alu_result_OBUF[4]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[6]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[2]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[0]_inst_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \alu_result_OBUF[0]_inst_i_12 
       (.I0(exe_src2_r_IBUF[2]),
        .I1(exe_src2_r_IBUF[1]),
        .I2(exe_reg1_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[3]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[0]_inst_i_12_n_0 ));
  CARRY4 \alu_result_OBUF[0]_inst_i_13 
       (.CI(\alu_result_OBUF[0]_inst_i_32_n_0 ),
        .CO({\alu_result_OBUF[0]_inst_i_13_n_0 ,\alu_result_OBUF[0]_inst_i_13_n_1 ,\alu_result_OBUF[0]_inst_i_13_n_2 ,\alu_result_OBUF[0]_inst_i_13_n_3 }),
        .CYINIT(1'b0),
        .DI({\alu_result_OBUF[0]_inst_i_33_n_0 ,\alu_result_OBUF[0]_inst_i_34_n_0 ,\alu_result_OBUF[0]_inst_i_35_n_0 ,\alu_result_OBUF[0]_inst_i_36_n_0 }),
        .O(\NLW_alu_result_OBUF[0]_inst_i_13_O_UNCONNECTED [3:0]),
        .S({\alu_result_OBUF[0]_inst_i_37_n_0 ,\alu_result_OBUF[0]_inst_i_38_n_0 ,\alu_result_OBUF[0]_inst_i_39_n_0 ,\alu_result_OBUF[0]_inst_i_40_n_0 }));
  LUT4 #(
    .INIT(16'h22B2)) 
    \alu_result_OBUF[0]_inst_i_14 
       (.I0(exe_src2_r_IBUF[31]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(exe_src2_r_IBUF[30]),
        .I3(exe_reg1_r_IBUF[30]),
        .O(\alu_result_OBUF[0]_inst_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_15 
       (.I0(exe_src2_r_IBUF[28]),
        .I1(exe_reg1_r_IBUF[28]),
        .I2(exe_reg1_r_IBUF[29]),
        .I3(exe_src2_r_IBUF[29]),
        .O(\alu_result_OBUF[0]_inst_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_16 
       (.I0(exe_src2_r_IBUF[26]),
        .I1(exe_reg1_r_IBUF[26]),
        .I2(exe_reg1_r_IBUF[27]),
        .I3(exe_src2_r_IBUF[27]),
        .O(\alu_result_OBUF[0]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_17 
       (.I0(exe_src2_r_IBUF[24]),
        .I1(exe_reg1_r_IBUF[24]),
        .I2(exe_reg1_r_IBUF[25]),
        .I3(exe_src2_r_IBUF[25]),
        .O(\alu_result_OBUF[0]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_18 
       (.I0(exe_reg1_r_IBUF[31]),
        .I1(exe_src2_r_IBUF[31]),
        .I2(exe_reg1_r_IBUF[30]),
        .I3(exe_src2_r_IBUF[30]),
        .O(\alu_result_OBUF[0]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_19 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[29]),
        .I2(exe_reg1_r_IBUF[28]),
        .I3(exe_src2_r_IBUF[28]),
        .O(\alu_result_OBUF[0]_inst_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h88A888A888AA8888)) 
    \alu_result_OBUF[0]_inst_i_2 
       (.I0(\alu_result_OBUF[0]_inst_i_7_n_0 ),
        .I1(\alu_result_OBUF[0]_inst_i_8_n_0 ),
        .I2(data4),
        .I3(exe_alu_opc_r_IBUF[2]),
        .I4(data3),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[0]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_20 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_src2_r_IBUF[27]),
        .I2(exe_reg1_r_IBUF[26]),
        .I3(exe_src2_r_IBUF[26]),
        .O(\alu_result_OBUF[0]_inst_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_21 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_src2_r_IBUF[25]),
        .I2(exe_reg1_r_IBUF[24]),
        .I3(exe_src2_r_IBUF[24]),
        .O(\alu_result_OBUF[0]_inst_i_21_n_0 ));
  CARRY4 \alu_result_OBUF[0]_inst_i_22 
       (.CI(\alu_result_OBUF[0]_inst_i_41_n_0 ),
        .CO({\alu_result_OBUF[0]_inst_i_22_n_0 ,\alu_result_OBUF[0]_inst_i_22_n_1 ,\alu_result_OBUF[0]_inst_i_22_n_2 ,\alu_result_OBUF[0]_inst_i_22_n_3 }),
        .CYINIT(1'b0),
        .DI({\alu_result_OBUF[0]_inst_i_42_n_0 ,\alu_result_OBUF[0]_inst_i_43_n_0 ,\alu_result_OBUF[0]_inst_i_44_n_0 ,\alu_result_OBUF[0]_inst_i_45_n_0 }),
        .O(\NLW_alu_result_OBUF[0]_inst_i_22_O_UNCONNECTED [3:0]),
        .S({\alu_result_OBUF[0]_inst_i_46_n_0 ,\alu_result_OBUF[0]_inst_i_47_n_0 ,\alu_result_OBUF[0]_inst_i_48_n_0 ,\alu_result_OBUF[0]_inst_i_49_n_0 }));
  LUT4 #(
    .INIT(16'h44D4)) 
    \alu_result_OBUF[0]_inst_i_23 
       (.I0(exe_src2_r_IBUF[31]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(exe_src2_r_IBUF[30]),
        .I3(exe_reg1_r_IBUF[30]),
        .O(\alu_result_OBUF[0]_inst_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_24 
       (.I0(exe_src2_r_IBUF[28]),
        .I1(exe_reg1_r_IBUF[28]),
        .I2(exe_reg1_r_IBUF[29]),
        .I3(exe_src2_r_IBUF[29]),
        .O(\alu_result_OBUF[0]_inst_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_25 
       (.I0(exe_src2_r_IBUF[26]),
        .I1(exe_reg1_r_IBUF[26]),
        .I2(exe_reg1_r_IBUF[27]),
        .I3(exe_src2_r_IBUF[27]),
        .O(\alu_result_OBUF[0]_inst_i_25_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_26 
       (.I0(exe_src2_r_IBUF[24]),
        .I1(exe_reg1_r_IBUF[24]),
        .I2(exe_reg1_r_IBUF[25]),
        .I3(exe_src2_r_IBUF[25]),
        .O(\alu_result_OBUF[0]_inst_i_26_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_27 
       (.I0(exe_reg1_r_IBUF[31]),
        .I1(exe_src2_r_IBUF[31]),
        .I2(exe_reg1_r_IBUF[30]),
        .I3(exe_src2_r_IBUF[30]),
        .O(\alu_result_OBUF[0]_inst_i_27_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_28 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[29]),
        .I2(exe_reg1_r_IBUF[28]),
        .I3(exe_src2_r_IBUF[28]),
        .O(\alu_result_OBUF[0]_inst_i_28_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_29 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_src2_r_IBUF[27]),
        .I2(exe_reg1_r_IBUF[26]),
        .I3(exe_src2_r_IBUF[26]),
        .O(\alu_result_OBUF[0]_inst_i_29_n_0 ));
  LUT5 #(
    .INIT(32'h88800080)) 
    \alu_result_OBUF[0]_inst_i_3 
       (.I0(exe_alu_opc_r_IBUF[3]),
        .I1(exe_alu_opc_r_IBUF[2]),
        .I2(\alu_result_OBUF[0]_inst_i_11_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(\alu_result_OBUF[1]_inst_i_7_n_0 ),
        .O(\alu_result_OBUF[0]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_30 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_src2_r_IBUF[25]),
        .I2(exe_reg1_r_IBUF[24]),
        .I3(exe_src2_r_IBUF[24]),
        .O(\alu_result_OBUF[0]_inst_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[0]_inst_i_31 
       (.I0(exe_reg1_r_IBUF[0]),
        .I1(exe_reg1_r_IBUF[16]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[24]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[8]),
        .O(\alu_result_OBUF[0]_inst_i_31_n_0 ));
  CARRY4 \alu_result_OBUF[0]_inst_i_32 
       (.CI(\alu_result_OBUF[0]_inst_i_50_n_0 ),
        .CO({\alu_result_OBUF[0]_inst_i_32_n_0 ,\alu_result_OBUF[0]_inst_i_32_n_1 ,\alu_result_OBUF[0]_inst_i_32_n_2 ,\alu_result_OBUF[0]_inst_i_32_n_3 }),
        .CYINIT(1'b0),
        .DI({\alu_result_OBUF[0]_inst_i_51_n_0 ,\alu_result_OBUF[0]_inst_i_52_n_0 ,\alu_result_OBUF[0]_inst_i_53_n_0 ,\alu_result_OBUF[0]_inst_i_54_n_0 }),
        .O(\NLW_alu_result_OBUF[0]_inst_i_32_O_UNCONNECTED [3:0]),
        .S({\alu_result_OBUF[0]_inst_i_55_n_0 ,\alu_result_OBUF[0]_inst_i_56_n_0 ,\alu_result_OBUF[0]_inst_i_57_n_0 ,\alu_result_OBUF[0]_inst_i_58_n_0 }));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_33 
       (.I0(exe_src2_r_IBUF[22]),
        .I1(exe_reg1_r_IBUF[22]),
        .I2(exe_reg1_r_IBUF[23]),
        .I3(exe_src2_r_IBUF[23]),
        .O(\alu_result_OBUF[0]_inst_i_33_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_34 
       (.I0(exe_src2_r_IBUF[20]),
        .I1(exe_reg1_r_IBUF[20]),
        .I2(exe_reg1_r_IBUF[21]),
        .I3(exe_src2_r_IBUF[21]),
        .O(\alu_result_OBUF[0]_inst_i_34_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_35 
       (.I0(exe_src2_r_IBUF[18]),
        .I1(exe_reg1_r_IBUF[18]),
        .I2(exe_reg1_r_IBUF[19]),
        .I3(exe_src2_r_IBUF[19]),
        .O(\alu_result_OBUF[0]_inst_i_35_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_36 
       (.I0(exe_src2_r_IBUF[16]),
        .I1(exe_reg1_r_IBUF[16]),
        .I2(exe_reg1_r_IBUF[17]),
        .I3(exe_src2_r_IBUF[17]),
        .O(\alu_result_OBUF[0]_inst_i_36_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_37 
       (.I0(exe_reg1_r_IBUF[23]),
        .I1(exe_src2_r_IBUF[23]),
        .I2(exe_reg1_r_IBUF[22]),
        .I3(exe_src2_r_IBUF[22]),
        .O(\alu_result_OBUF[0]_inst_i_37_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_38 
       (.I0(exe_reg1_r_IBUF[21]),
        .I1(exe_src2_r_IBUF[21]),
        .I2(exe_reg1_r_IBUF[20]),
        .I3(exe_src2_r_IBUF[20]),
        .O(\alu_result_OBUF[0]_inst_i_38_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_39 
       (.I0(exe_reg1_r_IBUF[19]),
        .I1(exe_src2_r_IBUF[19]),
        .I2(exe_reg1_r_IBUF[18]),
        .I3(exe_src2_r_IBUF[18]),
        .O(\alu_result_OBUF[0]_inst_i_39_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h88800080)) 
    \alu_result_OBUF[0]_inst_i_4 
       (.I0(exe_alu_opc_r_IBUF[0]),
        .I1(exe_alu_opc_r_IBUF[2]),
        .I2(\alu_result_OBUF[0]_inst_i_11_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(\alu_result_OBUF[1]_inst_i_7_n_0 ),
        .O(\alu_result_OBUF[0]_inst_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_40 
       (.I0(exe_reg1_r_IBUF[17]),
        .I1(exe_src2_r_IBUF[17]),
        .I2(exe_reg1_r_IBUF[16]),
        .I3(exe_src2_r_IBUF[16]),
        .O(\alu_result_OBUF[0]_inst_i_40_n_0 ));
  CARRY4 \alu_result_OBUF[0]_inst_i_41 
       (.CI(\alu_result_OBUF[0]_inst_i_59_n_0 ),
        .CO({\alu_result_OBUF[0]_inst_i_41_n_0 ,\alu_result_OBUF[0]_inst_i_41_n_1 ,\alu_result_OBUF[0]_inst_i_41_n_2 ,\alu_result_OBUF[0]_inst_i_41_n_3 }),
        .CYINIT(1'b0),
        .DI({\alu_result_OBUF[0]_inst_i_60_n_0 ,\alu_result_OBUF[0]_inst_i_61_n_0 ,\alu_result_OBUF[0]_inst_i_62_n_0 ,\alu_result_OBUF[0]_inst_i_63_n_0 }),
        .O(\NLW_alu_result_OBUF[0]_inst_i_41_O_UNCONNECTED [3:0]),
        .S({\alu_result_OBUF[0]_inst_i_64_n_0 ,\alu_result_OBUF[0]_inst_i_65_n_0 ,\alu_result_OBUF[0]_inst_i_66_n_0 ,\alu_result_OBUF[0]_inst_i_67_n_0 }));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_42 
       (.I0(exe_src2_r_IBUF[22]),
        .I1(exe_reg1_r_IBUF[22]),
        .I2(exe_reg1_r_IBUF[23]),
        .I3(exe_src2_r_IBUF[23]),
        .O(\alu_result_OBUF[0]_inst_i_42_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_43 
       (.I0(exe_src2_r_IBUF[20]),
        .I1(exe_reg1_r_IBUF[20]),
        .I2(exe_reg1_r_IBUF[21]),
        .I3(exe_src2_r_IBUF[21]),
        .O(\alu_result_OBUF[0]_inst_i_43_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_44 
       (.I0(exe_src2_r_IBUF[18]),
        .I1(exe_reg1_r_IBUF[18]),
        .I2(exe_reg1_r_IBUF[19]),
        .I3(exe_src2_r_IBUF[19]),
        .O(\alu_result_OBUF[0]_inst_i_44_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_45 
       (.I0(exe_src2_r_IBUF[16]),
        .I1(exe_reg1_r_IBUF[16]),
        .I2(exe_reg1_r_IBUF[17]),
        .I3(exe_src2_r_IBUF[17]),
        .O(\alu_result_OBUF[0]_inst_i_45_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_46 
       (.I0(exe_reg1_r_IBUF[23]),
        .I1(exe_src2_r_IBUF[23]),
        .I2(exe_reg1_r_IBUF[22]),
        .I3(exe_src2_r_IBUF[22]),
        .O(\alu_result_OBUF[0]_inst_i_46_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_47 
       (.I0(exe_reg1_r_IBUF[21]),
        .I1(exe_src2_r_IBUF[21]),
        .I2(exe_reg1_r_IBUF[20]),
        .I3(exe_src2_r_IBUF[20]),
        .O(\alu_result_OBUF[0]_inst_i_47_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_48 
       (.I0(exe_reg1_r_IBUF[19]),
        .I1(exe_src2_r_IBUF[19]),
        .I2(exe_reg1_r_IBUF[18]),
        .I3(exe_src2_r_IBUF[18]),
        .O(\alu_result_OBUF[0]_inst_i_48_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_49 
       (.I0(exe_reg1_r_IBUF[17]),
        .I1(exe_src2_r_IBUF[17]),
        .I2(exe_reg1_r_IBUF[16]),
        .I3(exe_src2_r_IBUF[16]),
        .O(\alu_result_OBUF[0]_inst_i_49_n_0 ));
  LUT6 #(
    .INIT(64'h003300CC00AAF0AA)) 
    \alu_result_OBUF[0]_inst_i_5 
       (.I0(data0[0]),
        .I1(exe_reg1_r_IBUF[0]),
        .I2(\alu_result_OBUF[0]_inst_i_12_n_0 ),
        .I3(exe_alu_opc_r_IBUF[0]),
        .I4(exe_src2_r_IBUF[0]),
        .I5(exe_alu_opc_r_IBUF[2]),
        .O(\alu_result_OBUF[0]_inst_i_5_n_0 ));
  CARRY4 \alu_result_OBUF[0]_inst_i_50 
       (.CI(1'b0),
        .CO({\alu_result_OBUF[0]_inst_i_50_n_0 ,\alu_result_OBUF[0]_inst_i_50_n_1 ,\alu_result_OBUF[0]_inst_i_50_n_2 ,\alu_result_OBUF[0]_inst_i_50_n_3 }),
        .CYINIT(1'b0),
        .DI({\alu_result_OBUF[0]_inst_i_68_n_0 ,\alu_result_OBUF[0]_inst_i_69_n_0 ,\alu_result_OBUF[0]_inst_i_70_n_0 ,\alu_result_OBUF[0]_inst_i_71_n_0 }),
        .O(\NLW_alu_result_OBUF[0]_inst_i_50_O_UNCONNECTED [3:0]),
        .S({\alu_result_OBUF[0]_inst_i_72_n_0 ,\alu_result_OBUF[0]_inst_i_73_n_0 ,\alu_result_OBUF[0]_inst_i_74_n_0 ,\alu_result_OBUF[0]_inst_i_75_n_0 }));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_51 
       (.I0(exe_src2_r_IBUF[14]),
        .I1(exe_reg1_r_IBUF[14]),
        .I2(exe_reg1_r_IBUF[15]),
        .I3(exe_src2_r_IBUF[15]),
        .O(\alu_result_OBUF[0]_inst_i_51_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_52 
       (.I0(exe_src2_r_IBUF[12]),
        .I1(exe_reg1_r_IBUF[12]),
        .I2(exe_reg1_r_IBUF[13]),
        .I3(exe_src2_r_IBUF[13]),
        .O(\alu_result_OBUF[0]_inst_i_52_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_53 
       (.I0(exe_src2_r_IBUF[10]),
        .I1(exe_reg1_r_IBUF[10]),
        .I2(exe_reg1_r_IBUF[11]),
        .I3(exe_src2_r_IBUF[11]),
        .O(\alu_result_OBUF[0]_inst_i_53_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_54 
       (.I0(exe_src2_r_IBUF[8]),
        .I1(exe_reg1_r_IBUF[8]),
        .I2(exe_reg1_r_IBUF[9]),
        .I3(exe_src2_r_IBUF[9]),
        .O(\alu_result_OBUF[0]_inst_i_54_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_55 
       (.I0(exe_reg1_r_IBUF[15]),
        .I1(exe_src2_r_IBUF[15]),
        .I2(exe_reg1_r_IBUF[14]),
        .I3(exe_src2_r_IBUF[14]),
        .O(\alu_result_OBUF[0]_inst_i_55_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_56 
       (.I0(exe_reg1_r_IBUF[13]),
        .I1(exe_src2_r_IBUF[13]),
        .I2(exe_reg1_r_IBUF[12]),
        .I3(exe_src2_r_IBUF[12]),
        .O(\alu_result_OBUF[0]_inst_i_56_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_57 
       (.I0(exe_reg1_r_IBUF[11]),
        .I1(exe_src2_r_IBUF[11]),
        .I2(exe_reg1_r_IBUF[10]),
        .I3(exe_src2_r_IBUF[10]),
        .O(\alu_result_OBUF[0]_inst_i_57_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_58 
       (.I0(exe_reg1_r_IBUF[9]),
        .I1(exe_src2_r_IBUF[9]),
        .I2(exe_reg1_r_IBUF[8]),
        .I3(exe_src2_r_IBUF[8]),
        .O(\alu_result_OBUF[0]_inst_i_58_n_0 ));
  CARRY4 \alu_result_OBUF[0]_inst_i_59 
       (.CI(1'b0),
        .CO({\alu_result_OBUF[0]_inst_i_59_n_0 ,\alu_result_OBUF[0]_inst_i_59_n_1 ,\alu_result_OBUF[0]_inst_i_59_n_2 ,\alu_result_OBUF[0]_inst_i_59_n_3 }),
        .CYINIT(1'b0),
        .DI({\alu_result_OBUF[0]_inst_i_76_n_0 ,\alu_result_OBUF[0]_inst_i_77_n_0 ,\alu_result_OBUF[0]_inst_i_78_n_0 ,\alu_result_OBUF[0]_inst_i_79_n_0 }),
        .O(\NLW_alu_result_OBUF[0]_inst_i_59_O_UNCONNECTED [3:0]),
        .S({\alu_result_OBUF[0]_inst_i_80_n_0 ,\alu_result_OBUF[0]_inst_i_81_n_0 ,\alu_result_OBUF[0]_inst_i_82_n_0 ,\alu_result_OBUF[0]_inst_i_83_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \alu_result_OBUF[0]_inst_i_6 
       (.I0(data1[0]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[2]),
        .O(\alu_result_OBUF[0]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_60 
       (.I0(exe_src2_r_IBUF[14]),
        .I1(exe_reg1_r_IBUF[14]),
        .I2(exe_reg1_r_IBUF[15]),
        .I3(exe_src2_r_IBUF[15]),
        .O(\alu_result_OBUF[0]_inst_i_60_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_61 
       (.I0(exe_src2_r_IBUF[12]),
        .I1(exe_reg1_r_IBUF[12]),
        .I2(exe_reg1_r_IBUF[13]),
        .I3(exe_src2_r_IBUF[13]),
        .O(\alu_result_OBUF[0]_inst_i_61_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_62 
       (.I0(exe_src2_r_IBUF[10]),
        .I1(exe_reg1_r_IBUF[10]),
        .I2(exe_reg1_r_IBUF[11]),
        .I3(exe_src2_r_IBUF[11]),
        .O(\alu_result_OBUF[0]_inst_i_62_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_63 
       (.I0(exe_src2_r_IBUF[8]),
        .I1(exe_reg1_r_IBUF[8]),
        .I2(exe_reg1_r_IBUF[9]),
        .I3(exe_src2_r_IBUF[9]),
        .O(\alu_result_OBUF[0]_inst_i_63_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_64 
       (.I0(exe_reg1_r_IBUF[15]),
        .I1(exe_src2_r_IBUF[15]),
        .I2(exe_reg1_r_IBUF[14]),
        .I3(exe_src2_r_IBUF[14]),
        .O(\alu_result_OBUF[0]_inst_i_64_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_65 
       (.I0(exe_reg1_r_IBUF[13]),
        .I1(exe_src2_r_IBUF[13]),
        .I2(exe_reg1_r_IBUF[12]),
        .I3(exe_src2_r_IBUF[12]),
        .O(\alu_result_OBUF[0]_inst_i_65_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_66 
       (.I0(exe_reg1_r_IBUF[11]),
        .I1(exe_src2_r_IBUF[11]),
        .I2(exe_reg1_r_IBUF[10]),
        .I3(exe_src2_r_IBUF[10]),
        .O(\alu_result_OBUF[0]_inst_i_66_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_67 
       (.I0(exe_reg1_r_IBUF[9]),
        .I1(exe_src2_r_IBUF[9]),
        .I2(exe_reg1_r_IBUF[8]),
        .I3(exe_src2_r_IBUF[8]),
        .O(\alu_result_OBUF[0]_inst_i_67_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_68 
       (.I0(exe_src2_r_IBUF[6]),
        .I1(exe_reg1_r_IBUF[6]),
        .I2(exe_reg1_r_IBUF[7]),
        .I3(exe_src2_r_IBUF[7]),
        .O(\alu_result_OBUF[0]_inst_i_68_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_69 
       (.I0(exe_src2_r_IBUF[4]),
        .I1(exe_reg1_r_IBUF[4]),
        .I2(exe_reg1_r_IBUF[5]),
        .I3(exe_src2_r_IBUF[5]),
        .O(\alu_result_OBUF[0]_inst_i_69_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \alu_result_OBUF[0]_inst_i_7 
       (.I0(exe_alu_opc_r_IBUF[1]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .O(\alu_result_OBUF[0]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_70 
       (.I0(exe_src2_r_IBUF[2]),
        .I1(exe_reg1_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[0]_inst_i_70_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_71 
       (.I0(exe_src2_r_IBUF[0]),
        .I1(exe_reg1_r_IBUF[0]),
        .I2(exe_reg1_r_IBUF[1]),
        .I3(exe_src2_r_IBUF[1]),
        .O(\alu_result_OBUF[0]_inst_i_71_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_72 
       (.I0(exe_reg1_r_IBUF[7]),
        .I1(exe_src2_r_IBUF[7]),
        .I2(exe_reg1_r_IBUF[6]),
        .I3(exe_src2_r_IBUF[6]),
        .O(\alu_result_OBUF[0]_inst_i_72_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_73 
       (.I0(exe_reg1_r_IBUF[5]),
        .I1(exe_src2_r_IBUF[5]),
        .I2(exe_reg1_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[0]_inst_i_73_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_74 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[2]),
        .I3(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[0]_inst_i_74_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_75 
       (.I0(exe_reg1_r_IBUF[1]),
        .I1(exe_src2_r_IBUF[1]),
        .I2(exe_reg1_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[0]_inst_i_75_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_76 
       (.I0(exe_src2_r_IBUF[6]),
        .I1(exe_reg1_r_IBUF[6]),
        .I2(exe_reg1_r_IBUF[7]),
        .I3(exe_src2_r_IBUF[7]),
        .O(\alu_result_OBUF[0]_inst_i_76_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_77 
       (.I0(exe_src2_r_IBUF[4]),
        .I1(exe_reg1_r_IBUF[4]),
        .I2(exe_reg1_r_IBUF[5]),
        .I3(exe_src2_r_IBUF[5]),
        .O(\alu_result_OBUF[0]_inst_i_77_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_78 
       (.I0(exe_src2_r_IBUF[2]),
        .I1(exe_reg1_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[0]_inst_i_78_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \alu_result_OBUF[0]_inst_i_79 
       (.I0(exe_src2_r_IBUF[0]),
        .I1(exe_reg1_r_IBUF[0]),
        .I2(exe_reg1_r_IBUF[1]),
        .I3(exe_src2_r_IBUF[1]),
        .O(\alu_result_OBUF[0]_inst_i_79_n_0 ));
  LUT4 #(
    .INIT(16'hB200)) 
    \alu_result_OBUF[0]_inst_i_8 
       (.I0(exe_src2_r_IBUF[0]),
        .I1(exe_alu_opc_r_IBUF[0]),
        .I2(exe_reg1_r_IBUF[0]),
        .I3(exe_alu_opc_r_IBUF[2]),
        .O(\alu_result_OBUF[0]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_80 
       (.I0(exe_reg1_r_IBUF[7]),
        .I1(exe_src2_r_IBUF[7]),
        .I2(exe_reg1_r_IBUF[6]),
        .I3(exe_src2_r_IBUF[6]),
        .O(\alu_result_OBUF[0]_inst_i_80_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_81 
       (.I0(exe_reg1_r_IBUF[5]),
        .I1(exe_src2_r_IBUF[5]),
        .I2(exe_reg1_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[0]_inst_i_81_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_82 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[2]),
        .I3(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[0]_inst_i_82_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \alu_result_OBUF[0]_inst_i_83 
       (.I0(exe_reg1_r_IBUF[1]),
        .I1(exe_src2_r_IBUF[1]),
        .I2(exe_reg1_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[0]_inst_i_83_n_0 ));
  CARRY4 \alu_result_OBUF[0]_inst_i_9 
       (.CI(\alu_result_OBUF[0]_inst_i_13_n_0 ),
        .CO({data4,\alu_result_OBUF[0]_inst_i_9_n_1 ,\alu_result_OBUF[0]_inst_i_9_n_2 ,\alu_result_OBUF[0]_inst_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({\alu_result_OBUF[0]_inst_i_14_n_0 ,\alu_result_OBUF[0]_inst_i_15_n_0 ,\alu_result_OBUF[0]_inst_i_16_n_0 ,\alu_result_OBUF[0]_inst_i_17_n_0 }),
        .O(\NLW_alu_result_OBUF[0]_inst_i_9_O_UNCONNECTED [3:0]),
        .S({\alu_result_OBUF[0]_inst_i_18_n_0 ,\alu_result_OBUF[0]_inst_i_19_n_0 ,\alu_result_OBUF[0]_inst_i_20_n_0 ,\alu_result_OBUF[0]_inst_i_21_n_0 }));
  OBUF \alu_result_OBUF[10]_inst 
       (.I(alu_result_OBUF[10]),
        .O(alu_result[10]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[10]_inst_i_1 
       (.I0(\alu_result_OBUF[10]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[10]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[10]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[10]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[10]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[10]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[18]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[26]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[10]),
        .O(\alu_result_OBUF[10]_inst_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[10]_inst_i_2 
       (.I0(data1[10]),
        .I1(\alu_result_OBUF[10]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[11]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[10]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[10]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[10]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[11]_inst_i_8_n_0 ),
        .I5(data0[10]),
        .O(\alu_result_OBUF[10]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[10]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[10]),
        .I1(exe_src2_r_IBUF[10]),
        .I2(\alu_result_OBUF[10]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[11]_inst_i_10_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[10]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[10]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[10]),
        .I4(exe_src2_r_IBUF[10]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[10]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[10]_inst_i_6 
       (.I0(\alu_result_OBUF[16]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[12]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[14]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[10]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[10]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \alu_result_OBUF[10]_inst_i_7 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I3(exe_reg1_r_IBUF[7]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(\alu_result_OBUF[12]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[10]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[10]_inst_i_8 
       (.I0(\alu_result_OBUF[16]_inst_i_12_n_0 ),
        .I1(\alu_result_OBUF[12]_inst_i_11_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[14]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[10]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[10]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \alu_result_OBUF[10]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[18]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[26]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[10]),
        .O(\alu_result_OBUF[10]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[11]_inst 
       (.I(alu_result_OBUF[11]),
        .O(alu_result[11]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[11]_inst_i_1 
       (.I0(\alu_result_OBUF[11]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[11]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[11]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[11]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[11]_inst_i_10 
       (.I0(\alu_result_OBUF[17]_inst_i_12_n_0 ),
        .I1(\alu_result_OBUF[13]_inst_i_11_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[15]_inst_i_21_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[11]_inst_i_21_n_0 ),
        .O(\alu_result_OBUF[11]_inst_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[11]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[11]),
        .I1(exe_src2_r_IBUF[11]),
        .O(\alu_result_OBUF[11]_inst_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[11]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[10]),
        .I1(exe_src2_r_IBUF[10]),
        .O(\alu_result_OBUF[11]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[11]_inst_i_13 
       (.I0(exe_reg1_r_IBUF[9]),
        .I1(exe_src2_r_IBUF[9]),
        .O(\alu_result_OBUF[11]_inst_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[11]_inst_i_14 
       (.I0(exe_reg1_r_IBUF[8]),
        .I1(exe_src2_r_IBUF[8]),
        .O(\alu_result_OBUF[11]_inst_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \alu_result_OBUF[11]_inst_i_15 
       (.I0(exe_reg1_r_IBUF[19]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[27]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[11]),
        .O(\alu_result_OBUF[11]_inst_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h000000003030BB88)) 
    \alu_result_OBUF[11]_inst_i_16 
       (.I0(exe_reg1_r_IBUF[4]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[0]),
        .I3(exe_reg1_r_IBUF[8]),
        .I4(exe_src2_r_IBUF[3]),
        .I5(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[11]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[11]_inst_i_17 
       (.I0(exe_reg1_r_IBUF[11]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[11]),
        .I3(exe_src2_r_IBUF[11]),
        .O(\alu_result_OBUF[11]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[11]_inst_i_18 
       (.I0(exe_reg1_r_IBUF[10]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[10]),
        .I3(exe_src2_r_IBUF[10]),
        .O(\alu_result_OBUF[11]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[11]_inst_i_19 
       (.I0(exe_reg1_r_IBUF[9]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[9]),
        .I3(exe_src2_r_IBUF[9]),
        .O(\alu_result_OBUF[11]_inst_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[11]_inst_i_2 
       (.I0(data1[11]),
        .I1(\alu_result_OBUF[11]_inst_i_7_n_0 ),
        .I2(\alu_result_OBUF[12]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[11]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[11]_inst_i_20 
       (.I0(exe_reg1_r_IBUF[8]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[8]),
        .I3(exe_src2_r_IBUF[8]),
        .O(\alu_result_OBUF[11]_inst_i_20_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[11]_inst_i_21 
       (.I0(exe_reg1_r_IBUF[19]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[27]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[11]),
        .O(\alu_result_OBUF[11]_inst_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[11]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[11]_inst_i_8_n_0 ),
        .I4(\alu_result_OBUF[12]_inst_i_7_n_0 ),
        .I5(data0[11]),
        .O(\alu_result_OBUF[11]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF6666F0006666)) 
    \alu_result_OBUF[11]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[11]),
        .I1(exe_src2_r_IBUF[11]),
        .I2(\alu_result_OBUF[12]_inst_i_8_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(\alu_result_OBUF[11]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[11]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[11]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[11]),
        .I4(exe_src2_r_IBUF[11]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[11]_inst_i_5_n_0 ));
  CARRY4 \alu_result_OBUF[11]_inst_i_6 
       (.CI(\alu_result_OBUF[7]_inst_i_6_n_0 ),
        .CO({\alu_result_OBUF[11]_inst_i_6_n_0 ,\alu_result_OBUF[11]_inst_i_6_n_1 ,\alu_result_OBUF[11]_inst_i_6_n_2 ,\alu_result_OBUF[11]_inst_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_reg1_r_IBUF[11:8]),
        .O(data1[11:8]),
        .S({\alu_result_OBUF[11]_inst_i_11_n_0 ,\alu_result_OBUF[11]_inst_i_12_n_0 ,\alu_result_OBUF[11]_inst_i_13_n_0 ,\alu_result_OBUF[11]_inst_i_14_n_0 }));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[11]_inst_i_7 
       (.I0(\alu_result_OBUF[17]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[13]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[15]_inst_i_15_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[11]_inst_i_15_n_0 ),
        .O(\alu_result_OBUF[11]_inst_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[11]_inst_i_8 
       (.I0(\alu_result_OBUF[11]_inst_i_16_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[13]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[11]_inst_i_8_n_0 ));
  CARRY4 \alu_result_OBUF[11]_inst_i_9 
       (.CI(\alu_result_OBUF[7]_inst_i_9_n_0 ),
        .CO({\alu_result_OBUF[11]_inst_i_9_n_0 ,\alu_result_OBUF[11]_inst_i_9_n_1 ,\alu_result_OBUF[11]_inst_i_9_n_2 ,\alu_result_OBUF[11]_inst_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_src2_r_IBUF[11:8]),
        .O(data0[11:8]),
        .S({\alu_result_OBUF[11]_inst_i_17_n_0 ,\alu_result_OBUF[11]_inst_i_18_n_0 ,\alu_result_OBUF[11]_inst_i_19_n_0 ,\alu_result_OBUF[11]_inst_i_20_n_0 }));
  OBUF \alu_result_OBUF[12]_inst 
       (.I(alu_result_OBUF[12]),
        .O(alu_result[12]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[12]_inst_i_1 
       (.I0(\alu_result_OBUF[12]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[12]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[12]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[12]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[12]));
  LUT6 #(
    .INIT(64'h000000003030BB88)) 
    \alu_result_OBUF[12]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[5]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[9]),
        .I4(exe_src2_r_IBUF[3]),
        .I5(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[12]_inst_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[12]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[20]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[28]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[12]),
        .O(\alu_result_OBUF[12]_inst_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[12]_inst_i_2 
       (.I0(data1[12]),
        .I1(\alu_result_OBUF[12]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[13]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[12]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[12]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[12]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[13]_inst_i_7_n_0 ),
        .I5(data0[12]),
        .O(\alu_result_OBUF[12]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[12]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[12]),
        .I1(exe_src2_r_IBUF[12]),
        .I2(\alu_result_OBUF[12]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[13]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[12]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[12]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[12]),
        .I4(exe_src2_r_IBUF[12]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[12]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[12]_inst_i_6 
       (.I0(\alu_result_OBUF[18]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[14]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[16]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[12]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[12]_inst_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[12]_inst_i_7 
       (.I0(\alu_result_OBUF[12]_inst_i_10_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[14]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[12]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[12]_inst_i_8 
       (.I0(\alu_result_OBUF[18]_inst_i_12_n_0 ),
        .I1(\alu_result_OBUF[14]_inst_i_11_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[16]_inst_i_12_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[12]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[12]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \alu_result_OBUF[12]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[20]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[28]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[12]),
        .O(\alu_result_OBUF[12]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[13]_inst 
       (.I(alu_result_OBUF[13]),
        .O(alu_result[13]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[13]_inst_i_1 
       (.I0(\alu_result_OBUF[13]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[13]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[13]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[13]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[13]));
  LUT6 #(
    .INIT(64'h000000003030BB88)) 
    \alu_result_OBUF[13]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[6]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[2]),
        .I3(exe_reg1_r_IBUF[10]),
        .I4(exe_src2_r_IBUF[3]),
        .I5(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[13]_inst_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[13]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[21]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[29]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[13]),
        .O(\alu_result_OBUF[13]_inst_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[13]_inst_i_2 
       (.I0(data1[13]),
        .I1(\alu_result_OBUF[13]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[14]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[13]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[13]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[13]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[14]_inst_i_7_n_0 ),
        .I5(data0[13]),
        .O(\alu_result_OBUF[13]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF6666F0006666)) 
    \alu_result_OBUF[13]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[13]),
        .I1(exe_src2_r_IBUF[13]),
        .I2(\alu_result_OBUF[14]_inst_i_8_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(\alu_result_OBUF[13]_inst_i_8_n_0 ),
        .O(\alu_result_OBUF[13]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[13]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[13]),
        .I4(exe_src2_r_IBUF[13]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[13]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[13]_inst_i_6 
       (.I0(\alu_result_OBUF[19]_inst_i_16_n_0 ),
        .I1(\alu_result_OBUF[15]_inst_i_15_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[17]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[13]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[13]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \alu_result_OBUF[13]_inst_i_7 
       (.I0(\alu_result_OBUF[13]_inst_i_10_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[15]_inst_i_16_n_0 ),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[19]_inst_i_17_n_0 ),
        .O(\alu_result_OBUF[13]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[13]_inst_i_8 
       (.I0(\alu_result_OBUF[19]_inst_i_23_n_0 ),
        .I1(\alu_result_OBUF[15]_inst_i_21_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[17]_inst_i_12_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[13]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[13]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \alu_result_OBUF[13]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[21]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[29]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[13]),
        .O(\alu_result_OBUF[13]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[14]_inst 
       (.I(alu_result_OBUF[14]),
        .O(alu_result[14]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[14]_inst_i_1 
       (.I0(\alu_result_OBUF[14]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[14]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[14]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[14]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[14]));
  LUT6 #(
    .INIT(64'h000000003030BB88)) 
    \alu_result_OBUF[14]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[7]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[11]),
        .I4(exe_src2_r_IBUF[3]),
        .I5(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[14]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[14]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[22]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[30]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[14]),
        .O(\alu_result_OBUF[14]_inst_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[14]_inst_i_2 
       (.I0(data1[14]),
        .I1(\alu_result_OBUF[14]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[15]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[14]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[14]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[14]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[15]_inst_i_8_n_0 ),
        .I5(data0[14]),
        .O(\alu_result_OBUF[14]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[14]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[14]),
        .I1(exe_src2_r_IBUF[14]),
        .I2(\alu_result_OBUF[14]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[15]_inst_i_10_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[14]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[14]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[14]),
        .I4(exe_src2_r_IBUF[14]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[14]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[14]_inst_i_6 
       (.I0(\alu_result_OBUF[20]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[16]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[18]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[14]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[14]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \alu_result_OBUF[14]_inst_i_7 
       (.I0(\alu_result_OBUF[14]_inst_i_10_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[16]_inst_i_10_n_0 ),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[20]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[14]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[14]_inst_i_8 
       (.I0(\alu_result_OBUF[16]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[16]_inst_i_12_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[18]_inst_i_12_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[14]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[14]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \alu_result_OBUF[14]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[22]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[30]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[14]),
        .O(\alu_result_OBUF[14]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[15]_inst 
       (.I(alu_result_OBUF[15]),
        .O(alu_result[15]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[15]_inst_i_1 
       (.I0(\alu_result_OBUF[15]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[15]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[15]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[15]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[15]_inst_i_10 
       (.I0(\alu_result_OBUF[17]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[17]_inst_i_12_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[19]_inst_i_23_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[15]_inst_i_21_n_0 ),
        .O(\alu_result_OBUF[15]_inst_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[15]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[15]),
        .I1(exe_src2_r_IBUF[15]),
        .O(\alu_result_OBUF[15]_inst_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[15]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[14]),
        .I1(exe_src2_r_IBUF[14]),
        .O(\alu_result_OBUF[15]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[15]_inst_i_13 
       (.I0(exe_reg1_r_IBUF[13]),
        .I1(exe_src2_r_IBUF[13]),
        .O(\alu_result_OBUF[15]_inst_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[15]_inst_i_14 
       (.I0(exe_reg1_r_IBUF[12]),
        .I1(exe_src2_r_IBUF[12]),
        .O(\alu_result_OBUF[15]_inst_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \alu_result_OBUF[15]_inst_i_15 
       (.I0(exe_reg1_r_IBUF[23]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[15]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[15]_inst_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[15]_inst_i_16 
       (.I0(exe_reg1_r_IBUF[0]),
        .I1(exe_reg1_r_IBUF[8]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[15]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[15]_inst_i_17 
       (.I0(exe_reg1_r_IBUF[15]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[15]),
        .I3(exe_src2_r_IBUF[15]),
        .O(\alu_result_OBUF[15]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[15]_inst_i_18 
       (.I0(exe_reg1_r_IBUF[14]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[14]),
        .I3(exe_src2_r_IBUF[14]),
        .O(\alu_result_OBUF[15]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[15]_inst_i_19 
       (.I0(exe_reg1_r_IBUF[13]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[13]),
        .I3(exe_src2_r_IBUF[13]),
        .O(\alu_result_OBUF[15]_inst_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[15]_inst_i_2 
       (.I0(data1[15]),
        .I1(\alu_result_OBUF[15]_inst_i_7_n_0 ),
        .I2(\alu_result_OBUF[16]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[15]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[15]_inst_i_20 
       (.I0(exe_reg1_r_IBUF[12]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[12]),
        .I3(exe_src2_r_IBUF[12]),
        .O(\alu_result_OBUF[15]_inst_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h3300B8B8)) 
    \alu_result_OBUF[15]_inst_i_21 
       (.I0(exe_reg1_r_IBUF[23]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[15]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[15]_inst_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[15]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[15]_inst_i_8_n_0 ),
        .I4(\alu_result_OBUF[16]_inst_i_7_n_0 ),
        .I5(data0[15]),
        .O(\alu_result_OBUF[15]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF6666F0006666)) 
    \alu_result_OBUF[15]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[15]),
        .I1(exe_src2_r_IBUF[15]),
        .I2(\alu_result_OBUF[16]_inst_i_8_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(\alu_result_OBUF[15]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[15]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[15]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[15]),
        .I4(exe_src2_r_IBUF[15]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[15]_inst_i_5_n_0 ));
  CARRY4 \alu_result_OBUF[15]_inst_i_6 
       (.CI(\alu_result_OBUF[11]_inst_i_6_n_0 ),
        .CO({\alu_result_OBUF[15]_inst_i_6_n_0 ,\alu_result_OBUF[15]_inst_i_6_n_1 ,\alu_result_OBUF[15]_inst_i_6_n_2 ,\alu_result_OBUF[15]_inst_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_reg1_r_IBUF[15:12]),
        .O(data1[15:12]),
        .S({\alu_result_OBUF[15]_inst_i_11_n_0 ,\alu_result_OBUF[15]_inst_i_12_n_0 ,\alu_result_OBUF[15]_inst_i_13_n_0 ,\alu_result_OBUF[15]_inst_i_14_n_0 }));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[15]_inst_i_7 
       (.I0(\alu_result_OBUF[21]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[17]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[19]_inst_i_16_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[15]_inst_i_15_n_0 ),
        .O(\alu_result_OBUF[15]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[15]_inst_i_8 
       (.I0(\alu_result_OBUF[15]_inst_i_16_n_0 ),
        .I1(\alu_result_OBUF[19]_inst_i_17_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[17]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[21]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[15]_inst_i_8_n_0 ));
  CARRY4 \alu_result_OBUF[15]_inst_i_9 
       (.CI(\alu_result_OBUF[11]_inst_i_9_n_0 ),
        .CO({\alu_result_OBUF[15]_inst_i_9_n_0 ,\alu_result_OBUF[15]_inst_i_9_n_1 ,\alu_result_OBUF[15]_inst_i_9_n_2 ,\alu_result_OBUF[15]_inst_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_src2_r_IBUF[15:12]),
        .O(data0[15:12]),
        .S({\alu_result_OBUF[15]_inst_i_17_n_0 ,\alu_result_OBUF[15]_inst_i_18_n_0 ,\alu_result_OBUF[15]_inst_i_19_n_0 ,\alu_result_OBUF[15]_inst_i_20_n_0 }));
  OBUF \alu_result_OBUF[16]_inst 
       (.I(alu_result_OBUF[16]),
        .O(alu_result[16]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[16]_inst_i_1 
       (.I0(\alu_result_OBUF[16]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[16]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[16]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[16]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[16]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[16]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[1]),
        .I1(exe_reg1_r_IBUF[9]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[16]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[16]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_reg1_r_IBUF[20]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[16]_inst_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[16]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[24]),
        .I1(exe_reg1_r_IBUF[16]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[16]_inst_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[16]_inst_i_2 
       (.I0(data1[16]),
        .I1(\alu_result_OBUF[16]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[17]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[16]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[16]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[16]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[17]_inst_i_7_n_0 ),
        .I5(data0[16]),
        .O(\alu_result_OBUF[16]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[16]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[16]),
        .I1(exe_src2_r_IBUF[16]),
        .I2(\alu_result_OBUF[16]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[17]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[16]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[16]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[16]),
        .I4(exe_src2_r_IBUF[16]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[16]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[16]_inst_i_6 
       (.I0(\alu_result_OBUF[22]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[18]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[20]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[16]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[16]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[16]_inst_i_7 
       (.I0(\alu_result_OBUF[16]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[20]_inst_i_11_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[18]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[22]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[16]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[16]_inst_i_8 
       (.I0(\alu_result_OBUF[18]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[18]_inst_i_12_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[16]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[16]_inst_i_12_n_0 ),
        .O(\alu_result_OBUF[16]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \alu_result_OBUF[16]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[24]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[16]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[16]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[17]_inst 
       (.I(alu_result_OBUF[17]),
        .O(alu_result[17]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[17]_inst_i_1 
       (.I0(\alu_result_OBUF[17]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[17]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[17]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[17]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[17]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[17]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[2]),
        .I1(exe_reg1_r_IBUF[10]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[17]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[17]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_reg1_r_IBUF[21]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[17]_inst_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[17]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_reg1_r_IBUF[17]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[17]_inst_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[17]_inst_i_2 
       (.I0(data1[17]),
        .I1(\alu_result_OBUF[17]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[18]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[17]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[17]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[17]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[18]_inst_i_7_n_0 ),
        .I5(data0[17]),
        .O(\alu_result_OBUF[17]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[17]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[17]),
        .I1(exe_src2_r_IBUF[17]),
        .I2(\alu_result_OBUF[17]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[18]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[17]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[17]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[17]),
        .I4(exe_src2_r_IBUF[17]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[17]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[17]_inst_i_6 
       (.I0(\alu_result_OBUF[19]_inst_i_15_n_0 ),
        .I1(\alu_result_OBUF[19]_inst_i_16_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[21]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[17]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[17]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[17]_inst_i_7 
       (.I0(\alu_result_OBUF[17]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[21]_inst_i_11_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[19]_inst_i_17_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[23]_inst_i_16_n_0 ),
        .O(\alu_result_OBUF[17]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[17]_inst_i_8 
       (.I0(\alu_result_OBUF[19]_inst_i_22_n_0 ),
        .I1(\alu_result_OBUF[19]_inst_i_23_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[17]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[17]_inst_i_12_n_0 ),
        .O(\alu_result_OBUF[17]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \alu_result_OBUF[17]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[17]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[17]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[18]_inst 
       (.I(alu_result_OBUF[18]),
        .O(alu_result[18]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[18]_inst_i_1 
       (.I0(\alu_result_OBUF[18]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[18]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[18]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[18]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[18]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[18]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_reg1_r_IBUF[11]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[18]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[18]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[30]),
        .I1(exe_reg1_r_IBUF[22]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[18]_inst_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[18]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[26]),
        .I1(exe_reg1_r_IBUF[18]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[18]_inst_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[18]_inst_i_2 
       (.I0(data1[18]),
        .I1(\alu_result_OBUF[18]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[19]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[18]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[18]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[18]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[19]_inst_i_8_n_0 ),
        .I5(data0[18]),
        .O(\alu_result_OBUF[18]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[18]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[18]),
        .I1(exe_src2_r_IBUF[18]),
        .I2(\alu_result_OBUF[18]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[19]_inst_i_10_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[18]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[18]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[18]),
        .I4(exe_src2_r_IBUF[18]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[18]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[18]_inst_i_6 
       (.I0(\alu_result_OBUF[20]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[20]_inst_i_10_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[22]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[18]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[18]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[18]_inst_i_7 
       (.I0(\alu_result_OBUF[18]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[22]_inst_i_11_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[20]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[24]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[18]_inst_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \alu_result_OBUF[18]_inst_i_8 
       (.I0(\alu_result_OBUF[20]_inst_i_12_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[18]_inst_i_11_n_0 ),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[18]_inst_i_12_n_0 ),
        .O(\alu_result_OBUF[18]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \alu_result_OBUF[18]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[26]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[18]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[18]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[19]_inst 
       (.I(alu_result_OBUF[19]),
        .O(alu_result[19]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[19]_inst_i_1 
       (.I0(\alu_result_OBUF[19]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[19]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[19]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[19]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[19]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \alu_result_OBUF[19]_inst_i_10 
       (.I0(\alu_result_OBUF[21]_inst_i_12_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[19]_inst_i_22_n_0 ),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[19]_inst_i_23_n_0 ),
        .O(\alu_result_OBUF[19]_inst_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[19]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[19]),
        .I1(exe_src2_r_IBUF[19]),
        .O(\alu_result_OBUF[19]_inst_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[19]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[18]),
        .I1(exe_src2_r_IBUF[18]),
        .O(\alu_result_OBUF[19]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[19]_inst_i_13 
       (.I0(exe_reg1_r_IBUF[17]),
        .I1(exe_src2_r_IBUF[17]),
        .O(\alu_result_OBUF[19]_inst_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[19]_inst_i_14 
       (.I0(exe_reg1_r_IBUF[16]),
        .I1(exe_src2_r_IBUF[16]),
        .O(\alu_result_OBUF[19]_inst_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hF0E2)) 
    \alu_result_OBUF[19]_inst_i_15 
       (.I0(exe_reg1_r_IBUF[23]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_reg1_r_IBUF[31]),
        .I3(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[19]_inst_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \alu_result_OBUF[19]_inst_i_16 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[19]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[19]_inst_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[19]_inst_i_17 
       (.I0(exe_reg1_r_IBUF[4]),
        .I1(exe_reg1_r_IBUF[12]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[19]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[19]_inst_i_18 
       (.I0(exe_reg1_r_IBUF[19]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[19]),
        .I3(exe_src2_r_IBUF[19]),
        .O(\alu_result_OBUF[19]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[19]_inst_i_19 
       (.I0(exe_reg1_r_IBUF[18]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[18]),
        .I3(exe_src2_r_IBUF[18]),
        .O(\alu_result_OBUF[19]_inst_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[19]_inst_i_2 
       (.I0(data1[19]),
        .I1(\alu_result_OBUF[19]_inst_i_7_n_0 ),
        .I2(\alu_result_OBUF[20]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[19]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[19]_inst_i_20 
       (.I0(exe_reg1_r_IBUF[17]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[17]),
        .I3(exe_src2_r_IBUF[17]),
        .O(\alu_result_OBUF[19]_inst_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[19]_inst_i_21 
       (.I0(exe_reg1_r_IBUF[16]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[16]),
        .I3(exe_src2_r_IBUF[16]),
        .O(\alu_result_OBUF[19]_inst_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[19]_inst_i_22 
       (.I0(exe_reg1_r_IBUF[31]),
        .I1(exe_reg1_r_IBUF[23]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[19]_inst_i_22_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[19]_inst_i_23 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_reg1_r_IBUF[19]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[19]_inst_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[19]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[19]_inst_i_8_n_0 ),
        .I4(\alu_result_OBUF[20]_inst_i_7_n_0 ),
        .I5(data0[19]),
        .O(\alu_result_OBUF[19]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[19]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[19]),
        .I1(exe_src2_r_IBUF[19]),
        .I2(\alu_result_OBUF[19]_inst_i_10_n_0 ),
        .I3(\alu_result_OBUF[20]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[19]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[19]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[19]),
        .I4(exe_src2_r_IBUF[19]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[19]_inst_i_5_n_0 ));
  CARRY4 \alu_result_OBUF[19]_inst_i_6 
       (.CI(\alu_result_OBUF[15]_inst_i_6_n_0 ),
        .CO({\alu_result_OBUF[19]_inst_i_6_n_0 ,\alu_result_OBUF[19]_inst_i_6_n_1 ,\alu_result_OBUF[19]_inst_i_6_n_2 ,\alu_result_OBUF[19]_inst_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_reg1_r_IBUF[19:16]),
        .O(data1[19:16]),
        .S({\alu_result_OBUF[19]_inst_i_11_n_0 ,\alu_result_OBUF[19]_inst_i_12_n_0 ,\alu_result_OBUF[19]_inst_i_13_n_0 ,\alu_result_OBUF[19]_inst_i_14_n_0 }));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[19]_inst_i_7 
       (.I0(\alu_result_OBUF[21]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[21]_inst_i_10_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[19]_inst_i_15_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[19]_inst_i_16_n_0 ),
        .O(\alu_result_OBUF[19]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[19]_inst_i_8 
       (.I0(\alu_result_OBUF[19]_inst_i_17_n_0 ),
        .I1(\alu_result_OBUF[23]_inst_i_16_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[21]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[25]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[19]_inst_i_8_n_0 ));
  CARRY4 \alu_result_OBUF[19]_inst_i_9 
       (.CI(\alu_result_OBUF[15]_inst_i_9_n_0 ),
        .CO({\alu_result_OBUF[19]_inst_i_9_n_0 ,\alu_result_OBUF[19]_inst_i_9_n_1 ,\alu_result_OBUF[19]_inst_i_9_n_2 ,\alu_result_OBUF[19]_inst_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_src2_r_IBUF[19:16]),
        .O(data0[19:16]),
        .S({\alu_result_OBUF[19]_inst_i_18_n_0 ,\alu_result_OBUF[19]_inst_i_19_n_0 ,\alu_result_OBUF[19]_inst_i_20_n_0 ,\alu_result_OBUF[19]_inst_i_21_n_0 }));
  OBUF \alu_result_OBUF[1]_inst 
       (.I(alu_result_OBUF[1]),
        .O(alu_result[1]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBBBB888)) 
    \alu_result_OBUF[1]_inst_i_1 
       (.I0(\alu_result_OBUF[1]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[1]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[1]_inst_i_5_n_0 ),
        .I5(\alu_result_OBUF[1]_inst_i_6_n_0 ),
        .O(alu_result_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \alu_result_OBUF[1]_inst_i_10 
       (.I0(exe_src2_r_IBUF[1]),
        .I1(exe_reg1_r_IBUF[1]),
        .O(\alu_result_OBUF[1]_inst_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[1]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[1]),
        .I1(exe_reg1_r_IBUF[17]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[25]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[9]),
        .O(\alu_result_OBUF[1]_inst_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hCCAAF0AA)) 
    \alu_result_OBUF[1]_inst_i_2 
       (.I0(data1[1]),
        .I1(\alu_result_OBUF[2]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[1]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[1]_inst_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h0D)) 
    \alu_result_OBUF[1]_inst_i_3 
       (.I0(exe_alu_opc_r_IBUF[1]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[2]),
        .O(\alu_result_OBUF[1]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF000AAAAC0C0AAAA)) 
    \alu_result_OBUF[1]_inst_i_4 
       (.I0(data0[1]),
        .I1(\alu_result_OBUF[1]_inst_i_8_n_0 ),
        .I2(\alu_result_OBUF[30]_inst_i_12_n_0 ),
        .I3(\alu_result_OBUF[1]_inst_i_9_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[1]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[1]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[1]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[1]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAA8A0A8AA0800080)) 
    \alu_result_OBUF[1]_inst_i_6 
       (.I0(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I1(\alu_result_OBUF[1]_inst_i_7_n_0 ),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[0]),
        .I4(\alu_result_OBUF[2]_inst_i_8_n_0 ),
        .I5(\alu_result_OBUF[1]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[1]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[1]_inst_i_7 
       (.I0(\alu_result_OBUF[1]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[5]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[7]_inst_i_15_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[3]_inst_i_15_n_0 ),
        .O(\alu_result_OBUF[1]_inst_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \alu_result_OBUF[1]_inst_i_8 
       (.I0(exe_src2_r_IBUF[4]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[1]),
        .O(\alu_result_OBUF[1]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \alu_result_OBUF[1]_inst_i_9 
       (.I0(exe_src2_r_IBUF[4]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[0]),
        .O(\alu_result_OBUF[1]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[20]_inst 
       (.I(alu_result_OBUF[20]),
        .O(alu_result[20]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[20]_inst_i_1 
       (.I0(\alu_result_OBUF[20]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[20]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[20]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[20]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[20]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \alu_result_OBUF[20]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[20]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[20]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[20]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[5]),
        .I1(exe_reg1_r_IBUF[13]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[20]_inst_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h000000003030BB88)) 
    \alu_result_OBUF[20]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[24]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[28]),
        .I3(exe_reg1_r_IBUF[20]),
        .I4(exe_src2_r_IBUF[3]),
        .I5(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[20]_inst_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[20]_inst_i_2 
       (.I0(data1[20]),
        .I1(\alu_result_OBUF[20]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[21]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[20]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[20]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[20]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[21]_inst_i_7_n_0 ),
        .I5(data0[20]),
        .O(\alu_result_OBUF[20]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[20]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[20]),
        .I1(exe_src2_r_IBUF[20]),
        .I2(\alu_result_OBUF[20]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[21]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[20]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[20]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[20]),
        .I4(exe_src2_r_IBUF[20]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[20]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[20]_inst_i_6 
       (.I0(\alu_result_OBUF[22]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[22]_inst_i_10_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[20]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[20]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[20]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[20]_inst_i_7 
       (.I0(\alu_result_OBUF[20]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[24]_inst_i_10_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[22]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[26]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[20]_inst_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[20]_inst_i_8 
       (.I0(\alu_result_OBUF[22]_inst_i_12_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[20]_inst_i_12_n_0 ),
        .O(\alu_result_OBUF[20]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hF0E2)) 
    \alu_result_OBUF[20]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[24]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_reg1_r_IBUF[31]),
        .I3(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[20]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[21]_inst 
       (.I(alu_result_OBUF[21]),
        .O(alu_result[21]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[21]_inst_i_1 
       (.I0(\alu_result_OBUF[21]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[21]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[21]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[21]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[21]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \alu_result_OBUF[21]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[21]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[21]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[21]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[6]),
        .I1(exe_reg1_r_IBUF[14]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[21]_inst_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h000000003030BB88)) 
    \alu_result_OBUF[21]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[29]),
        .I3(exe_reg1_r_IBUF[21]),
        .I4(exe_src2_r_IBUF[3]),
        .I5(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[21]_inst_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[21]_inst_i_2 
       (.I0(data1[21]),
        .I1(\alu_result_OBUF[21]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[22]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[21]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[21]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[21]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[22]_inst_i_7_n_0 ),
        .I5(data0[21]),
        .O(\alu_result_OBUF[21]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[21]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[21]),
        .I1(exe_src2_r_IBUF[21]),
        .I2(\alu_result_OBUF[21]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[22]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[21]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[21]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[21]),
        .I4(exe_src2_r_IBUF[21]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[21]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \alu_result_OBUF[21]_inst_i_6 
       (.I0(\alu_result_OBUF[23]_inst_i_15_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[21]_inst_i_9_n_0 ),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[21]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[21]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[21]_inst_i_7 
       (.I0(\alu_result_OBUF[21]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[25]_inst_i_10_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[23]_inst_i_16_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[27]_inst_i_17_n_0 ),
        .O(\alu_result_OBUF[21]_inst_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[21]_inst_i_8 
       (.I0(\alu_result_OBUF[23]_inst_i_21_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[21]_inst_i_12_n_0 ),
        .O(\alu_result_OBUF[21]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hF0E2)) 
    \alu_result_OBUF[21]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_reg1_r_IBUF[31]),
        .I3(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[21]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[22]_inst 
       (.I(alu_result_OBUF[22]),
        .O(alu_result[22]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[22]_inst_i_1 
       (.I0(\alu_result_OBUF[22]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[22]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[22]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[22]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[22]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \alu_result_OBUF[22]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[30]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[22]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[22]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \alu_result_OBUF[22]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[7]),
        .I1(exe_reg1_r_IBUF[15]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[22]_inst_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h000000003030BB88)) 
    \alu_result_OBUF[22]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[26]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[30]),
        .I3(exe_reg1_r_IBUF[22]),
        .I4(exe_src2_r_IBUF[3]),
        .I5(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[22]_inst_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[22]_inst_i_2 
       (.I0(data1[22]),
        .I1(\alu_result_OBUF[22]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[23]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[22]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[22]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[22]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[23]_inst_i_8_n_0 ),
        .I5(data0[22]),
        .O(\alu_result_OBUF[22]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[22]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[22]),
        .I1(exe_src2_r_IBUF[22]),
        .I2(\alu_result_OBUF[22]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[23]_inst_i_10_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[22]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[22]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[22]),
        .I4(exe_src2_r_IBUF[22]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[22]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \alu_result_OBUF[22]_inst_i_6 
       (.I0(\alu_result_OBUF[24]_inst_i_9_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[22]_inst_i_9_n_0 ),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[22]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[22]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[22]_inst_i_7 
       (.I0(\alu_result_OBUF[22]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[26]_inst_i_10_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[24]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[28]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[22]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \alu_result_OBUF[22]_inst_i_8 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I3(exe_reg1_r_IBUF[24]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(\alu_result_OBUF[22]_inst_i_12_n_0 ),
        .O(\alu_result_OBUF[22]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hF0E2)) 
    \alu_result_OBUF[22]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[26]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_reg1_r_IBUF[31]),
        .I3(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[22]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[23]_inst 
       (.I(alu_result_OBUF[23]),
        .O(alu_result[23]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[23]_inst_i_1 
       (.I0(\alu_result_OBUF[23]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[23]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[23]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[23]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[23]));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \alu_result_OBUF[23]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I3(exe_reg1_r_IBUF[25]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(\alu_result_OBUF[23]_inst_i_21_n_0 ),
        .O(\alu_result_OBUF[23]_inst_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[23]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[23]),
        .I1(exe_src2_r_IBUF[23]),
        .O(\alu_result_OBUF[23]_inst_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[23]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[22]),
        .I1(exe_src2_r_IBUF[22]),
        .O(\alu_result_OBUF[23]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[23]_inst_i_13 
       (.I0(exe_reg1_r_IBUF[21]),
        .I1(exe_src2_r_IBUF[21]),
        .O(\alu_result_OBUF[23]_inst_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[23]_inst_i_14 
       (.I0(exe_reg1_r_IBUF[20]),
        .I1(exe_src2_r_IBUF[20]),
        .O(\alu_result_OBUF[23]_inst_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFB800B8)) 
    \alu_result_OBUF[23]_inst_i_15 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[23]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[31]),
        .I5(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[23]_inst_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[23]_inst_i_16 
       (.I0(exe_reg1_r_IBUF[8]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[16]),
        .O(\alu_result_OBUF[23]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[23]_inst_i_17 
       (.I0(exe_reg1_r_IBUF[23]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[23]),
        .I3(exe_src2_r_IBUF[23]),
        .O(\alu_result_OBUF[23]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[23]_inst_i_18 
       (.I0(exe_reg1_r_IBUF[22]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[22]),
        .I3(exe_src2_r_IBUF[22]),
        .O(\alu_result_OBUF[23]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[23]_inst_i_19 
       (.I0(exe_reg1_r_IBUF[21]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[21]),
        .I3(exe_src2_r_IBUF[21]),
        .O(\alu_result_OBUF[23]_inst_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[23]_inst_i_2 
       (.I0(data1[23]),
        .I1(\alu_result_OBUF[23]_inst_i_7_n_0 ),
        .I2(\alu_result_OBUF[24]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[23]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[23]_inst_i_20 
       (.I0(exe_reg1_r_IBUF[20]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[20]),
        .I3(exe_src2_r_IBUF[20]),
        .O(\alu_result_OBUF[23]_inst_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h000000003030BB88)) 
    \alu_result_OBUF[23]_inst_i_21 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[31]),
        .I3(exe_reg1_r_IBUF[23]),
        .I4(exe_src2_r_IBUF[3]),
        .I5(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[23]_inst_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[23]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[23]_inst_i_8_n_0 ),
        .I4(\alu_result_OBUF[24]_inst_i_7_n_0 ),
        .I5(data0[23]),
        .O(\alu_result_OBUF[23]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[23]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[23]),
        .I1(exe_src2_r_IBUF[23]),
        .I2(\alu_result_OBUF[23]_inst_i_10_n_0 ),
        .I3(\alu_result_OBUF[24]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[23]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[23]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[23]),
        .I4(exe_src2_r_IBUF[23]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[23]_inst_i_5_n_0 ));
  CARRY4 \alu_result_OBUF[23]_inst_i_6 
       (.CI(\alu_result_OBUF[19]_inst_i_6_n_0 ),
        .CO({\alu_result_OBUF[23]_inst_i_6_n_0 ,\alu_result_OBUF[23]_inst_i_6_n_1 ,\alu_result_OBUF[23]_inst_i_6_n_2 ,\alu_result_OBUF[23]_inst_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_reg1_r_IBUF[23:20]),
        .O(data1[23:20]),
        .S({\alu_result_OBUF[23]_inst_i_11_n_0 ,\alu_result_OBUF[23]_inst_i_12_n_0 ,\alu_result_OBUF[23]_inst_i_13_n_0 ,\alu_result_OBUF[23]_inst_i_14_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[23]_inst_i_7 
       (.I0(\alu_result_OBUF[25]_inst_i_9_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[23]_inst_i_15_n_0 ),
        .O(\alu_result_OBUF[23]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[23]_inst_i_8 
       (.I0(\alu_result_OBUF[23]_inst_i_16_n_0 ),
        .I1(\alu_result_OBUF[27]_inst_i_17_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[25]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[29]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[23]_inst_i_8_n_0 ));
  CARRY4 \alu_result_OBUF[23]_inst_i_9 
       (.CI(\alu_result_OBUF[19]_inst_i_9_n_0 ),
        .CO({\alu_result_OBUF[23]_inst_i_9_n_0 ,\alu_result_OBUF[23]_inst_i_9_n_1 ,\alu_result_OBUF[23]_inst_i_9_n_2 ,\alu_result_OBUF[23]_inst_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_src2_r_IBUF[23:20]),
        .O(data0[23:20]),
        .S({\alu_result_OBUF[23]_inst_i_17_n_0 ,\alu_result_OBUF[23]_inst_i_18_n_0 ,\alu_result_OBUF[23]_inst_i_19_n_0 ,\alu_result_OBUF[23]_inst_i_20_n_0 }));
  OBUF \alu_result_OBUF[24]_inst 
       (.I(alu_result_OBUF[24]),
        .O(alu_result[24]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[24]_inst_i_1 
       (.I0(\alu_result_OBUF[24]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[24]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[24]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[24]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[24]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[24]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[9]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[1]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[17]),
        .O(\alu_result_OBUF[24]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h000B0008)) 
    \alu_result_OBUF[24]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_src2_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[3]),
        .I4(exe_reg1_r_IBUF[24]),
        .O(\alu_result_OBUF[24]_inst_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[24]_inst_i_2 
       (.I0(data1[24]),
        .I1(\alu_result_OBUF[24]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[25]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[24]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[24]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[24]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[25]_inst_i_7_n_0 ),
        .I5(data0[24]),
        .O(\alu_result_OBUF[24]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[24]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[24]),
        .I1(exe_src2_r_IBUF[24]),
        .I2(\alu_result_OBUF[24]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[25]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[24]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[24]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[24]),
        .I4(exe_src2_r_IBUF[24]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[24]_inst_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[24]_inst_i_6 
       (.I0(\alu_result_OBUF[26]_inst_i_9_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[24]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[24]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[24]_inst_i_7 
       (.I0(\alu_result_OBUF[24]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[28]_inst_i_11_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[26]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[30]_inst_i_14_n_0 ),
        .O(\alu_result_OBUF[24]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \alu_result_OBUF[24]_inst_i_8 
       (.I0(exe_reg1_r_IBUF[30]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I3(exe_reg1_r_IBUF[26]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(\alu_result_OBUF[24]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[24]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFB800B8)) 
    \alu_result_OBUF[24]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[24]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[31]),
        .I5(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[24]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[25]_inst 
       (.I(alu_result_OBUF[25]),
        .O(alu_result[25]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[25]_inst_i_1 
       (.I0(\alu_result_OBUF[25]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[25]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[25]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[25]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[25]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[25]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[10]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[2]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[18]),
        .O(\alu_result_OBUF[25]_inst_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h000B0008)) 
    \alu_result_OBUF[25]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_src2_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[3]),
        .I4(exe_reg1_r_IBUF[25]),
        .O(\alu_result_OBUF[25]_inst_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[25]_inst_i_2 
       (.I0(data1[25]),
        .I1(\alu_result_OBUF[25]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[26]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[25]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[25]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[25]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[26]_inst_i_7_n_0 ),
        .I5(data0[25]),
        .O(\alu_result_OBUF[25]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[25]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_src2_r_IBUF[25]),
        .I2(\alu_result_OBUF[25]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[26]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[25]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[25]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[25]),
        .I4(exe_src2_r_IBUF[25]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[25]_inst_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[25]_inst_i_6 
       (.I0(\alu_result_OBUF[27]_inst_i_16_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[25]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[25]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[25]_inst_i_7 
       (.I0(\alu_result_OBUF[25]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[29]_inst_i_10_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[27]_inst_i_17_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[31]_inst_i_16_n_0 ),
        .O(\alu_result_OBUF[25]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \alu_result_OBUF[25]_inst_i_8 
       (.I0(exe_reg1_r_IBUF[31]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I3(exe_reg1_r_IBUF[27]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(\alu_result_OBUF[25]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[25]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFB800B8)) 
    \alu_result_OBUF[25]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[25]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[31]),
        .I5(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[25]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[26]_inst 
       (.I(alu_result_OBUF[26]),
        .O(alu_result[26]));
  LUT6 #(
    .INIT(64'hBBBBBBB8BBB8BBB8)) 
    \alu_result_OBUF[26]_inst_i_1 
       (.I0(\alu_result_OBUF[26]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[26]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[26]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[26]_inst_i_5_n_0 ),
        .I5(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .O(alu_result_OBUF[26]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[26]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[11]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[19]),
        .O(\alu_result_OBUF[26]_inst_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[26]_inst_i_2 
       (.I0(data1[26]),
        .I1(\alu_result_OBUF[26]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[27]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[26]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[26]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[26]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[27]_inst_i_8_n_0 ),
        .I5(data0[26]),
        .O(\alu_result_OBUF[26]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[26]_inst_i_4 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[26]),
        .I4(exe_src2_r_IBUF[26]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[26]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[26]_inst_i_5 
       (.I0(exe_reg1_r_IBUF[26]),
        .I1(exe_src2_r_IBUF[26]),
        .I2(\alu_result_OBUF[26]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[27]_inst_i_10_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[26]_inst_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[26]_inst_i_6 
       (.I0(\alu_result_OBUF[28]_inst_i_10_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[26]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[26]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[26]_inst_i_7 
       (.I0(\alu_result_OBUF[26]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[30]_inst_i_14_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[28]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[31]_inst_i_20_n_0 ),
        .O(\alu_result_OBUF[26]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h30BB000030880000)) 
    \alu_result_OBUF[26]_inst_i_8 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_src2_r_IBUF[1]),
        .I2(exe_reg1_r_IBUF[30]),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I5(exe_reg1_r_IBUF[26]),
        .O(\alu_result_OBUF[26]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFB800B8)) 
    \alu_result_OBUF[26]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[30]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[26]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[31]),
        .I5(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[26]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[27]_inst 
       (.I(alu_result_OBUF[27]),
        .O(alu_result[27]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[27]_inst_i_1 
       (.I0(\alu_result_OBUF[27]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[27]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[27]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[27]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[27]));
  LUT6 #(
    .INIT(64'h30BB000030880000)) 
    \alu_result_OBUF[27]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[1]),
        .I2(exe_reg1_r_IBUF[31]),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I5(exe_reg1_r_IBUF[27]),
        .O(\alu_result_OBUF[27]_inst_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[27]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_src2_r_IBUF[27]),
        .O(\alu_result_OBUF[27]_inst_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[27]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[26]),
        .I1(exe_src2_r_IBUF[26]),
        .O(\alu_result_OBUF[27]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[27]_inst_i_13 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_src2_r_IBUF[25]),
        .O(\alu_result_OBUF[27]_inst_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[27]_inst_i_14 
       (.I0(exe_reg1_r_IBUF[24]),
        .I1(exe_src2_r_IBUF[24]),
        .O(\alu_result_OBUF[27]_inst_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE02)) 
    \alu_result_OBUF[27]_inst_i_15 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[27]_inst_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE02)) 
    \alu_result_OBUF[27]_inst_i_16 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[27]_inst_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[27]_inst_i_17 
       (.I0(exe_reg1_r_IBUF[12]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[20]),
        .O(\alu_result_OBUF[27]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[27]_inst_i_18 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[27]),
        .I3(exe_src2_r_IBUF[27]),
        .O(\alu_result_OBUF[27]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[27]_inst_i_19 
       (.I0(exe_reg1_r_IBUF[26]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[26]),
        .I3(exe_src2_r_IBUF[26]),
        .O(\alu_result_OBUF[27]_inst_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[27]_inst_i_2 
       (.I0(data1[27]),
        .I1(\alu_result_OBUF[27]_inst_i_7_n_0 ),
        .I2(\alu_result_OBUF[28]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[27]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[27]_inst_i_20 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[25]),
        .I3(exe_src2_r_IBUF[25]),
        .O(\alu_result_OBUF[27]_inst_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[27]_inst_i_21 
       (.I0(exe_reg1_r_IBUF[24]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[24]),
        .I3(exe_src2_r_IBUF[24]),
        .O(\alu_result_OBUF[27]_inst_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[27]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[27]_inst_i_8_n_0 ),
        .I4(\alu_result_OBUF[28]_inst_i_7_n_0 ),
        .I5(data0[27]),
        .O(\alu_result_OBUF[27]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF6666F0006666)) 
    \alu_result_OBUF[27]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_src2_r_IBUF[27]),
        .I2(\alu_result_OBUF[28]_inst_i_8_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(\alu_result_OBUF[27]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[27]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[27]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[27]),
        .I4(exe_src2_r_IBUF[27]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[27]_inst_i_5_n_0 ));
  CARRY4 \alu_result_OBUF[27]_inst_i_6 
       (.CI(\alu_result_OBUF[23]_inst_i_6_n_0 ),
        .CO({\alu_result_OBUF[27]_inst_i_6_n_0 ,\alu_result_OBUF[27]_inst_i_6_n_1 ,\alu_result_OBUF[27]_inst_i_6_n_2 ,\alu_result_OBUF[27]_inst_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_reg1_r_IBUF[27:24]),
        .O(data1[27:24]),
        .S({\alu_result_OBUF[27]_inst_i_11_n_0 ,\alu_result_OBUF[27]_inst_i_12_n_0 ,\alu_result_OBUF[27]_inst_i_13_n_0 ,\alu_result_OBUF[27]_inst_i_14_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[27]_inst_i_7 
       (.I0(\alu_result_OBUF[27]_inst_i_15_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[27]_inst_i_16_n_0 ),
        .O(\alu_result_OBUF[27]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[27]_inst_i_8 
       (.I0(\alu_result_OBUF[27]_inst_i_17_n_0 ),
        .I1(\alu_result_OBUF[31]_inst_i_16_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[29]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[31]_inst_i_15_n_0 ),
        .O(\alu_result_OBUF[27]_inst_i_8_n_0 ));
  CARRY4 \alu_result_OBUF[27]_inst_i_9 
       (.CI(\alu_result_OBUF[23]_inst_i_9_n_0 ),
        .CO({\alu_result_OBUF[27]_inst_i_9_n_0 ,\alu_result_OBUF[27]_inst_i_9_n_1 ,\alu_result_OBUF[27]_inst_i_9_n_2 ,\alu_result_OBUF[27]_inst_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_src2_r_IBUF[27:24]),
        .O(data0[27:24]),
        .S({\alu_result_OBUF[27]_inst_i_18_n_0 ,\alu_result_OBUF[27]_inst_i_19_n_0 ,\alu_result_OBUF[27]_inst_i_20_n_0 ,\alu_result_OBUF[27]_inst_i_21_n_0 }));
  OBUF \alu_result_OBUF[28]_inst 
       (.I(alu_result_OBUF[28]),
        .O(alu_result[28]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[28]_inst_i_1 
       (.I0(\alu_result_OBUF[28]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[28]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[28]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[28]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[28]));
  LUT5 #(
    .INIT(32'hFF00FE02)) 
    \alu_result_OBUF[28]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[28]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[28]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[13]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[5]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[21]),
        .O(\alu_result_OBUF[28]_inst_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[28]_inst_i_2 
       (.I0(data1[28]),
        .I1(\alu_result_OBUF[28]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[29]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[28]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[28]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[28]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[29]_inst_i_7_n_0 ),
        .I5(data0[28]),
        .O(\alu_result_OBUF[28]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[28]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_src2_r_IBUF[28]),
        .I2(\alu_result_OBUF[28]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[29]_inst_i_9_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[28]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[28]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[28]),
        .I4(exe_src2_r_IBUF[28]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[28]_inst_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[28]_inst_i_6 
       (.I0(\alu_result_OBUF[28]_inst_i_9_n_0 ),
        .I1(exe_src2_r_IBUF[1]),
        .I2(\alu_result_OBUF[28]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[28]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[28]_inst_i_7 
       (.I0(\alu_result_OBUF[28]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[31]_inst_i_20_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[30]_inst_i_14_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[31]_inst_i_19_n_0 ),
        .O(\alu_result_OBUF[28]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002020300)) 
    \alu_result_OBUF[28]_inst_i_8 
       (.I0(exe_reg1_r_IBUF[30]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[28]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[28]_inst_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE02)) 
    \alu_result_OBUF[28]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[30]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[28]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[29]_inst 
       (.I(alu_result_OBUF[29]),
        .O(alu_result[29]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[29]_inst_i_1 
       (.I0(\alu_result_OBUF[29]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[29]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[29]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[29]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[29]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[29]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[14]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[6]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[22]),
        .O(\alu_result_OBUF[29]_inst_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[29]_inst_i_2 
       (.I0(data1[29]),
        .I1(\alu_result_OBUF[29]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[30]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[29]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[29]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[29]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[30]_inst_i_9_n_0 ),
        .I5(data0[29]),
        .O(\alu_result_OBUF[29]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF6666F0006666)) 
    \alu_result_OBUF[29]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[29]),
        .I2(\alu_result_OBUF[29]_inst_i_8_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(\alu_result_OBUF[29]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[29]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[29]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[29]),
        .I4(exe_src2_r_IBUF[29]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[29]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0004)) 
    \alu_result_OBUF[29]_inst_i_6 
       (.I0(exe_src2_r_IBUF[1]),
        .I1(exe_reg1_r_IBUF[29]),
        .I2(exe_src2_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[3]),
        .I4(exe_reg1_r_IBUF[31]),
        .I5(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[29]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[29]_inst_i_7 
       (.I0(\alu_result_OBUF[29]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[31]_inst_i_15_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[31]_inst_i_16_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[31]_inst_i_17_n_0 ),
        .O(\alu_result_OBUF[29]_inst_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \alu_result_OBUF[29]_inst_i_8 
       (.I0(exe_src2_r_IBUF[2]),
        .I1(exe_src2_r_IBUF[1]),
        .I2(exe_reg1_r_IBUF[30]),
        .I3(exe_src2_r_IBUF[3]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[29]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002020300)) 
    \alu_result_OBUF[29]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[31]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[29]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[29]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[2]_inst 
       (.I(alu_result_OBUF[2]),
        .O(alu_result[2]));
  LUT6 #(
    .INIT(64'hBBBBBBB8BBB8BBB8)) 
    \alu_result_OBUF[2]_inst_i_1 
       (.I0(\alu_result_OBUF[2]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[2]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[2]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[2]_inst_i_5_n_0 ),
        .I5(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .O(alu_result_OBUF[2]));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[2]_inst_i_2 
       (.I0(data1[2]),
        .I1(\alu_result_OBUF[2]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[3]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[2]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA8A0A8AA0800080)) 
    \alu_result_OBUF[2]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(\alu_result_OBUF[3]_inst_i_8_n_0 ),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[0]),
        .I4(\alu_result_OBUF[2]_inst_i_7_n_0 ),
        .I5(data0[2]),
        .O(\alu_result_OBUF[2]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[2]_inst_i_4 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[2]),
        .I4(exe_src2_r_IBUF[2]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[2]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[2]_inst_i_5 
       (.I0(exe_reg1_r_IBUF[2]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(\alu_result_OBUF[2]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[3]_inst_i_10_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[2]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[2]_inst_i_6 
       (.I0(\alu_result_OBUF[8]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[4]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[6]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[2]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[2]_inst_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \alu_result_OBUF[2]_inst_i_7 
       (.I0(exe_src2_r_IBUF[2]),
        .I1(exe_src2_r_IBUF[1]),
        .I2(exe_reg1_r_IBUF[1]),
        .I3(exe_src2_r_IBUF[3]),
        .I4(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[2]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[2]_inst_i_8 
       (.I0(\alu_result_OBUF[8]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[4]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[6]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[2]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[2]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[2]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[2]),
        .I1(exe_reg1_r_IBUF[18]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[26]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[10]),
        .O(\alu_result_OBUF[2]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[30]_inst 
       (.I(alu_result_OBUF[30]),
        .O(alu_result[30]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[30]_inst_i_1 
       (.I0(\alu_result_OBUF[30]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[30]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[30]_inst_i_5_n_0 ),
        .I5(\alu_result_OBUF[30]_inst_i_6_n_0 ),
        .O(alu_result_OBUF[30]));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_result_OBUF[30]_inst_i_10 
       (.I0(exe_src2_r_IBUF[30]),
        .I1(exe_reg1_r_IBUF[30]),
        .O(\alu_result_OBUF[30]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \alu_result_OBUF[30]_inst_i_11 
       (.I0(exe_src2_r_IBUF[4]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[30]),
        .O(\alu_result_OBUF[30]_inst_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \alu_result_OBUF[30]_inst_i_12 
       (.I0(exe_src2_r_IBUF[1]),
        .I1(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[30]_inst_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \alu_result_OBUF[30]_inst_i_13 
       (.I0(exe_src2_r_IBUF[4]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[31]),
        .O(\alu_result_OBUF[30]_inst_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[30]_inst_i_14 
       (.I0(exe_reg1_r_IBUF[15]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[7]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[23]),
        .O(\alu_result_OBUF[30]_inst_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hCCAAF0AA)) 
    \alu_result_OBUF[30]_inst_i_2 
       (.I0(data1[30]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(\alu_result_OBUF[30]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[30]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA8A0A8AA0800080)) 
    \alu_result_OBUF[30]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(\alu_result_OBUF[31]_inst_i_10_n_0 ),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[0]),
        .I4(\alu_result_OBUF[30]_inst_i_9_n_0 ),
        .I5(data0[30]),
        .O(\alu_result_OBUF[30]_inst_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \alu_result_OBUF[30]_inst_i_4 
       (.I0(exe_alu_opc_r_IBUF[1]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[2]),
        .O(\alu_result_OBUF[30]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF000AAAAC0C0AAAA)) 
    \alu_result_OBUF[30]_inst_i_5 
       (.I0(\alu_result_OBUF[30]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[30]_inst_i_11_n_0 ),
        .I2(\alu_result_OBUF[30]_inst_i_12_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_13_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[30]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[30]_inst_i_6 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[30]),
        .I4(exe_src2_r_IBUF[30]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[30]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0004)) 
    \alu_result_OBUF[30]_inst_i_7 
       (.I0(exe_src2_r_IBUF[1]),
        .I1(exe_reg1_r_IBUF[30]),
        .I2(exe_src2_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[3]),
        .I4(exe_reg1_r_IBUF[31]),
        .I5(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[30]_inst_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_result_OBUF[30]_inst_i_8 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .O(\alu_result_OBUF[30]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[30]_inst_i_9 
       (.I0(\alu_result_OBUF[30]_inst_i_14_n_0 ),
        .I1(\alu_result_OBUF[31]_inst_i_19_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[31]_inst_i_20_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[31]_inst_i_21_n_0 ),
        .O(\alu_result_OBUF[30]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[31]_inst 
       (.I(alu_result_OBUF[31]),
        .O(alu_result[31]));
  LUT6 #(
    .INIT(64'hFFFFFFFFEEEEEEEA)) 
    \alu_result_OBUF[31]_inst_i_1 
       (.I0(\alu_result_OBUF[31]_inst_i_2_n_0 ),
        .I1(\alu_result_OBUF[31]_inst_i_3_n_0 ),
        .I2(\alu_result_OBUF[31]_inst_i_4_n_0 ),
        .I3(\alu_result_OBUF[31]_inst_i_5_n_0 ),
        .I4(\alu_result_OBUF[31]_inst_i_6_n_0 ),
        .I5(\alu_result_OBUF[31]_inst_i_7_n_0 ),
        .O(alu_result_OBUF[31]));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_10 
       (.I0(\alu_result_OBUF[31]_inst_i_14_n_0 ),
        .I1(\alu_result_OBUF[31]_inst_i_15_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[31]_inst_i_16_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[31]_inst_i_17_n_0 ),
        .O(\alu_result_OBUF[31]_inst_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_11 
       (.I0(\alu_result_OBUF[31]_inst_i_18_n_0 ),
        .I1(\alu_result_OBUF[31]_inst_i_19_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[31]_inst_i_20_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[31]_inst_i_21_n_0 ),
        .O(\alu_result_OBUF[31]_inst_i_11_n_0 ));
  CARRY4 \alu_result_OBUF[31]_inst_i_12 
       (.CI(\alu_result_OBUF[27]_inst_i_9_n_0 ),
        .CO({\NLW_alu_result_OBUF[31]_inst_i_12_CO_UNCONNECTED [3],\alu_result_OBUF[31]_inst_i_12_n_1 ,\alu_result_OBUF[31]_inst_i_12_n_2 ,\alu_result_OBUF[31]_inst_i_12_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,exe_src2_r_IBUF[30:28]}),
        .O(data0[31:28]),
        .S({\alu_result_OBUF[31]_inst_i_22_n_0 ,\alu_result_OBUF[31]_inst_i_23_n_0 ,\alu_result_OBUF[31]_inst_i_24_n_0 ,\alu_result_OBUF[31]_inst_i_25_n_0 }));
  CARRY4 \alu_result_OBUF[31]_inst_i_13 
       (.CI(\alu_result_OBUF[27]_inst_i_6_n_0 ),
        .CO({\NLW_alu_result_OBUF[31]_inst_i_13_CO_UNCONNECTED [3],\alu_result_OBUF[31]_inst_i_13_n_1 ,\alu_result_OBUF[31]_inst_i_13_n_2 ,\alu_result_OBUF[31]_inst_i_13_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,exe_reg1_r_IBUF[30:28]}),
        .O(data1[31:28]),
        .S({\alu_result_OBUF[31]_inst_i_26_n_0 ,\alu_result_OBUF[31]_inst_i_27_n_0 ,\alu_result_OBUF[31]_inst_i_28_n_0 ,\alu_result_OBUF[31]_inst_i_29_n_0 }));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_14 
       (.I0(exe_reg1_r_IBUF[30]),
        .I1(exe_reg1_r_IBUF[14]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[6]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[22]),
        .O(\alu_result_OBUF[31]_inst_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_15 
       (.I0(exe_reg1_r_IBUF[26]),
        .I1(exe_reg1_r_IBUF[10]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[2]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[18]),
        .O(\alu_result_OBUF[31]_inst_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_16 
       (.I0(exe_reg1_r_IBUF[24]),
        .I1(exe_reg1_r_IBUF[8]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[0]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[16]),
        .O(\alu_result_OBUF[31]_inst_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_17 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_reg1_r_IBUF[12]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[4]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[20]),
        .O(\alu_result_OBUF[31]_inst_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_18 
       (.I0(exe_reg1_r_IBUF[31]),
        .I1(exe_reg1_r_IBUF[15]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[7]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[23]),
        .O(\alu_result_OBUF[31]_inst_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_19 
       (.I0(exe_reg1_r_IBUF[27]),
        .I1(exe_reg1_r_IBUF[11]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[3]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[19]),
        .O(\alu_result_OBUF[31]_inst_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hF000F000D4000000)) 
    \alu_result_OBUF[31]_inst_i_2 
       (.I0(exe_alu_opc_r_IBUF[0]),
        .I1(exe_src2_r_IBUF[31]),
        .I2(exe_reg1_r_IBUF[31]),
        .I3(exe_alu_opc_r_IBUF[2]),
        .I4(exe_alu_opc_r_IBUF[1]),
        .I5(exe_alu_opc_r_IBUF[3]),
        .O(\alu_result_OBUF[31]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_20 
       (.I0(exe_reg1_r_IBUF[25]),
        .I1(exe_reg1_r_IBUF[9]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[1]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[17]),
        .O(\alu_result_OBUF[31]_inst_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[31]_inst_i_21 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_reg1_r_IBUF[13]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[5]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[21]),
        .O(\alu_result_OBUF[31]_inst_i_21_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[31]_inst_i_22 
       (.I0(exe_reg1_r_IBUF[31]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[31]),
        .I3(exe_src2_r_IBUF[31]),
        .O(\alu_result_OBUF[31]_inst_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[31]_inst_i_23 
       (.I0(exe_reg1_r_IBUF[30]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[30]),
        .I3(exe_src2_r_IBUF[30]),
        .O(\alu_result_OBUF[31]_inst_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[31]_inst_i_24 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[29]),
        .I3(exe_src2_r_IBUF[29]),
        .O(\alu_result_OBUF[31]_inst_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[31]_inst_i_25 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[28]),
        .I3(exe_src2_r_IBUF[28]),
        .O(\alu_result_OBUF[31]_inst_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[31]_inst_i_26 
       (.I0(exe_reg1_r_IBUF[31]),
        .I1(exe_src2_r_IBUF[31]),
        .O(\alu_result_OBUF[31]_inst_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[31]_inst_i_27 
       (.I0(exe_reg1_r_IBUF[30]),
        .I1(exe_src2_r_IBUF[30]),
        .O(\alu_result_OBUF[31]_inst_i_27_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[31]_inst_i_28 
       (.I0(exe_reg1_r_IBUF[29]),
        .I1(exe_src2_r_IBUF[29]),
        .O(\alu_result_OBUF[31]_inst_i_28_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[31]_inst_i_29 
       (.I0(exe_reg1_r_IBUF[28]),
        .I1(exe_src2_r_IBUF[28]),
        .O(\alu_result_OBUF[31]_inst_i_29_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \alu_result_OBUF[31]_inst_i_3 
       (.I0(exe_alu_opc_r_IBUF[1]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .O(\alu_result_OBUF[31]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \alu_result_OBUF[31]_inst_i_4 
       (.I0(\alu_result_OBUF[31]_inst_i_8_n_0 ),
        .I1(exe_alu_opc_r_IBUF[2]),
        .I2(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I3(exe_reg1_r_IBUF[31]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[31]_inst_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0440)) 
    \alu_result_OBUF[31]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[0]),
        .I1(exe_alu_opc_r_IBUF[2]),
        .I2(exe_reg1_r_IBUF[31]),
        .I3(exe_src2_r_IBUF[31]),
        .O(\alu_result_OBUF[31]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000F7B3C480)) 
    \alu_result_OBUF[31]_inst_i_6 
       (.I0(exe_src2_r_IBUF[0]),
        .I1(exe_alu_opc_r_IBUF[0]),
        .I2(\alu_result_OBUF[31]_inst_i_10_n_0 ),
        .I3(\alu_result_OBUF[31]_inst_i_11_n_0 ),
        .I4(data0[31]),
        .I5(exe_alu_opc_r_IBUF[2]),
        .O(\alu_result_OBUF[31]_inst_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \alu_result_OBUF[31]_inst_i_7 
       (.I0(data1[31]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[2]),
        .O(\alu_result_OBUF[31]_inst_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \alu_result_OBUF[31]_inst_i_8 
       (.I0(exe_src2_r_IBUF[0]),
        .I1(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[31]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \alu_result_OBUF[31]_inst_i_9 
       (.I0(exe_src2_r_IBUF[3]),
        .I1(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[31]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[3]_inst 
       (.I(alu_result_OBUF[3]),
        .O(alu_result[3]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[3]_inst_i_1 
       (.I0(\alu_result_OBUF[3]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[3]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[3]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[3]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[3]_inst_i_10 
       (.I0(\alu_result_OBUF[9]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[5]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[7]_inst_i_15_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[3]_inst_i_15_n_0 ),
        .O(\alu_result_OBUF[3]_inst_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[3]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[3]_inst_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[3]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[2]),
        .I1(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[3]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[3]_inst_i_13 
       (.I0(exe_reg1_r_IBUF[1]),
        .I1(exe_src2_r_IBUF[1]),
        .O(\alu_result_OBUF[3]_inst_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[3]_inst_i_14 
       (.I0(exe_reg1_r_IBUF[0]),
        .I1(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[3]_inst_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[3]_inst_i_15 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_reg1_r_IBUF[19]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[27]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[11]),
        .O(\alu_result_OBUF[3]_inst_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[3]_inst_i_16 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[3]),
        .I3(exe_src2_r_IBUF[3]),
        .O(\alu_result_OBUF[3]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[3]_inst_i_17 
       (.I0(exe_reg1_r_IBUF[2]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[2]),
        .I3(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[3]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[3]_inst_i_18 
       (.I0(exe_reg1_r_IBUF[1]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[1]),
        .I3(exe_src2_r_IBUF[1]),
        .O(\alu_result_OBUF[3]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[3]_inst_i_19 
       (.I0(exe_reg1_r_IBUF[0]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[3]_inst_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[3]_inst_i_2 
       (.I0(data1[3]),
        .I1(\alu_result_OBUF[3]_inst_i_7_n_0 ),
        .I2(\alu_result_OBUF[4]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[3]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[3]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[3]_inst_i_8_n_0 ),
        .I4(\alu_result_OBUF[4]_inst_i_7_n_0 ),
        .I5(data0[3]),
        .O(\alu_result_OBUF[3]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF6666F0006666)) 
    \alu_result_OBUF[3]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(\alu_result_OBUF[4]_inst_i_8_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(\alu_result_OBUF[3]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[3]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[3]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[3]),
        .I4(exe_src2_r_IBUF[3]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[3]_inst_i_5_n_0 ));
  CARRY4 \alu_result_OBUF[3]_inst_i_6 
       (.CI(1'b0),
        .CO({\alu_result_OBUF[3]_inst_i_6_n_0 ,\alu_result_OBUF[3]_inst_i_6_n_1 ,\alu_result_OBUF[3]_inst_i_6_n_2 ,\alu_result_OBUF[3]_inst_i_6_n_3 }),
        .CYINIT(1'b1),
        .DI(exe_reg1_r_IBUF[3:0]),
        .O(data1[3:0]),
        .S({\alu_result_OBUF[3]_inst_i_11_n_0 ,\alu_result_OBUF[3]_inst_i_12_n_0 ,\alu_result_OBUF[3]_inst_i_13_n_0 ,\alu_result_OBUF[3]_inst_i_14_n_0 }));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[3]_inst_i_7 
       (.I0(\alu_result_OBUF[9]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[5]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[7]_inst_i_15_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[3]_inst_i_15_n_0 ),
        .O(\alu_result_OBUF[3]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002020300)) 
    \alu_result_OBUF[3]_inst_i_8 
       (.I0(exe_reg1_r_IBUF[0]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[2]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[3]_inst_i_8_n_0 ));
  CARRY4 \alu_result_OBUF[3]_inst_i_9 
       (.CI(1'b0),
        .CO({\alu_result_OBUF[3]_inst_i_9_n_0 ,\alu_result_OBUF[3]_inst_i_9_n_1 ,\alu_result_OBUF[3]_inst_i_9_n_2 ,\alu_result_OBUF[3]_inst_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_src2_r_IBUF[3:0]),
        .O(data0[3:0]),
        .S({\alu_result_OBUF[3]_inst_i_16_n_0 ,\alu_result_OBUF[3]_inst_i_17_n_0 ,\alu_result_OBUF[3]_inst_i_18_n_0 ,\alu_result_OBUF[3]_inst_i_19_n_0 }));
  OBUF \alu_result_OBUF[4]_inst 
       (.I(alu_result_OBUF[4]),
        .O(alu_result[4]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[4]_inst_i_1 
       (.I0(\alu_result_OBUF[4]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[4]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[4]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[4]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[4]));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[4]_inst_i_2 
       (.I0(data1[4]),
        .I1(\alu_result_OBUF[4]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[5]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[4]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA8A0A8AA0800080)) 
    \alu_result_OBUF[4]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(\alu_result_OBUF[5]_inst_i_7_n_0 ),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[0]),
        .I4(\alu_result_OBUF[4]_inst_i_7_n_0 ),
        .I5(data0[4]),
        .O(\alu_result_OBUF[4]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[4]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[4]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(\alu_result_OBUF[4]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[5]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[4]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[4]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[4]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[4]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[4]_inst_i_6 
       (.I0(\alu_result_OBUF[10]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[6]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[8]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[4]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[4]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002020300)) 
    \alu_result_OBUF[4]_inst_i_7 
       (.I0(exe_reg1_r_IBUF[1]),
        .I1(exe_src2_r_IBUF[4]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[3]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(exe_src2_r_IBUF[2]),
        .O(\alu_result_OBUF[4]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[4]_inst_i_8 
       (.I0(\alu_result_OBUF[10]_inst_i_10_n_0 ),
        .I1(\alu_result_OBUF[6]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[8]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[4]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[4]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[4]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[4]),
        .I1(exe_reg1_r_IBUF[20]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[28]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[12]),
        .O(\alu_result_OBUF[4]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[5]_inst 
       (.I(alu_result_OBUF[5]),
        .O(alu_result[5]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[5]_inst_i_1 
       (.I0(\alu_result_OBUF[5]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[5]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[5]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[5]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[5]));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[5]_inst_i_2 
       (.I0(data1[5]),
        .I1(\alu_result_OBUF[5]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[6]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[5]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[5]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[5]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[6]_inst_i_7_n_0 ),
        .I5(data0[5]),
        .O(\alu_result_OBUF[5]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF6666F0006666)) 
    \alu_result_OBUF[5]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[5]),
        .I1(exe_src2_r_IBUF[5]),
        .I2(\alu_result_OBUF[6]_inst_i_8_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(\alu_result_OBUF[5]_inst_i_8_n_0 ),
        .O(\alu_result_OBUF[5]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[5]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[5]),
        .I4(exe_src2_r_IBUF[5]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[5]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[5]_inst_i_6 
       (.I0(\alu_result_OBUF[11]_inst_i_15_n_0 ),
        .I1(\alu_result_OBUF[7]_inst_i_15_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[9]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[5]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[5]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h30BB000030880000)) 
    \alu_result_OBUF[5]_inst_i_7 
       (.I0(exe_reg1_r_IBUF[2]),
        .I1(exe_src2_r_IBUF[1]),
        .I2(exe_reg1_r_IBUF[0]),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I5(exe_reg1_r_IBUF[4]),
        .O(\alu_result_OBUF[5]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[5]_inst_i_8 
       (.I0(\alu_result_OBUF[11]_inst_i_21_n_0 ),
        .I1(\alu_result_OBUF[7]_inst_i_15_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[9]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[5]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[5]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[5]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[5]),
        .I1(exe_reg1_r_IBUF[21]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[29]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[13]),
        .O(\alu_result_OBUF[5]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[6]_inst 
       (.I(alu_result_OBUF[6]),
        .O(alu_result[6]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[6]_inst_i_1 
       (.I0(\alu_result_OBUF[6]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[6]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[6]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[6]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[6]));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[6]_inst_i_2 
       (.I0(data1[6]),
        .I1(\alu_result_OBUF[6]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[7]_inst_i_7_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[6]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[6]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[6]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[7]_inst_i_8_n_0 ),
        .I5(data0[6]),
        .O(\alu_result_OBUF[6]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[6]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[6]),
        .I1(exe_src2_r_IBUF[6]),
        .I2(\alu_result_OBUF[6]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[7]_inst_i_10_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[6]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[6]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[6]),
        .I4(exe_src2_r_IBUF[6]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[6]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[6]_inst_i_6 
       (.I0(\alu_result_OBUF[12]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[8]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[10]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[6]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[6]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h30BB000030880000)) 
    \alu_result_OBUF[6]_inst_i_7 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_src2_r_IBUF[1]),
        .I2(exe_reg1_r_IBUF[1]),
        .I3(exe_src2_r_IBUF[2]),
        .I4(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I5(exe_reg1_r_IBUF[5]),
        .O(\alu_result_OBUF[6]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[6]_inst_i_8 
       (.I0(\alu_result_OBUF[12]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[8]_inst_i_11_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[10]_inst_i_10_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[6]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[6]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFC0CFAFAFC0C0A0A)) 
    \alu_result_OBUF[6]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[6]),
        .I1(exe_reg1_r_IBUF[22]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[30]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[14]),
        .O(\alu_result_OBUF[6]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[7]_inst 
       (.I(alu_result_OBUF[7]),
        .O(alu_result[7]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[7]_inst_i_1 
       (.I0(\alu_result_OBUF[7]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[7]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[7]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[7]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[7]_inst_i_10 
       (.I0(\alu_result_OBUF[13]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[9]_inst_i_10_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[11]_inst_i_21_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[7]_inst_i_15_n_0 ),
        .O(\alu_result_OBUF[7]_inst_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[7]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[7]),
        .I1(exe_src2_r_IBUF[7]),
        .O(\alu_result_OBUF[7]_inst_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[7]_inst_i_12 
       (.I0(exe_reg1_r_IBUF[6]),
        .I1(exe_src2_r_IBUF[6]),
        .O(\alu_result_OBUF[7]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[7]_inst_i_13 
       (.I0(exe_reg1_r_IBUF[5]),
        .I1(exe_src2_r_IBUF[5]),
        .O(\alu_result_OBUF[7]_inst_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_result_OBUF[7]_inst_i_14 
       (.I0(exe_reg1_r_IBUF[4]),
        .I1(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[7]_inst_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFCFC0C0CFA0AFA0A)) 
    \alu_result_OBUF[7]_inst_i_15 
       (.I0(exe_reg1_r_IBUF[7]),
        .I1(exe_reg1_r_IBUF[23]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[15]),
        .I4(exe_reg1_r_IBUF[31]),
        .I5(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[7]_inst_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h000B0008)) 
    \alu_result_OBUF[7]_inst_i_16 
       (.I0(exe_reg1_r_IBUF[2]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_src2_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[3]),
        .I4(exe_reg1_r_IBUF[6]),
        .O(\alu_result_OBUF[7]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[7]_inst_i_17 
       (.I0(exe_reg1_r_IBUF[7]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[7]),
        .I3(exe_src2_r_IBUF[7]),
        .O(\alu_result_OBUF[7]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[7]_inst_i_18 
       (.I0(exe_reg1_r_IBUF[6]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[6]),
        .I3(exe_src2_r_IBUF[6]),
        .O(\alu_result_OBUF[7]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[7]_inst_i_19 
       (.I0(exe_reg1_r_IBUF[5]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[5]),
        .I3(exe_src2_r_IBUF[5]),
        .O(\alu_result_OBUF[7]_inst_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[7]_inst_i_2 
       (.I0(data1[7]),
        .I1(\alu_result_OBUF[7]_inst_i_7_n_0 ),
        .I2(\alu_result_OBUF[8]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[7]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1DE2)) 
    \alu_result_OBUF[7]_inst_i_20 
       (.I0(exe_reg1_r_IBUF[4]),
        .I1(exe_sel_pc_r_IBUF),
        .I2(exe_pc_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[4]),
        .O(\alu_result_OBUF[7]_inst_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[7]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[7]_inst_i_8_n_0 ),
        .I4(\alu_result_OBUF[8]_inst_i_7_n_0 ),
        .I5(data0[7]),
        .O(\alu_result_OBUF[7]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF6666F0006666)) 
    \alu_result_OBUF[7]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[7]),
        .I1(exe_src2_r_IBUF[7]),
        .I2(\alu_result_OBUF[8]_inst_i_8_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(\alu_result_OBUF[7]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[7]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[7]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[7]),
        .I4(exe_src2_r_IBUF[7]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[7]_inst_i_5_n_0 ));
  CARRY4 \alu_result_OBUF[7]_inst_i_6 
       (.CI(\alu_result_OBUF[3]_inst_i_6_n_0 ),
        .CO({\alu_result_OBUF[7]_inst_i_6_n_0 ,\alu_result_OBUF[7]_inst_i_6_n_1 ,\alu_result_OBUF[7]_inst_i_6_n_2 ,\alu_result_OBUF[7]_inst_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_reg1_r_IBUF[7:4]),
        .O(data1[7:4]),
        .S({\alu_result_OBUF[7]_inst_i_11_n_0 ,\alu_result_OBUF[7]_inst_i_12_n_0 ,\alu_result_OBUF[7]_inst_i_13_n_0 ,\alu_result_OBUF[7]_inst_i_14_n_0 }));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[7]_inst_i_7 
       (.I0(\alu_result_OBUF[13]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[9]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[11]_inst_i_15_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[7]_inst_i_15_n_0 ),
        .O(\alu_result_OBUF[7]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \alu_result_OBUF[7]_inst_i_8 
       (.I0(exe_reg1_r_IBUF[0]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I3(exe_reg1_r_IBUF[4]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(\alu_result_OBUF[7]_inst_i_16_n_0 ),
        .O(\alu_result_OBUF[7]_inst_i_8_n_0 ));
  CARRY4 \alu_result_OBUF[7]_inst_i_9 
       (.CI(\alu_result_OBUF[3]_inst_i_9_n_0 ),
        .CO({\alu_result_OBUF[7]_inst_i_9_n_0 ,\alu_result_OBUF[7]_inst_i_9_n_1 ,\alu_result_OBUF[7]_inst_i_9_n_2 ,\alu_result_OBUF[7]_inst_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI(exe_src2_r_IBUF[7:4]),
        .O(data0[7:4]),
        .S({\alu_result_OBUF[7]_inst_i_17_n_0 ,\alu_result_OBUF[7]_inst_i_18_n_0 ,\alu_result_OBUF[7]_inst_i_19_n_0 ,\alu_result_OBUF[7]_inst_i_20_n_0 }));
  OBUF \alu_result_OBUF[8]_inst 
       (.I(alu_result_OBUF[8]),
        .O(alu_result[8]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[8]_inst_i_1 
       (.I0(\alu_result_OBUF[8]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[8]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[8]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[8]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[8]));
  LUT5 #(
    .INIT(32'h000B0008)) 
    \alu_result_OBUF[8]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[3]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(exe_src2_r_IBUF[4]),
        .I3(exe_src2_r_IBUF[3]),
        .I4(exe_reg1_r_IBUF[7]),
        .O(\alu_result_OBUF[8]_inst_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[8]_inst_i_11 
       (.I0(exe_reg1_r_IBUF[16]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[24]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[8]),
        .O(\alu_result_OBUF[8]_inst_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[8]_inst_i_2 
       (.I0(data1[8]),
        .I1(\alu_result_OBUF[8]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[9]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[8]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[8]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[8]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[9]_inst_i_7_n_0 ),
        .I5(data0[8]),
        .O(\alu_result_OBUF[8]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF006666F0F06666)) 
    \alu_result_OBUF[8]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[8]),
        .I1(exe_src2_r_IBUF[8]),
        .I2(\alu_result_OBUF[8]_inst_i_8_n_0 ),
        .I3(\alu_result_OBUF[9]_inst_i_8_n_0 ),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[8]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[8]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[8]),
        .I4(exe_src2_r_IBUF[8]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[8]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[8]_inst_i_6 
       (.I0(\alu_result_OBUF[14]_inst_i_9_n_0 ),
        .I1(\alu_result_OBUF[10]_inst_i_9_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[12]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[8]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[8]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \alu_result_OBUF[8]_inst_i_7 
       (.I0(exe_reg1_r_IBUF[1]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I3(exe_reg1_r_IBUF[5]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(\alu_result_OBUF[8]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[8]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[8]_inst_i_8 
       (.I0(\alu_result_OBUF[14]_inst_i_11_n_0 ),
        .I1(\alu_result_OBUF[10]_inst_i_10_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[12]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[8]_inst_i_11_n_0 ),
        .O(\alu_result_OBUF[8]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \alu_result_OBUF[8]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[16]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[24]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[8]),
        .O(\alu_result_OBUF[8]_inst_i_9_n_0 ));
  OBUF \alu_result_OBUF[9]_inst 
       (.I(alu_result_OBUF[9]),
        .O(alu_result[9]));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBB8B8B8)) 
    \alu_result_OBUF[9]_inst_i_1 
       (.I0(\alu_result_OBUF[9]_inst_i_2_n_0 ),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(\alu_result_OBUF[9]_inst_i_3_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_4_n_0 ),
        .I4(\alu_result_OBUF[9]_inst_i_4_n_0 ),
        .I5(\alu_result_OBUF[9]_inst_i_5_n_0 ),
        .O(alu_result_OBUF[9]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \alu_result_OBUF[9]_inst_i_10 
       (.I0(exe_reg1_r_IBUF[17]),
        .I1(exe_src2_r_IBUF[3]),
        .I2(exe_reg1_r_IBUF[25]),
        .I3(exe_src2_r_IBUF[4]),
        .I4(exe_reg1_r_IBUF[9]),
        .O(\alu_result_OBUF[9]_inst_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \alu_result_OBUF[9]_inst_i_2 
       (.I0(data1[9]),
        .I1(\alu_result_OBUF[9]_inst_i_6_n_0 ),
        .I2(\alu_result_OBUF[10]_inst_i_6_n_0 ),
        .I3(\alu_result_OBUF[30]_inst_i_8_n_0 ),
        .I4(exe_src2_r_IBUF[0]),
        .O(\alu_result_OBUF[9]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2A8A0AA0208000)) 
    \alu_result_OBUF[9]_inst_i_3 
       (.I0(\alu_result_OBUF[1]_inst_i_3_n_0 ),
        .I1(exe_src2_r_IBUF[0]),
        .I2(exe_alu_opc_r_IBUF[0]),
        .I3(\alu_result_OBUF[9]_inst_i_7_n_0 ),
        .I4(\alu_result_OBUF[10]_inst_i_7_n_0 ),
        .I5(data0[9]),
        .O(\alu_result_OBUF[9]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF6666F0006666)) 
    \alu_result_OBUF[9]_inst_i_4 
       (.I0(exe_reg1_r_IBUF[9]),
        .I1(exe_src2_r_IBUF[9]),
        .I2(\alu_result_OBUF[10]_inst_i_8_n_0 ),
        .I3(exe_src2_r_IBUF[0]),
        .I4(exe_alu_opc_r_IBUF[0]),
        .I5(\alu_result_OBUF[9]_inst_i_8_n_0 ),
        .O(\alu_result_OBUF[9]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8000000A8A8A800)) 
    \alu_result_OBUF[9]_inst_i_5 
       (.I0(exe_alu_opc_r_IBUF[2]),
        .I1(exe_alu_opc_r_IBUF[3]),
        .I2(exe_alu_opc_r_IBUF[1]),
        .I3(exe_reg1_r_IBUF[9]),
        .I4(exe_src2_r_IBUF[9]),
        .I5(exe_alu_opc_r_IBUF[0]),
        .O(\alu_result_OBUF[9]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[9]_inst_i_6 
       (.I0(\alu_result_OBUF[15]_inst_i_15_n_0 ),
        .I1(\alu_result_OBUF[11]_inst_i_15_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[13]_inst_i_9_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[9]_inst_i_9_n_0 ),
        .O(\alu_result_OBUF[9]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \alu_result_OBUF[9]_inst_i_7 
       (.I0(exe_reg1_r_IBUF[2]),
        .I1(exe_src2_r_IBUF[2]),
        .I2(\alu_result_OBUF[31]_inst_i_9_n_0 ),
        .I3(exe_reg1_r_IBUF[6]),
        .I4(exe_src2_r_IBUF[1]),
        .I5(\alu_result_OBUF[11]_inst_i_16_n_0 ),
        .O(\alu_result_OBUF[9]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \alu_result_OBUF[9]_inst_i_8 
       (.I0(\alu_result_OBUF[15]_inst_i_21_n_0 ),
        .I1(\alu_result_OBUF[11]_inst_i_21_n_0 ),
        .I2(exe_src2_r_IBUF[1]),
        .I3(\alu_result_OBUF[13]_inst_i_11_n_0 ),
        .I4(exe_src2_r_IBUF[2]),
        .I5(\alu_result_OBUF[9]_inst_i_10_n_0 ),
        .O(\alu_result_OBUF[9]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \alu_result_OBUF[9]_inst_i_9 
       (.I0(exe_reg1_r_IBUF[17]),
        .I1(exe_reg1_r_IBUF[31]),
        .I2(exe_src2_r_IBUF[3]),
        .I3(exe_reg1_r_IBUF[25]),
        .I4(exe_src2_r_IBUF[4]),
        .I5(exe_reg1_r_IBUF[9]),
        .O(\alu_result_OBUF[9]_inst_i_9_n_0 ));
  IBUF \exe_alu_opc_r_IBUF[0]_inst 
       (.I(exe_alu_opc_r[0]),
        .O(exe_alu_opc_r_IBUF[0]));
  IBUF \exe_alu_opc_r_IBUF[1]_inst 
       (.I(exe_alu_opc_r[1]),
        .O(exe_alu_opc_r_IBUF[1]));
  IBUF \exe_alu_opc_r_IBUF[2]_inst 
       (.I(exe_alu_opc_r[2]),
        .O(exe_alu_opc_r_IBUF[2]));
  IBUF \exe_alu_opc_r_IBUF[3]_inst 
       (.I(exe_alu_opc_r[3]),
        .O(exe_alu_opc_r_IBUF[3]));
  IBUF \exe_pc_r_IBUF[0]_inst 
       (.I(exe_pc_r[0]),
        .O(exe_pc_r_IBUF[0]));
  IBUF \exe_pc_r_IBUF[10]_inst 
       (.I(exe_pc_r[10]),
        .O(exe_pc_r_IBUF[10]));
  IBUF \exe_pc_r_IBUF[11]_inst 
       (.I(exe_pc_r[11]),
        .O(exe_pc_r_IBUF[11]));
  IBUF \exe_pc_r_IBUF[12]_inst 
       (.I(exe_pc_r[12]),
        .O(exe_pc_r_IBUF[12]));
  IBUF \exe_pc_r_IBUF[13]_inst 
       (.I(exe_pc_r[13]),
        .O(exe_pc_r_IBUF[13]));
  IBUF \exe_pc_r_IBUF[14]_inst 
       (.I(exe_pc_r[14]),
        .O(exe_pc_r_IBUF[14]));
  IBUF \exe_pc_r_IBUF[15]_inst 
       (.I(exe_pc_r[15]),
        .O(exe_pc_r_IBUF[15]));
  IBUF \exe_pc_r_IBUF[16]_inst 
       (.I(exe_pc_r[16]),
        .O(exe_pc_r_IBUF[16]));
  IBUF \exe_pc_r_IBUF[17]_inst 
       (.I(exe_pc_r[17]),
        .O(exe_pc_r_IBUF[17]));
  IBUF \exe_pc_r_IBUF[18]_inst 
       (.I(exe_pc_r[18]),
        .O(exe_pc_r_IBUF[18]));
  IBUF \exe_pc_r_IBUF[19]_inst 
       (.I(exe_pc_r[19]),
        .O(exe_pc_r_IBUF[19]));
  IBUF \exe_pc_r_IBUF[1]_inst 
       (.I(exe_pc_r[1]),
        .O(exe_pc_r_IBUF[1]));
  IBUF \exe_pc_r_IBUF[20]_inst 
       (.I(exe_pc_r[20]),
        .O(exe_pc_r_IBUF[20]));
  IBUF \exe_pc_r_IBUF[21]_inst 
       (.I(exe_pc_r[21]),
        .O(exe_pc_r_IBUF[21]));
  IBUF \exe_pc_r_IBUF[22]_inst 
       (.I(exe_pc_r[22]),
        .O(exe_pc_r_IBUF[22]));
  IBUF \exe_pc_r_IBUF[23]_inst 
       (.I(exe_pc_r[23]),
        .O(exe_pc_r_IBUF[23]));
  IBUF \exe_pc_r_IBUF[24]_inst 
       (.I(exe_pc_r[24]),
        .O(exe_pc_r_IBUF[24]));
  IBUF \exe_pc_r_IBUF[25]_inst 
       (.I(exe_pc_r[25]),
        .O(exe_pc_r_IBUF[25]));
  IBUF \exe_pc_r_IBUF[26]_inst 
       (.I(exe_pc_r[26]),
        .O(exe_pc_r_IBUF[26]));
  IBUF \exe_pc_r_IBUF[27]_inst 
       (.I(exe_pc_r[27]),
        .O(exe_pc_r_IBUF[27]));
  IBUF \exe_pc_r_IBUF[28]_inst 
       (.I(exe_pc_r[28]),
        .O(exe_pc_r_IBUF[28]));
  IBUF \exe_pc_r_IBUF[29]_inst 
       (.I(exe_pc_r[29]),
        .O(exe_pc_r_IBUF[29]));
  IBUF \exe_pc_r_IBUF[2]_inst 
       (.I(exe_pc_r[2]),
        .O(exe_pc_r_IBUF[2]));
  IBUF \exe_pc_r_IBUF[30]_inst 
       (.I(exe_pc_r[30]),
        .O(exe_pc_r_IBUF[30]));
  IBUF \exe_pc_r_IBUF[31]_inst 
       (.I(exe_pc_r[31]),
        .O(exe_pc_r_IBUF[31]));
  IBUF \exe_pc_r_IBUF[3]_inst 
       (.I(exe_pc_r[3]),
        .O(exe_pc_r_IBUF[3]));
  IBUF \exe_pc_r_IBUF[4]_inst 
       (.I(exe_pc_r[4]),
        .O(exe_pc_r_IBUF[4]));
  IBUF \exe_pc_r_IBUF[5]_inst 
       (.I(exe_pc_r[5]),
        .O(exe_pc_r_IBUF[5]));
  IBUF \exe_pc_r_IBUF[6]_inst 
       (.I(exe_pc_r[6]),
        .O(exe_pc_r_IBUF[6]));
  IBUF \exe_pc_r_IBUF[7]_inst 
       (.I(exe_pc_r[7]),
        .O(exe_pc_r_IBUF[7]));
  IBUF \exe_pc_r_IBUF[8]_inst 
       (.I(exe_pc_r[8]),
        .O(exe_pc_r_IBUF[8]));
  IBUF \exe_pc_r_IBUF[9]_inst 
       (.I(exe_pc_r[9]),
        .O(exe_pc_r_IBUF[9]));
  IBUF \exe_reg1_r_IBUF[0]_inst 
       (.I(exe_reg1_r[0]),
        .O(exe_reg1_r_IBUF[0]));
  IBUF \exe_reg1_r_IBUF[10]_inst 
       (.I(exe_reg1_r[10]),
        .O(exe_reg1_r_IBUF[10]));
  IBUF \exe_reg1_r_IBUF[11]_inst 
       (.I(exe_reg1_r[11]),
        .O(exe_reg1_r_IBUF[11]));
  IBUF \exe_reg1_r_IBUF[12]_inst 
       (.I(exe_reg1_r[12]),
        .O(exe_reg1_r_IBUF[12]));
  IBUF \exe_reg1_r_IBUF[13]_inst 
       (.I(exe_reg1_r[13]),
        .O(exe_reg1_r_IBUF[13]));
  IBUF \exe_reg1_r_IBUF[14]_inst 
       (.I(exe_reg1_r[14]),
        .O(exe_reg1_r_IBUF[14]));
  IBUF \exe_reg1_r_IBUF[15]_inst 
       (.I(exe_reg1_r[15]),
        .O(exe_reg1_r_IBUF[15]));
  IBUF \exe_reg1_r_IBUF[16]_inst 
       (.I(exe_reg1_r[16]),
        .O(exe_reg1_r_IBUF[16]));
  IBUF \exe_reg1_r_IBUF[17]_inst 
       (.I(exe_reg1_r[17]),
        .O(exe_reg1_r_IBUF[17]));
  IBUF \exe_reg1_r_IBUF[18]_inst 
       (.I(exe_reg1_r[18]),
        .O(exe_reg1_r_IBUF[18]));
  IBUF \exe_reg1_r_IBUF[19]_inst 
       (.I(exe_reg1_r[19]),
        .O(exe_reg1_r_IBUF[19]));
  IBUF \exe_reg1_r_IBUF[1]_inst 
       (.I(exe_reg1_r[1]),
        .O(exe_reg1_r_IBUF[1]));
  IBUF \exe_reg1_r_IBUF[20]_inst 
       (.I(exe_reg1_r[20]),
        .O(exe_reg1_r_IBUF[20]));
  IBUF \exe_reg1_r_IBUF[21]_inst 
       (.I(exe_reg1_r[21]),
        .O(exe_reg1_r_IBUF[21]));
  IBUF \exe_reg1_r_IBUF[22]_inst 
       (.I(exe_reg1_r[22]),
        .O(exe_reg1_r_IBUF[22]));
  IBUF \exe_reg1_r_IBUF[23]_inst 
       (.I(exe_reg1_r[23]),
        .O(exe_reg1_r_IBUF[23]));
  IBUF \exe_reg1_r_IBUF[24]_inst 
       (.I(exe_reg1_r[24]),
        .O(exe_reg1_r_IBUF[24]));
  IBUF \exe_reg1_r_IBUF[25]_inst 
       (.I(exe_reg1_r[25]),
        .O(exe_reg1_r_IBUF[25]));
  IBUF \exe_reg1_r_IBUF[26]_inst 
       (.I(exe_reg1_r[26]),
        .O(exe_reg1_r_IBUF[26]));
  IBUF \exe_reg1_r_IBUF[27]_inst 
       (.I(exe_reg1_r[27]),
        .O(exe_reg1_r_IBUF[27]));
  IBUF \exe_reg1_r_IBUF[28]_inst 
       (.I(exe_reg1_r[28]),
        .O(exe_reg1_r_IBUF[28]));
  IBUF \exe_reg1_r_IBUF[29]_inst 
       (.I(exe_reg1_r[29]),
        .O(exe_reg1_r_IBUF[29]));
  IBUF \exe_reg1_r_IBUF[2]_inst 
       (.I(exe_reg1_r[2]),
        .O(exe_reg1_r_IBUF[2]));
  IBUF \exe_reg1_r_IBUF[30]_inst 
       (.I(exe_reg1_r[30]),
        .O(exe_reg1_r_IBUF[30]));
  IBUF \exe_reg1_r_IBUF[31]_inst 
       (.I(exe_reg1_r[31]),
        .O(exe_reg1_r_IBUF[31]));
  IBUF \exe_reg1_r_IBUF[3]_inst 
       (.I(exe_reg1_r[3]),
        .O(exe_reg1_r_IBUF[3]));
  IBUF \exe_reg1_r_IBUF[4]_inst 
       (.I(exe_reg1_r[4]),
        .O(exe_reg1_r_IBUF[4]));
  IBUF \exe_reg1_r_IBUF[5]_inst 
       (.I(exe_reg1_r[5]),
        .O(exe_reg1_r_IBUF[5]));
  IBUF \exe_reg1_r_IBUF[6]_inst 
       (.I(exe_reg1_r[6]),
        .O(exe_reg1_r_IBUF[6]));
  IBUF \exe_reg1_r_IBUF[7]_inst 
       (.I(exe_reg1_r[7]),
        .O(exe_reg1_r_IBUF[7]));
  IBUF \exe_reg1_r_IBUF[8]_inst 
       (.I(exe_reg1_r[8]),
        .O(exe_reg1_r_IBUF[8]));
  IBUF \exe_reg1_r_IBUF[9]_inst 
       (.I(exe_reg1_r[9]),
        .O(exe_reg1_r_IBUF[9]));
  IBUF exe_sel_pc_r_IBUF_inst
       (.I(exe_sel_pc_r),
        .O(exe_sel_pc_r_IBUF));
  IBUF \exe_src2_r_IBUF[0]_inst 
       (.I(exe_src2_r[0]),
        .O(exe_src2_r_IBUF[0]));
  IBUF \exe_src2_r_IBUF[10]_inst 
       (.I(exe_src2_r[10]),
        .O(exe_src2_r_IBUF[10]));
  IBUF \exe_src2_r_IBUF[11]_inst 
       (.I(exe_src2_r[11]),
        .O(exe_src2_r_IBUF[11]));
  IBUF \exe_src2_r_IBUF[12]_inst 
       (.I(exe_src2_r[12]),
        .O(exe_src2_r_IBUF[12]));
  IBUF \exe_src2_r_IBUF[13]_inst 
       (.I(exe_src2_r[13]),
        .O(exe_src2_r_IBUF[13]));
  IBUF \exe_src2_r_IBUF[14]_inst 
       (.I(exe_src2_r[14]),
        .O(exe_src2_r_IBUF[14]));
  IBUF \exe_src2_r_IBUF[15]_inst 
       (.I(exe_src2_r[15]),
        .O(exe_src2_r_IBUF[15]));
  IBUF \exe_src2_r_IBUF[16]_inst 
       (.I(exe_src2_r[16]),
        .O(exe_src2_r_IBUF[16]));
  IBUF \exe_src2_r_IBUF[17]_inst 
       (.I(exe_src2_r[17]),
        .O(exe_src2_r_IBUF[17]));
  IBUF \exe_src2_r_IBUF[18]_inst 
       (.I(exe_src2_r[18]),
        .O(exe_src2_r_IBUF[18]));
  IBUF \exe_src2_r_IBUF[19]_inst 
       (.I(exe_src2_r[19]),
        .O(exe_src2_r_IBUF[19]));
  IBUF \exe_src2_r_IBUF[1]_inst 
       (.I(exe_src2_r[1]),
        .O(exe_src2_r_IBUF[1]));
  IBUF \exe_src2_r_IBUF[20]_inst 
       (.I(exe_src2_r[20]),
        .O(exe_src2_r_IBUF[20]));
  IBUF \exe_src2_r_IBUF[21]_inst 
       (.I(exe_src2_r[21]),
        .O(exe_src2_r_IBUF[21]));
  IBUF \exe_src2_r_IBUF[22]_inst 
       (.I(exe_src2_r[22]),
        .O(exe_src2_r_IBUF[22]));
  IBUF \exe_src2_r_IBUF[23]_inst 
       (.I(exe_src2_r[23]),
        .O(exe_src2_r_IBUF[23]));
  IBUF \exe_src2_r_IBUF[24]_inst 
       (.I(exe_src2_r[24]),
        .O(exe_src2_r_IBUF[24]));
  IBUF \exe_src2_r_IBUF[25]_inst 
       (.I(exe_src2_r[25]),
        .O(exe_src2_r_IBUF[25]));
  IBUF \exe_src2_r_IBUF[26]_inst 
       (.I(exe_src2_r[26]),
        .O(exe_src2_r_IBUF[26]));
  IBUF \exe_src2_r_IBUF[27]_inst 
       (.I(exe_src2_r[27]),
        .O(exe_src2_r_IBUF[27]));
  IBUF \exe_src2_r_IBUF[28]_inst 
       (.I(exe_src2_r[28]),
        .O(exe_src2_r_IBUF[28]));
  IBUF \exe_src2_r_IBUF[29]_inst 
       (.I(exe_src2_r[29]),
        .O(exe_src2_r_IBUF[29]));
  IBUF \exe_src2_r_IBUF[2]_inst 
       (.I(exe_src2_r[2]),
        .O(exe_src2_r_IBUF[2]));
  IBUF \exe_src2_r_IBUF[30]_inst 
       (.I(exe_src2_r[30]),
        .O(exe_src2_r_IBUF[30]));
  IBUF \exe_src2_r_IBUF[31]_inst 
       (.I(exe_src2_r[31]),
        .O(exe_src2_r_IBUF[31]));
  IBUF \exe_src2_r_IBUF[3]_inst 
       (.I(exe_src2_r[3]),
        .O(exe_src2_r_IBUF[3]));
  IBUF \exe_src2_r_IBUF[4]_inst 
       (.I(exe_src2_r[4]),
        .O(exe_src2_r_IBUF[4]));
  IBUF \exe_src2_r_IBUF[5]_inst 
       (.I(exe_src2_r[5]),
        .O(exe_src2_r_IBUF[5]));
  IBUF \exe_src2_r_IBUF[6]_inst 
       (.I(exe_src2_r[6]),
        .O(exe_src2_r_IBUF[6]));
  IBUF \exe_src2_r_IBUF[7]_inst 
       (.I(exe_src2_r[7]),
        .O(exe_src2_r_IBUF[7]));
  IBUF \exe_src2_r_IBUF[8]_inst 
       (.I(exe_src2_r[8]),
        .O(exe_src2_r_IBUF[8]));
  IBUF \exe_src2_r_IBUF[9]_inst 
       (.I(exe_src2_r[9]),
        .O(exe_src2_r_IBUF[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
