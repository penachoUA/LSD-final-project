library IEEE;
use IEEE.std_logic_1164.all;

entity SingleTurnFSM is
	port(
		clk      : in  std_logic;
		reset    : in  std_logic;
		clickA   : in  std_logic;
		clickB   : in  std_logic;
		timeExp  : in  std_logic;
		randTime : in  std_logic_vector(31 downto 0);
		newTime  : out std_logic;
		timeVal  : out std_logic_vector(31 downto 0);
		ledOn    : out std_logic;
		winA     : out std_logic;
		winB     : out std_logic;
		draw     : out std_logic;
		state    : out std_logic_vector(2 downto 0)
	);
end;

architecture Behavioral of SingleTurnFSM is
	type TSTATE is (IDLE, READY, DELAY, PLAY, WIN_A, WIN_B);
	signal pState, nState : TSTATE;
	
	signal s_newTime  : std_logic := '0';
	
	constant MAX_WAIT : std_logic_vector(31 downto 0) := x"1DCD6500"; -- 10 seconds
	-- constant FALSE_START_DELAY : std_logic_vector(31 downto 0) := x"05F5E100"; -- 2 seconds
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
		
	comb_proc : process(pState, clickA, clickB, randTime, timeExp)
		begin
			winA      <= '0';
			winB      <= '0';
			draw      <= '0';
			ledOn     <= '0';
			timeVal	 <= (others => '-');
			
			case pState is
				when IDLE =>
					if (clickA = '1' or clickB = '1') then
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
					timeVal <= MAX_WAIT;
					ledOn   <= '1';
		
					if ((clickA = '1' and clickB = '1') or timeExp = '1') then
						draw   <= '1';
						nState <= READY;
					elsif clickA = '1' then
						winA   <= '1';
						nState <= WIN_A;
					elsif clickB = '1' then
						winB   <= '1';
						nState <= WIN_B;
					else
						nState <= PLAY;
					end if;
					
				when WIN_A =>
					if clickB = '1' then
						nState <= READY;
					else
						nState <= WIN_A;
					end if;
					
				when WIN_B =>
					if clickA = '1' then
						nState <= READY;
					else
						nState <= WIN_B;
					end if;
				when others =>
					nState <= IDLE;
			end case;
		end process;
		
	with pState select
		state <= "000" when IDLE,
					"001" when READY,
					"010" when DELAY,
					"011" when PLAY,
					"100" when WIN_A,
					"101" when WIN_B,
					"000" when others;
					
	newTime <= s_newTime;
end;