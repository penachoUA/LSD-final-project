library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Bin2BCD is
	port(
		binIn		: in  std_logic_vector(5 downto 0);
		bcdUni	: out std_logic_vector(3 downto 0);
		bcdTen	: out std_logic_vector(3 downto 0)
	);
end;

architecture Behav of Bin2BCD is
	signal s_in : unsigned(5 downto 0);
begin
	s_in <= unsigned(binIn);
	
	bcdUni <= std_logic_vector(s_in rem 10)(3 downto 0);
	bcdTen <= std_logic_vector(s_in / 10)(3 downto 0);
end;
