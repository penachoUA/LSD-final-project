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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/19/2024 22:48:17"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Bin2BCD
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Bin2BCD_vhd_vec_tst IS
END Bin2BCD_vhd_vec_tst;
ARCHITECTURE Bin2BCD_arch OF Bin2BCD_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL bcdCent : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bcdDec : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bcdMili : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bcdTen : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bcdUni : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL binIn : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT Bin2BCD
	PORT (
	bcdCent : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bcdDec : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bcdMili : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bcdTen : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bcdUni : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	binIn : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Bin2BCD
	PORT MAP (
-- list connections between master ports and signals
	bcdCent => bcdCent,
	bcdDec => bcdDec,
	bcdMili => bcdMili,
	bcdTen => bcdTen,
	bcdUni => bcdUni,
	binIn => binIn
	);
-- binIn[15]
t_prcs_binIn_15: PROCESS
BEGIN
	binIn(15) <= '0';
	WAIT FOR 370000 ps;
	binIn(15) <= '1';
	WAIT FOR 290000 ps;
	binIn(15) <= '0';
WAIT;
END PROCESS t_prcs_binIn_15;
-- binIn[14]
t_prcs_binIn_14: PROCESS
BEGIN
	binIn(14) <= '0';
	WAIT FOR 370000 ps;
	binIn(14) <= '1';
	WAIT FOR 290000 ps;
	binIn(14) <= '0';
WAIT;
END PROCESS t_prcs_binIn_14;
-- binIn[13]
t_prcs_binIn_13: PROCESS
BEGIN
	binIn(13) <= '1';
	WAIT FOR 370000 ps;
	binIn(13) <= '0';
	WAIT FOR 290000 ps;
	binIn(13) <= '1';
WAIT;
END PROCESS t_prcs_binIn_13;
-- binIn[12]
t_prcs_binIn_12: PROCESS
BEGIN
	binIn(12) <= '1';
	WAIT FOR 660000 ps;
	binIn(12) <= '0';
WAIT;
END PROCESS t_prcs_binIn_12;
-- binIn[11]
t_prcs_binIn_11: PROCESS
BEGIN
	binIn(11) <= '0';
WAIT;
END PROCESS t_prcs_binIn_11;
-- binIn[10]
t_prcs_binIn_10: PROCESS
BEGIN
	binIn(10) <= '0';
	WAIT FOR 370000 ps;
	binIn(10) <= '1';
WAIT;
END PROCESS t_prcs_binIn_10;
-- binIn[9]
t_prcs_binIn_9: PROCESS
BEGIN
	binIn(9) <= '0';
	WAIT FOR 660000 ps;
	binIn(9) <= '1';
WAIT;
END PROCESS t_prcs_binIn_9;
-- binIn[8]
t_prcs_binIn_8: PROCESS
BEGIN
	binIn(8) <= '0';
	WAIT FOR 660000 ps;
	binIn(8) <= '1';
WAIT;
END PROCESS t_prcs_binIn_8;
-- binIn[7]
t_prcs_binIn_7: PROCESS
BEGIN
	binIn(7) <= '0';
WAIT;
END PROCESS t_prcs_binIn_7;
-- binIn[6]
t_prcs_binIn_6: PROCESS
BEGIN
	binIn(6) <= '0';
WAIT;
END PROCESS t_prcs_binIn_6;
-- binIn[5]
t_prcs_binIn_5: PROCESS
BEGIN
	binIn(5) <= '1';
	WAIT FOR 660000 ps;
	binIn(5) <= '0';
WAIT;
END PROCESS t_prcs_binIn_5;
-- binIn[4]
t_prcs_binIn_4: PROCESS
BEGIN
	binIn(4) <= '1';
	WAIT FOR 660000 ps;
	binIn(4) <= '0';
WAIT;
END PROCESS t_prcs_binIn_4;
-- binIn[3]
t_prcs_binIn_3: PROCESS
BEGIN
	binIn(3) <= '1';
	WAIT FOR 370000 ps;
	binIn(3) <= '0';
	WAIT FOR 290000 ps;
	binIn(3) <= '1';
WAIT;
END PROCESS t_prcs_binIn_3;
-- binIn[2]
t_prcs_binIn_2: PROCESS
BEGIN
	binIn(2) <= '0';
	WAIT FOR 660000 ps;
	binIn(2) <= '1';
WAIT;
END PROCESS t_prcs_binIn_2;
-- binIn[1]
t_prcs_binIn_1: PROCESS
BEGIN
	binIn(1) <= '0';
	WAIT FOR 660000 ps;
	binIn(1) <= '1';
WAIT;
END PROCESS t_prcs_binIn_1;
-- binIn[0]
t_prcs_binIn_0: PROCESS
BEGIN
	binIn(0) <= '1';
WAIT;
END PROCESS t_prcs_binIn_0;
END Bin2BCD_arch;
