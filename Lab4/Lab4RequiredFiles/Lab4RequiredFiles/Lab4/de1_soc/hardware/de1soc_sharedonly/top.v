// (C) 1992-2018 Intel Corporation.
// Intel, the Intel logo, Intel, MegaCore, NIOS II, Quartus and TalkBack words
// and logos are trademarks of Intel Corporation or its subsidiaries in the U.S.
// and/or other countries. Other marks and brands may be claimed as the property
// of others. See Trademarks on intel.com for full list of Intel trademarks or
// the Trademarks & Brands Names Database (if Intel) or See www.Intel.com/legal (if Altera)
// Your use of Intel Corporation's design tools, logic functions and other
// software and tools, and its AMPP partner logic functions, and any output
// files any of the foregoing (including device programming or simulation
// files), and any associated documentation or information are expressly subject
// to the terms and conditions of the Altera Program License Subscription
// Agreement, Intel MegaCore Function License Agreement, or other applicable
// license agreement, including, without limitation, that your use is for the
// sole purpose of programming logic devices manufactured by Intel and sold by
// Intel or its authorized distributors.  Please refer to the applicable
// agreement for further details.

module top (
  	fpga_clk_50,
  	fpga_reset_n,
  	fpga_led_output,

 	memory_mem_a,
  	memory_mem_ba,
  	memory_mem_ck,
  	memory_mem_ck_n,
  	memory_mem_cke,
  	memory_mem_cs_n,
  	memory_mem_ras_n,
  	memory_mem_cas_n,
  	memory_mem_we_n,
  	memory_mem_reset_n,
  	memory_mem_dq,
  	memory_mem_dqs,
  	memory_mem_dqs_n,
  	memory_mem_odt,
  	memory_mem_dm,
  	memory_oct_rzqin,

  	emac_mdio,
  	emac_mdc,
  	emac_tx_ctl,
  	emac_tx_clk,
  	emac_txd,
  	emac_rx_ctl,
  	emac_rx_clk,
  	emac_rxd,

  	usb1_d,
  	usb1_clk,
  	usb1_stp,
  	usb1_dir,
  	usb1_nxt,

  	sd_cmd,
  	sd_clk,
  	sd_d,
  	uart_rx,
  	uart_tx,
  	led,
  	i2c_sda,
  	i2c_scl,
	
	LEDR,
	KEY,

	
	SW,
	
	// VGA
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,
	
	
	CLOCK2_50,
	
	GPIO_1,
	
	// ADC
	ADC_CS_N,
	ADC_DIN,
	ADC_DOUT,
	ADC_SCLK,
	
	// I2C Bus for Configuration of the Audio and Video-In Chips
	FPGA_I2C_SCLK,
	FPGA_I2C_SDAT,

);

  input  wire 		fpga_clk_50;
  input  wire 		fpga_reset_n;
  output wire [3:0] 	fpga_led_output;

  output wire [14:0] 	memory_mem_a;
  output wire [2:0] 	memory_mem_ba;
  output wire 		memory_mem_ck;
  output wire 		memory_mem_ck_n;
  output wire 		memory_mem_cke;
  output wire 		memory_mem_cs_n;
  output wire 		memory_mem_ras_n;
  output wire 		memory_mem_cas_n;
  output wire 		memory_mem_we_n;
  output wire 		memory_mem_reset_n;
  inout  wire [31:0] 	memory_mem_dq;
  inout  wire [3:0] 	memory_mem_dqs;
  inout  wire [3:0] 	memory_mem_dqs_n;
  output wire 		memory_mem_odt;
  output wire [3:0] 	memory_mem_dm;
  input  wire 		memory_oct_rzqin;

  inout  wire 		emac_mdio;
  output wire 		emac_mdc;
  output wire 		emac_tx_ctl;
  output wire 		emac_tx_clk;
  output wire [3:0] 	emac_txd;
  input  wire 		emac_rx_ctl;
  input  wire 		emac_rx_clk;
  input  wire [3:0] 	emac_rxd;


  inout  wire [7:0] 	usb1_d;
  input  wire 		usb1_clk;
  output wire 		usb1_stp;
  input  wire 		usb1_dir;
  input  wire 		usb1_nxt;

  inout  wire 		sd_cmd;
  output wire 		sd_clk;
  inout  wire [3:0] 	sd_d;
  input  wire 		uart_rx;
  output wire 		uart_tx;
  inout  wire [0:0] 	led;
  inout  wire 		i2c_scl;
  inout  wire 		i2c_sda;

  wire	[29:0]	fpga_internal_led;
  wire		kernel_clk;
  
  output [5:0] LEDR;
  input [2:0] KEY;
  
//  // VGA
output		[ 7: 0]	VGA_B;
output					VGA_BLANK_N;
output					VGA_CLK;
output		[ 7: 0]	VGA_G;
output					VGA_HS;
output		[ 7: 0]	VGA_R;
output					VGA_SYNC_N;
output					VGA_VS;


// 40-pin headers
//inout			[35: 0]	GPIO_0;
inout			[35: 0]	GPIO_1;


wire		[11: 0]	CCD_DATA;

assign	CCD_DATA[0]	=	GPIO_1[13];
assign	CCD_DATA[1]	=	GPIO_1[12];
assign	CCD_DATA[2]	=	GPIO_1[11];
assign	CCD_DATA[3]	=	GPIO_1[10];
assign	CCD_DATA[4]	=	GPIO_1[9];
assign	CCD_DATA[5]	=	GPIO_1[8];
assign	CCD_DATA[6]	=	GPIO_1[7];
assign	CCD_DATA[7]	=	GPIO_1[6];
assign	CCD_DATA[8]	=	GPIO_1[5];
assign	CCD_DATA[9]	=	GPIO_1[4];
assign	CCD_DATA[10]=	GPIO_1[3];
assign	CCD_DATA[11]=	GPIO_1[1];

// Slider Switches
input			[ 9: 0]	SW;

input						CLOCK2_50;


// ADC
inout						ADC_CS_N;
output					ADC_DIN;
input						ADC_DOUT;
output					ADC_SCLK;


// I2C Bus for Configuration of the Audio and Video-In Chips
output					FPGA_I2C_SCLK;
inout						FPGA_I2C_SDAT;

  system the_system (
	.reset_50_reset_n                    			(fpga_reset_n),
	.clk_50_clk                          			(fpga_clk_50),
        .kernel_clk_clk						(kernel_clk),
	.memory_mem_a                        			(memory_mem_a),
	.memory_mem_ba                       			(memory_mem_ba),
	.memory_mem_ck                       			(memory_mem_ck),
	.memory_mem_ck_n                     			(memory_mem_ck_n),
	.memory_mem_cke                      			(memory_mem_cke),
	.memory_mem_cs_n                     			(memory_mem_cs_n),
	.memory_mem_ras_n                    			(memory_mem_ras_n),
	.memory_mem_cas_n                    			(memory_mem_cas_n),
	.memory_mem_we_n                     			(memory_mem_we_n),
	.memory_mem_reset_n                  			(memory_mem_reset_n),
	.memory_mem_dq                       			(memory_mem_dq),
	.memory_mem_dqs                      			(memory_mem_dqs),
	.memory_mem_dqs_n                    			(memory_mem_dqs_n),
	.memory_mem_odt                      			(memory_mem_odt),
	.memory_mem_dm                       			(memory_mem_dm),
	.memory_oct_rzqin                    			(memory_oct_rzqin),
	.peripheral_hps_io_emac1_inst_MDIO   			(emac_mdio),
	.peripheral_hps_io_emac1_inst_MDC    			(emac_mdc),
	.peripheral_hps_io_emac1_inst_TX_CLK 			(emac_tx_clk),
	.peripheral_hps_io_emac1_inst_TX_CTL 			(emac_tx_ctl),
	.peripheral_hps_io_emac1_inst_TXD0   			(emac_txd[0]),
	.peripheral_hps_io_emac1_inst_TXD1   			(emac_txd[1]),
	.peripheral_hps_io_emac1_inst_TXD2   			(emac_txd[2]),
	.peripheral_hps_io_emac1_inst_TXD3   			(emac_txd[3]),
	.peripheral_hps_io_emac1_inst_RX_CLK 			(emac_rx_clk),
	.peripheral_hps_io_emac1_inst_RX_CTL 			(emac_rx_ctl),
	.peripheral_hps_io_emac1_inst_RXD0   			(emac_rxd[0]),
	.peripheral_hps_io_emac1_inst_RXD1   			(emac_rxd[1]),
	.peripheral_hps_io_emac1_inst_RXD2   			(emac_rxd[2]),
	.peripheral_hps_io_emac1_inst_RXD3   			(emac_rxd[3]),
	.peripheral_hps_io_usb1_inst_D0      			(usb1_d[0]),
	.peripheral_hps_io_usb1_inst_D1      			(usb1_d[1]),
	.peripheral_hps_io_usb1_inst_D2      			(usb1_d[2]),
	.peripheral_hps_io_usb1_inst_D3      			(usb1_d[3]),
	.peripheral_hps_io_usb1_inst_D4      			(usb1_d[4]),
	.peripheral_hps_io_usb1_inst_D5      			(usb1_d[5]),
	.peripheral_hps_io_usb1_inst_D6      			(usb1_d[6]),
	.peripheral_hps_io_usb1_inst_D7      			(usb1_d[7]),
	.peripheral_hps_io_usb1_inst_CLK     			(usb1_clk),
	.peripheral_hps_io_usb1_inst_STP     			(usb1_stp),
	.peripheral_hps_io_usb1_inst_DIR     			(usb1_dir),
	.peripheral_hps_io_usb1_inst_NXT     			(usb1_nxt),
	.peripheral_hps_io_sdio_inst_CMD     			(sd_cmd),
	.peripheral_hps_io_sdio_inst_CLK     			(sd_clk),
	.peripheral_hps_io_sdio_inst_D0      			(sd_d[0]),
	.peripheral_hps_io_sdio_inst_D1      			(sd_d[1]),
	.peripheral_hps_io_sdio_inst_D2      			(sd_d[2]),
	.peripheral_hps_io_sdio_inst_D3      			(sd_d[3]),
	.peripheral_hps_io_uart0_inst_RX     			(uart_rx),
	.peripheral_hps_io_uart0_inst_TX     			(uart_tx),
	.peripheral_hps_io_gpio_inst_GPIO53  			(led[0]),
	.peripheral_hps_io_i2c0_inst_SDA     			(i2c_sda),
	.peripheral_hps_io_i2c0_inst_SCL     			(i2c_scl),
	
	.acl_iface_led_pio_export                    (LEDR),
	.acl_iface_pushbuttons_export                (KEY),
	
   //VGA
	.acl_iface_vga_CLK(VGA_CLK),                   
	.acl_iface_vga_HS(VGA_HS),                  
	.acl_iface_vga_VS(VGA_VS),                    
	.acl_iface_vga_BLANK(VGA_BLANK_N),                 
	.acl_iface_vga_SYNC(VGA_SYNC_N),                  
	.acl_iface_vga_R(VGA_R),                     
	.acl_iface_vga_G(VGA_G),                   
	.acl_iface_vga_B(VGA_B),                    
	.acl_iface_vga_pll_d5m_clk_clk(GPIO_1[16]),       
	.acl_iface_vga_pll_ref_clk_clk(CLOCK2_50),       
	.acl_iface_vga_pll_ref_reset_reset(1'b0),

   .acl_iface_d5m_config_I2C_SDAT(GPIO_1[23]),       //        acl_iface_d5m_config.I2C_SDAT
	.acl_iface_d5m_config_I2C_SCLK(GPIO_1[24]),       //                            .I2C_SCLK
	.acl_iface_d5m_config_exposure({SW, 6'h00}),       //                            .exposure

   .acl_iface_video_in_PIXEL_CLK(GPIO_1[0]),        //          acl_iface_video_in.PIXEL_CLK
	.acl_iface_video_in_LINE_VALID(GPIO_1[21]),       //                            .LINE_VALID
	.acl_iface_video_in_FRAME_VALID(GPIO_1[22]),      //                            .FRAME_VALID
	.acl_iface_video_in_PIXEL_DATA(CCD_DATA),       //                            .PIXEL_DATA   

	
	.acl_iface_adc_sclk                        (ADC_SCLK),
	.acl_iface_adc_cs_n                        (ADC_CS_N),
	.acl_iface_adc_dout                        (ADC_DOUT),
	.acl_iface_adc_din                         (ADC_DIN),
	
	
	// AV Config
	.acl_iface_av_config_SCLK							(FPGA_I2C_SCLK),
	.acl_iface_av_config_SDAT							(FPGA_I2C_SDAT),
	
  );
  


  // module for visualizing the kernel clock with 4 LEDs
  async_counter_30 AC30 (
        .clk 	(kernel_clk),
        .count	(fpga_internal_led)
    );
  assign fpga_led_output[3:0] = ~fpga_internal_led[29:26];

endmodule



module async_counter_30(clk, count);
  input			clk;
  output 	[29:0]	count;
  reg		[14:0] 	count_a;
  reg           [14:0]  count_b;

  initial count_a = 15'b0;
  initial count_b = 15'b0;

always @(negedge clk)
	count_a <= count_a + 1'b1;

always @(negedge count_a[14])
	count_b <= count_b + 1'b1;

assign count = {count_b, count_a};

endmodule



