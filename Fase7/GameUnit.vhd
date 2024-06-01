library IEEE;
use IEEE.std_logic_1164.all;

entity GameUnit is
	port(
		clk      : in  std_logic;
		reset    : in  std_logic;
		clickA   : in  std_logic;
		clickB   : in  std_logic;
		timeExp  : in  std_logic;
		newTime  : out std_logic;
		timeVal  : out std_logic_vector(31 downto 0);
		ledOn    : out std_logic;
		winA     : out std_logic;
		winB     : out std_logic;
		lossA    : out std_logic;
		lossB    : out std_logic;
		draw     : out std_logic;
		state    : out std_logic_vector(2 downto 0)
	);
end;

architecture Structural of GameUnit is
	signal s_randTime : std_logic_vector(31 downto 0);
begin
	rand_counter : entity work.CounterNBits(Behavioral)
		generic map(
			N	   => 32,
			MIN   => 150_000_000, -- 3 seconds
			MAX   => 350_000_000,  -- 7 seconds
			START => 150_000_000
		)
		port map(
			reset   => reset,
			clk     => clk,
			enable1 => '1',
			enable2 => '1',
			valOut  => s_randTime,
			termCnt => open
		);
	
	single_turn_fsm: entity work.SingleTurnFSM(Behavioral)
		port map(
			clk      => clk,
			reset    => reset,
			clickA   => clickA,
			clickB   => clickB,
			timeExp  => timeExp,
			randTime => s_randTime,
			newTime  => newTime,
			timeVal  => timeVal,
			ledOn    => ledOn,
			winA     => winA,
			winB     => winB,
			lossA    => lossA,
			lossB    => lossB,
			draw     => draw,
			state    => state
		);
end;