library IEEE;
use IEEE.std_logic_1164.all;

entity ConfController is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(0 downto 0);
		KEY      : in  std_logic_vector(1 downto 1);
		HEX6     : out std_logic_vector(6 downto 0);
		HEX7     : out std_logic_vector(6 downto 0)
	);
end;

architecture Structural of ConfController is
	signal s_short_click  : std_logic;
	signal s_long_click   : std_logic;
	signal s_target       : std_logic_vector(5 downto 0);
	
	constant one_second   : std_logic_vector(31 downto 0) := x"02FAF080";
begin
	debounce1 : entity work.Debouncer(Behavioral)
     generic map(
			kHzClkFreq		=> 50_000,
			mSecMinInWidth => 100,
			inPolarity		=> '0',
			outPolarity 	=> '1'
		)
		port map(
			refClk 	 => CLOCK_50,
			dirtyIn	 => KEY(1),
			pulsedOut => s_short_click
		);

	target_setter: entity work.TargetScoreSetter(Structural)
		port map(
			clk    => CLOCK_50,
			reset  => SW(0),
			click  => s_short_click,
			target => s_target
		);
		
	target_display: entity work.ScoreDisplay(Structural)
		port map(
			score  => '0' & s_target,
			hexTen => HEX7,
			hexUni => HEX6
		);
end;
