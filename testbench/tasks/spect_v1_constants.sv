///////////////////////////////////////////////////////////////////
// File Name: spect_v1_constants.sv
// Engineer:  Carl Grace (crgrace@lbl.gov)
// Description:  Constants for spect_v1 operation and simulation
//          
///////////////////////////////////////////////////////////////////

`ifndef _spect_v1_constants_
`ifndef SYNTHESIS 
`define _spect_v1_constants_
`endif

// declare needed variables
localparam TRUE = 1;
localparam FALSE = 0;
localparam SILENT = 0;
localparam VERBOSE = 1;          // high to print out verification results

// localparams to define config registers
// configuration word definitions
localparam BYPASS_SEL = 0;
localparam EXT_RESET_0 = 1;
localparam EXT_RESET_1 = 2;
localparam EXT_RESET_2 = 3;
localparam FB_DEL_CTRL = 4;
localparam GAIN_SEL = 5;
localparam PD_ANODE_0 = 6;
localparam PD_ANODE_1 = 7;
localparam PD_CATHODE_RST_SEL = 8;

// UART ops
localparam WRITE = 1;
localparam READ = 0;


`endif // _spect_v1_constants_
