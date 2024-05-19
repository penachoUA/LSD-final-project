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
		state    : out std_logic_vector(4 downto 0)
	);
end;

architecture Behavioral of SingleTurnFSM is
	type TSTATE is (IDLE, READY, FALSE_START, PLAY, REACTED);
	signal pState, nState : TSTATE;
	
	constant FALSE_START_DELAY : std_logic_vector(31 downto 0) := x"05F5E100"; -- 2 seconds
begin
	sync_proc: process(clk)
		begin
			if rising_edge(clk) then
				newTime <= '0';
			
				if reset = '1' then
					pState <= IDLE;
				else
					-- Start time delay for states that need it
					if ((nState = READY) and (pState /= READY)) or 
						((nState = FALSE_START) and (pState /= FALSE_START)) then
						
						newTime <= '1';
					end if;
					pState <= nState;
				end if;
			end if;
		end process;
		
	comb_proc : process(pState, click, randTime, timeExp)
		begin
			run_time <= '0';
			timeVal	<= (others => '-');
			
			case pState is
				when IDLE =>
					state <= "00001";
					
					if click = '1' then
						nState <= READY;
					else
						nState <= IDLE;
					end if;
					
				when READY =>
					state 	<= "00010";
					timeVal	<= randTime;
					
					if click = '1' then
						nState <= FALSE_START;
					elsif timeExp = '1' then
						nState <= PLAY;
					else
						nState <= READY;
					end if;
					
				when FALSE_START =>
					state <= "00100";
					timeVal	<= FALSE_START_DELAY;
					
					if timeExp = '1' then
						nState <= READY;
					else
						nState <= FALSE_START;
					end if;
					
				when PLAY =>
					state 	<= "01000";
					run_time <= '1';
					
					if click = '1' then
						run_time <= '0';
						nState <= REACTED;
					else
						nState <= PLAY;
					end if;
					
				when REACTED =>
					state <= "10000";
					
					nState <= READY;
					
				when others =>
					state <= "00000";
					
					nState <= IDLE;
			end case;
		end process;
end;