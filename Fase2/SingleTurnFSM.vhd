library IEEE;
use IEEE.std_logic_1164.all;

entity SingleTurnFSM is
	port(
		clk      : in  std_logic;
		reset    : in  std_logic;
		click    : in  std_logic;
		timeExp  : in  std_logic;
		randTime : in  std_logic_vector(31 downto 0);
		newTime  : out std_logic;
		timeVal  : out std_logic_vector(31 downto 0);
		run_time : out std_logic;
		state    : out std_logic_vector(2 downto 0)
	);
end;

architecture Behavioral of SingleTurnFSM is
	type TSTATE is (IDLE, READY, DELAY, PLAY, REACTED);
	signal pState, nState : TSTATE;
	signal s_newTime      : std_logic;
	
	constant FALSE_START_DELAY : std_logic_vector(31 downto 0) := x"05F5E100"; -- 2 seconds
begin
	sync_proc: process(clk)
		begin
			if rising_edge(clk) then
				if reset = '1' then
					pState <= IDLE;
				else	
					pState <= nState;
				end if;
			end if;
		end process;
		
	comb_proc : process(pState, click, randTime, timeExp)
		begin
			s_newTime <= '0';
			run_time <= '0';
			timeVal	<= (others => '-');
			
			case pState is
				when IDLE =>
					
					if click = '1' then
						nState <= READY;
					else
						nState <= IDLE;
					end if;
					
				when READY =>
					timeVal	 <= randTime;
					s_newTime <= '1';
					nState    <= DELAY;
					
				when DELAY =>
					if timeExp = '1' then
						nState <= PLAY;
					else
						nState <= DELAY;
					end if;
					
				when PLAY =>
					run_time <= '1';
					
					if click = '1' then
						run_time <= '0';
						nState <= REACTED;
					else
						nState <= PLAY;
					end if;
					
				when REACTED =>
					nState <= READY;
					
				when others =>		
					nState <= IDLE;
			end case;
		end process;
		
	with pState select
		state <= "000" when IDLE,
					"001" when READY,
					"010" when DELAY,
					"011" when PLAY,
					"100" when REACTED,
					"000" when others;
					
	newTime <= s_newTime;
end;