library IEEE;
use IEEE.std_logic_1164.all;

entity ReactionGame_Demo is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(0 downto 0);
		KEY      : in  std_logic_vector(3 downto 0);
		LEDG     : out std_logic_vector(7 downto 0)
	);
end;

architecture Structural of ReactionGame_Demo is
	signal s_reset  : std_logic;
	signal s_clickA : std_logic;
	signal s_clickB : std_logic;
	signal s_ledOn  : std_logic;
	signal s_winA   : std_logic;
	signal s_winB   : std_logic;
	
	signal s_state			  : std_logic_vector(2 downto 0);
	
begin
	sync_inputs: process(CLOCK_50)
	 begin
		if rising_edge(CLOCK_50) then
			s_reset <= SW(0);
		end if;
	 end process;

	debounce0 : entity work.Debouncer(Behavioral)
     generic map(
			kHzClkFreq		=> 50_000,
			mSecMinInWidth => 100,
			inPolarity		=> '0',
			outPolarity 	=> '1'
		)
		port map(
			refClk 	 => CLOCK_50,
			dirtyIn	 => KEY(0),
			pulsedOut => s_clickB
		);

	debounce3 : entity work.Debouncer(Behavioral)
     generic map(
			kHzClkFreq		=> 50_000,
			mSecMinInWidth => 100,
			inPolarity		=> '0',
			outPolarity 	=> '1'
		)
		port map(
			refClk 	 => CLOCK_50,
			dirtyIn	 => KEY(3),
			pulsedOut => s_clickA
		);
	
	reaction_game: entity work.ReactionGame(Structural)
		port map(
			clk           => CLOCK_50,
			reset         => s_reset,
			clickA        => s_clickA,
			clickB        => s_clickB,
			ledOn         => s_ledOn,
			winA          => s_winA,
			winB          => s_winB,
			state         => s_state
		);
		
	LEDG(7 downto 4) <= (others => '1') when (s_ledOn = '1' and s_winA = '0') else (others => '0');
	LEDG(3 downto 0) <= (others => '1') when (s_ledOn = '1' and s_winB = '0') else (others => '0');
end;