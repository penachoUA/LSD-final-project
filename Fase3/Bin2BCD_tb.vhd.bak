library IEEE;
use IEEE.std_logic_1164.all;

entity Bin2BCD_tb is
end;

architecture Stimulus of Bin2BCD_tb is
	signal s_binIn	  : std_logic_vector(15 downto 0);
	signal s_bcdMili : std_logic_vector(3 downto 0);
	signal s_bcdCent : std_logic_vector(3 downto 0);
	signal s_bcdDec  : std_logic_vector(3 downto 0);
	signal s_bcdUni  : std_logic_vector(3 downto 0);
	signal s_bcdTen  : std_logic_vector(3 downto 0);
begin
	uut: entity work.Bin2BCD(Behavioral)
		port map(
			binIn   => s_binIn,
			bcdMili => s_bcdMili,
			bcdCent => s_bcdCent,
			bcdDec  => s_bcdDec,
			bcdUni  => s_bcdUni,
			bcdTen  => s_bcdTen
		);
		
	stim_proc: process
		begin
			s_binIn <= "0011000000111001"; --12345
			wait for 200 ns;
			
			s_binIn <= "1101010000110001"; --54321
			wait for 200 ns;
			
			s_binIn <= "0010011100001111"; --9999
			wait for 200 ns;
		end process;
end;