library IEEE;
use IEEE.std_logic_1164.all;

entity Bin2BCD_tb is
end;

architecture Stimulus of Bin2BCD_tb is
	signal s_binIn  : std_logic_vector(6 downto 0);
	signal s_bcdUni : std_logic_vector(3 downto 0);
	signal s_bcdTen : std_logic_vector(3 downto 0);
begin
	uut: entity work.Bin2BCD(Behavioral)
		port map(
			binIn  => s_binIn,
			bcdUni => s_bcdUni,
			bcdTen => s_bcdTen
		);
		
	stim_proc: process
		begin
			s_binIn <= "0000000"; -- 0
			wait for 200 ns;
			
			s_binIn <= "0000101"; -- 5
			wait for 200 ns;
			
			s_binIn <= "0001001"; -- 9
			wait for 200 ns;
			
			s_binIn <= "0001010"; -- 10
			wait for 200 ns;
			
			s_binIn <= "0001111"; -- 15
			wait for 200 ns;

			s_binIn <= "0010101"; -- 21
			wait for 200 ns;
			
			s_binIn <= "0100000"; -- 32
			wait for 200 ns;
			
			s_binIn <= "0110001"; -- 49
			wait for 200 ns;

			wait;
		end process;
end;
