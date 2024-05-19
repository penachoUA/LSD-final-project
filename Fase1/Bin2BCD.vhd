library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Bin2BCD is
	port(
		binIn		: in  std_logic_vector(15 downto 0);
		bcdMili  : out std_logic_vector(3 downto 0);
		bcdCent	: out std_logic_vector(3 downto 0);
		bcdDec	: out std_logic_vector(3 downto 0);
		bcdUni	: out std_logic_vector(3 downto 0);
		bcdTen	: out std_logic_vector(3 downto 0)
	);
end;

architecture Behavioral of Bin2BCD is
	signal s_in : unsigned(15 downto 0);
begin
	s_in <= unsigned(binIn);
	
	bcdMili <= std_logic_vector(s_in rem 10)(3 downto 0);
	bcdCent <= std_logic_vector((s_in rem 100) / 10)(3 downto 0);
	bcdDec  <= std_logic_vector((s_in / 100) rem 10)(3 downto 0);
	bcdUni  <= std_logic_vector((s_in / 1000) rem 10)(3 downto 0);
	bcdTen  <= std_logic_vector(s_in / 10000)(3 downto 0);
end;
