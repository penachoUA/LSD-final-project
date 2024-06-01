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
		lossA    : out std_logic;
		lossB    : out std_logic;
		draw     : out std_logic;
		state    : out std_logic_vector(2 downto 0)
	);
end;

architecture Behavioral of SingleTurnFSM is
	type TSTATE is (IDLE, DELAY, PLAY, WIN_A, WIN_B, LOSS_A, LOSS_B);
	signal pState, nState : TSTATE;
	
	-- signal s_winA         : std_logic;
	-- signal s_winB         : std_logic;
	-- signal s_draw         : std_logic;
	
	signal s_stateChange  : std_logic := '0';
	
	constant MAX_WAIT   : std_logic_vector(31 downto 0) := x"1DCD6500"; -- 10 seconds
	constant LOSS_DELAY : std_logic_vector(31 downto 0) := x"05F5E100"; -- 2 seconds
begin
	sync_proc: process(clk)
		begin
			if rising_edge(clk) then
				if reset = '1' then
					pState    <= IDLE;
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
		
	comb_proc : process(pState, clickA, clickB, randTime, timeExp)
		begin
			winA    <= '0';
			winB    <= '0';
			lossA   <= '0';
			lossB   <= '0';
			draw    <= '0';
			ledOn   <= '0';
			timeVal <= (others => '-');
			
			case pState is
				when IDLE =>
					if (clickA = '1' or clickB = '1') then
						nState <= DELAY;
					else
						nState <= IDLE;
					end if;

				when DELAY =>
					timeVal	 <= randTime;
				
					if timeExp = '1' then
						nState <= PLAY;
					elsif (clickA = '1' and clickB = '1') then
						nState <= DELAY;
					elsif clickA = '1' then
						lossA  <= '1';
						nState <= LOSS_A;
					elsif clickB = '1' then
						lossB  <= '1';
						nState <= LOSS_B;
					else
						nState <= DELAY;
					end if;
					
				when LOSS_A =>
					timeVal <= LOSS_DELAY;
					
					if timeExp = '1' then
						nState <= DELAY;
					else
					   nState <= LOSS_A;
					end if;
					
				when LOSS_B =>
					timeVal <= LOSS_DELAY;
					
					if timeExp = '1' then
						nState <= DELAY;
					else
					   nState <= LOSS_B;
					end if;
					
				when PLAY =>
					timeVal <= MAX_WAIT;
					ledOn   <= '1';
		
					if ((clickA = '1' and clickB = '1') or timeExp = '1') then
						draw   <= '1';
						nState <= DELAY;
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
					ledOn <= '1';
					
					if clickB = '1' then
						nState <= DELAY;
					else
						nState <= WIN_A;
					end if;
					
				when WIN_B =>
					ledOn <= '1';
					
					if clickA = '1' then
						nState <= DELAY;
					else
						nState <= WIN_B;
					end if;
					
				when others =>
					nState <= IDLE;
			end case;
		end process;
		
	--sync_mealy_outs: process(clk)
	--	begin
	--		if rising_edge(clk) then
	--			winA <= s_winA;
	--			winB <= s_winB;
	--			draw <= s_draw;		
	--		end if;
	--	end process;
		
	with pState select
		state <= "000" when IDLE,
					"001" when DELAY,
					"010" when PLAY,
					"011" when WIN_A,
					"100" when WIN_B,
					"101" when LOSS_A,
					"110" when LOSS_B,
					"000" when others;
					
	newTime <= s_stateChange;
end;