library IEEE;
use IEEE.std_logic_1164.all;

entity TargetScoreButtonFSM is
	port(
		clk        : in  std_logic;
		reset      : in  std_logic;
		pressIn    : in  std_logic;
		timeExp    : in  std_logic;
		newTime    : out std_logic;
		timeVal    : out std_logic_vector(31 downto 0);
		shortPress : out std_logic;
		longPress  : out std_logic;
		resetTimer : out std_logic
	);
end;

architecture Behavioral of TargetScoreButtonFSM is
	signal s_newTime         : std_logic;
	signal s_short_press     : std_logic;
	signal s_long_press      : std_logic;
	signal s_reset_timer     : std_logic;
	
	constant ONE_SECOND : std_logic_vector(31 downto 0) := x"02FAF080";
begin	
	timeVal    <= ONE_SECOND;
	newTime    <= s_newTime;
	shortPress <= s_short_press;
	longPress  <= s_long_press;
	
	process(clk)
		begin
			if rising_edge(clk) then
				s_newTime     <= '0';
				s_short_press <= '0';
				s_long_press  <= '0';
				s_reset_timer <= '0';
				
				if reset = '0' then
					if pressIn = '1' then
						s_short_press <= '1';
						s_newTime     <= '1';
					end if;
					
					if (pressIn = '1' and timeExp = '1') then
						s_long_press <= '1';
					end if;
					
					if pressIn = '0' then
						s_reset_timer <= '1';
					end if;
				end if;
			end if;
		end process;
end;