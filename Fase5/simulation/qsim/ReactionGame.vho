-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

-- DATE "05/31/2024 22:50:52"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ConfigurationUnit IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	press : IN std_logic;
	timeExp : IN std_logic;
	newTime : OUT std_logic;
	timeVal : OUT std_logic_vector(31 DOWNTO 0);
	targetScore : OUT std_logic_vector(5 DOWNTO 0);
	resetTimer : OUT std_logic;
	fastIncrement : OUT std_logic;
	short : OUT std_logic
	);
END ConfigurationUnit;

-- Design Ports Information
-- newTime	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[0]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[1]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[2]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[3]	=>  Location: PIN_H23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[4]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[5]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[6]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[7]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[8]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[9]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[10]	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[11]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[12]	=>  Location: PIN_R27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[13]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[14]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[15]	=>  Location: PIN_AE10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[16]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[17]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[18]	=>  Location: PIN_AC19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[19]	=>  Location: PIN_V26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[20]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[21]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[22]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[23]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[24]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[25]	=>  Location: PIN_L24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[26]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[27]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[28]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[29]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[30]	=>  Location: PIN_D23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeVal[31]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- targetScore[0]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- targetScore[1]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- targetScore[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- targetScore[3]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- targetScore[4]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- targetScore[5]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resetTimer	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fastIncrement	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- short	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- press	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeExp	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ConfigurationUnit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_press : std_logic;
SIGNAL ww_timeExp : std_logic;
SIGNAL ww_newTime : std_logic;
SIGNAL ww_timeVal : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_targetScore : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_resetTimer : std_logic;
SIGNAL ww_fastIncrement : std_logic;
SIGNAL ww_short : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \newTime~output_o\ : std_logic;
SIGNAL \timeVal[0]~output_o\ : std_logic;
SIGNAL \timeVal[1]~output_o\ : std_logic;
SIGNAL \timeVal[2]~output_o\ : std_logic;
SIGNAL \timeVal[3]~output_o\ : std_logic;
SIGNAL \timeVal[4]~output_o\ : std_logic;
SIGNAL \timeVal[5]~output_o\ : std_logic;
SIGNAL \timeVal[6]~output_o\ : std_logic;
SIGNAL \timeVal[7]~output_o\ : std_logic;
SIGNAL \timeVal[8]~output_o\ : std_logic;
SIGNAL \timeVal[9]~output_o\ : std_logic;
SIGNAL \timeVal[10]~output_o\ : std_logic;
SIGNAL \timeVal[11]~output_o\ : std_logic;
SIGNAL \timeVal[12]~output_o\ : std_logic;
SIGNAL \timeVal[13]~output_o\ : std_logic;
SIGNAL \timeVal[14]~output_o\ : std_logic;
SIGNAL \timeVal[15]~output_o\ : std_logic;
SIGNAL \timeVal[16]~output_o\ : std_logic;
SIGNAL \timeVal[17]~output_o\ : std_logic;
SIGNAL \timeVal[18]~output_o\ : std_logic;
SIGNAL \timeVal[19]~output_o\ : std_logic;
SIGNAL \timeVal[20]~output_o\ : std_logic;
SIGNAL \timeVal[21]~output_o\ : std_logic;
SIGNAL \timeVal[22]~output_o\ : std_logic;
SIGNAL \timeVal[23]~output_o\ : std_logic;
SIGNAL \timeVal[24]~output_o\ : std_logic;
SIGNAL \timeVal[25]~output_o\ : std_logic;
SIGNAL \timeVal[26]~output_o\ : std_logic;
SIGNAL \timeVal[27]~output_o\ : std_logic;
SIGNAL \timeVal[28]~output_o\ : std_logic;
SIGNAL \timeVal[29]~output_o\ : std_logic;
SIGNAL \timeVal[30]~output_o\ : std_logic;
SIGNAL \timeVal[31]~output_o\ : std_logic;
SIGNAL \targetScore[0]~output_o\ : std_logic;
SIGNAL \targetScore[1]~output_o\ : std_logic;
SIGNAL \targetScore[2]~output_o\ : std_logic;
SIGNAL \targetScore[3]~output_o\ : std_logic;
SIGNAL \targetScore[4]~output_o\ : std_logic;
SIGNAL \targetScore[5]~output_o\ : std_logic;
SIGNAL \resetTimer~output_o\ : std_logic;
SIGNAL \fastIncrement~output_o\ : std_logic;
SIGNAL \short~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \press~input_o\ : std_logic;
SIGNAL \debounce_press|s_dirtyIn~0_combout\ : std_logic;
SIGNAL \debounce_press|s_dirtyIn~q\ : std_logic;
SIGNAL \debounce_press|s_previousIn~q\ : std_logic;
SIGNAL \debounce_press|Add0~0_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~24_combout\ : std_logic;
SIGNAL \debounce_press|Add0~1\ : std_logic;
SIGNAL \debounce_press|Add0~2_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~20_combout\ : std_logic;
SIGNAL \debounce_press|Add0~3\ : std_logic;
SIGNAL \debounce_press|Add0~4_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~21_combout\ : std_logic;
SIGNAL \debounce_press|Add0~5\ : std_logic;
SIGNAL \debounce_press|Add0~6_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~22_combout\ : std_logic;
SIGNAL \debounce_press|Add0~7\ : std_logic;
SIGNAL \debounce_press|Add0~8_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~23_combout\ : std_logic;
SIGNAL \debounce_press|Add0~9\ : std_logic;
SIGNAL \debounce_press|Add0~10_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~27_combout\ : std_logic;
SIGNAL \debounce_press|s_pulsedOut~5_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[14]~2_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[14]~3_combout\ : std_logic;
SIGNAL \debounce_press|Add0~11\ : std_logic;
SIGNAL \debounce_press|Add0~12_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~1_combout\ : std_logic;
SIGNAL \debounce_press|Add0~13\ : std_logic;
SIGNAL \debounce_press|Add0~14_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~12_combout\ : std_logic;
SIGNAL \debounce_press|Add0~15\ : std_logic;
SIGNAL \debounce_press|Add0~17\ : std_logic;
SIGNAL \debounce_press|Add0~18_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~14_combout\ : std_logic;
SIGNAL \debounce_press|Add0~19\ : std_logic;
SIGNAL \debounce_press|Add0~20_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~15_combout\ : std_logic;
SIGNAL \debounce_press|Add0~21\ : std_logic;
SIGNAL \debounce_press|Add0~22_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~16_combout\ : std_logic;
SIGNAL \debounce_press|Add0~23\ : std_logic;
SIGNAL \debounce_press|Add0~24_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~8_combout\ : std_logic;
SIGNAL \debounce_press|Add0~25\ : std_logic;
SIGNAL \debounce_press|Add0~26_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~9_combout\ : std_logic;
SIGNAL \debounce_press|Add0~27\ : std_logic;
SIGNAL \debounce_press|Add0~28_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~17_combout\ : std_logic;
SIGNAL \debounce_press|Add0~29\ : std_logic;
SIGNAL \debounce_press|Add0~30_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~5_combout\ : std_logic;
SIGNAL \debounce_press|Add0~31\ : std_logic;
SIGNAL \debounce_press|Add0~32_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~6_combout\ : std_logic;
SIGNAL \debounce_press|Add0~33\ : std_logic;
SIGNAL \debounce_press|Add0~34_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~7_combout\ : std_logic;
SIGNAL \debounce_press|Add0~35\ : std_logic;
SIGNAL \debounce_press|Add0~36_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[18]~18_combout\ : std_logic;
SIGNAL \debounce_press|Add0~37\ : std_logic;
SIGNAL \debounce_press|Add0~38_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[19]~19_combout\ : std_logic;
SIGNAL \debounce_press|Add0~39\ : std_logic;
SIGNAL \debounce_press|Add0~40_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[20]~10_combout\ : std_logic;
SIGNAL \debounce_press|Add0~41\ : std_logic;
SIGNAL \debounce_press|Add0~43\ : std_logic;
SIGNAL \debounce_press|Add0~44_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[22]~25_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[22]~26_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[14]~4_combout\ : std_logic;
SIGNAL \debounce_press|Add0~42_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[21]~11_combout\ : std_logic;
SIGNAL \debounce_press|LessThan0~4_combout\ : std_logic;
SIGNAL \debounce_press|LessThan0~5_combout\ : std_logic;
SIGNAL \debounce_press|LessThan0~6_combout\ : std_logic;
SIGNAL \debounce_press|LessThan0~1_combout\ : std_logic;
SIGNAL \debounce_press|LessThan0~0_combout\ : std_logic;
SIGNAL \debounce_press|LessThan0~2_combout\ : std_logic;
SIGNAL \debounce_press|LessThan0~3_combout\ : std_logic;
SIGNAL \debounce_press|LessThan0~7_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt[14]~0_combout\ : std_logic;
SIGNAL \debounce_press|Add0~16_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt~13_combout\ : std_logic;
SIGNAL \debounce_press|s_pulsedOut~2_combout\ : std_logic;
SIGNAL \debounce_press|s_pulsedOut~0_combout\ : std_logic;
SIGNAL \debounce_press|s_pulsedOut~1_combout\ : std_logic;
SIGNAL \debounce_press|s_pulsedOut~3_combout\ : std_logic;
SIGNAL \debounce_press|s_pulsedOut~4_combout\ : std_logic;
SIGNAL \debounce_press|s_pulsedOut~6_combout\ : std_logic;
SIGNAL \debounce_press|s_pulsedOut~7_combout\ : std_logic;
SIGNAL \debounce_press|s_pulsedOut~q\ : std_logic;
SIGNAL \s_newTime~feeder_combout\ : std_logic;
SIGNAL \s_newTime~q\ : std_logic;
SIGNAL \target_counter|Add0~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~0_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~1\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~2_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~3\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~4_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~5\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~6_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~7\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~8_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~9\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~10_combout\ : std_logic;
SIGNAL \pulse10hz_gen|s_cnt~4_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~11\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~12_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~13\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~14_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~15\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~16_combout\ : std_logic;
SIGNAL \pulse10hz_gen|s_cnt~3_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~17\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~18_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~19\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~20_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~21\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~22_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~23\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~24_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~25\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~26_combout\ : std_logic;
SIGNAL \pulse10hz_gen|s_cnt~5_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~27\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~28_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~29\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~30_combout\ : std_logic;
SIGNAL \pulse10hz_gen|s_cnt~6_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~31\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~32_combout\ : std_logic;
SIGNAL \pulse10hz_gen|s_cnt~0_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~33\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~34_combout\ : std_logic;
SIGNAL \pulse10hz_gen|s_cnt~1_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~35\ : std_logic;
SIGNAL \pulse10hz_gen|Add0~36_combout\ : std_logic;
SIGNAL \pulse10hz_gen|s_cnt~2_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Equal0~1_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Equal0~3_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Equal0~2_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Equal0~0_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Equal0~4_combout\ : std_logic;
SIGNAL \pulse10hz_gen|Equal0~5_combout\ : std_logic;
SIGNAL \pulse10hz_gen|pulse~q\ : std_logic;
SIGNAL \timeExp~input_o\ : std_logic;
SIGNAL \press_type_proc~0_combout\ : std_logic;
SIGNAL \s_long_press~q\ : std_logic;
SIGNAL \target_counter|cnt_value~0_combout\ : std_logic;
SIGNAL \target_counter|cnt_value~1_combout\ : std_logic;
SIGNAL \target_counter|Add0~1\ : std_logic;
SIGNAL \target_counter|Add0~2_combout\ : std_logic;
SIGNAL \target_counter|Add0~3\ : std_logic;
SIGNAL \target_counter|Add0~4_combout\ : std_logic;
SIGNAL \target_counter|cnt_value~6_combout\ : std_logic;
SIGNAL \target_counter|cnt_value[5]~5_combout\ : std_logic;
SIGNAL \target_counter|Add0~5\ : std_logic;
SIGNAL \target_counter|Add0~6_combout\ : std_logic;
SIGNAL \target_counter|cnt_value~7_combout\ : std_logic;
SIGNAL \target_counter|Add0~7\ : std_logic;
SIGNAL \target_counter|Add0~8_combout\ : std_logic;
SIGNAL \target_counter|cnt_value~8_combout\ : std_logic;
SIGNAL \target_counter|Add0~9\ : std_logic;
SIGNAL \target_counter|Add0~10_combout\ : std_logic;
SIGNAL \target_counter|cnt_value~9_combout\ : std_logic;
SIGNAL \target_counter|cnt_value[5]~2_combout\ : std_logic;
SIGNAL \target_counter|cnt_value[5]~3_combout\ : std_logic;
SIGNAL \target_counter|cnt_value~4_combout\ : std_logic;
SIGNAL \s_resetTimer~q\ : std_logic;
SIGNAL \s_fast_increment~0_combout\ : std_logic;
SIGNAL \debounce_press|s_debounceCnt\ : std_logic_vector(22 DOWNTO 0);
SIGNAL \target_counter|cnt_value\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \pulse10hz_gen|s_cnt\ : std_logic_vector(18 DOWNTO 0);
SIGNAL \target_counter|ALT_INV_cnt_value\ : std_logic_vector(0 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_press <= press;
ww_timeExp <= timeExp;
newTime <= ww_newTime;
timeVal <= ww_timeVal;
targetScore <= ww_targetScore;
resetTimer <= ww_resetTimer;
fastIncrement <= ww_fastIncrement;
short <= ww_short;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\target_counter|ALT_INV_cnt_value\(0) <= NOT \target_counter|cnt_value\(0);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N2
\newTime~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s_newTime~q\,
	devoe => ww_devoe,
	o => \newTime~output_o\);

-- Location: IOOBUF_X52_Y73_N16
\timeVal[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[0]~output_o\);

-- Location: IOOBUF_X67_Y0_N2
\timeVal[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[1]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\timeVal[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[2]~output_o\);

-- Location: IOOBUF_X115_Y65_N16
\timeVal[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[3]~output_o\);

-- Location: IOOBUF_X115_Y15_N9
\timeVal[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[4]~output_o\);

-- Location: IOOBUF_X5_Y73_N9
\timeVal[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[5]~output_o\);

-- Location: IOOBUF_X49_Y0_N23
\timeVal[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[6]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\timeVal[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[7]~output_o\);

-- Location: IOOBUF_X40_Y73_N9
\timeVal[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[8]~output_o\);

-- Location: IOOBUF_X67_Y0_N9
\timeVal[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[9]~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\timeVal[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[10]~output_o\);

-- Location: IOOBUF_X1_Y73_N23
\timeVal[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[11]~output_o\);

-- Location: IOOBUF_X115_Y34_N16
\timeVal[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[12]~output_o\);

-- Location: IOOBUF_X56_Y0_N16
\timeVal[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[13]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\timeVal[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[14]~output_o\);

-- Location: IOOBUF_X29_Y0_N23
\timeVal[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[15]~output_o\);

-- Location: IOOBUF_X0_Y52_N16
\timeVal[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[16]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\timeVal[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[17]~output_o\);

-- Location: IOOBUF_X94_Y0_N9
\timeVal[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[18]~output_o\);

-- Location: IOOBUF_X115_Y23_N9
\timeVal[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[19]~output_o\);

-- Location: IOOBUF_X89_Y0_N2
\timeVal[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[20]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\timeVal[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[21]~output_o\);

-- Location: IOOBUF_X40_Y73_N2
\timeVal[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[22]~output_o\);

-- Location: IOOBUF_X58_Y73_N23
\timeVal[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[23]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\timeVal[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[24]~output_o\);

-- Location: IOOBUF_X115_Y48_N2
\timeVal[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \timeVal[25]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\timeVal[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[26]~output_o\);

-- Location: IOOBUF_X47_Y0_N9
\timeVal[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[27]~output_o\);

-- Location: IOOBUF_X83_Y0_N9
\timeVal[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[28]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\timeVal[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[29]~output_o\);

-- Location: IOOBUF_X100_Y73_N16
\timeVal[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[30]~output_o\);

-- Location: IOOBUF_X0_Y29_N16
\timeVal[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \timeVal[31]~output_o\);

-- Location: IOOBUF_X60_Y73_N9
\targetScore[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \target_counter|ALT_INV_cnt_value\(0),
	devoe => ww_devoe,
	o => \targetScore[0]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\targetScore[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \target_counter|cnt_value\(1),
	devoe => ww_devoe,
	o => \targetScore[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\targetScore[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \target_counter|cnt_value\(2),
	devoe => ww_devoe,
	o => \targetScore[2]~output_o\);

-- Location: IOOBUF_X62_Y73_N23
\targetScore[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \target_counter|cnt_value\(3),
	devoe => ww_devoe,
	o => \targetScore[3]~output_o\);

-- Location: IOOBUF_X62_Y73_N16
\targetScore[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \target_counter|cnt_value\(4),
	devoe => ww_devoe,
	o => \targetScore[4]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\targetScore[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \target_counter|cnt_value\(5),
	devoe => ww_devoe,
	o => \targetScore[5]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\resetTimer~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s_resetTimer~q\,
	devoe => ww_devoe,
	o => \resetTimer~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\fastIncrement~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s_fast_increment~0_combout\,
	devoe => ww_devoe,
	o => \fastIncrement~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\short~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \debounce_press|s_pulsedOut~q\,
	devoe => ww_devoe,
	o => \short~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X69_Y73_N15
\press~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_press,
	o => \press~input_o\);

-- Location: LCCOMB_X68_Y68_N20
\debounce_press|s_dirtyIn~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_dirtyIn~0_combout\ = !\press~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \press~input_o\,
	combout => \debounce_press|s_dirtyIn~0_combout\);

-- Location: FF_X68_Y68_N21
\debounce_press|s_dirtyIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_dirtyIn~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_dirtyIn~q\);

-- Location: FF_X70_Y68_N5
\debounce_press|s_previousIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \debounce_press|s_dirtyIn~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_previousIn~q\);

-- Location: LCCOMB_X69_Y68_N10
\debounce_press|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~0_combout\ = \debounce_press|s_debounceCnt\(0) $ (VCC)
-- \debounce_press|Add0~1\ = CARRY(\debounce_press|s_debounceCnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(0),
	datad => VCC,
	combout => \debounce_press|Add0~0_combout\,
	cout => \debounce_press|Add0~1\);

-- Location: LCCOMB_X69_Y68_N2
\debounce_press|s_debounceCnt~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~24_combout\ = (\debounce_press|Add0~0_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|Add0~0_combout\,
	datac => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~24_combout\);

-- Location: FF_X69_Y68_N3
\debounce_press|s_debounceCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~24_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(0));

-- Location: LCCOMB_X69_Y68_N12
\debounce_press|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~2_combout\ = (\debounce_press|s_debounceCnt\(1) & (\debounce_press|Add0~1\ & VCC)) # (!\debounce_press|s_debounceCnt\(1) & (!\debounce_press|Add0~1\))
-- \debounce_press|Add0~3\ = CARRY((!\debounce_press|s_debounceCnt\(1) & !\debounce_press|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(1),
	datad => VCC,
	cin => \debounce_press|Add0~1\,
	combout => \debounce_press|Add0~2_combout\,
	cout => \debounce_press|Add0~3\);

-- Location: LCCOMB_X69_Y68_N6
\debounce_press|s_debounceCnt~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~20_combout\ = (\debounce_press|s_debounceCnt[14]~4_combout\ & \debounce_press|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_press|s_debounceCnt[14]~4_combout\,
	datad => \debounce_press|Add0~2_combout\,
	combout => \debounce_press|s_debounceCnt~20_combout\);

-- Location: FF_X69_Y68_N7
\debounce_press|s_debounceCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~20_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(1));

-- Location: LCCOMB_X69_Y68_N14
\debounce_press|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~4_combout\ = (\debounce_press|s_debounceCnt\(2) & ((GND) # (!\debounce_press|Add0~3\))) # (!\debounce_press|s_debounceCnt\(2) & (\debounce_press|Add0~3\ $ (GND)))
-- \debounce_press|Add0~5\ = CARRY((\debounce_press|s_debounceCnt\(2)) # (!\debounce_press|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(2),
	datad => VCC,
	cin => \debounce_press|Add0~3\,
	combout => \debounce_press|Add0~4_combout\,
	cout => \debounce_press|Add0~5\);

-- Location: LCCOMB_X70_Y68_N10
\debounce_press|s_debounceCnt~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~21_combout\ = (\debounce_press|Add0~4_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|Add0~4_combout\,
	datad => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~21_combout\);

-- Location: FF_X70_Y68_N11
\debounce_press|s_debounceCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~21_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(2));

-- Location: LCCOMB_X69_Y68_N16
\debounce_press|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~6_combout\ = (\debounce_press|s_debounceCnt\(3) & (\debounce_press|Add0~5\ & VCC)) # (!\debounce_press|s_debounceCnt\(3) & (!\debounce_press|Add0~5\))
-- \debounce_press|Add0~7\ = CARRY((!\debounce_press|s_debounceCnt\(3) & !\debounce_press|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(3),
	datad => VCC,
	cin => \debounce_press|Add0~5\,
	combout => \debounce_press|Add0~6_combout\,
	cout => \debounce_press|Add0~7\);

-- Location: LCCOMB_X69_Y68_N8
\debounce_press|s_debounceCnt~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~22_combout\ = (\debounce_press|Add0~6_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|Add0~6_combout\,
	datac => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~22_combout\);

-- Location: FF_X69_Y68_N9
\debounce_press|s_debounceCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~22_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(3));

-- Location: LCCOMB_X69_Y68_N18
\debounce_press|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~8_combout\ = (\debounce_press|s_debounceCnt\(4) & ((GND) # (!\debounce_press|Add0~7\))) # (!\debounce_press|s_debounceCnt\(4) & (\debounce_press|Add0~7\ $ (GND)))
-- \debounce_press|Add0~9\ = CARRY((\debounce_press|s_debounceCnt\(4)) # (!\debounce_press|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(4),
	datad => VCC,
	cin => \debounce_press|Add0~7\,
	combout => \debounce_press|Add0~8_combout\,
	cout => \debounce_press|Add0~9\);

-- Location: LCCOMB_X70_Y68_N28
\debounce_press|s_debounceCnt~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~23_combout\ = (\debounce_press|Add0~8_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_press|Add0~8_combout\,
	datad => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~23_combout\);

-- Location: FF_X70_Y68_N29
\debounce_press|s_debounceCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~23_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(4));

-- Location: LCCOMB_X69_Y68_N20
\debounce_press|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~10_combout\ = (\debounce_press|s_debounceCnt\(5) & (\debounce_press|Add0~9\ & VCC)) # (!\debounce_press|s_debounceCnt\(5) & (!\debounce_press|Add0~9\))
-- \debounce_press|Add0~11\ = CARRY((!\debounce_press|s_debounceCnt\(5) & !\debounce_press|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(5),
	datad => VCC,
	cin => \debounce_press|Add0~9\,
	combout => \debounce_press|Add0~10_combout\,
	cout => \debounce_press|Add0~11\);

-- Location: LCCOMB_X69_Y68_N4
\debounce_press|s_debounceCnt~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~27_combout\ = (\debounce_press|Add0~10_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|Add0~10_combout\,
	datac => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~27_combout\);

-- Location: FF_X69_Y68_N5
\debounce_press|s_debounceCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~27_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(5));

-- Location: LCCOMB_X70_Y68_N22
\debounce_press|s_pulsedOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_pulsedOut~5_combout\ = (!\debounce_press|s_debounceCnt\(2) & (!\debounce_press|s_debounceCnt\(4) & (!\debounce_press|s_debounceCnt\(1) & !\debounce_press|s_debounceCnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(2),
	datab => \debounce_press|s_debounceCnt\(4),
	datac => \debounce_press|s_debounceCnt\(1),
	datad => \debounce_press|s_debounceCnt\(3),
	combout => \debounce_press|s_pulsedOut~5_combout\);

-- Location: LCCOMB_X70_Y68_N18
\debounce_press|s_debounceCnt[14]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[14]~2_combout\ = (\debounce_press|s_debounceCnt\(0)) # ((\debounce_press|s_debounceCnt\(5)) # ((!\debounce_press|s_pulsedOut~4_combout\) # (!\debounce_press|s_pulsedOut~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(0),
	datab => \debounce_press|s_debounceCnt\(5),
	datac => \debounce_press|s_pulsedOut~5_combout\,
	datad => \debounce_press|s_pulsedOut~4_combout\,
	combout => \debounce_press|s_debounceCnt[14]~2_combout\);

-- Location: LCCOMB_X70_Y68_N4
\debounce_press|s_debounceCnt[14]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[14]~3_combout\ = ((\debounce_press|s_debounceCnt\(22)) # ((\debounce_press|s_debounceCnt[14]~2_combout\) # (!\debounce_press|s_previousIn~q\))) # (!\debounce_press|s_dirtyIn~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_dirtyIn~q\,
	datab => \debounce_press|s_debounceCnt\(22),
	datac => \debounce_press|s_previousIn~q\,
	datad => \debounce_press|s_debounceCnt[14]~2_combout\,
	combout => \debounce_press|s_debounceCnt[14]~3_combout\);

-- Location: LCCOMB_X69_Y68_N22
\debounce_press|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~12_combout\ = (\debounce_press|s_debounceCnt\(6) & ((GND) # (!\debounce_press|Add0~11\))) # (!\debounce_press|s_debounceCnt\(6) & (\debounce_press|Add0~11\ $ (GND)))
-- \debounce_press|Add0~13\ = CARRY((\debounce_press|s_debounceCnt\(6)) # (!\debounce_press|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(6),
	datad => VCC,
	cin => \debounce_press|Add0~11\,
	combout => \debounce_press|Add0~12_combout\,
	cout => \debounce_press|Add0~13\);

-- Location: LCCOMB_X70_Y68_N0
\debounce_press|s_debounceCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~1_combout\ = (\debounce_press|s_debounceCnt[14]~0_combout\ & ((\debounce_press|Add0~12_combout\) # (!\debounce_press|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_previousIn~q\,
	datab => \debounce_press|Add0~12_combout\,
	datad => \debounce_press|s_debounceCnt[14]~0_combout\,
	combout => \debounce_press|s_debounceCnt~1_combout\);

-- Location: FF_X70_Y68_N1
\debounce_press|s_debounceCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~1_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(6));

-- Location: LCCOMB_X69_Y68_N24
\debounce_press|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~14_combout\ = (\debounce_press|s_debounceCnt\(7) & (\debounce_press|Add0~13\ & VCC)) # (!\debounce_press|s_debounceCnt\(7) & (!\debounce_press|Add0~13\))
-- \debounce_press|Add0~15\ = CARRY((!\debounce_press|s_debounceCnt\(7) & !\debounce_press|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(7),
	datad => VCC,
	cin => \debounce_press|Add0~13\,
	combout => \debounce_press|Add0~14_combout\,
	cout => \debounce_press|Add0~15\);

-- Location: LCCOMB_X67_Y68_N28
\debounce_press|s_debounceCnt~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~12_combout\ = (\debounce_press|Add0~14_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_press|Add0~14_combout\,
	datad => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~12_combout\);

-- Location: FF_X67_Y68_N29
\debounce_press|s_debounceCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~12_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(7));

-- Location: LCCOMB_X69_Y68_N26
\debounce_press|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~16_combout\ = (\debounce_press|s_debounceCnt\(8) & ((GND) # (!\debounce_press|Add0~15\))) # (!\debounce_press|s_debounceCnt\(8) & (\debounce_press|Add0~15\ $ (GND)))
-- \debounce_press|Add0~17\ = CARRY((\debounce_press|s_debounceCnt\(8)) # (!\debounce_press|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(8),
	datad => VCC,
	cin => \debounce_press|Add0~15\,
	combout => \debounce_press|Add0~16_combout\,
	cout => \debounce_press|Add0~17\);

-- Location: LCCOMB_X69_Y68_N28
\debounce_press|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~18_combout\ = (\debounce_press|s_debounceCnt\(9) & (\debounce_press|Add0~17\ & VCC)) # (!\debounce_press|s_debounceCnt\(9) & (!\debounce_press|Add0~17\))
-- \debounce_press|Add0~19\ = CARRY((!\debounce_press|s_debounceCnt\(9) & !\debounce_press|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(9),
	datad => VCC,
	cin => \debounce_press|Add0~17\,
	combout => \debounce_press|Add0~18_combout\,
	cout => \debounce_press|Add0~19\);

-- Location: LCCOMB_X67_Y68_N16
\debounce_press|s_debounceCnt~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~14_combout\ = (\debounce_press|s_debounceCnt[14]~0_combout\ & ((\debounce_press|Add0~18_combout\) # (!\debounce_press|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|Add0~18_combout\,
	datab => \debounce_press|s_previousIn~q\,
	datac => \debounce_press|s_debounceCnt[14]~0_combout\,
	combout => \debounce_press|s_debounceCnt~14_combout\);

-- Location: FF_X67_Y68_N17
\debounce_press|s_debounceCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~14_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(9));

-- Location: LCCOMB_X69_Y68_N30
\debounce_press|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~20_combout\ = (\debounce_press|s_debounceCnt\(10) & ((GND) # (!\debounce_press|Add0~19\))) # (!\debounce_press|s_debounceCnt\(10) & (\debounce_press|Add0~19\ $ (GND)))
-- \debounce_press|Add0~21\ = CARRY((\debounce_press|s_debounceCnt\(10)) # (!\debounce_press|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(10),
	datad => VCC,
	cin => \debounce_press|Add0~19\,
	combout => \debounce_press|Add0~20_combout\,
	cout => \debounce_press|Add0~21\);

-- Location: LCCOMB_X67_Y68_N26
\debounce_press|s_debounceCnt~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~15_combout\ = (\debounce_press|Add0~20_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|Add0~20_combout\,
	datad => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~15_combout\);

-- Location: FF_X67_Y68_N27
\debounce_press|s_debounceCnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~15_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(10));

-- Location: LCCOMB_X69_Y67_N0
\debounce_press|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~22_combout\ = (\debounce_press|s_debounceCnt\(11) & (\debounce_press|Add0~21\ & VCC)) # (!\debounce_press|s_debounceCnt\(11) & (!\debounce_press|Add0~21\))
-- \debounce_press|Add0~23\ = CARRY((!\debounce_press|s_debounceCnt\(11) & !\debounce_press|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(11),
	datad => VCC,
	cin => \debounce_press|Add0~21\,
	combout => \debounce_press|Add0~22_combout\,
	cout => \debounce_press|Add0~23\);

-- Location: LCCOMB_X70_Y68_N14
\debounce_press|s_debounceCnt~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~16_combout\ = (\debounce_press|s_debounceCnt[14]~0_combout\ & ((\debounce_press|Add0~22_combout\) # (!\debounce_press|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_previousIn~q\,
	datac => \debounce_press|Add0~22_combout\,
	datad => \debounce_press|s_debounceCnt[14]~0_combout\,
	combout => \debounce_press|s_debounceCnt~16_combout\);

-- Location: FF_X70_Y68_N15
\debounce_press|s_debounceCnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~16_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(11));

-- Location: LCCOMB_X69_Y67_N2
\debounce_press|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~24_combout\ = (\debounce_press|s_debounceCnt\(12) & ((GND) # (!\debounce_press|Add0~23\))) # (!\debounce_press|s_debounceCnt\(12) & (\debounce_press|Add0~23\ $ (GND)))
-- \debounce_press|Add0~25\ = CARRY((\debounce_press|s_debounceCnt\(12)) # (!\debounce_press|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(12),
	datad => VCC,
	cin => \debounce_press|Add0~23\,
	combout => \debounce_press|Add0~24_combout\,
	cout => \debounce_press|Add0~25\);

-- Location: LCCOMB_X69_Y68_N0
\debounce_press|s_debounceCnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~8_combout\ = (\debounce_press|s_debounceCnt[14]~4_combout\ & \debounce_press|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_press|s_debounceCnt[14]~4_combout\,
	datad => \debounce_press|Add0~24_combout\,
	combout => \debounce_press|s_debounceCnt~8_combout\);

-- Location: FF_X69_Y68_N1
\debounce_press|s_debounceCnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~8_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(12));

-- Location: LCCOMB_X69_Y67_N4
\debounce_press|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~26_combout\ = (\debounce_press|s_debounceCnt\(13) & (\debounce_press|Add0~25\ & VCC)) # (!\debounce_press|s_debounceCnt\(13) & (!\debounce_press|Add0~25\))
-- \debounce_press|Add0~27\ = CARRY((!\debounce_press|s_debounceCnt\(13) & !\debounce_press|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(13),
	datad => VCC,
	cin => \debounce_press|Add0~25\,
	combout => \debounce_press|Add0~26_combout\,
	cout => \debounce_press|Add0~27\);

-- Location: LCCOMB_X70_Y68_N6
\debounce_press|s_debounceCnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~9_combout\ = (\debounce_press|Add0~26_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_press|Add0~26_combout\,
	datad => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~9_combout\);

-- Location: FF_X70_Y68_N7
\debounce_press|s_debounceCnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~9_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(13));

-- Location: LCCOMB_X69_Y67_N6
\debounce_press|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~28_combout\ = (\debounce_press|s_debounceCnt\(14) & ((GND) # (!\debounce_press|Add0~27\))) # (!\debounce_press|s_debounceCnt\(14) & (\debounce_press|Add0~27\ $ (GND)))
-- \debounce_press|Add0~29\ = CARRY((\debounce_press|s_debounceCnt\(14)) # (!\debounce_press|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(14),
	datad => VCC,
	cin => \debounce_press|Add0~27\,
	combout => \debounce_press|Add0~28_combout\,
	cout => \debounce_press|Add0~29\);

-- Location: LCCOMB_X70_Y68_N24
\debounce_press|s_debounceCnt~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~17_combout\ = (\debounce_press|s_debounceCnt[14]~0_combout\ & ((\debounce_press|Add0~28_combout\) # (!\debounce_press|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_previousIn~q\,
	datac => \debounce_press|Add0~28_combout\,
	datad => \debounce_press|s_debounceCnt[14]~0_combout\,
	combout => \debounce_press|s_debounceCnt~17_combout\);

-- Location: FF_X70_Y68_N25
\debounce_press|s_debounceCnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~17_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(14));

-- Location: LCCOMB_X69_Y67_N8
\debounce_press|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~30_combout\ = (\debounce_press|s_debounceCnt\(15) & (\debounce_press|Add0~29\ & VCC)) # (!\debounce_press|s_debounceCnt\(15) & (!\debounce_press|Add0~29\))
-- \debounce_press|Add0~31\ = CARRY((!\debounce_press|s_debounceCnt\(15) & !\debounce_press|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(15),
	datad => VCC,
	cin => \debounce_press|Add0~29\,
	combout => \debounce_press|Add0~30_combout\,
	cout => \debounce_press|Add0~31\);

-- Location: LCCOMB_X70_Y68_N26
\debounce_press|s_debounceCnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~5_combout\ = (\debounce_press|Add0~30_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_press|Add0~30_combout\,
	datad => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~5_combout\);

-- Location: FF_X70_Y68_N27
\debounce_press|s_debounceCnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~5_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(15));

-- Location: LCCOMB_X69_Y67_N10
\debounce_press|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~32_combout\ = (\debounce_press|s_debounceCnt\(16) & ((GND) # (!\debounce_press|Add0~31\))) # (!\debounce_press|s_debounceCnt\(16) & (\debounce_press|Add0~31\ $ (GND)))
-- \debounce_press|Add0~33\ = CARRY((\debounce_press|s_debounceCnt\(16)) # (!\debounce_press|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(16),
	datad => VCC,
	cin => \debounce_press|Add0~31\,
	combout => \debounce_press|Add0~32_combout\,
	cout => \debounce_press|Add0~33\);

-- Location: LCCOMB_X70_Y68_N20
\debounce_press|s_debounceCnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~6_combout\ = (\debounce_press|Add0~32_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|Add0~32_combout\,
	datad => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~6_combout\);

-- Location: FF_X70_Y68_N21
\debounce_press|s_debounceCnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~6_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(16));

-- Location: LCCOMB_X69_Y67_N12
\debounce_press|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~34_combout\ = (\debounce_press|s_debounceCnt\(17) & (\debounce_press|Add0~33\ & VCC)) # (!\debounce_press|s_debounceCnt\(17) & (!\debounce_press|Add0~33\))
-- \debounce_press|Add0~35\ = CARRY((!\debounce_press|s_debounceCnt\(17) & !\debounce_press|Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(17),
	datad => VCC,
	cin => \debounce_press|Add0~33\,
	combout => \debounce_press|Add0~34_combout\,
	cout => \debounce_press|Add0~35\);

-- Location: LCCOMB_X70_Y68_N30
\debounce_press|s_debounceCnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~7_combout\ = (\debounce_press|Add0~34_combout\ & \debounce_press|s_debounceCnt[14]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_press|Add0~34_combout\,
	datad => \debounce_press|s_debounceCnt[14]~4_combout\,
	combout => \debounce_press|s_debounceCnt~7_combout\);

-- Location: FF_X70_Y68_N31
\debounce_press|s_debounceCnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~7_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(17));

-- Location: LCCOMB_X69_Y67_N14
\debounce_press|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~36_combout\ = (\debounce_press|s_debounceCnt\(18) & ((GND) # (!\debounce_press|Add0~35\))) # (!\debounce_press|s_debounceCnt\(18) & (\debounce_press|Add0~35\ $ (GND)))
-- \debounce_press|Add0~37\ = CARRY((\debounce_press|s_debounceCnt\(18)) # (!\debounce_press|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(18),
	datad => VCC,
	cin => \debounce_press|Add0~35\,
	combout => \debounce_press|Add0~36_combout\,
	cout => \debounce_press|Add0~37\);

-- Location: LCCOMB_X69_Y67_N24
\debounce_press|s_debounceCnt[18]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[18]~18_combout\ = (\debounce_press|s_debounceCnt[14]~3_combout\ & (\debounce_press|s_debounceCnt[14]~0_combout\ & ((\debounce_press|Add0~36_combout\) # (!\debounce_press|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_previousIn~q\,
	datab => \debounce_press|s_debounceCnt[14]~3_combout\,
	datac => \debounce_press|Add0~36_combout\,
	datad => \debounce_press|s_debounceCnt[14]~0_combout\,
	combout => \debounce_press|s_debounceCnt[18]~18_combout\);

-- Location: FF_X69_Y67_N25
\debounce_press|s_debounceCnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt[18]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(18));

-- Location: LCCOMB_X69_Y67_N16
\debounce_press|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~38_combout\ = (\debounce_press|s_debounceCnt\(19) & (\debounce_press|Add0~37\ & VCC)) # (!\debounce_press|s_debounceCnt\(19) & (!\debounce_press|Add0~37\))
-- \debounce_press|Add0~39\ = CARRY((!\debounce_press|s_debounceCnt\(19) & !\debounce_press|Add0~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(19),
	datad => VCC,
	cin => \debounce_press|Add0~37\,
	combout => \debounce_press|Add0~38_combout\,
	cout => \debounce_press|Add0~39\);

-- Location: LCCOMB_X68_Y68_N2
\debounce_press|s_debounceCnt[19]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[19]~19_combout\ = (\debounce_press|s_debounceCnt[14]~3_combout\ & (\debounce_press|s_debounceCnt[14]~0_combout\ & ((\debounce_press|Add0~38_combout\) # (!\debounce_press|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_previousIn~q\,
	datab => \debounce_press|s_debounceCnt[14]~3_combout\,
	datac => \debounce_press|Add0~38_combout\,
	datad => \debounce_press|s_debounceCnt[14]~0_combout\,
	combout => \debounce_press|s_debounceCnt[19]~19_combout\);

-- Location: FF_X68_Y68_N3
\debounce_press|s_debounceCnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt[19]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(19));

-- Location: LCCOMB_X69_Y67_N18
\debounce_press|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~40_combout\ = (\debounce_press|s_debounceCnt\(20) & ((GND) # (!\debounce_press|Add0~39\))) # (!\debounce_press|s_debounceCnt\(20) & (\debounce_press|Add0~39\ $ (GND)))
-- \debounce_press|Add0~41\ = CARRY((\debounce_press|s_debounceCnt\(20)) # (!\debounce_press|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(20),
	datad => VCC,
	cin => \debounce_press|Add0~39\,
	combout => \debounce_press|Add0~40_combout\,
	cout => \debounce_press|Add0~41\);

-- Location: LCCOMB_X68_Y68_N10
\debounce_press|s_debounceCnt[20]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[20]~10_combout\ = (\debounce_press|s_debounceCnt[14]~4_combout\ & (\debounce_press|s_debounceCnt[14]~3_combout\ & \debounce_press|Add0~40_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt[14]~4_combout\,
	datab => \debounce_press|s_debounceCnt[14]~3_combout\,
	datad => \debounce_press|Add0~40_combout\,
	combout => \debounce_press|s_debounceCnt[20]~10_combout\);

-- Location: FF_X68_Y68_N11
\debounce_press|s_debounceCnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt[20]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(20));

-- Location: LCCOMB_X69_Y67_N20
\debounce_press|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~42_combout\ = (\debounce_press|s_debounceCnt\(21) & (\debounce_press|Add0~41\ & VCC)) # (!\debounce_press|s_debounceCnt\(21) & (!\debounce_press|Add0~41\))
-- \debounce_press|Add0~43\ = CARRY((!\debounce_press|s_debounceCnt\(21) & !\debounce_press|Add0~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_debounceCnt\(21),
	datad => VCC,
	cin => \debounce_press|Add0~41\,
	combout => \debounce_press|Add0~42_combout\,
	cout => \debounce_press|Add0~43\);

-- Location: LCCOMB_X69_Y67_N22
\debounce_press|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|Add0~44_combout\ = \debounce_press|s_debounceCnt\(22) $ (\debounce_press|Add0~43\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(22),
	cin => \debounce_press|Add0~43\,
	combout => \debounce_press|Add0~44_combout\);

-- Location: LCCOMB_X69_Y67_N28
\debounce_press|s_debounceCnt[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[22]~25_combout\ = (\debounce_press|s_dirtyIn~q\ & ((\debounce_press|s_debounceCnt\(22) & ((!\debounce_press|LessThan0~7_combout\))) # (!\debounce_press|s_debounceCnt\(22) & (\debounce_press|s_debounceCnt[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(22),
	datab => \debounce_press|s_dirtyIn~q\,
	datac => \debounce_press|s_debounceCnt[14]~2_combout\,
	datad => \debounce_press|LessThan0~7_combout\,
	combout => \debounce_press|s_debounceCnt[22]~25_combout\);

-- Location: LCCOMB_X69_Y67_N30
\debounce_press|s_debounceCnt[22]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[22]~26_combout\ = (\debounce_press|s_previousIn~q\ & (\debounce_press|Add0~44_combout\ & ((\debounce_press|s_debounceCnt[22]~25_combout\)))) # (!\debounce_press|s_previousIn~q\ & 
-- (((\debounce_press|s_debounceCnt[14]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|Add0~44_combout\,
	datab => \debounce_press|s_previousIn~q\,
	datac => \debounce_press|s_debounceCnt[14]~0_combout\,
	datad => \debounce_press|s_debounceCnt[22]~25_combout\,
	combout => \debounce_press|s_debounceCnt[22]~26_combout\);

-- Location: FF_X69_Y67_N31
\debounce_press|s_debounceCnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt[22]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(22));

-- Location: LCCOMB_X68_Y68_N6
\debounce_press|s_debounceCnt[14]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[14]~4_combout\ = (\debounce_press|s_previousIn~q\ & (\debounce_press|s_dirtyIn~q\ & ((!\debounce_press|s_debounceCnt\(22)) # (!\debounce_press|LessThan0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_previousIn~q\,
	datab => \debounce_press|s_dirtyIn~q\,
	datac => \debounce_press|LessThan0~7_combout\,
	datad => \debounce_press|s_debounceCnt\(22),
	combout => \debounce_press|s_debounceCnt[14]~4_combout\);

-- Location: LCCOMB_X68_Y68_N16
\debounce_press|s_debounceCnt[21]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[21]~11_combout\ = (\debounce_press|s_debounceCnt[14]~4_combout\ & (\debounce_press|s_debounceCnt[14]~3_combout\ & \debounce_press|Add0~42_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt[14]~4_combout\,
	datab => \debounce_press|s_debounceCnt[14]~3_combout\,
	datac => \debounce_press|Add0~42_combout\,
	combout => \debounce_press|s_debounceCnt[21]~11_combout\);

-- Location: FF_X68_Y68_N17
\debounce_press|s_debounceCnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt[21]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(21));

-- Location: LCCOMB_X68_Y68_N24
\debounce_press|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|LessThan0~4_combout\ = (\debounce_press|s_debounceCnt\(12)) # ((\debounce_press|s_debounceCnt\(13)) # ((\debounce_press|s_debounceCnt\(10) & \debounce_press|s_debounceCnt\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(10),
	datab => \debounce_press|s_debounceCnt\(12),
	datac => \debounce_press|s_debounceCnt\(13),
	datad => \debounce_press|s_debounceCnt\(11),
	combout => \debounce_press|LessThan0~4_combout\);

-- Location: LCCOMB_X68_Y68_N26
\debounce_press|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|LessThan0~5_combout\ = (\debounce_press|s_debounceCnt\(15)) # ((\debounce_press|s_debounceCnt\(16)) # ((\debounce_press|s_debounceCnt\(14) & \debounce_press|LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(14),
	datab => \debounce_press|s_debounceCnt\(15),
	datac => \debounce_press|s_debounceCnt\(16),
	datad => \debounce_press|LessThan0~4_combout\,
	combout => \debounce_press|LessThan0~5_combout\);

-- Location: LCCOMB_X68_Y68_N4
\debounce_press|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|LessThan0~6_combout\ = (\debounce_press|s_debounceCnt\(19) & (\debounce_press|s_debounceCnt\(18) & ((\debounce_press|s_debounceCnt\(17)) # (\debounce_press|LessThan0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(17),
	datab => \debounce_press|s_debounceCnt\(19),
	datac => \debounce_press|LessThan0~5_combout\,
	datad => \debounce_press|s_debounceCnt\(18),
	combout => \debounce_press|LessThan0~6_combout\);

-- Location: LCCOMB_X68_Y68_N22
\debounce_press|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|LessThan0~1_combout\ = (\debounce_press|s_debounceCnt\(9) & \debounce_press|s_debounceCnt\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_press|s_debounceCnt\(9),
	datad => \debounce_press|s_debounceCnt\(11),
	combout => \debounce_press|LessThan0~1_combout\);

-- Location: LCCOMB_X68_Y68_N12
\debounce_press|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|LessThan0~0_combout\ = (\debounce_press|s_debounceCnt\(19) & (\debounce_press|s_debounceCnt\(8) & (\debounce_press|s_debounceCnt\(14) & \debounce_press|s_debounceCnt\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(19),
	datab => \debounce_press|s_debounceCnt\(8),
	datac => \debounce_press|s_debounceCnt\(14),
	datad => \debounce_press|s_debounceCnt\(18),
	combout => \debounce_press|LessThan0~0_combout\);

-- Location: LCCOMB_X68_Y68_N28
\debounce_press|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|LessThan0~2_combout\ = (\debounce_press|s_debounceCnt\(6) & ((\debounce_press|s_debounceCnt\(0)) # ((\debounce_press|s_debounceCnt\(5)) # (!\debounce_press|s_pulsedOut~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(0),
	datab => \debounce_press|s_debounceCnt\(5),
	datac => \debounce_press|s_debounceCnt\(6),
	datad => \debounce_press|s_pulsedOut~5_combout\,
	combout => \debounce_press|LessThan0~2_combout\);

-- Location: LCCOMB_X68_Y68_N18
\debounce_press|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|LessThan0~3_combout\ = (\debounce_press|LessThan0~1_combout\ & (\debounce_press|LessThan0~0_combout\ & ((\debounce_press|s_debounceCnt\(7)) # (\debounce_press|LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|LessThan0~1_combout\,
	datab => \debounce_press|s_debounceCnt\(7),
	datac => \debounce_press|LessThan0~0_combout\,
	datad => \debounce_press|LessThan0~2_combout\,
	combout => \debounce_press|LessThan0~3_combout\);

-- Location: LCCOMB_X68_Y68_N30
\debounce_press|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|LessThan0~7_combout\ = (\debounce_press|s_debounceCnt\(21)) # ((\debounce_press|s_debounceCnt\(20)) # ((\debounce_press|LessThan0~6_combout\) # (\debounce_press|LessThan0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(21),
	datab => \debounce_press|s_debounceCnt\(20),
	datac => \debounce_press|LessThan0~6_combout\,
	datad => \debounce_press|LessThan0~3_combout\,
	combout => \debounce_press|LessThan0~7_combout\);

-- Location: LCCOMB_X68_Y68_N8
\debounce_press|s_debounceCnt[14]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt[14]~0_combout\ = (\debounce_press|s_dirtyIn~q\ & ((!\debounce_press|s_debounceCnt\(22)) # (!\debounce_press|LessThan0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_dirtyIn~q\,
	datac => \debounce_press|LessThan0~7_combout\,
	datad => \debounce_press|s_debounceCnt\(22),
	combout => \debounce_press|s_debounceCnt[14]~0_combout\);

-- Location: LCCOMB_X67_Y68_N22
\debounce_press|s_debounceCnt~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_debounceCnt~13_combout\ = (\debounce_press|s_debounceCnt[14]~0_combout\ & ((\debounce_press|Add0~16_combout\) # (!\debounce_press|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_previousIn~q\,
	datac => \debounce_press|s_debounceCnt[14]~0_combout\,
	datad => \debounce_press|Add0~16_combout\,
	combout => \debounce_press|s_debounceCnt~13_combout\);

-- Location: FF_X67_Y68_N23
\debounce_press|s_debounceCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_debounceCnt~13_combout\,
	ena => \debounce_press|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_debounceCnt\(8));

-- Location: LCCOMB_X67_Y68_N20
\debounce_press|s_pulsedOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_pulsedOut~2_combout\ = (!\debounce_press|s_debounceCnt\(8) & (!\debounce_press|s_debounceCnt\(7) & (!\debounce_press|s_debounceCnt\(10) & !\debounce_press|s_debounceCnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(8),
	datab => \debounce_press|s_debounceCnt\(7),
	datac => \debounce_press|s_debounceCnt\(10),
	datad => \debounce_press|s_debounceCnt\(9),
	combout => \debounce_press|s_pulsedOut~2_combout\);

-- Location: LCCOMB_X70_Y68_N16
\debounce_press|s_pulsedOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_pulsedOut~0_combout\ = (!\debounce_press|s_debounceCnt\(15) & (!\debounce_press|s_debounceCnt\(6) & (!\debounce_press|s_debounceCnt\(17) & !\debounce_press|s_debounceCnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(15),
	datab => \debounce_press|s_debounceCnt\(6),
	datac => \debounce_press|s_debounceCnt\(17),
	datad => \debounce_press|s_debounceCnt\(16),
	combout => \debounce_press|s_pulsedOut~0_combout\);

-- Location: LCCOMB_X70_Y68_N8
\debounce_press|s_pulsedOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_pulsedOut~1_combout\ = (!\debounce_press|s_debounceCnt\(13) & (!\debounce_press|s_debounceCnt\(21) & (!\debounce_press|s_debounceCnt\(12) & !\debounce_press|s_debounceCnt\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(13),
	datab => \debounce_press|s_debounceCnt\(21),
	datac => \debounce_press|s_debounceCnt\(12),
	datad => \debounce_press|s_debounceCnt\(20),
	combout => \debounce_press|s_pulsedOut~1_combout\);

-- Location: LCCOMB_X70_Y68_N2
\debounce_press|s_pulsedOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_pulsedOut~3_combout\ = (!\debounce_press|s_debounceCnt\(14) & (!\debounce_press|s_debounceCnt\(11) & (!\debounce_press|s_debounceCnt\(19) & !\debounce_press|s_debounceCnt\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_debounceCnt\(14),
	datab => \debounce_press|s_debounceCnt\(11),
	datac => \debounce_press|s_debounceCnt\(19),
	datad => \debounce_press|s_debounceCnt\(18),
	combout => \debounce_press|s_pulsedOut~3_combout\);

-- Location: LCCOMB_X70_Y68_N12
\debounce_press|s_pulsedOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_pulsedOut~4_combout\ = (\debounce_press|s_pulsedOut~2_combout\ & (\debounce_press|s_pulsedOut~0_combout\ & (\debounce_press|s_pulsedOut~1_combout\ & \debounce_press|s_pulsedOut~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_pulsedOut~2_combout\,
	datab => \debounce_press|s_pulsedOut~0_combout\,
	datac => \debounce_press|s_pulsedOut~1_combout\,
	datad => \debounce_press|s_pulsedOut~3_combout\,
	combout => \debounce_press|s_pulsedOut~4_combout\);

-- Location: LCCOMB_X68_Y68_N14
\debounce_press|s_pulsedOut~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_pulsedOut~6_combout\ = (\debounce_press|s_previousIn~q\ & (!\debounce_press|s_debounceCnt\(22) & (\debounce_press|s_dirtyIn~q\ & \debounce_press|s_debounceCnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_previousIn~q\,
	datab => \debounce_press|s_debounceCnt\(22),
	datac => \debounce_press|s_dirtyIn~q\,
	datad => \debounce_press|s_debounceCnt\(0),
	combout => \debounce_press|s_pulsedOut~6_combout\);

-- Location: LCCOMB_X68_Y68_N0
\debounce_press|s_pulsedOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_press|s_pulsedOut~7_combout\ = (\debounce_press|s_pulsedOut~4_combout\ & (\debounce_press|s_pulsedOut~6_combout\ & (!\debounce_press|s_debounceCnt\(5) & \debounce_press|s_pulsedOut~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_press|s_pulsedOut~4_combout\,
	datab => \debounce_press|s_pulsedOut~6_combout\,
	datac => \debounce_press|s_debounceCnt\(5),
	datad => \debounce_press|s_pulsedOut~5_combout\,
	combout => \debounce_press|s_pulsedOut~7_combout\);

-- Location: FF_X68_Y68_N1
\debounce_press|s_pulsedOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_press|s_pulsedOut~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_press|s_pulsedOut~q\);

-- Location: LCCOMB_X69_Y72_N0
\s_newTime~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_newTime~feeder_combout\ = \debounce_press|s_pulsedOut~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_press|s_pulsedOut~q\,
	combout => \s_newTime~feeder_combout\);

-- Location: FF_X69_Y72_N1
s_newTime : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \s_newTime~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_newTime~q\);

-- Location: LCCOMB_X65_Y72_N6
\target_counter|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|Add0~0_combout\ = \target_counter|cnt_value\(0) $ (GND)
-- \target_counter|Add0~1\ = CARRY(!\target_counter|cnt_value\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \target_counter|cnt_value\(0),
	datad => VCC,
	combout => \target_counter|Add0~0_combout\,
	cout => \target_counter|Add0~1\);

-- Location: IOIBUF_X65_Y73_N8
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X63_Y69_N14
\pulse10hz_gen|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~0_combout\ = \pulse10hz_gen|s_cnt\(0) $ (VCC)
-- \pulse10hz_gen|Add0~1\ = CARRY(\pulse10hz_gen|s_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(0),
	datad => VCC,
	combout => \pulse10hz_gen|Add0~0_combout\,
	cout => \pulse10hz_gen|Add0~1\);

-- Location: FF_X63_Y69_N15
\pulse10hz_gen|s_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(0));

-- Location: LCCOMB_X63_Y69_N16
\pulse10hz_gen|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~2_combout\ = (\pulse10hz_gen|s_cnt\(1) & (!\pulse10hz_gen|Add0~1\)) # (!\pulse10hz_gen|s_cnt\(1) & ((\pulse10hz_gen|Add0~1\) # (GND)))
-- \pulse10hz_gen|Add0~3\ = CARRY((!\pulse10hz_gen|Add0~1\) # (!\pulse10hz_gen|s_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(1),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~1\,
	combout => \pulse10hz_gen|Add0~2_combout\,
	cout => \pulse10hz_gen|Add0~3\);

-- Location: FF_X63_Y69_N17
\pulse10hz_gen|s_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(1));

-- Location: LCCOMB_X63_Y69_N18
\pulse10hz_gen|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~4_combout\ = (\pulse10hz_gen|s_cnt\(2) & (\pulse10hz_gen|Add0~3\ $ (GND))) # (!\pulse10hz_gen|s_cnt\(2) & (!\pulse10hz_gen|Add0~3\ & VCC))
-- \pulse10hz_gen|Add0~5\ = CARRY((\pulse10hz_gen|s_cnt\(2) & !\pulse10hz_gen|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(2),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~3\,
	combout => \pulse10hz_gen|Add0~4_combout\,
	cout => \pulse10hz_gen|Add0~5\);

-- Location: FF_X63_Y69_N19
\pulse10hz_gen|s_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(2));

-- Location: LCCOMB_X63_Y69_N20
\pulse10hz_gen|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~6_combout\ = (\pulse10hz_gen|s_cnt\(3) & (!\pulse10hz_gen|Add0~5\)) # (!\pulse10hz_gen|s_cnt\(3) & ((\pulse10hz_gen|Add0~5\) # (GND)))
-- \pulse10hz_gen|Add0~7\ = CARRY((!\pulse10hz_gen|Add0~5\) # (!\pulse10hz_gen|s_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(3),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~5\,
	combout => \pulse10hz_gen|Add0~6_combout\,
	cout => \pulse10hz_gen|Add0~7\);

-- Location: FF_X63_Y69_N21
\pulse10hz_gen|s_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(3));

-- Location: LCCOMB_X63_Y69_N22
\pulse10hz_gen|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~8_combout\ = (\pulse10hz_gen|s_cnt\(4) & (\pulse10hz_gen|Add0~7\ $ (GND))) # (!\pulse10hz_gen|s_cnt\(4) & (!\pulse10hz_gen|Add0~7\ & VCC))
-- \pulse10hz_gen|Add0~9\ = CARRY((\pulse10hz_gen|s_cnt\(4) & !\pulse10hz_gen|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(4),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~7\,
	combout => \pulse10hz_gen|Add0~8_combout\,
	cout => \pulse10hz_gen|Add0~9\);

-- Location: FF_X63_Y69_N23
\pulse10hz_gen|s_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(4));

-- Location: LCCOMB_X63_Y69_N24
\pulse10hz_gen|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~10_combout\ = (\pulse10hz_gen|s_cnt\(5) & (!\pulse10hz_gen|Add0~9\)) # (!\pulse10hz_gen|s_cnt\(5) & ((\pulse10hz_gen|Add0~9\) # (GND)))
-- \pulse10hz_gen|Add0~11\ = CARRY((!\pulse10hz_gen|Add0~9\) # (!\pulse10hz_gen|s_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(5),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~9\,
	combout => \pulse10hz_gen|Add0~10_combout\,
	cout => \pulse10hz_gen|Add0~11\);

-- Location: LCCOMB_X63_Y69_N12
\pulse10hz_gen|s_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|s_cnt~4_combout\ = (\pulse10hz_gen|Add0~10_combout\ & !\pulse10hz_gen|Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|Add0~10_combout\,
	datac => \pulse10hz_gen|Equal0~5_combout\,
	combout => \pulse10hz_gen|s_cnt~4_combout\);

-- Location: FF_X63_Y69_N13
\pulse10hz_gen|s_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|s_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(5));

-- Location: LCCOMB_X63_Y69_N26
\pulse10hz_gen|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~12_combout\ = (\pulse10hz_gen|s_cnt\(6) & (\pulse10hz_gen|Add0~11\ $ (GND))) # (!\pulse10hz_gen|s_cnt\(6) & (!\pulse10hz_gen|Add0~11\ & VCC))
-- \pulse10hz_gen|Add0~13\ = CARRY((\pulse10hz_gen|s_cnt\(6) & !\pulse10hz_gen|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(6),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~11\,
	combout => \pulse10hz_gen|Add0~12_combout\,
	cout => \pulse10hz_gen|Add0~13\);

-- Location: FF_X63_Y69_N27
\pulse10hz_gen|s_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(6));

-- Location: LCCOMB_X63_Y69_N28
\pulse10hz_gen|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~14_combout\ = (\pulse10hz_gen|s_cnt\(7) & (!\pulse10hz_gen|Add0~13\)) # (!\pulse10hz_gen|s_cnt\(7) & ((\pulse10hz_gen|Add0~13\) # (GND)))
-- \pulse10hz_gen|Add0~15\ = CARRY((!\pulse10hz_gen|Add0~13\) # (!\pulse10hz_gen|s_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(7),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~13\,
	combout => \pulse10hz_gen|Add0~14_combout\,
	cout => \pulse10hz_gen|Add0~15\);

-- Location: FF_X63_Y69_N29
\pulse10hz_gen|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(7));

-- Location: LCCOMB_X63_Y69_N30
\pulse10hz_gen|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~16_combout\ = (\pulse10hz_gen|s_cnt\(8) & (\pulse10hz_gen|Add0~15\ $ (GND))) # (!\pulse10hz_gen|s_cnt\(8) & (!\pulse10hz_gen|Add0~15\ & VCC))
-- \pulse10hz_gen|Add0~17\ = CARRY((\pulse10hz_gen|s_cnt\(8) & !\pulse10hz_gen|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(8),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~15\,
	combout => \pulse10hz_gen|Add0~16_combout\,
	cout => \pulse10hz_gen|Add0~17\);

-- Location: LCCOMB_X63_Y69_N4
\pulse10hz_gen|s_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|s_cnt~3_combout\ = (\pulse10hz_gen|Add0~16_combout\ & !\pulse10hz_gen|Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|Add0~16_combout\,
	datac => \pulse10hz_gen|Equal0~5_combout\,
	combout => \pulse10hz_gen|s_cnt~3_combout\);

-- Location: FF_X63_Y69_N5
\pulse10hz_gen|s_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|s_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(8));

-- Location: LCCOMB_X63_Y68_N0
\pulse10hz_gen|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~18_combout\ = (\pulse10hz_gen|s_cnt\(9) & (!\pulse10hz_gen|Add0~17\)) # (!\pulse10hz_gen|s_cnt\(9) & ((\pulse10hz_gen|Add0~17\) # (GND)))
-- \pulse10hz_gen|Add0~19\ = CARRY((!\pulse10hz_gen|Add0~17\) # (!\pulse10hz_gen|s_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(9),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~17\,
	combout => \pulse10hz_gen|Add0~18_combout\,
	cout => \pulse10hz_gen|Add0~19\);

-- Location: FF_X63_Y68_N1
\pulse10hz_gen|s_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(9));

-- Location: LCCOMB_X63_Y68_N2
\pulse10hz_gen|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~20_combout\ = (\pulse10hz_gen|s_cnt\(10) & (\pulse10hz_gen|Add0~19\ $ (GND))) # (!\pulse10hz_gen|s_cnt\(10) & (!\pulse10hz_gen|Add0~19\ & VCC))
-- \pulse10hz_gen|Add0~21\ = CARRY((\pulse10hz_gen|s_cnt\(10) & !\pulse10hz_gen|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(10),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~19\,
	combout => \pulse10hz_gen|Add0~20_combout\,
	cout => \pulse10hz_gen|Add0~21\);

-- Location: FF_X63_Y68_N3
\pulse10hz_gen|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(10));

-- Location: LCCOMB_X63_Y68_N4
\pulse10hz_gen|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~22_combout\ = (\pulse10hz_gen|s_cnt\(11) & (!\pulse10hz_gen|Add0~21\)) # (!\pulse10hz_gen|s_cnt\(11) & ((\pulse10hz_gen|Add0~21\) # (GND)))
-- \pulse10hz_gen|Add0~23\ = CARRY((!\pulse10hz_gen|Add0~21\) # (!\pulse10hz_gen|s_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(11),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~21\,
	combout => \pulse10hz_gen|Add0~22_combout\,
	cout => \pulse10hz_gen|Add0~23\);

-- Location: FF_X63_Y68_N5
\pulse10hz_gen|s_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(11));

-- Location: LCCOMB_X63_Y68_N6
\pulse10hz_gen|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~24_combout\ = (\pulse10hz_gen|s_cnt\(12) & (\pulse10hz_gen|Add0~23\ $ (GND))) # (!\pulse10hz_gen|s_cnt\(12) & (!\pulse10hz_gen|Add0~23\ & VCC))
-- \pulse10hz_gen|Add0~25\ = CARRY((\pulse10hz_gen|s_cnt\(12) & !\pulse10hz_gen|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(12),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~23\,
	combout => \pulse10hz_gen|Add0~24_combout\,
	cout => \pulse10hz_gen|Add0~25\);

-- Location: FF_X63_Y68_N7
\pulse10hz_gen|s_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(12));

-- Location: LCCOMB_X63_Y68_N8
\pulse10hz_gen|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~26_combout\ = (\pulse10hz_gen|s_cnt\(13) & (!\pulse10hz_gen|Add0~25\)) # (!\pulse10hz_gen|s_cnt\(13) & ((\pulse10hz_gen|Add0~25\) # (GND)))
-- \pulse10hz_gen|Add0~27\ = CARRY((!\pulse10hz_gen|Add0~25\) # (!\pulse10hz_gen|s_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(13),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~25\,
	combout => \pulse10hz_gen|Add0~26_combout\,
	cout => \pulse10hz_gen|Add0~27\);

-- Location: LCCOMB_X63_Y68_N26
\pulse10hz_gen|s_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|s_cnt~5_combout\ = (\pulse10hz_gen|Add0~26_combout\ & !\pulse10hz_gen|Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse10hz_gen|Add0~26_combout\,
	datad => \pulse10hz_gen|Equal0~5_combout\,
	combout => \pulse10hz_gen|s_cnt~5_combout\);

-- Location: FF_X63_Y68_N27
\pulse10hz_gen|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|s_cnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(13));

-- Location: LCCOMB_X63_Y68_N10
\pulse10hz_gen|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~28_combout\ = (\pulse10hz_gen|s_cnt\(14) & (\pulse10hz_gen|Add0~27\ $ (GND))) # (!\pulse10hz_gen|s_cnt\(14) & (!\pulse10hz_gen|Add0~27\ & VCC))
-- \pulse10hz_gen|Add0~29\ = CARRY((\pulse10hz_gen|s_cnt\(14) & !\pulse10hz_gen|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(14),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~27\,
	combout => \pulse10hz_gen|Add0~28_combout\,
	cout => \pulse10hz_gen|Add0~29\);

-- Location: FF_X63_Y68_N11
\pulse10hz_gen|s_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(14));

-- Location: LCCOMB_X63_Y68_N12
\pulse10hz_gen|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~30_combout\ = (\pulse10hz_gen|s_cnt\(15) & (!\pulse10hz_gen|Add0~29\)) # (!\pulse10hz_gen|s_cnt\(15) & ((\pulse10hz_gen|Add0~29\) # (GND)))
-- \pulse10hz_gen|Add0~31\ = CARRY((!\pulse10hz_gen|Add0~29\) # (!\pulse10hz_gen|s_cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|s_cnt\(15),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~29\,
	combout => \pulse10hz_gen|Add0~30_combout\,
	cout => \pulse10hz_gen|Add0~31\);

-- Location: LCCOMB_X63_Y68_N28
\pulse10hz_gen|s_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|s_cnt~6_combout\ = (!\pulse10hz_gen|Equal0~5_combout\ & \pulse10hz_gen|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|Equal0~5_combout\,
	datad => \pulse10hz_gen|Add0~30_combout\,
	combout => \pulse10hz_gen|s_cnt~6_combout\);

-- Location: FF_X63_Y68_N29
\pulse10hz_gen|s_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|s_cnt~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(15));

-- Location: LCCOMB_X63_Y68_N14
\pulse10hz_gen|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~32_combout\ = (\pulse10hz_gen|s_cnt\(16) & (\pulse10hz_gen|Add0~31\ $ (GND))) # (!\pulse10hz_gen|s_cnt\(16) & (!\pulse10hz_gen|Add0~31\ & VCC))
-- \pulse10hz_gen|Add0~33\ = CARRY((\pulse10hz_gen|s_cnt\(16) & !\pulse10hz_gen|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(16),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~31\,
	combout => \pulse10hz_gen|Add0~32_combout\,
	cout => \pulse10hz_gen|Add0~33\);

-- Location: LCCOMB_X62_Y68_N16
\pulse10hz_gen|s_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|s_cnt~0_combout\ = (\pulse10hz_gen|Add0~32_combout\ & !\pulse10hz_gen|Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse10hz_gen|Add0~32_combout\,
	datad => \pulse10hz_gen|Equal0~5_combout\,
	combout => \pulse10hz_gen|s_cnt~0_combout\);

-- Location: FF_X62_Y68_N17
\pulse10hz_gen|s_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|s_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(16));

-- Location: LCCOMB_X63_Y68_N16
\pulse10hz_gen|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~34_combout\ = (\pulse10hz_gen|s_cnt\(17) & (!\pulse10hz_gen|Add0~33\)) # (!\pulse10hz_gen|s_cnt\(17) & ((\pulse10hz_gen|Add0~33\) # (GND)))
-- \pulse10hz_gen|Add0~35\ = CARRY((!\pulse10hz_gen|Add0~33\) # (!\pulse10hz_gen|s_cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(17),
	datad => VCC,
	cin => \pulse10hz_gen|Add0~33\,
	combout => \pulse10hz_gen|Add0~34_combout\,
	cout => \pulse10hz_gen|Add0~35\);

-- Location: LCCOMB_X63_Y68_N22
\pulse10hz_gen|s_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|s_cnt~1_combout\ = (!\pulse10hz_gen|Equal0~5_combout\ & \pulse10hz_gen|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|Equal0~5_combout\,
	datad => \pulse10hz_gen|Add0~34_combout\,
	combout => \pulse10hz_gen|s_cnt~1_combout\);

-- Location: FF_X63_Y68_N23
\pulse10hz_gen|s_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|s_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(17));

-- Location: LCCOMB_X63_Y68_N18
\pulse10hz_gen|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Add0~36_combout\ = \pulse10hz_gen|Add0~35\ $ (!\pulse10hz_gen|s_cnt\(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \pulse10hz_gen|s_cnt\(18),
	cin => \pulse10hz_gen|Add0~35\,
	combout => \pulse10hz_gen|Add0~36_combout\);

-- Location: LCCOMB_X63_Y68_N20
\pulse10hz_gen|s_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|s_cnt~2_combout\ = (!\pulse10hz_gen|Equal0~5_combout\ & \pulse10hz_gen|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse10hz_gen|Equal0~5_combout\,
	datad => \pulse10hz_gen|Add0~36_combout\,
	combout => \pulse10hz_gen|s_cnt~2_combout\);

-- Location: FF_X63_Y68_N21
\pulse10hz_gen|s_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|s_cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|s_cnt\(18));

-- Location: LCCOMB_X63_Y69_N6
\pulse10hz_gen|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Equal0~1_combout\ = (\pulse10hz_gen|s_cnt\(4) & (\pulse10hz_gen|s_cnt\(3) & (!\pulse10hz_gen|s_cnt\(6) & !\pulse10hz_gen|s_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(4),
	datab => \pulse10hz_gen|s_cnt\(3),
	datac => \pulse10hz_gen|s_cnt\(6),
	datad => \pulse10hz_gen|s_cnt\(5),
	combout => \pulse10hz_gen|Equal0~1_combout\);

-- Location: LCCOMB_X63_Y68_N30
\pulse10hz_gen|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Equal0~3_combout\ = (!\pulse10hz_gen|s_cnt\(14) & (\pulse10hz_gen|s_cnt\(15) & (\pulse10hz_gen|s_cnt\(13) & !\pulse10hz_gen|s_cnt\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(14),
	datab => \pulse10hz_gen|s_cnt\(15),
	datac => \pulse10hz_gen|s_cnt\(13),
	datad => \pulse10hz_gen|s_cnt\(12),
	combout => \pulse10hz_gen|Equal0~3_combout\);

-- Location: LCCOMB_X63_Y69_N8
\pulse10hz_gen|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Equal0~2_combout\ = (!\pulse10hz_gen|s_cnt\(11) & (\pulse10hz_gen|s_cnt\(1) & (\pulse10hz_gen|s_cnt\(0) & \pulse10hz_gen|s_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(11),
	datab => \pulse10hz_gen|s_cnt\(1),
	datac => \pulse10hz_gen|s_cnt\(0),
	datad => \pulse10hz_gen|s_cnt\(2),
	combout => \pulse10hz_gen|Equal0~2_combout\);

-- Location: LCCOMB_X63_Y69_N10
\pulse10hz_gen|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Equal0~0_combout\ = (!\pulse10hz_gen|s_cnt\(9) & (!\pulse10hz_gen|s_cnt\(7) & (\pulse10hz_gen|s_cnt\(8) & !\pulse10hz_gen|s_cnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(9),
	datab => \pulse10hz_gen|s_cnt\(7),
	datac => \pulse10hz_gen|s_cnt\(8),
	datad => \pulse10hz_gen|s_cnt\(10),
	combout => \pulse10hz_gen|Equal0~0_combout\);

-- Location: LCCOMB_X63_Y69_N2
\pulse10hz_gen|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Equal0~4_combout\ = (\pulse10hz_gen|Equal0~1_combout\ & (\pulse10hz_gen|Equal0~3_combout\ & (\pulse10hz_gen|Equal0~2_combout\ & \pulse10hz_gen|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|Equal0~1_combout\,
	datab => \pulse10hz_gen|Equal0~3_combout\,
	datac => \pulse10hz_gen|Equal0~2_combout\,
	datad => \pulse10hz_gen|Equal0~0_combout\,
	combout => \pulse10hz_gen|Equal0~4_combout\);

-- Location: LCCOMB_X63_Y68_N24
\pulse10hz_gen|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse10hz_gen|Equal0~5_combout\ = (\pulse10hz_gen|s_cnt\(17) & (\pulse10hz_gen|s_cnt\(18) & (\pulse10hz_gen|s_cnt\(16) & \pulse10hz_gen|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|s_cnt\(17),
	datab => \pulse10hz_gen|s_cnt\(18),
	datac => \pulse10hz_gen|s_cnt\(16),
	datad => \pulse10hz_gen|Equal0~4_combout\,
	combout => \pulse10hz_gen|Equal0~5_combout\);

-- Location: FF_X63_Y68_N25
\pulse10hz_gen|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse10hz_gen|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse10hz_gen|pulse~q\);

-- Location: IOIBUF_X67_Y73_N15
\timeExp~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_timeExp,
	o => \timeExp~input_o\);

-- Location: LCCOMB_X68_Y72_N22
\press_type_proc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \press_type_proc~0_combout\ = (\press~input_o\ & \timeExp~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \press~input_o\,
	datac => \timeExp~input_o\,
	combout => \press_type_proc~0_combout\);

-- Location: FF_X68_Y72_N23
s_long_press : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \press_type_proc~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_long_press~q\);

-- Location: LCCOMB_X65_Y72_N28
\target_counter|cnt_value~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value~0_combout\ = (!\debounce_press|s_pulsedOut~q\ & ((!\s_long_press~q\) # (!\pulse10hz_gen|pulse~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_press|s_pulsedOut~q\,
	datac => \pulse10hz_gen|pulse~q\,
	datad => \s_long_press~q\,
	combout => \target_counter|cnt_value~0_combout\);

-- Location: LCCOMB_X65_Y72_N4
\target_counter|cnt_value~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value~1_combout\ = (!\reset~input_o\ & ((\target_counter|cnt_value~0_combout\ & ((\target_counter|cnt_value\(0)))) # (!\target_counter|cnt_value~0_combout\ & (!\target_counter|Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \target_counter|Add0~0_combout\,
	datab => \reset~input_o\,
	datac => \target_counter|cnt_value\(0),
	datad => \target_counter|cnt_value~0_combout\,
	combout => \target_counter|cnt_value~1_combout\);

-- Location: FF_X65_Y72_N5
\target_counter|cnt_value[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \target_counter|cnt_value~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \target_counter|cnt_value\(0));

-- Location: LCCOMB_X65_Y72_N8
\target_counter|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|Add0~2_combout\ = (\target_counter|cnt_value\(1) & (!\target_counter|Add0~1\)) # (!\target_counter|cnt_value\(1) & ((\target_counter|Add0~1\) # (GND)))
-- \target_counter|Add0~3\ = CARRY((!\target_counter|Add0~1\) # (!\target_counter|cnt_value\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \target_counter|cnt_value\(1),
	datad => VCC,
	cin => \target_counter|Add0~1\,
	combout => \target_counter|Add0~2_combout\,
	cout => \target_counter|Add0~3\);

-- Location: LCCOMB_X65_Y72_N10
\target_counter|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|Add0~4_combout\ = (\target_counter|cnt_value\(2) & (\target_counter|Add0~3\ $ (GND))) # (!\target_counter|cnt_value\(2) & (!\target_counter|Add0~3\ & VCC))
-- \target_counter|Add0~5\ = CARRY((\target_counter|cnt_value\(2) & !\target_counter|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \target_counter|cnt_value\(2),
	datad => VCC,
	cin => \target_counter|Add0~3\,
	combout => \target_counter|Add0~4_combout\,
	cout => \target_counter|Add0~5\);

-- Location: LCCOMB_X65_Y72_N24
\target_counter|cnt_value~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value~6_combout\ = (\target_counter|cnt_value[5]~3_combout\ & \target_counter|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \target_counter|cnt_value[5]~3_combout\,
	datad => \target_counter|Add0~4_combout\,
	combout => \target_counter|cnt_value~6_combout\);

-- Location: LCCOMB_X65_Y72_N18
\target_counter|cnt_value[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value[5]~5_combout\ = (\reset~input_o\) # ((\debounce_press|s_pulsedOut~q\) # ((\pulse10hz_gen|pulse~q\ & \s_long_press~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse10hz_gen|pulse~q\,
	datab => \reset~input_o\,
	datac => \debounce_press|s_pulsedOut~q\,
	datad => \s_long_press~q\,
	combout => \target_counter|cnt_value[5]~5_combout\);

-- Location: FF_X65_Y72_N25
\target_counter|cnt_value[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \target_counter|cnt_value~6_combout\,
	ena => \target_counter|cnt_value[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \target_counter|cnt_value\(2));

-- Location: LCCOMB_X65_Y72_N12
\target_counter|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|Add0~6_combout\ = (\target_counter|cnt_value\(3) & (!\target_counter|Add0~5\)) # (!\target_counter|cnt_value\(3) & ((\target_counter|Add0~5\) # (GND)))
-- \target_counter|Add0~7\ = CARRY((!\target_counter|Add0~5\) # (!\target_counter|cnt_value\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \target_counter|cnt_value\(3),
	datad => VCC,
	cin => \target_counter|Add0~5\,
	combout => \target_counter|Add0~6_combout\,
	cout => \target_counter|Add0~7\);

-- Location: LCCOMB_X65_Y72_N30
\target_counter|cnt_value~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value~7_combout\ = (\target_counter|cnt_value[5]~3_combout\ & \target_counter|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \target_counter|cnt_value[5]~3_combout\,
	datad => \target_counter|Add0~6_combout\,
	combout => \target_counter|cnt_value~7_combout\);

-- Location: FF_X65_Y72_N31
\target_counter|cnt_value[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \target_counter|cnt_value~7_combout\,
	ena => \target_counter|cnt_value[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \target_counter|cnt_value\(3));

-- Location: LCCOMB_X65_Y72_N14
\target_counter|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|Add0~8_combout\ = (\target_counter|cnt_value\(4) & (\target_counter|Add0~7\ $ (GND))) # (!\target_counter|cnt_value\(4) & (!\target_counter|Add0~7\ & VCC))
-- \target_counter|Add0~9\ = CARRY((\target_counter|cnt_value\(4) & !\target_counter|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \target_counter|cnt_value\(4),
	datad => VCC,
	cin => \target_counter|Add0~7\,
	combout => \target_counter|Add0~8_combout\,
	cout => \target_counter|Add0~9\);

-- Location: LCCOMB_X65_Y72_N0
\target_counter|cnt_value~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value~8_combout\ = (\target_counter|Add0~8_combout\ & \target_counter|cnt_value[5]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \target_counter|Add0~8_combout\,
	datad => \target_counter|cnt_value[5]~3_combout\,
	combout => \target_counter|cnt_value~8_combout\);

-- Location: FF_X65_Y72_N1
\target_counter|cnt_value[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \target_counter|cnt_value~8_combout\,
	ena => \target_counter|cnt_value[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \target_counter|cnt_value\(4));

-- Location: LCCOMB_X65_Y72_N16
\target_counter|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|Add0~10_combout\ = \target_counter|cnt_value\(5) $ (\target_counter|Add0~9\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \target_counter|cnt_value\(5),
	cin => \target_counter|Add0~9\,
	combout => \target_counter|Add0~10_combout\);

-- Location: LCCOMB_X65_Y72_N26
\target_counter|cnt_value~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value~9_combout\ = (\target_counter|cnt_value[5]~3_combout\ & \target_counter|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \target_counter|cnt_value[5]~3_combout\,
	datad => \target_counter|Add0~10_combout\,
	combout => \target_counter|cnt_value~9_combout\);

-- Location: FF_X65_Y72_N27
\target_counter|cnt_value[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \target_counter|cnt_value~9_combout\,
	ena => \target_counter|cnt_value[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \target_counter|cnt_value\(5));

-- Location: LCCOMB_X65_Y72_N22
\target_counter|cnt_value[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value[5]~2_combout\ = (\target_counter|cnt_value\(3)) # (((\target_counter|cnt_value\(2)) # (!\target_counter|cnt_value\(0))) # (!\target_counter|cnt_value\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \target_counter|cnt_value\(3),
	datab => \target_counter|cnt_value\(1),
	datac => \target_counter|cnt_value\(0),
	datad => \target_counter|cnt_value\(2),
	combout => \target_counter|cnt_value[5]~2_combout\);

-- Location: LCCOMB_X65_Y72_N20
\target_counter|cnt_value[5]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value[5]~3_combout\ = (!\reset~input_o\ & (((\target_counter|cnt_value[5]~2_combout\) # (!\target_counter|cnt_value\(4))) # (!\target_counter|cnt_value\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \target_counter|cnt_value\(5),
	datab => \target_counter|cnt_value\(4),
	datac => \target_counter|cnt_value[5]~2_combout\,
	datad => \reset~input_o\,
	combout => \target_counter|cnt_value[5]~3_combout\);

-- Location: LCCOMB_X65_Y72_N2
\target_counter|cnt_value~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_counter|cnt_value~4_combout\ = (\target_counter|Add0~2_combout\ & \target_counter|cnt_value[5]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \target_counter|Add0~2_combout\,
	datad => \target_counter|cnt_value[5]~3_combout\,
	combout => \target_counter|cnt_value~4_combout\);

-- Location: FF_X65_Y72_N3
\target_counter|cnt_value[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \target_counter|cnt_value~4_combout\,
	ena => \target_counter|cnt_value[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \target_counter|cnt_value\(1));

-- Location: FF_X68_Y72_N13
s_resetTimer : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \press~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_resetTimer~q\);

-- Location: LCCOMB_X68_Y72_N0
\s_fast_increment~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_fast_increment~0_combout\ = (\s_long_press~q\ & \pulse10hz_gen|pulse~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_long_press~q\,
	datac => \pulse10hz_gen|pulse~q\,
	combout => \s_fast_increment~0_combout\);

ww_newTime <= \newTime~output_o\;

ww_timeVal(0) <= \timeVal[0]~output_o\;

ww_timeVal(1) <= \timeVal[1]~output_o\;

ww_timeVal(2) <= \timeVal[2]~output_o\;

ww_timeVal(3) <= \timeVal[3]~output_o\;

ww_timeVal(4) <= \timeVal[4]~output_o\;

ww_timeVal(5) <= \timeVal[5]~output_o\;

ww_timeVal(6) <= \timeVal[6]~output_o\;

ww_timeVal(7) <= \timeVal[7]~output_o\;

ww_timeVal(8) <= \timeVal[8]~output_o\;

ww_timeVal(9) <= \timeVal[9]~output_o\;

ww_timeVal(10) <= \timeVal[10]~output_o\;

ww_timeVal(11) <= \timeVal[11]~output_o\;

ww_timeVal(12) <= \timeVal[12]~output_o\;

ww_timeVal(13) <= \timeVal[13]~output_o\;

ww_timeVal(14) <= \timeVal[14]~output_o\;

ww_timeVal(15) <= \timeVal[15]~output_o\;

ww_timeVal(16) <= \timeVal[16]~output_o\;

ww_timeVal(17) <= \timeVal[17]~output_o\;

ww_timeVal(18) <= \timeVal[18]~output_o\;

ww_timeVal(19) <= \timeVal[19]~output_o\;

ww_timeVal(20) <= \timeVal[20]~output_o\;

ww_timeVal(21) <= \timeVal[21]~output_o\;

ww_timeVal(22) <= \timeVal[22]~output_o\;

ww_timeVal(23) <= \timeVal[23]~output_o\;

ww_timeVal(24) <= \timeVal[24]~output_o\;

ww_timeVal(25) <= \timeVal[25]~output_o\;

ww_timeVal(26) <= \timeVal[26]~output_o\;

ww_timeVal(27) <= \timeVal[27]~output_o\;

ww_timeVal(28) <= \timeVal[28]~output_o\;

ww_timeVal(29) <= \timeVal[29]~output_o\;

ww_timeVal(30) <= \timeVal[30]~output_o\;

ww_timeVal(31) <= \timeVal[31]~output_o\;

ww_targetScore(0) <= \targetScore[0]~output_o\;

ww_targetScore(1) <= \targetScore[1]~output_o\;

ww_targetScore(2) <= \targetScore[2]~output_o\;

ww_targetScore(3) <= \targetScore[3]~output_o\;

ww_targetScore(4) <= \targetScore[4]~output_o\;

ww_targetScore(5) <= \targetScore[5]~output_o\;

ww_resetTimer <= \resetTimer~output_o\;

ww_fastIncrement <= \fastIncrement~output_o\;

ww_short <= \short~output_o\;
END structure;


