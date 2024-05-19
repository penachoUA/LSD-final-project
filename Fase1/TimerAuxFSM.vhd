library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TimerAuxFSM is
	port(
		clk     : in  std_logic;
		reset   : in  std_logic;
		newTime : in  std_logic;
		timeVal : in  std_logic_vector(31 downto 0);
		timeExp : out std_logic
	);
end;

architecture Behavioral of TimerAuxFSM is
	signal s_count : unsigned(31 downto 0) := (others => '1');
	signal s_end : std_logic := '0';
begin
	process(clk)
	begin		
		if rising_edge(clk) then
			s_end <= '0';
			
			if reset = '1' then
				s_count 	 <= (others => '1');
			elsif newTime = '1' then
				s_count <= unsigned(timeVal) - 1;
			else
				if s_count = 0 then
					s_end <= '1';
				else
					s_count <= s_count - 1;
				end if;
			end if;
		end if;
	end process;
	
	timeExp <= s_end;
end;