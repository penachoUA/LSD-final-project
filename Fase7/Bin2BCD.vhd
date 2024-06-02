library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Bin2BCD is
	port(
		binIn		: in  std_logic_vector(6 downto 0);
		bcdUni	: out std_logic_vector(3 downto 0);
		bcdTen	: out std_logic_vector(3 downto 0)
	);
end;

architecture Behavioral of Bin2BCD is
	signal s_in  : unsigned(6 downto 0);
	signal s_uni : unsigned(6 downto 0);
	signal s_ten : unsigned(6 downto 0);
begin
	s_in  <= unsigned(binIn);
	s_uni <= s_in rem 10;
	s_ten <= s_in / 10;
	
	bcdUni <= std_logic_vector(resize(s_uni, bcdUni'length));
	bcdTen <= std_logic_vector(resize(s_ten, bcdTen'length));
end;