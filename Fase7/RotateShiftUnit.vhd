library IEEE;
use IEEE.std_logic_1164.all;

entity RotateShiftUnit is
	port(
		clk		: in  std_logic;
		reset    : in  std_logic;
		enable   : in  std_logic;
		dataIn	: in  std_logic_vector(3 downto 0);
		dirLeft	: in  std_logic;
		dataOut	: out std_logic_vector(3 downto 0)
	);
end;

architecture Behavioral of RotateShiftUnit is
	signal s_shiftReg : std_logic_vector(3 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				s_shiftReg <= dataIn;
			else
				if enable = '1' then
					if dirLeft = '1' then
						s_shiftReg <= s_shiftReg(2 downto 0) & s_shiftReg(3);
					else
						s_shiftReg <= s_shiftReg(0) & s_shiftReg(3 downto 1);
					end if;
				end if;
			end if;
		end if;
	end process;
	
	dataOut <= s_shiftReg;
end;