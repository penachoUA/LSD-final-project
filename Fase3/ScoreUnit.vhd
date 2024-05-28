library IEEE;
use IEEE.std_logic_1164.all;


entity ScoreUnit is
	port(
		clk       : in  std_logic;
		reset     : in  std_logic;
		enable    : in  std_logic;
		max       : in  std_logic_vector(6 downto 0);
		increment : in  std_logic;
		decrement : in  std_logic;
		hexTen    : out std_logic_vector(6 downto 0);
		hexUni    : out std_logic_vector(6 downto 0);
		victory   : out std_logic
	);
end;

architecture Structural of ScoreUnit is
	signal s_score : std_logic_vector(6 downto 0);
begin
	counter: entity work.ScoreCounter(Behavioral)
		port map(
			clk       => clk,
			reset     => reset,
			enable    => enable,
			max       => max,
			increment => increment,
			decrement => decrement,
			score     => s_score
		);
		
	display: entity work.ScoreDisplay(Structural)
		port map(
			score  => s_score,
			hexTen => hexTen,
			hexUni => hexUni
		);
		
	victory_proc: process(clk)
		begin
			if rising_edge(clk) then
				if s_score = max then
					victory <= '1';
				else
					victory <= '0';
				end if;
			end if;
		end process;
end;