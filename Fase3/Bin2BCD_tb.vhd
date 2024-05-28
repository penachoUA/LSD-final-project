library IEEE;
use IEEE.std_logic_1164.all;

entity Bin2BCD_tb is
end;

architecture Stimulus of Bin2BCD_tb is
	signal s_binIn	  : std_logic_vector(5 downto 0);
	signal s_bcdUni  : std_logic_vector(3 downto 0);
	signal s_bcdTen  : std_logic_vector(3 downto 0);
begin
	uut: entity work.Bin2BCD(Behavioral)
		port map(
			binIn   => s_binIn,
			bcdUni  => s_bcdUni,
			bcdTen  => s_bcdTen
		);
		
	stim_proc: process
		begin
			s_binIn <= "110010"; --50
			wait for 200 ns;
			
			s_binIn <= "100000"; --32
			wait for 200 ns;
			
			s_binIn <= "000010"; --2
			wait for 200 ns;
		end process;
end;