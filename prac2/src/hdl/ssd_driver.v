`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         The University of Edinburgh
// Engineer:        Nigel Topham
// 
// Create Date:     17.09.2015 12:36:42
// Design Name:     Practical 2
// Module Name:     ssd_driver
// Project Name:    Computer Design
// Target Devices:  Zync-7010
// Tool Versions:   2015.2
// Description:     Module to drive a seven-segment display from 8-bit integer
// 
// Dependencies:    none
// 
// Revision:
// Revision 1.0 -   File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ssd_driver(
    input           clk,
    input           reset,
    input  [7:0]    ssd_input,
    output [6:0]    ssd_a,
    output          ssd_c
);

// Define the on/off settings for each segment of a seven-segment digit

localparam BLANK    = 7'h00; // 
localparam ZERO     = 7'h3f; // 0
localparam ONE      = 7'h06; // 1
localparam TWO      = 7'h5b; // 2
localparam THREE    = 7'h4f; // 3
localparam FOUR     = 7'h66; // 4
localparam FIVE     = 7'h6d; // 5
localparam SIX      = 7'h7d; // 6
localparam SEVEN    = 7'h07; // 7
localparam EIGHT    = 7'h7f; // 8
localparam NINE     = 7'h6f; // 9
localparam DASH     = 7'h40; // -

// Declare a counter reg to divide down the 60 MHz clock to 60 Hertz
// This requires a division by 1,000,000, which is ~2^20. 

reg [19:0] counter_r;

// Using the 21-bit counter, counting at 125 MHz, the most-significant bit
// will toggle at just under 60Hz. This is a suitable frequency for toggling
// between driving each digit of the SSD display.

always @(posedge clk or posedge reset)
  begin: count_PROC
    if (reset == 1'b1)
      counter_r <= 20'd0;
    else
      counter_r <= counter_r + 1;
  end

// Define the decoding from a 4-bit unsigned binary integer to the two
// digits of a seven segment display. This requires 14 bits of output,
// one for each of the seven segments of the two digits. This decoding
// therefore also splits binary numbers into two decimal digits as 
// an implicit side effect of the mapping to the SSD.

reg [13:0] ssd_segments;

always @*
begin: ssd_mapping_PROC
  case (ssd_input)
    // decode values from 0..9
    8'd0:  ssd_segments = { BLANK, ZERO  };
    8'd1:  ssd_segments = { BLANK, ONE   };
    8'd2:  ssd_segments = { BLANK, TWO   };
    8'd3:  ssd_segments = { BLANK, THREE };
    8'd4:  ssd_segments = { BLANK, FOUR  };
    8'd5:  ssd_segments = { BLANK, FIVE  };
    8'd6:  ssd_segments = { BLANK, SIX   };
    8'd7:  ssd_segments = { BLANK, SEVEN };
    8'd8:  ssd_segments = { BLANK, EIGHT };
    8'd9:  ssd_segments = { BLANK, NINE  };
    // decode values from 10..19
    8'd10: ssd_segments = { ONE,   ZERO  };
    8'd11: ssd_segments = { ONE,   ONE   };
    8'd12: ssd_segments = { ONE,   TWO   };
    8'd13: ssd_segments = { ONE,   THREE };
    8'd14: ssd_segments = { ONE,   FOUR  };
    8'd15: ssd_segments = { ONE,   FIVE  };  
    8'd16: ssd_segments = { ONE,   SIX   };
    8'd17: ssd_segments = { ONE,   SEVEN };
    8'd18: ssd_segments = { ONE,   EIGHT };
    8'd19: ssd_segments = { ONE,   NINE  };
    // decode values from 20..29
    8'd20: ssd_segments = { TWO,   ZERO  };
    8'd21: ssd_segments = { TWO,   ONE   };
    8'd22: ssd_segments = { TWO,   TWO   };
    8'd23: ssd_segments = { TWO,   THREE };
    8'd24: ssd_segments = { TWO,   FOUR  };
    8'd25: ssd_segments = { TWO,   FIVE  };  
    8'd26: ssd_segments = { TWO,   SIX   };
    8'd27: ssd_segments = { TWO,   SEVEN };
    8'd28: ssd_segments = { TWO,   EIGHT };
    8'd29: ssd_segments = { TWO,   NINE  };
    // decode values from 30..39
    8'd30: ssd_segments = { THREE, ZERO  };
    8'd31: ssd_segments = { THREE, ONE   };
    8'd32: ssd_segments = { THREE, TWO   };
    8'd33: ssd_segments = { THREE, THREE };
    8'd34: ssd_segments = { THREE, FOUR  };
    8'd35: ssd_segments = { THREE, FIVE  };  
    8'd36: ssd_segments = { THREE, SIX   };
    8'd37: ssd_segments = { THREE, SEVEN };
    8'd38: ssd_segments = { THREE, EIGHT };
    8'd39: ssd_segments = { THREE, NINE  };
    // decode values from 40..49
    8'd40: ssd_segments = { FOUR,  ZERO  };
    8'd41: ssd_segments = { FOUR,  ONE   };
    8'd42: ssd_segments = { FOUR,  TWO   };
    8'd43: ssd_segments = { FOUR,  THREE };
    8'd44: ssd_segments = { FOUR,  FOUR  };
    8'd45: ssd_segments = { FOUR,  FIVE  };  
    8'd46: ssd_segments = { FOUR,  SIX   };
    8'd47: ssd_segments = { FOUR,  SEVEN };
    8'd48: ssd_segments = { FOUR,  EIGHT };
    8'd49: ssd_segments = { FOUR,  NINE  };
    // decode values from 50..59
    8'd50: ssd_segments = { FIVE,  ZERO  };
    8'd51: ssd_segments = { FIVE,  ONE   };
    8'd52: ssd_segments = { FIVE,  TWO   };
    8'd53: ssd_segments = { FIVE,  THREE };
    8'd54: ssd_segments = { FIVE,  FOUR  };
    8'd55: ssd_segments = { FIVE,  FIVE  };  
    8'd56: ssd_segments = { FIVE,  SIX   };
    8'd57: ssd_segments = { FIVE,  SEVEN };
    8'd58: ssd_segments = { FIVE,  EIGHT };
    8'd59: ssd_segments = { FIVE,  NINE  };
    // decode values from 60..69
    8'd60: ssd_segments = { SIX,   ZERO  };
    8'd61: ssd_segments = { SIX,   ONE   };
    8'd62: ssd_segments = { SIX,   TWO   };
    8'd63: ssd_segments = { SIX,   THREE };
    8'd64: ssd_segments = { SIX,   FOUR  };
    8'd65: ssd_segments = { SIX,   FIVE  };  
    8'd66: ssd_segments = { SIX,   SIX   };
    8'd67: ssd_segments = { SIX,   SEVEN };
    8'd68: ssd_segments = { SIX,   EIGHT };
    8'd69: ssd_segments = { SIX,   NINE  };
    // decode values from 70..79
    8'd70: ssd_segments = { SEVEN, ZERO  };
    8'd71: ssd_segments = { SEVEN, ONE   };
    8'd72: ssd_segments = { SEVEN, TWO   };
    8'd73: ssd_segments = { SEVEN, THREE };
    8'd74: ssd_segments = { SEVEN, FOUR  };
    8'd75: ssd_segments = { SEVEN, FIVE  };  
    8'd76: ssd_segments = { SEVEN, SIX   };
    8'd77: ssd_segments = { SEVEN, SEVEN };
    8'd78: ssd_segments = { SEVEN, EIGHT };
    8'd79: ssd_segments = { SEVEN, NINE  };
    // decode values from 80..89
    8'd80: ssd_segments = { EIGHT, ZERO  };
    8'd81: ssd_segments = { EIGHT, ONE   };
    8'd82: ssd_segments = { EIGHT, TWO   };
    8'd83: ssd_segments = { EIGHT, THREE };
    8'd84: ssd_segments = { EIGHT, FOUR  };
    8'd85: ssd_segments = { EIGHT, FIVE  };  
    8'd86: ssd_segments = { EIGHT, SIX   };
    8'd87: ssd_segments = { EIGHT, SEVEN };
    8'd88: ssd_segments = { EIGHT, EIGHT };
    8'd89: ssd_segments = { EIGHT, NINE  };
    // decode values from 90..99
    8'd90: ssd_segments = { NINE,  ZERO  };
    8'd91: ssd_segments = { NINE,  ONE   };
    8'd92: ssd_segments = { NINE,  TWO   };
    8'd93: ssd_segments = { NINE,  THREE };
    8'd94: ssd_segments = { NINE,  FOUR  };
    8'd95: ssd_segments = { NINE,  FIVE  };  
    8'd96: ssd_segments = { NINE,  SIX   };
    8'd97: ssd_segments = { NINE,  SEVEN };
    8'd98: ssd_segments = { NINE,  EIGHT };
    8'd99: ssd_segments = { NINE,  NINE  };
    //
    default: ssd_segments = { DASH, DASH }; // out of range [0..99]
  endcase
end // ssd_mapping_PROC

// Time-division multiplex the two digit outputs for the SSD

assign ssd_a = (counter_r[19] == 1'b1) ? ssd_segments[13:7] : ssd_segments[6:0];
assign ssd_c = counter_r[19];

endmodule
