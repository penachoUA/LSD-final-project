library IEEE;
use IEEE.std_logic_1164.all;

entity SingleTurnFSM is
	port(
		clk   : in  std_logic;
		reset : in  std_logic;
		click : in  std_logic;
		start : in  std_logic;
		state : out std_logic_vector(4 downto 0)
	);
end;

architecture Behavioral of SingleTurnFSM is
	type TSTATE is (IDLE, READY, FALSE_START, PLAY, REACTED);
	signal pState, nState : TSTATE;
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
		
	comb_proc : process(pState, click, start)
		begin
			case pState is
				when IDLE =>
					state <= "00001";
					
					if click = '1' then
						nState <= READY;
					else
						nState <= IDLE;
					end if;
					
				when READY =>
					state <= "00010";
					
					if click = '1' then
						nState <= FALSE_START;
					elsif start = '1' then
						nState <= PLAY;
					else
						nState <= READY;
					end if;
					
				when FALSE_START =>
					state <= "00100";
					
					nState <= READY;
					
				when PLAY =>
					state <= "01000";
					
					if click = '1' then
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