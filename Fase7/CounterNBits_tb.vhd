library IEEE;
use IEEE.std_logic_1164.all;

entity CounterNBits_tb is
end;

architecture Stimulus of CounterNBits_tb is
	signal s_reset   : std_logic;
	signal s_clk     : std_logic;
	signal s_enable1 : std_logic;
	signal s_enable2 : std_logic;
	signal s_valOut  : std_logic_vector(3 downto 0);
	signal s_term    : std_logic;

begin
	uut: entity work.CounterNBits(Behavioral)
		generic map(
			N     => 4,
			MIN   => 3,
			MAX   => 7,
			START => 5
		)
		port map(
			reset   => s_reset,
			clk     => s_clk,
			enable1 => s_enable1,
			enable2 => s_enable2,
			valOut  => s_valOut,
			termCnt => s_term
		);
		
	clk_proc: process
	begin
		s_clk <= '0';
		wait for 100 ns;
		s_clk <= '1';
		wait for 100 ns;
	end process;
	
	stim_proc: process
	begin
		s_reset  <= '0';
		s_enable1 <= '0';
		s_enable2 <= '0';
		wait for 150 ns;
		
		-- Reset
		s_reset <= '1';
		wait for 200 ns;
		s_reset <= '0';
		wait for 200 ns;
		
		-- Enable
		s_enable1 <= '1';
		s_enable2 <= '1';
		wait for 1200 ns;
		
		-- Disable
		s_enable1 <= '0';
		s_enable2 <= '0';
		wait for 400 ns;
		
		-- Enable
		s_enable1 <= '1';
		s_enable2 <= '1';
		wait for 400 ns; 

		wait;
	end process;
end;