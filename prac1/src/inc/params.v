////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2019, Nigel Topham, All rights reserved.
//
// This is an unpublished, proprietary work of Nigel Topham and is fully
// protected under copyright and trade secret law. You may not view, use,
// disclose, or distribute this file or any information contained herein except
// persuant to a valid written license from Nigel Topham.
//
// The entire notice above must be reproduced on all authorized copies.
//
////////////////////////////////////////////////////////////////////////////////
//
// Description:    parameter definitions for ALU functions
// 
// Dependencies:   None
// 
////////////////////////////////////////////////////////////////////////////////

parameter [3:0]  ALU_OPC_ADD      = 4'b0000;
parameter [3:0]  ALU_OPC_SUB      = 4'b1000;
parameter [3:0]  ALU_OPC_SLL      = 4'b0001;
parameter [3:0]  ALU_OPC_SLT      = 4'b0010;
parameter [3:0]  ALU_OPC_SLTU     = 4'b0011;
parameter [3:0]  ALU_OPC_XOR      = 4'b0100;
parameter [3:0]  ALU_OPC_SRL      = 4'b0101;
parameter [3:0]  ALU_OPC_SRA      = 4'b1101;
parameter [3:0]  ALU_OPC_OR       = 4'b0110;
parameter [3:0]  ALU_OPC_AND      = 4'b0111;
