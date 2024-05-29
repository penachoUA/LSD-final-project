library IEEE;
use IEEE.std_logic_1164.all;

entity SystemFSM is
	port(
		clk      : in  std_logic;
		reset    : in  std_logic;
		endConf  : in  std_logic;
		victory  : in  std_logic;
		timeExp  : in  std_logic;
		newTime  : out std_logic;
		timeVal  : out std_logic_vector(31 downto 0);
		state    : out std_logic_vector(1 downto 0)
	);
end;

architecture Behavioral of SystemFSM is
	type TSTATE is (CONF, GAME, FINAL);
	signal pState, nState : TSTATE;
	
	signal s_stateChange  : std_logic := '0';
	
	constant CELEBRATION_TIME : std_logic_vector(31 downto 0) := x"0EE6B280";
begin
	sync_proc: process(clk)
		begin
			if rising_edge(clk) then
				if reset = '1' then
					pState    <= CONF;
					s_stateChange <= '0';
				else
					if pState /= nState then
						s_stateChange <= '1';
					else
						s_stateChange <= '0';
					end if;
					pState <= nState;
				end if;
			end if;
		end process;
		
	comb_proc : process(pState, endConf, victory, timeExp)
		begin
			timeVal <= (others => '-');
			
			case pState is
				when CONF =>
					if endConf = '1' then
						nState <= GAME;
					else
						nState <= CONF;
					end if;
					
				when GAME =>
					if victory = '1' then
						nState <= FINAL;
					else
						nState <= GAME;
					end if;
					
				when FINAL =>
					timeVal <= CELEBRATION_TIME;
					
					if timeExp = '1' then
						nState <= CONF;
					else
						nState <= FINAL;
					end if;
					
				when others =>
					nState <= CONF;
			end case;
		end process;
		
	with pState select
		state <= "00" when CONF,
					"01" when GAME,
					"10" when FINAL,
					"00" when others;
					
	newTime <= s_stateChange;
end;