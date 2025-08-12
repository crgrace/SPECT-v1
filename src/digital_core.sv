///////////////////////////////////////////////////////////////////
// File Name: digital_core.sv
// Engineer:  Carl Grace (crgrace@lbl.gov)
// Description: SPECT_V1 synthesized digital core.  
//              Includes:
//              UARTs for inter-chip communcation
//              9-byte Register Map for configuration bits
//
//              Note that the "primary" is the chip writing to and reading
//              from the current chip. It could also be the FPGA.
//              The "secondary" is always the current chip.
//
///////////////////////////////////////////////////////////////////

module digital_core
    #(parameter NUMREGS = 9)   // number of configuration registers
    
    (output logic piso,// PRIMARY-IN-SECONDARY-OUT TX UART output bit
    
// ANALOG CORE CONFIGURATION SIGNALS
    output logic [2:0] bypass_sel, 
    output logic [2:0] bypass_sel_cathode, 
    output logic [15:0] ext_reset,
    output logic ext_reset_cathode,
    output logic [3:0] fb_del_ctrl,
    output logic [3:0] fb_del_ctrl_cathode,
    output logic [2:0] gain_sel,
    output logic [2:0] gain_sel_cathode,
    output logic [15:0] pd_anode,
    output logic pd_cathode,
    output logic reset_sel,
    output logic reset_sel_cathode,
// INPUTS
    input logic posi,       // PRIMARY-OUT-SECONDARY-IN: RX UART input bit  
    input logic clk,        // clk for UART
    input logic reset_n);   // asynchronous reset for UART (active low)

`include "spect_v1_constants.sv"
logic [7:0] config_bits [0:NUMREGS-1];// regmap config bit outputs

always_comb begin
    bypass_sel                  = config_bits[BYPASS_SEL][2:0];
    bypass_sel_cathode          = config_bits[BYPASS_SEL][5:3];
    ext_reset[7:0]              = config_bits[EXT_RESET_0][7:0];
    ext_reset[15:8]             = config_bits[EXT_RESET_1][7:0];
    ext_reset_cathode           = config_bits[EXT_RESET_2][0];
    fb_del_ctrl                 = config_bits[FB_DEL_CTRL][3:0];
    fb_del_ctrl_cathode         = config_bits[FB_DEL_CTRL][7:4];
    gain_sel                    = config_bits[GAIN_SEL][2:0];
    gain_sel_cathode            = config_bits[GAIN_SEL][5:3];
    pd_anode[7:0]               = config_bits[PD_ANODE_0][7:0];
    pd_anode[15:8]              = config_bits[PD_ANODE_1][7:0];
    pd_cathode                  = config_bits[PD_CATHODE_RST_SEL][0];
    reset_sel                   = config_bits[PD_CATHODE_RST_SEL][1];
    reset_sel_cathode           = config_bits[PD_CATHODE_RST_SEL][2];
end // always_comb

external_interface
    #(.NUMREGS(NUMREGS)
    ) external_interface_inst (
    .config_bits            (config_bits),
    .piso                   (piso),
    .posi                   (posi),
    .clk                    (clk),
    .reset_n                (reset_n)
    );

endmodule
