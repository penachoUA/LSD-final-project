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
		ledOn    : out std_logic;
		state    : out std_logic_vector(1 downto 0)
	);
end;

architecture Behavioral of SingleTurnFSM is
	type TSTATE is (IDLE, READY, DELAY, PLAY, REACTED);
	signal pState, nState : TSTATE := IDLE;
	signal s_newTime      : std_logic := '0';
	
	constant FALSE_START_DELAY : std_logic_vector(31 downto 0) := x"05F5E100"; -- 2  seconds
	constant MAX_WAIT          : std_logic_vector(31 downto 0) := x"1DCD6500"; -- 10 seconds
begin
	sync_proc: process(clk)
		begin
			if rising_edge(clk) then
				if reset = '1' then
					pState    <= IDLE;
					s_newTime <= '0';
				else
					if pState /= nState then
						s_newTime <= '1';
					else
						s_newTime <= '0';
					end if;
					pState <= nState;
				end if;
			end if;
		end process;
		
	comb_proc : process(pState, click, randTime, timeExp)
		begin
			ledOn     <= '0';
			run_time  <= '0';
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
					nState    <= DELAY;
					
				when DELAY =>
					if timeExp = '1' then
						nState <= PLAY;
					else
						nState <= DELAY;
					end if;
					
				when PLAY =>
					timeVal  <= MAX_WAIT;
					ledOn    <= '1';
					run_time <= '1';
					
					if (click = '1' or timeExp = '1') then
						ledOn    <= '0';
						run_time <= '0';
						nState <= READY;
					else
						nState <= PLAY;
					end if;
					
				when others =>		
					nState <= IDLE;
			end case;
		end process;
		
	with pState select
		state <= "00" when IDLE,
					"01" when READY,
					"10" when DELAY,
					"11" when PLAY,
					"00" when others;
					
	newTime <= s_newTime;
end;
