library IEEE;
use IEEE.std_logic_1164.all;

entity TargetScoreSetter is
	port(
		clk    : in  std_logic;
		reset  : in  std_logic;
		click  : in  std_logic;
		target : out std_logic_vector(5 downto 0)
	);
end;

architecture Structural of TargetScoreSetter is
	signal s_short_click  : std_logic;
	signal s_long_click   : std_logic;
	signal s_target       : std_logic_vector(5 downto 0);
begin
	target_counter: entity work.CounterNBits(Behavioral)
		generic map(
			N	 => 6,
			MIN => 1,
			MAX => 50
		)
		port map(
			reset   => reset,
			clk     => clk,
			enable1 => s_short_click or s_long_click,
			enable2 => '1',
			valOut  => s_target,
			termCnt => open
		);
end;
