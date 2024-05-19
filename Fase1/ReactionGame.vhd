library IEEE;
use IEEE.std_logic_1164.all;

entity ReactionGame is
	port(
		clk           : in  std_logic;
		reset         : in  std_logic;
		click         : in  std_logic;
		reaction_time : out std_logic_vector(15 downto 0);
		state         : out std_logic_vector(4 downto 0)
	);
end;

architecture Structural of ReactionGame is
	signal s_timeExp  : std_logic;
	signal s_newTime  : std_logic;
	signal s_randTime	: std_logic_vector(31 downto 0);	
	signal s_timeVal  : std_logic_vector(31 downto 0);
	signal s_run_time : std_logic;
	
	signal s_clk_1000hz : std_logic;
	signal s_maxTime    : std_logic;
begin
	turn_fsm: entity work.SingleTurnFSM(Behavioral)
		port map(
			clk      => clk,
			reset    => reset,
			click    => click,
			timeExp  => s_timeExp or s_maxTime,
			randTime => s_randTime,
			newTime  => s_newTime,
			timeVal  => s_timeVal,
			run_time => s_run_time,
			state    => state
		);

	timer_fsm: entity work.TimerAuxFSM(Behavioral)
		port map(
			clk     => clk,
			reset   => reset,
			newTime => s_newTime,
			timeVal => s_timeVal,
			timeExp => s_timeExp
		);
		
	clk_div_1000hz: entity work.ClkDividerN(Behavioral)
		generic map(K 	=> 50_000)
		port map(
			clkIn	 => clk, 
			clkOut => s_clk_1000hz
		);
	
	rand_counter : entity work.CounterNBits(Behavioral)
		generic map(
			N	 => 32,
			MIN => 150_000_000, -- 3 seconds
			MAX => 350_000_000  -- 7 seconds
		)
		port map(
			reset   => reset,
			clk     => clk,
			enable1 => '1',
			enable2 => '1',
			valOut  => s_randTime,
			termCnt => open
		);
	
	chronometer : entity work.CounterNBits(Behavioral)
		generic map(
			N	 => 16,
			MIN => 0,
			MAX => 500_000_000  -- 10 seconds
		)
		port map(
			reset   => reset,
			clk     => clk,
			enable1 => s_clk_1000hz,
			enable2 => s_run_time,
			valOut  => reaction_time,
			termCnt => s_maxTime
		);
end;