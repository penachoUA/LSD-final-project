library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SingleTurnFSM is
	port(
		clk      : in  std_logic;
		reset    : in  std_logic;
		click    : in  std_logic;
		randTime : in  std_logic_vector(31 downto 0);
		run_time : out std_logic;
		ledOn    : out std_logic;
		reacted  : out std_logic;
		state    : out std_logic_vector(1 downto 0)
	);
end;

architecture Behavioral of SingleTurnFSM is
	type TSTATE is (IDLE, READY, DELAY, PLAY);
	signal pState : TSTATE;
	signal s_delayTime : unsigned(31 downto 0);
begin
	sync_proc: process(clk)
		begin
			if rising_edge(clk) then
				if reset = '1' then
					pState <= IDLE;
				else
					ledOn    <= '0';
					reacted  <= '0';
					run_time <= '0';
				
					case pState is
						when IDLE    =>
							if click = '1' then
								pState <= READY;
							else
								pState <= IDLE;
							end if;
							
						when READY   =>
							s_delayTime <= unsigned(randTime);
							pState      <= DELAY;
							
						when DELAY   =>
							if s_delayTime = 0 then
								pState <= PLAY;
							else
								s_delayTime <= s_delayTime - 1;
								pState <= DELAY;
							end if;
							
						when PLAY    =>
							ledOn    <= '1';
							run_time <= '1';
							
							if click = '1' then
								reacted  <= '1';
								run_time <= '0';
								pState   <= READY;
							else
								pState   <= PLAY;
							end if;
								
						when others  =>
							pState <= IDLE;
							
					end case;
				end if;
			end if;
		end process;
		
	with pState select
		state <= "00" when IDLE,
					"01" when READY,
					"10" when DELAY,
					"11" when PLAY,
					"00" when others;
end;