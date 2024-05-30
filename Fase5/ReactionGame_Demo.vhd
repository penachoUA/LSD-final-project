library IEEE;
use IEEE.std_logic_1164.all;

entity ReactionGame_Demo is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(0 downto 0);
		KEY      : in  std_logic_vector(2 downto 1);
		LEDG     : out std_logic_vector(7 downto 0);
		LEDR     : out std_logic_vector(1 downto 0);
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
		
	signal s_global_reset   : std_logic;
	
	-- SystemFSM signals
	signal s_endConf        : std_logic;
	signal s_system_state   : std_logic_vector(1 downto 0);
	signal s_timeExp_system : std_logic;
	signal s_newTime_system : std_logic;
	signal s_timeVal_system : std_logic_vector(31 downto 0);
	
begin
	sync_inputs: process(CLOCK_50)
	 begin
		if rising_edge(CLOCK_50) then
			s_global_reset <= SW(0);
		end if;
	 end process;

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
			victory       => not KEY(1),
			timeExp       => s_timeExp_system,
			newTime       => s_newTime_system,
			timeVal       => s_timeVal_system,
			state         => s_system_state
		);
		
	timer_fsm: entity work.TimerAuxFSM(Behavioral)
		port map(
			clk     => not CLOCK_50,
			reset   => s_global_reset,
			newTime => s_newTime_system,
			timeVal => s_timeVal_system,
			timeExp => s_timeExp_system
		);
	
	HEX7 <= s_d7s_target_score(1) when s_system_state = "00" else (others => '1');	
	HEX6 <= s_d7s_target_score(0) when s_system_state = "00" else (others => '1');
	HEX5 <= s_d7s_round_count(1) when s_system_state = "01" else (others => '1');
	HEX4 <= s_d7s_round_count(0) when s_system_state = "01" else (others => '1');
	
	HEX3 <= CONF_WORD(3) when s_system_state = "00" else
			  TEST_WORD(3) when s_system_state = "01" else
			  (others => '1');
			  
	HEX2 <= CONF_WORD(2) when s_system_state = "00" else
			  TEST_WORD(2) when s_system_state = "01" else
			  (others => '1');
			  
	HEX1 <= CONF_WORD(1) when s_system_state = "00" else
			  TEST_WORD(1) when s_system_state = "01" else
			  (others => '1');
			  
	HEX0 <= CONF_WORD(0) when s_system_state = "00" else
			  TEST_WORD(0) when s_system_state = "01" else
			  (others => '1');		
		
	LEDR <= s_system_state;
	LEDG <= (others => '1') when s_system_state = "10" else (others => '0');
end;