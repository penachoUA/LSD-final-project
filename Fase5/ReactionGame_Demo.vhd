library IEEE;
use IEEE.std_logic_1164.all;

entity ReactionGame_Demo is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(17 downto 0);
		KEY      : in  std_logic_vector(3 downto 0);
		LEDG     : out std_logic_vector(8 downto 0);
		LEDR     : out std_logic_vector(8 downto 0);
		HEX7     : out std_logic_vector(6 downto 0);
		HEX6     : out std_logic_vector(6 downto 0);
		HEX5     : out std_logic_vector(6 downto 0);
		HEX4     : out std_logic_vector(6 downto 0);
		HEX3     : out std_logic_vector(6 downto 0);
		HEX2     : out std_logic_vector(6 downto 0);
		HEX1     : out std_logic_vector(6 downto 0);
		HEX0     : out std_logic_vector(6 downto 0)
	);
end;

architecture Structural of ReactionGame_Demo is
	--- Display 7 Segment values subtype ---
	subtype D7S_VALUE is std_logic_vector(6 downto 0); -- 2 digit counter display
	type D7S_SCORE is array(0 to 1) of D7S_VALUE;
	
	signal s_d7s_target_score : D7S_SCORE;
	signal s_d7s_turn_count   : D7S_SCORE;
	signal s_d7s_scoreA       : D7S_SCORE;
	signal s_d7s_scoreB       : D7S_SCORE;
	

	------- Mode display words -------------
	type D7S_WORD is array(0 to 3) of D7S_VALUE;
	
	constant CONF_WORD : D7S_WORD :=(
		"1000110", -- c
		"0100011", -- o
		"0101011", -- n
		"0001110"  -- F
		);
	constant TEST_WORD : D7S_WORD :=(
		"0000111", -- t
		"0000110", -- E
		"0010010", -- S
		"0000111"  -- t
		);
		
	--- Player led group subtype ------
	subtype PLAYER_LEDS is std_logic_vector(3 downto 0);
	signal s_greenA : PLAYER_LEDS;
	signal s_greenB : PLAYER_LEDS;
	signal s_redA   : PLAYER_LEDS;
	signal s_redB   : PLAYER_LEDS;
	-----------------------------------
		
	-- Reset signals
	signal s_global_reset   : std_logic;
	signal s_timer_reset    : std_logic;
	signal s_pause          : std_logic;
	
	-- TimerAuxFSM signals
	signal s_timeExp : std_logic;
	signal s_newTime : std_logic;
	signal s_timeVal : std_logic_vector(31 downto 0);
	
	-- SystemFSM signals
	signal s_endConf        : std_logic;
	signal s_system_state   : std_logic_vector(1 downto 0);
	signal s_timeExp_system : std_logic;
	signal s_newTime_system : std_logic;
	signal s_timeVal_system : std_logic_vector(31 downto 0);
	
	-- SingleTurnFSM signals
	signal s_clickA : std_logic;
	signal s_clickB : std_logic;
	
	signal s_timeExp_turn : std_logic;
	signal s_newTime_turn : std_logic;
	signal s_timeVal_turn : std_logic_vector(31 downto 0);
	signal s_ledOn        : std_logic;
	signal s_winA         : std_logic;
	signal s_winB         : std_logic;
	signal s_draw         : std_logic;
	signal s_turn_state   : std_logic_vector(2 downto 0);
	
	-- ConfigurationUnit signals
	signal s_timeExp_press  : std_logic;
	signal s_newTime_press  : std_logic;
	signal s_timeVal_press  : std_logic_vector(31 downto 0);
	signal s_press_reset    : std_logic;
	signal s_targetScore    : std_logic_vector(5 downto 0);
	signal s_longPress      : std_logic;
	
	-- ScoreUnit signals
	signal s_scoreA    : std_logic_vector(6 downto 0);
	signal s_scoreB    : std_logic_vector(6 downto 0);
	signal s_turnCount : std_logic_vector(6 downto 0);
	signal s_victoryA  : std_logic;
	signal s_victoryB  : std_logic;
	signal s_firstTurn : std_logic;
	
	-- Blinkers
	signal s_1hz_blink  : std_logic;
	
	signal s_randTime     : std_logic_vector(31 downto 0);
begin
	sync_inputs: process(CLOCK_50)
	 begin
		if rising_edge(CLOCK_50) then
			s_global_reset <= SW(17);
			s_pause        <= SW(0);
			--s_clickA       <= not KEY(0);
			--s_clickB       <= not KEY(3);
		end if;
	 end process;
		
	one_sec_blinker: entity work.BlinkGen(Behavioral)
		generic map(STEPS => 50_000_000)
		port map(
			clk   => CLOCK_50,
			blink => s_1hz_blink
	);
	
	debounce0 : entity work.Debouncer(Behavioral)
     generic map(
			kHzClkFreq		=> 50_000,
			mSecMinInWidth => 50,
			inPolarity		=> '0',
			outPolarity 	=> '1'
		)
		port map(
			refClk 	 => CLOCK_50,
			dirtyIn	 => KEY(0),
			pulsedOut => s_clickA
		);

	debounce2 : entity work.Debouncer(Behavioral)
     generic map(
			kHzClkFreq		=> 50_000,
			mSecMinInWidth => 100,
			inPolarity		=> '0',
			outPolarity 	=> '1'
		)
		port map(
			refClk 	 => CLOCK_50,
			dirtyIn	 => KEY(2),
			pulsedOut => s_endConf
		);
		
	debounce3 : entity work.Debouncer(Behavioral)
     generic map(
			kHzClkFreq		=> 50_000,
			mSecMinInWidth => 50,
			inPolarity		=> '0',
			outPolarity 	=> '1'
		)
		port map(
			refClk 	 => CLOCK_50,
			dirtyIn	 => KEY(3),
			pulsedOut => s_clickB
		);
		
	systemFSM: entity work.SystemFSM(Behavioral)
		port map(
			clk           => CLOCK_50,
			reset         => s_global_reset,
			endConf       => s_endConf,
			victory       => '0',
			timeExp       => s_timeExp_system,
			newTime       => s_newTime_system,
			timeVal       => s_timeVal_system,
			state         => s_system_state
		);
		
	timer_fsm: entity work.TimerAuxFSM(Behavioral)
		port map(
			clk     => not CLOCK_50,
			reset   => s_timer_reset,
			newTime => s_newTime,
			timeVal => s_timeVal,
			timeExp => s_timeExp
		);
	
	game_unit: entity work.GameUnit(Structural)
		port map(
			clk      => CLOCK_50,
			reset    => s_global_reset or s_pause,
			clickA   => s_clickA,
			clickB   => s_clickB,
			timeExp  => s_timeExp_turn,
			newTime  => s_newTime_turn,
			timeVal  => s_timeVal_turn,
			ledOn    => s_ledOn,
			winA     => s_winA,
			winB     => s_winB,
			draw     => s_draw,
			state    => s_turn_state
		);
		
	conf_unit : entity work.ConfigurationUnit(Structural)
		port map(
			clk           => CLOCK_50,
			reset         => s_global_reset,
			enable        => (not s_system_state(1)) and (not s_system_state(0)),
			press         => not KEY(1),
			timeExp       => s_timeExp_press,
			newTime       => s_newTime_press,
			timeVal       => s_timeVal_press,
			targetScore   => s_targetScore,
			resetTimer    => s_press_reset,
			longPress     => s_longPress
		);
		
	score_unit: entity work.ScoreUnit(Structural)
	port map(
		clk         => CLOCK_50,
		reset       => s_global_reset,
		targetScore => '0' & s_targetScore,
		winA        => s_winA,
		winB        => s_winB,
		draw        => s_draw,
		scoreA      => s_scoreA,
		scoreB      => s_scoreB,
		turnCount   => s_turnCount,
		victoryA    => s_victoryA,
		victoryB    => s_victoryB,
		firstTurn   => s_firstTurn 
	);
		
	target_score_display: entity work.ScoreDisplay(Structural)
		port map(
			score  => '0' & s_targetScore,
			hexTen => s_d7s_target_score(0),
			hexUni => s_d7s_target_score(1)
		);
		
	scoreA_display: entity work.ScoreDisplay(Structural)
		port map(
			score  => s_scoreA,
			hexTen => s_d7s_scoreA(0),
			hexUni => s_d7s_scoreA(1)
		);

	scoreB_display: entity work.ScoreDisplay(Structural)
		port map(
			score  => s_scoreB,
			hexTen => s_d7s_scoreB(0),
			hexUni => s_d7s_scoreB(1)
		);

	turn_count_display: entity work.ScoreDisplay(Structural)
		port map(
			score  => s_turnCount,
			hexTen => s_d7s_turn_count(0),
			hexUni => s_d7s_turn_count(1)
		);		
	-- timerAuxFSM multiplexing and demultiplexing
	timer_signals_proc: process(CLOCK_50)
		begin
			if rising_edge(CLOCK_50) then
				s_timer_reset <= s_global_reset;
				
				case s_system_state is
					when "00" =>
						s_timer_reset   <= s_global_reset or s_press_reset;
						s_timeExp_press <= s_timeExp;
						s_timeVal       <= s_timeVal_press;
						s_newTime       <= s_newTime_press;
					when "01" =>
						s_timeExp_turn <= s_timeExp;
						s_timeVal      <= s_timeVal_turn;
						s_newTime      <= s_newTime_turn;
					when "11" =>
						s_timeExp_system <= s_timeExp;
						s_timeVal        <= s_timeVal_system;
						s_newTime        <= s_newTime_system;
					when others =>
						s_timeExp_press  <= '0';
						s_timeExp_system <= '0';
						s_timeExp_turn   <= '0';
						s_timeVal        <= (others => '0');
						s_newTime        <= '0';
				end case;
			end if;
		end process;
		
	s_greenA <= (others => '1') when (s_ledOn = '1' and s_turn_state /= "011") else (others => '0');
	s_greenB <= (others => '1') when (s_ledOn = '1' and s_turn_state /= "100") else (others => '0');
	
	---------- Board outputs ---------
	

	HEX7 <= s_d7s_target_score(0) when ((s_system_state = "00" and s_1hz_blink = '1') or s_longPress = '1' or s_system_state = "01") else 
			  (others => '1'); -- This condition is a bit long but it provides conditional blinking only for slow
			                   -- increment, it doesn't look good when increment is fast
			  
	HEX6 <= s_d7s_target_score(1) when ((s_system_state = "00" and s_1hz_blink = '1') or s_longPress = '1' or s_system_state = "01") else
	        (others => '1');
			  
	HEX5 <= s_d7s_turn_count(0) when s_system_state = "01" else (others => '1');
	HEX4 <= s_d7s_turn_count(1) when s_system_state = "01" else (others => '1');
	
	HEX3 <= CONF_WORD(0)    when s_system_state = "00"                         else
			  TEST_WORD(0)    when (s_system_state = "01" and s_firstTurn = '1') else
			  s_d7s_scoreA(0) when s_system_state = "01"                         else
			  (others => '1') when s_global_reset = '1'                          else
			  (others => '1');
			  
	HEX2 <= CONF_WORD(1)    when s_system_state = "00"                         else
			  TEST_WORD(1)    when (s_system_state = "01" and s_firstTurn = '1') else
			  s_d7s_scoreA(1) when s_system_state = "01"                         else
			  (others => '1') when s_global_reset = '1'                          else
			  (others => '1');
			  
	HEX1 <= CONF_WORD(2)    when s_system_state = "00"                         else
			  TEST_WORD(2)    when (s_system_state = "01" and s_firstTurn = '1') else
			  s_d7s_scoreB(0) when s_system_state = "01"                         else
			  (others => '1') when s_global_reset = '1'                          else
			  (others => '1');
			  
	HEX0 <= CONF_WORD(3)    when s_system_state = "00"                         else
			  TEST_WORD(3)    when (s_system_state = "01" and s_firstTurn = '1') else
			  s_d7s_scoreB(1) when s_system_state = "01"                         else
			  (others => '1') when s_global_reset = '1'                          else
			  (others => '1');		
		
	LEDR(1 downto 0) <= s_system_state;
	LEDR(4 downto 2) <= s_turn_state;
	
	LEDG(3 downto 0) <= s_greenA;
	LEDG(7 downto 4) <= s_greenB;
end;