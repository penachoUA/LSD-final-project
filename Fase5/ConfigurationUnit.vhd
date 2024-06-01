library IEEE;
use IEEE.std_logic_1164.all;

entity ConfigurationUnit is
	port(
		clk           : in  std_logic;
		reset         : in  std_logic;
		press         : in  std_logic;
		timeExp       : in  std_logic;
		newTime       : out std_logic;
		timeVal       : out std_logic_vector(31 downto 0);
		targetScore   : out std_logic_vector(5 downto 0);
		resetTimer    : out std_logic;
		longPress : out std_logic
	);
end;

architecture Structural of ConfigurationUnit is
	signal s_newTime    : std_logic;
	signal s_resetTimer : std_logic := '0';

	signal s_press          : std_logic;
	signal s_short_press    : std_logic := '0';
	signal s_long_press     : std_logic := '0';
	signal s_fast_increment : std_logic := '0';
	
	signal s_10hz_pulse : std_logic;
	
	constant PRESS_DURATION : std_logic_vector(31 downto 0) := x"02FAF080"; -- 1sec
begin
	newTime    <= s_newTime;
	resetTimer <= s_resetTimer;
	timeVal    <= PRESS_DURATION;
	longPress  <= s_long_press;
		
	pulse10hz_gen: entity work.PulseGen(Behavioral)
		generic map(MAX => 500_000)
		port map(
			clk   => clk,
			pulse => s_10hz_pulse
		);
	
	debounce_press : entity work.Debouncer(Behavioral)
     generic map(
			kHzClkFreq		=> 50_000,
			mSecMinInWidth => 50,
			inPolarity		=> '0',
			outPolarity 	=> '1'
		)
		port map(
			refClk 	 => clk,
			dirtyIn	 => press,
			pulsedOut => s_short_press
		);
	
	------ Press Duration FSM ----------
	press_type_proc: process(clk)
		begin
			if rising_edge(clk) then		
				if s_short_press = '1' then
					s_newTime <= '1';
				else
					s_newTime <= '0';
				end if;
				
				--if press = '0' then
				--	s_resetTimer <= '1';
				--else
				--	s_resetTimer <= '0';
				--end if;
				
				if (press = '1' and timeExp = '1') then
					s_long_press <= '1';
				else
					s_long_press <= '0';
				end if;
			end if;
		end process;
	----------------------------------
	s_fast_increment <= s_10hz_pulse when s_long_press = '1' else '0';

	target_counter: entity work.CounterNBits(Behavioral)
		generic map(
			N	   => 6,
			MIN   => 1,
			MAX   => 50,
			START => 10
		)
		port map(
			reset   => reset,
			clk     => clk,
			enable1 => s_short_press or s_fast_increment,
			enable2 => '1',
			valOut  => targetScore,
			termCnt => open
		);
		
end;