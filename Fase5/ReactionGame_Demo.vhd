library IEEE;
use IEEE.std_logic_1164.all;

entity ReactionGame_Demo is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(0 downto 0);
		KEY      : in  std_logic_vector(2 downto 1);
		LEDG     : out std_logic_vector(7 downto 0);
		LEDR     : out std_logic_vector(1 downto 0)
	);
end;

architecture Structural of ReactionGame_Demo is
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
		
	LEDR <= s_system_state;
	LEDG <= (others => '1') when s_system_state = "10" else (others => '0');
end;