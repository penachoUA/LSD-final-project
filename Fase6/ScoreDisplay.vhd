library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity ScoreDisplay is
	port(
		score     : in   std_logic_vector(6 downto 0);
		hexTen    : out  std_logic_vector(6 downto 0);
		hexUni    : out  std_logic_vector(6 downto 0)
	);
end;

architecture Structural of ScoreDisplay is
	signal s_hexTen    : std_logic_vector(6 downto 0);
	signal s_hexUni    : std_logic_vector(6 downto 0);
	
	signal s_bcd_uni   : std_logic_vector(3 downto 0);
	signal s_bcd_ten   : std_logic_vector(3 downto 0);
	
	-- Negative numbers display
	constant s_minus_sign : std_logic_vector(6 downto 0) := "0111111";
	signal s_score        : std_logic_vector(6 downto 0);
begin
	process(score)
		begin
			if score = "1111111" then
				hexTen <= s_minus_sign;
				s_score <= "0000001"; -- 1
			elsif score = "1111110" then
				hexTen <= s_minus_sign;
				s_score <= "0000010"; -- 2
			else
				hexTen  <= s_hexTen;
				s_score <= score;
			end if;
		end process;

	bin2bcd: entity work.Bin2BCD(Behavioral)
		port map(
			binIn  => s_score,
			bcdUni => s_bcd_uni,
			bcdTen => s_bcd_ten
		);
		
	ten_7seg: entity work.Bin7SegDecoder(Behavioral)
		port map(
			enable   => '1',
			binInput => s_bcd_ten,
			decOut_n => s_hexTen
		);
		
	uni_7seg: entity work.Bin7SegDecoder(Behavioral)
		port map(
			enable   => '1',
			binInput => s_bcd_uni,
			decOut_n => hexUni
		);
end;