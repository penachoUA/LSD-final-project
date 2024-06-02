library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PulseGen is
	generic(MAX : positive := 50_000_000);
	port(
		clk	: in  std_logic;
		pulse	: out std_logic
	);
end;

architecture Behavioral of PulseGen is
	signal s_cnt : natural range 0 to MAX-1 := 0;
begin
	process(clk)
	begin
		if rising_edge(clk) then	
			if (s_cnt = MAX-1) then
				s_cnt <= 0;
				pulse <= '1';
			else
				s_cnt <= s_cnt + 1;
				pulse <= '0';
			end if;
			
		end if;
	end process;
end;