
module acl_iface_system (
	adc_sclk,
	adc_cs_n,
	adc_dout,
	adc_din,
	av_config_SDAT,
	av_config_SCLK,
	config_clk_clk,
	d5m_config_I2C_SDAT,
	d5m_config_I2C_SCLK,
	d5m_config_exposure,
	reset_n,
	kernel_clk_clk,
	kernel_clk_snoop_clk,
	kernel_mem0_waitrequest,
	kernel_mem0_readdata,
	kernel_mem0_readdatavalid,
	kernel_mem0_burstcount,
	kernel_mem0_writedata,
	kernel_mem0_address,
	kernel_mem0_write,
	kernel_mem0_read,
	kernel_mem0_byteenable,
	kernel_mem0_debugaccess,
	kernel_reset_reset_n,
	led_pio_export,
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
	peripheral_hps_io_emac1_inst_TX_CLK,
	peripheral_hps_io_emac1_inst_TXD0,
	peripheral_hps_io_emac1_inst_TXD1,
	peripheral_hps_io_emac1_inst_TXD2,
	peripheral_hps_io_emac1_inst_TXD3,
	peripheral_hps_io_emac1_inst_RXD0,
	peripheral_hps_io_emac1_inst_MDIO,
	peripheral_hps_io_emac1_inst_MDC,
	peripheral_hps_io_emac1_inst_RX_CTL,
	peripheral_hps_io_emac1_inst_TX_CTL,
	peripheral_hps_io_emac1_inst_RX_CLK,
	peripheral_hps_io_emac1_inst_RXD1,
	peripheral_hps_io_emac1_inst_RXD2,
	peripheral_hps_io_emac1_inst_RXD3,
	peripheral_hps_io_sdio_inst_CMD,
	peripheral_hps_io_sdio_inst_D0,
	peripheral_hps_io_sdio_inst_D1,
	peripheral_hps_io_sdio_inst_CLK,
	peripheral_hps_io_sdio_inst_D2,
	peripheral_hps_io_sdio_inst_D3,
	peripheral_hps_io_usb1_inst_D0,
	peripheral_hps_io_usb1_inst_D1,
	peripheral_hps_io_usb1_inst_D2,
	peripheral_hps_io_usb1_inst_D3,
	peripheral_hps_io_usb1_inst_D4,
	peripheral_hps_io_usb1_inst_D5,
	peripheral_hps_io_usb1_inst_D6,
	peripheral_hps_io_usb1_inst_D7,
	peripheral_hps_io_usb1_inst_CLK,
	peripheral_hps_io_usb1_inst_STP,
	peripheral_hps_io_usb1_inst_DIR,
	peripheral_hps_io_usb1_inst_NXT,
	peripheral_hps_io_uart0_inst_RX,
	peripheral_hps_io_uart0_inst_TX,
	peripheral_hps_io_i2c0_inst_SDA,
	peripheral_hps_io_i2c0_inst_SCL,
	peripheral_hps_io_gpio_inst_GPIO53,
	pushbuttons_export,
	vga_CLK,
	vga_HS,
	vga_VS,
	vga_BLANK,
	vga_SYNC,
	vga_R,
	vga_G,
	vga_B,
	vga_pll_d5m_clk_clk,
	vga_pll_ref_clk_clk,
	vga_pll_ref_reset_reset,
	video_in_PIXEL_CLK,
	video_in_LINE_VALID,
	video_in_FRAME_VALID,
	video_in_pixel_clk_reset,
	video_in_PIXEL_DATA);	

	output		adc_sclk;
	output		adc_cs_n;
	input		adc_dout;
	output		adc_din;
	inout		av_config_SDAT;
	output		av_config_SCLK;
	input		config_clk_clk;
	inout		d5m_config_I2C_SDAT;
	output		d5m_config_I2C_SCLK;
	input	[15:0]	d5m_config_exposure;
	input		reset_n;
	output		kernel_clk_clk;
	output		kernel_clk_snoop_clk;
	output		kernel_mem0_waitrequest;
	output	[255:0]	kernel_mem0_readdata;
	output		kernel_mem0_readdatavalid;
	input	[4:0]	kernel_mem0_burstcount;
	input	[255:0]	kernel_mem0_writedata;
	input	[24:0]	kernel_mem0_address;
	input		kernel_mem0_write;
	input		kernel_mem0_read;
	input	[31:0]	kernel_mem0_byteenable;
	input		kernel_mem0_debugaccess;
	output		kernel_reset_reset_n;
	output	[5:0]	led_pio_export;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	output		peripheral_hps_io_emac1_inst_TX_CLK;
	output		peripheral_hps_io_emac1_inst_TXD0;
	output		peripheral_hps_io_emac1_inst_TXD1;
	output		peripheral_hps_io_emac1_inst_TXD2;
	output		peripheral_hps_io_emac1_inst_TXD3;
	input		peripheral_hps_io_emac1_inst_RXD0;
	inout		peripheral_hps_io_emac1_inst_MDIO;
	output		peripheral_hps_io_emac1_inst_MDC;
	input		peripheral_hps_io_emac1_inst_RX_CTL;
	output		peripheral_hps_io_emac1_inst_TX_CTL;
	input		peripheral_hps_io_emac1_inst_RX_CLK;
	input		peripheral_hps_io_emac1_inst_RXD1;
	input		peripheral_hps_io_emac1_inst_RXD2;
	input		peripheral_hps_io_emac1_inst_RXD3;
	inout		peripheral_hps_io_sdio_inst_CMD;
	inout		peripheral_hps_io_sdio_inst_D0;
	inout		peripheral_hps_io_sdio_inst_D1;
	output		peripheral_hps_io_sdio_inst_CLK;
	inout		peripheral_hps_io_sdio_inst_D2;
	inout		peripheral_hps_io_sdio_inst_D3;
	inout		peripheral_hps_io_usb1_inst_D0;
	inout		peripheral_hps_io_usb1_inst_D1;
	inout		peripheral_hps_io_usb1_inst_D2;
	inout		peripheral_hps_io_usb1_inst_D3;
	inout		peripheral_hps_io_usb1_inst_D4;
	inout		peripheral_hps_io_usb1_inst_D5;
	inout		peripheral_hps_io_usb1_inst_D6;
	inout		peripheral_hps_io_usb1_inst_D7;
	input		peripheral_hps_io_usb1_inst_CLK;
	output		peripheral_hps_io_usb1_inst_STP;
	input		peripheral_hps_io_usb1_inst_DIR;
	input		peripheral_hps_io_usb1_inst_NXT;
	input		peripheral_hps_io_uart0_inst_RX;
	output		peripheral_hps_io_uart0_inst_TX;
	inout		peripheral_hps_io_i2c0_inst_SDA;
	inout		peripheral_hps_io_i2c0_inst_SCL;
	inout		peripheral_hps_io_gpio_inst_GPIO53;
	input	[3:0]	pushbuttons_export;
	output		vga_CLK;
	output		vga_HS;
	output		vga_VS;
	output		vga_BLANK;
	output		vga_SYNC;
	output	[7:0]	vga_R;
	output	[7:0]	vga_G;
	output	[7:0]	vga_B;
	output		vga_pll_d5m_clk_clk;
	input		vga_pll_ref_clk_clk;
	input		vga_pll_ref_reset_reset;
	input		video_in_PIXEL_CLK;
	input		video_in_LINE_VALID;
	input		video_in_FRAME_VALID;
	input		video_in_pixel_clk_reset;
	input	[11:0]	video_in_PIXEL_DATA;
endmodule
