`timescale 1ns / 1ps
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
// Description:    STore Queue for RISC-V core (STQ)
// 
// Dependencies:   params.v
// 
////////////////////////////////////////////////////////////////////////////////

module store_queue #(
  parameter         AM = 11         // address bits - 1
  )(
  input             clk,            // external clock source
  input             reset,          // async reset input

  //==== store commit interface ================================================
  //
  input             mem_stq_commit, // store instruction commits this cycle
  input      [31:0] mem_stq_data,   // store data committing this cycle
  input      [AM:2] mem_stq_addr,   // address of store committing this cycle
  input      [3:0]  mem_stq_wenb,   // byte-lane enables of committing store

  //==== store retirement interface ============================================
  //
  output reg        stq_mem_req,    // request to retire from store queue
  input             stq_mem_ack,    // permission to retire is granted
  //
  output reg [31:0] stq_mem_data,   // store data to retire to memory
  output reg [AM:2] stq_mem_addr,   // store address in memory to retire
  output reg [3:0]  stq_mem_wenb,   // byte-lane enables for memory store

  //==== store forwarding interface ============================================
  //
  input      [AM:2] mem_ld_addr,    // load address (word aligned)
  input      [31:0] mem_ld_data,    // load data pre-forwarding
  output reg [31:0] stq_ld_data     // load data post-forwarding
);

////////////////////////////////////////////////////////////////////////////////
// 2-entry Store Queue state declarations, and their next values              //
////////////////////////////////////////////////////////////////////////////////

reg   [1:0]     stq_valid_r;            // Store Queue valid bits
reg   [3:0]     stq_wenb_r[0:1];        // Store Queue byte-lane write enables
reg   [31:0]    stq_data_r[0:1];        // Store Queue write data
reg   [AM:2]    stq_addr_r[0:1];        // Store Queue byte address (4KB range)
reg             wp_r;                   // write pointer
reg             rp_r;                   // read pointer

reg   [1:0]     stq_valid_nxt;          // next stq valid bit
reg             wp_nxt;                 // next write pointer
reg             rp_nxt;                 // next read pointer

reg   [1:0]     stq_entry_cg0;          // update enable for stq entries
integer         i;                      // iterator over stq entries
reg   [1:0]     stq_read;               // read STQ element i
reg   [1:0]     stq_write;              // write STQ element i

////////////////////////////////////////////////////////////////////////////////
// Combinational process defining the control and datapath logic of the STQ   //
////////////////////////////////////////////////////////////////////////////////

always @*
  begin : stq_logic_PROC
  
  // define the retirement request signal
  stq_mem_req     = |stq_valid_r;

  for (i = 0; i < 2; i = i + 1)
    begin
    // stq_read[i] is asserted if entry is read from the STQ[i] to retire to MEM
    stq_read[i]   = stq_valid_r[i] & stq_mem_ack & (rp_r == i);
  
    // stq_write[i] is asserted if MEM commits a store, this is written to STQ[i]
    stq_write[i]  = mem_stq_commit & (wp_r == i);
    end

  // next read pointer is toggled current read pointer if read takes place
  rp_nxt          = (stq_mem_req & stq_mem_ack) ? !rp_r : rp_r;

  // next write pointer is toggled current write pointer if write takes place
  wp_nxt          = mem_stq_commit ? !wp_r : wp_r;

  // select the entry to retire on the retirement interface
  stq_mem_data    = stq_data_r[rp_r];
  stq_mem_addr    = stq_addr_r[rp_r];
  stq_mem_wenb    = stq_wenb_r[rp_r];


  // next validity of each STQ entry
  stq_valid_nxt   = (stq_valid_r & ~stq_read) | stq_write;

  // update each entry of the store queue when it is written
  stq_entry_cg0   = stq_write;
  end

////////////////////////////////////////////////////////////////////////////////
// Combinational process to implement store forwarding from the STQ entries   //
////////////////////////////////////////////////////////////////////////////////

reg   [1:0]         addr_match;
reg   [3:0]         byte_match[1:0];
reg   [3:0]         load_byte_sel;
reg   [31:0]        load_byte_1h;
reg   [3:0]         stq_entry_sel;
reg   [31:0]        stq_entry_1h;
reg   [31:0]        stq_fwd_data;

always @*
  begin : stq_forwarding_PROC
  
  addr_match[0] = (stq_addr_r[0] == mem_ld_addr);
  addr_match[1] = (stq_addr_r[1] == mem_ld_addr);
  
  byte_match[0] = {4{addr_match[0]}} & stq_wenb_r[0];
  byte_match[1] = {4{addr_match[1]}} & stq_wenb_r[1];
  
  load_byte_sel = ~byte_match[0] & ~byte_match[1];
  stq_entry_sel = ~byte_match[0] | (byte_match[1] & {4{!rp_r}});
  
  load_byte_1h  = { {8{load_byte_sel[3]}}, 
                    {8{load_byte_sel[2]}},
                    {8{load_byte_sel[1]}},
                    {8{load_byte_sel[0]}}};
  
  stq_entry_1h  = { {8{stq_entry_sel[3]}}, 
                    {8{stq_entry_sel[2]}},
                    {8{stq_entry_sel[1]}},
                    {8{stq_entry_sel[0]}}};

  stq_fwd_data  = ( stq_entry_1h & stq_data_r[1])
                | (~stq_entry_1h & stq_data_r[0])
                ;

  stq_ld_data   = ( load_byte_1h & mem_ld_data)
                | (~load_byte_1h & stq_fwd_data)
                ;
  end

////////////////////////////////////////////////////////////////////////////////
// Synchronous process defining the flip-flops of the STQ state               //
////////////////////////////////////////////////////////////////////////////////

always @(posedge clk or posedge reset)
  begin : stq_reg_PROC
  if (reset == 1'b1)
    begin
    rp_r        <= 1'b0;
    wp_r        <= 1'b0;
    stq_valid_r <= 2'b00;
    for (i = 0; i < 2; i = i + 1)
      begin
      stq_wenb_r[i] <= 'd0;
      stq_addr_r[i] <= 'd0;
      stq_data_r[i] <= 'd0;
      end
    end
  else
    begin
    rp_r    <= rp_nxt;
    wp_r    <= wp_nxt;
    for (i = 0; i < 2; i = i + 1)
      begin
      stq_valid_r[i]  <= stq_valid_nxt[i];
      if (stq_entry_cg0[i] == 1'b1)
        begin
        stq_wenb_r[i] <= mem_stq_wenb;
        stq_addr_r[i] <= mem_stq_addr;
        stq_data_r[i] <= mem_stq_data;
        end
      end
    end
  end
endmodule
