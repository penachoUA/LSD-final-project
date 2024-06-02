library IEEE;
use IEEE.std_logic_1164.all;

entity RotateShiftUnit_tb is
end;

architecture Stimulus of RotateShiftUnit_tb is
	signal s_clk     : std_logic;
	signal s_reset   : std_logic;
	signal s_enable  : std_logic;
	signal s_dirLeft : std_logic;
	signal s_dataIn  : std_logic_vector(3 downto 0);
	signal s_dataOut : std_logic_vector(3 downto 0);
begin
	uut: entity work.RotateShiftUnit(Behavioral)
		generic map(N => 4)
		port map(
			clk     => s_clk,
			reset   => s_reset,
			enable  => s_enable,
			dataIn  => s_dataIn,
			dirLeft => s_dirLeft,
			dataOut => s_dataOut
		);
		
	clk_proc: process
		begin
			s_clk <= '0'; wait for 100 ns;
			s_clk <= '1'; wait for 100 ns;
		end process;
		
	stim_proc: process
		begin
			s_reset <= '1';
			s_enable <= '0';
			s_dataIn <= "0011";
			wait for 200 ns;

			-- Load
			s_reset <= '0';
			wait for 200 ns;

			-- Start and shift right
			s_enable <= '1';
			wait for 600 ns;
			
			-- Shift left
			s_dirLeft <= '1';
			wait for 600 ns;

			-- Shift right
			s_dirLeft <= '0';
			wait for 600 ns;

			-- Disable shifting
			s_enable <= '0';
			wait for 400 ns;

			wait;
		end process;
end;