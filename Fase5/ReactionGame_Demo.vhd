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
	signal s_d7s_round_count  : D7S_SCORE;
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
	signal s_longPress : std_logic;
	
	-- Blinkers
	signal s_1hz_blink  : std_logic;
	
	signal s_randTime     : std_logic_vector(31 downto 0);
begin
	sync_inputs: process(CLOCK_50)
	 begin
		if rising_edge(CLOCK_50) then
			s_global_reset <= SW(17);
			s_pause        <= SW(0);
			s_clickA       <= not KEY(0);
			s_clickB       <= not KEY(3);
		end if;
	 end process;
		
	one_sec_blinker: entity work.BlinkGen(Behavioral)
		generic map(STEPS => 50_000_000)
		port map(
			clk   => CLOCK_50,
			blink => s_1hz_blink
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
		
	rand_counter : entity work.CounterNBits(Behavioral)
		generic map(
			N	   => 32,
			MIN   => 150_000_000, -- 3 seconds
			MAX   => 350_000_000,  -- 7 seconds
			START => 150_000_000
		)
		port map(
			reset   => s_global_reset or s_pause,
			clk     => CLOCK_50,
			enable1 => '1',
			enable2 => '1',
			valOut  => s_randTime,
			termCnt => open
		);
	
	single_turn_fsm: entity work.SingleTurnFSM(Behavioral)
		port map(
			clk      => CLOCK_50,
			reset    => s_global_reset or s_pause,
			clickA   => s_clickA,
			clickB   => s_clickB,
			timeExp  => s_timeExp_turn,
			randTime => s_randTime,
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
			press         => not KEY(1),
			timeExp       => s_timeExp_press,
			newTime       => s_newTime_press,
			timeVal       => s_timeVal_press,
			targetScore   => s_targetScore,
			resetTimer    => s_press_reset,
			longPress     => s_longPress
		);
		
	LEDG(8) <= s_newTime_press;
	LEDR(8) <= s_press_reset;
	
		
	target_score_display: entity work.ScoreDisplay(Structural)
		port map(
			score  => '0' & s_targetScore,
			hexTen => s_d7s_target_score(0),
			hexUni => s_d7s_target_score(1)
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
	

	HEX7 <= s_d7s_target_score(0) when (s_system_state = "00" and (s_1hz_blink = '1' or s_longPress = '1')) else 
			  (others => '1'); -- This condition is a bit long but it provides conditional blinking only for slow
			                   -- increment, it doesn't look good when increment is fast
			  
	HEX6 <= s_d7s_target_score(1) when (s_system_state = "00" and (s_1hz_blink = '1' or s_longPress = '1')) else
	        (others => '1');
			  
	HEX5 <= s_d7s_round_count(0) when s_system_state = "01" else (others => '1');
	HEX4 <= s_d7s_round_count(1) when s_system_state = "01" else (others => '1');
	
	HEX3 <= CONF_WORD(0) when s_system_state = "00" else
			  TEST_WORD(0) when s_system_state = "01" else
			  (others => '1');
			  
	HEX2 <= CONF_WORD(1) when s_system_state = "00" else
			  TEST_WORD(1) when s_system_state = "01" else
			  (others => '1');
			  
	HEX1 <= CONF_WORD(2) when s_system_state = "00" else
			  TEST_WORD(2) when s_system_state = "01" else
			  (others => '1');
			  
	HEX0 <= CONF_WORD(3) when s_system_state = "00" else
			  TEST_WORD(3) when s_system_state = "01" else
			  (others => '1');		
		
	LEDR(1 downto 0) <= s_system_state;
	LEDR(4 downto 2) <= s_turn_state;
	
	LEDG(3 downto 0) <= s_greenA;
	LEDG(7 downto 4) <= s_greenB;
end;