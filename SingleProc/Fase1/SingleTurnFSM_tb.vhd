library IEEE;
use IEEE.std_logic_1164.all;

entity SingleTurnFSM_tb is
end;

architecture Stimulus of SingleTurnFSM_tb is
		signal s_clk      : std_logic;
		signal s_reset    : std_logic;
		signal s_click    : std_logic;
		signal s_randTime : std_logic_vector(31 downto 0);
		signal s_run_time : std_logic;
		signal s_ledOn    : std_logic;
		signal s_reacted  : std_logic;
		signal s_state    : std_logic_vector(1 downto 0);
begin
	uut: entity work.SingleTurnFSM(Behavioral)
		port map(
			clk      => s_clk,
			reset    => s_reset,
			click    => s_click,
			randTime => s_randTime,
			run_time => s_run_time,
			ledOn    => s_ledOn,
			reacted  => s_reacted,
			state    => s_state
		);
		
	clk_proc: process
		begin
			s_clk <= '0'; wait for 20 ns;
			s_clk <= '1'; wait for 20 ns;
		end process;
		
	stim_proc: process
		begin
			s_reset    <= '1';
			s_click    <= '0';
			s_randTime <= (others => '0');
			wait for 40 ns;
			
			s_reset <= '0';
			s_randTime <= x"00000007";
 			wait for 40 ns;
			
			s_click <= '1';
			wait for 40 ns;
			
			s_click <= '0';
			wait for 500 ns;
			
			s_click <= '1';
			wait for 40 ns;
			
			s_reset <= '0';
			wait for 40 ns;
		end process;
end;