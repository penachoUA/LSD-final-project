library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity BlinkGen is
	generic(STEPS : positive := 8);
	port(
		clk	: in  std_logic;
		blink	: out std_logic
	);
end;

architecture Behavioral of BlinkGen is
	signal s_cnt : natural range 0 to STEPS-1;
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if (s_cnt >= STEPS-1) then
				s_cnt <= 0;
			else
				s_cnt <= s_cnt + 1;
			end if;
		end if;
	end process;
	
	blink <= '1' when s_cnt >= (STEPS / 2) else '0';
end;