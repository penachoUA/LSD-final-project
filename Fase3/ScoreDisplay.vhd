library IEEE;
use IEEE.std_logic_1164.all;


entity ScoreDisplay is
	port(
		score     : in   std_logic_vector(5 downto 0);
		hexTen    : out  std_logic_vector(6 downto 0);
		hexUni    : out  std_logic_vector(6 downto 0)
	);
end;

architecture Structural of ScoreDisplay is
	signal s_bcd_uni : std_logic_vector(3 downto 0);
	signal s_bcd_ten : std_logic_vector(3 downto 0);
begin
	bin2bcd: entity work.Bin2BCD(Behavioral)
		port map(
			binIn  => score,
			bcdUni => s_bcd_uni,
			bcdTen => s_bcd_ten
		);
		
	ten_7seg: entity work.Bin7SegDecoder(Behavioral)
		port map(
			enable   => '1',
			binInput => s_bcd_ten,
			decOut_n => hexTen
		);
		
	uni_7seg: entity work.Bin7SegDecoder(Behavioral)
		port map(
			enable   => '1',
			binInput => s_bcd_ten,
			decOut_n => hexUni
		);
end;