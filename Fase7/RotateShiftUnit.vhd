library IEEE;
use IEEE.std_logic_1164.all;

entity RotateShiftUnit is
	generic(N : natural := 4);
	port(
		clk		: in  std_logic;
		reset    : in  std_logic;
		enable   : in  std_logic;
		dirLeft	: in  std_logic;
		dataIn	: in  std_logic_vector(N-1 downto 0);
		dataOut	: out std_logic_vector(N-1 downto 0)
	);
end;

architecture Behavioral of RotateShiftUnit is
	signal s_shiftReg : std_logic_vector(N-1 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				s_shiftReg <= dataIn;
			else
				if enable = '1' then
					if dirLeft = '1' then
						s_shiftReg <= s_shiftReg(N-2 downto 0) & s_shiftReg(N-1);
					else
						s_shiftReg <= s_shiftReg(0) & s_shiftReg(N-1 downto 1);
					end if;
				end if;
			end if;
		end if;
	end process;
	
	dataOut <= s_shiftReg;
end;