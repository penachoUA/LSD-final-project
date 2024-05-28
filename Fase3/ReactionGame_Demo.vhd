library IEEE;
use IEEE.std_logic_1164.all;

entity ReactionGame_Demo is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(0 downto 0);
		KEY      : in  std_logic_vector(3 downto 0);
		LEDG     : out std_logic_vector(7 downto 0);
		LEDR     : out std_logic_vector(2 downto 0);
		HEX0     : out std_logic_vector(6 downto 0);
		HEX1     : out std_logic_vector(6 downto 0);
		HEX2     : out std_logic_vector(6 downto 0);
		HEX3     : out std_logic_vector(6 downto 0);
		HEX4     : out std_logic_vector(6 downto 0);
		HEX5     : out std_logic_vector(6 downto 0)
	);
end;

architecture Structural of ReactionGame_Demo is
	subtype LED_GROUP is std_logic_vector(3 downto 0);
	signal s_greenA, s_greenB : LED_GROUP;
	signal s_redA, s_redB     : LED_GROUP;

	signal s_global_reset  : std_logic;
	signal s_reset_game    : std_logic;
	signal s_clickA        : std_logic;
	signal s_clickB        : std_logic;
	signal s_ledOn         : std_logic;
	signal s_draw          : std_logic;
	signal s_winA          : std_logic;
	signal s_winB          : std_logic;
	
	signal s_state  : std_logic_vector(2 downto 0);
	
	constant MAX_POINTS : std_logic_vector(6 downto 0) := "0000101";
	
	signal s_victoryA : std_logic;
	signal s_victoryB : std_logic;
begin
	sync_inputs: process(CLOCK_50)
	 begin
		if rising_edge(CLOCK_50) then
			s_global_reset <= SW(0);
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
			reset         => s_global_reset or s_reset_game,
			clickA        => s_clickA,
			clickB        => s_clickB,
			ledOn         => s_ledOn,
			draw          => s_draw,
			winA          => s_winA,
			winB          => s_winB,
			state         => LEDR
		);
		
	scoreA: entity work.ScoreUnit(Structural)
		port map(
			clk       => CLOCK_50,
			reset     => s_global_reset,
			enable    => '1',
			max       => MAX_POINTS,
			increment => s_winA,
			decrement => '0',
			hexTen    => HEX3,
			hexUni    => HEX2,
			victory   => s_victoryA
		);
		
	scoreB: entity work.ScoreUnit(Structural)
		port map(
			clk       => CLOCK_50,
			reset     => s_global_reset,
			enable    => '1',
			max       => MAX_POINTS,
			increment => s_winB,
			decrement => '0',
			hexTen    => HEX1,
			hexUni    => HEX0,
			victory   => s_victoryB
		);
	
	turn_count_display : entity work.ScoreUnit(Structural)
		port map(
			clk       => CLOCK_50,
			reset     => s_global_reset,
			enable    => '1',
			max       => (others => '1'),
			increment => s_winA or s_winB or s_draw,
			decrement => '0',
			hexTen    => HEX5,
			hexUni    => HEX4,
			victory   => open
		);
	
	s_greenA <= (others => '1') when (s_ledOn = '1' and s_winA = '0') else
					(others => '1') when (s_victoryA = '1')               else
					(others => '0');
					
	s_greenB <= (others => '1') when (s_ledOn = '1' and s_winB = '0') else
					(others => '1') when (s_victoryB = '1')               else
					(others => '0');
	
	end_game_proc: process(CLOCK_50)
		begin
			if rising_edge(CLOCK_50) then
				if (s_victoryA = '1' or s_victoryB = '1') then
					s_reset_game <= '1';
				else
					s_reset_game <= '0';
				end if;
			end if;
		end process;
		
	LEDG(7 downto 4) <= s_greenA;
	LEDG(3 downto 0) <= s_greenB;
end;