library IEEE;
use IEEE.std_logic_1164.all;

entity ConfController is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(0 downto 0);
		KEY      : in  std_logic_vector(1 downto 1);
		HEX0     : out std_logic_vector(6 downto 0);
		HEX1     : out std_logic_vector(6 downto 0);
		HEX2     : out std_logic_vector(6 downto 0);
		HEX3		: out std_logic_vector(6 downto 0);
		HEX6     : out std_logic_vector(6 downto 0);
		HEX7     : out std_logic_vector(6 downto 0)
	);
end;

architecture Structural of ConfController is
	signal s_click           : std_logic;
	signal s_short_click     : std_logic;
	signal s_long_click      : std_logic;
	signal s_rapid_increment : std_logic;
	signal s_target          : std_logic_vector(5 downto 0);
	
	signal s_1hz_blink  : std_logic;
	signal s_10hz_pulse : std_logic;
	
	signal s_hexTen    : std_logic_vector(6 downto 0);
	signal s_hexUni    : std_logic_vector(6 downto 0);
	
	signal s_reset_timer : std_logic;
	signal s_timeExp     : std_logic;
	signal s_newTime     : std_logic;
	
	constant ONE_SECOND : std_logic_vector(31 downto 0) := x"02FAF080";
begin
	----- Conf word display-----
	HEX3 <= "1000110"; -- c
	HEX2 <= "0100011"; -- o
	HEX1 <= "0101011"; -- n
	HEX0 <= "0001110"; -- F
	----------------------------

	one_sec_blinker: entity work.BlinkGen(Behavioral)
		generic map(STEPS => 50_000_000)
		port map(
			clk   => CLOCK_50,
			blink => s_1hz_blink
		);
		
	pulse10hz_gen: entity work.PulseGen(Behavioral)
		generic map(MAX => 500_000)
		port map(
			clk   => CLOCK_50,
			pulse => s_10hz_pulse
		);
	
	debounce1 : entity work.Debouncer(Behavioral)
     generic map(
			kHzClkFreq		=> 50_000,
			mSecMinInWidth => 100,
			inPolarity		=> '0',
			outPolarity 	=> '1'
		)
		port map(
			refClk 	 => CLOCK_50,
			dirtyIn	 => KEY(1),
			pulsedOut => s_short_click
		);

	s_click <= not KEY(1);
		
	long_press_proc: process(CLOCK_50)
		begin
			if rising_edge(CLOCK_50) then
				s_newTime     <= '0';
				s_long_click  <= '0';
				s_reset_timer <= '0';
				
				if s_short_click = '1' then
					s_newTime <= '1';
				end if;
				
				if (s_click = '1' and s_timeExp = '1') then
					s_long_click <= '1';
				end if;
				
				if s_click = '0' then
					s_reset_timer <= '1';
				end if;
			end if;
		end process;
		
	timer_fsm: entity work.TimerAuxFSM(Behavioral)
		port map(
			clk     => not CLOCK_50,
			reset   => SW(0) or s_reset_timer,
			newTime => s_newTime,
			timeVal => ONE_SECOND,
			timeExp => s_timeExp
		);
		
	s_rapid_increment <= s_10hz_pulse when s_long_click = '1' else '0';
		
	target_setter: entity work.TargetScoreSetter(Structural)
		port map(
			clk    => CLOCK_50,
			reset  => SW(0),
			click  => s_short_click or s_rapid_increment,
			target => s_target
		);
		
	target_display: entity work.ScoreDisplay(Structural)
		port map(
			score  => '0' & s_target,
			hexTen => s_hexTen,
			hexUni => s_hexUni
		);
		
	HEX7 <= s_hexTen when (s_1hz_blink = '1' or s_long_click = '1') else (others => 'Z');
	HEX6 <= s_hexUni when (s_1hz_blink = '1' or s_long_click = '1') else (others => 'Z');
end;
