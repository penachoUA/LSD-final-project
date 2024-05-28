library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ScoreCounter is
	port(
		clk       : in  std_logic;
		reset     : in  std_logic;
		enable    : in  std_logic;
		max       : in  std_logic_vector(6 downto 0);
		increment : in  std_logic;
		decrement : in  std_logic;
		score     : out std_logic_vector(6 downto 0)
	);
end;

architecture Behavioral of ScoreCounter is
	signal s_score : unsigned(6 downto 0);
begin
	process(clk)
		begin
			if rising_edge(clk) then
				if reset = '1' then
					s_score <= (others => '0');
				elsif enable = '1' then
					if increment = '1' then
						s_score <= s_score + 1;
					elsif decrement = '1' then
						s_score <= s_score - 2;
					end if;
				end if;
			end if;
		end process;
		
	score <= std_logic_vector(s_score);
end;