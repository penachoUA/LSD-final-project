library IEEE;
use IEEE.std_logic_1164.all;

entity ReactionGame is
	port(
		clk        : in  std_logic;
		reset      : in  std_logic;
		clickA     : in  std_logic;
		clickB     : in  std_logic;
		ledOn      : out std_logic;
		winA       : out std_logic;
		winB       : out std_logic;
		draw       : out std_logic;
		turn_count : out std_logic_vector(6 downto 0);
		state      : out std_logic_vector(2 downto 0)
	);
end;

architecture Structural of ReactionGame is
	signal s_timeExp  : std_logic;
	signal s_newTime  : std_logic;
	signal s_randTime	: std_logic_vector(31 downto 0);	
	signal s_timeVal  : std_logic_vector(31 downto 0);
begin
	turn_fsm: entity work.SingleTurnFSM(Behavioral)
		port map(
			clk      => clk,
			reset    => reset,
			clickA   => clickA,
			clickB   => clickB,
			timeExp  => s_timeExp,
			randTime => s_randTime,
			newTime  => s_newTime,
			timeVal  => s_timeVal,
			ledOn    => ledOn,
			winA     => winA,
			winB     => winB,
			draw     => draw,
			state    => state
		);

	timer_fsm: entity work.TimerAuxFSM(Behavioral)
		port map(
			clk     => not clk,
			reset   => reset,
			newTime => s_newTime,
			timeVal => s_timeVal,
			timeExp => s_timeExp
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
end;