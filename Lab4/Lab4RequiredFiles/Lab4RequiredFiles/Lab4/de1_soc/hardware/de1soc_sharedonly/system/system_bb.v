
module system (
	acl_iface_d5m_config_I2C_SDAT,
	acl_iface_d5m_config_I2C_SCLK,
	acl_iface_d5m_config_exposure,
	acl_iface_led_pio_export,
	acl_iface_pushbuttons_export,
	acl_iface_vga_CLK,
	acl_iface_vga_HS,
	acl_iface_vga_VS,
	acl_iface_vga_BLANK,
	acl_iface_vga_SYNC,
	acl_iface_vga_R,
	acl_iface_vga_G,
	acl_iface_vga_B,
	acl_iface_vga_pll_d5m_clk_clk,
	acl_iface_vga_pll_ref_clk_clk,
	acl_iface_vga_pll_ref_reset_reset,
	acl_iface_video_in_PIXEL_CLK,
	acl_iface_video_in_LINE_VALID,
	acl_iface_video_in_FRAME_VALID,
	acl_iface_video_in_pixel_clk_reset,
	acl_iface_video_in_PIXEL_DATA,
	clk_50_clk,
	kernel_clk_clk,
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
	reset_50_reset_n,
	acl_iface_adc_sclk,
	acl_iface_adc_cs_n,
	acl_iface_adc_dout,
	acl_iface_adc_din,
	acl_iface_av_config_SDAT,
	acl_iface_av_config_SCLK);	

	inout		acl_iface_d5m_config_I2C_SDAT;
	output		acl_iface_d5m_config_I2C_SCLK;
	input	[15:0]	acl_iface_d5m_config_exposure;
	output	[5:0]	acl_iface_led_pio_export;
	input	[3:0]	acl_iface_pushbuttons_export;
	output		acl_iface_vga_CLK;
	output		acl_iface_vga_HS;
	output		acl_iface_vga_VS;
	output		acl_iface_vga_BLANK;
	output		acl_iface_vga_SYNC;
	output	[7:0]	acl_iface_vga_R;
	output	[7:0]	acl_iface_vga_G;
	output	[7:0]	acl_iface_vga_B;
	output		acl_iface_vga_pll_d5m_clk_clk;
	input		acl_iface_vga_pll_ref_clk_clk;
	input		acl_iface_vga_pll_ref_reset_reset;
	input		acl_iface_video_in_PIXEL_CLK;
	input		acl_iface_video_in_LINE_VALID;
	input		acl_iface_video_in_FRAME_VALID;
	input		acl_iface_video_in_pixel_clk_reset;
	input	[11:0]	acl_iface_video_in_PIXEL_DATA;
	input		clk_50_clk;
	output		kernel_clk_clk;
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
	input		reset_50_reset_n;
	output		acl_iface_adc_sclk;
	output		acl_iface_adc_cs_n;
	input		acl_iface_adc_dout;
	output		acl_iface_adc_din;
	inout		acl_iface_av_config_SDAT;
	output		acl_iface_av_config_SCLK;
endmodule
