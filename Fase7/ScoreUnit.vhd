library IEEE;
use IEEE.std_logic_1164.all;

entity ScoreUnit is
	port(
		clk         : in  std_logic;
		reset       : in  std_logic;
		targetScore : in  std_logic_vector(6 downto 0);
		winA        : in  std_logic;
		winB        : in  std_logic;
		lossA       : in  std_logic;
		lossB       : in  std_logic;
		scoreA      : out std_logic_vector(6 downto 0);
		scoreB      : out std_logic_vector(6 downto 0);
		turnCount   : out std_logic_vector(6 downto 0);
		victoryA    : out std_logic;
		victoryB    : out std_logic;
		jointLoss   : out std_logic;
		firstTurn   : out std_logic
	);
end;

architecture Structural of ScoreUnit is
	signal s_scoreA    : std_logic_vector(6 downto 0);
	signal s_scoreB    : std_logic_vector(6 downto 0);
	signal s_turnCount : std_logic_vector(6 downto 0);
begin
	firstTurn <= '1' when s_turnCount = "0000000" else '0';
	scoreA    <= s_scoreA;
	scoreB    <= s_scoreB;
	turnCount <= s_turnCount;

	counterA: entity work.ScoreCounter(Behavioral)
		port map(
			clk       => clk,
			reset     => reset,
			enable    => '1',
			increment => winA,
			decrement => lossA,
			score     => s_scoreA
		);
	
	counterB: entity work.ScoreCounter(Behavioral)
		port map(
			clk       => clk,
			reset     => reset,
			enable    => '1',
			increment => winB,
			decrement => lossB,
			score     => s_scoreB
	);
	
	turn_count : entity work.ScoreCounter(Behavioral)
		port map(
			clk       => clk,
			reset     => reset,
			enable    => '1',
			increment => winA or winB or lossA or lossB,
			decrement => '0',
			score     => s_turnCount
	);
		
	victory_proc: process(clk)
		begin
			if rising_edge(clk) then
				if reset = '1' then
					victoryA  <= '0';
					victoryB  <= '0';
					jointLoss <= '0';
				else
					-- If both negative (game restarts)
					if ((s_scoreA(6 downto 1) = "111111") and (s_scoreB(6 downto 1) = "111111")) then
						jointLoss <= '1';
	
					-- If reached target or opponent has negative score
					elsif ((s_scoreA = targetScore) or (s_scoreB(6 downto 1) = "111111")) then
						victoryA <= '1';
					elsif ((s_scoreB = targetScore) or (s_scoreA(6 downto 1) = "111111")) then
						victoryB <= '1';
						
					else
						victoryA  <= '0';
						victoryB  <= '0';
						jointLoss <= '0';
					end if;
				end if;
			end if;
		end process;
end;