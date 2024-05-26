library IEEE;
use IEEE.std_logic_1164.all;

entity ReactionGame_Demo is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(0 downto 0);
		KEY      : in  std_logic_vector(0 downto 0);
		HEX0     : out std_logic_vector(6 downto 0);
		HEX1     : out std_logic_vector(6 downto 0);
		HEX2     : out std_logic_vector(6 downto 0);
		HEX3     : out std_logic_vector(6 downto 0);
		HEX4     : out std_logic_vector(6 downto 0);
		LEDG     : out std_logic_vector(8 downto 0);
		LEDR     : out std_logic_vector(7 downto 0)
	);
end;

architecture Structural of ReactionGame_Demo is
	signal s_reset : std_logic;
	signal s_click : std_logic;

	signal s_reaction_time : std_logic_vector(15 downto 0);
	signal s_state			  : std_logic_vector(2 downto 0);
	
	signal s_mili : std_logic_vector(3 downto 0);
	signal s_cent : std_logic_vector(3 downto 0);
	signal s_dec  : std_logic_vector(3 downto 0);
	signal s_uni  : std_logic_vector(3 downto 0);
	signal s_ten  : std_logic_vector(3 downto 0);
	
begin
	sync_inputs: process(CLOCK_50)
	 begin
		if rising_edge(CLOCK_50) then
			s_reset <= SW(0);
		end if;
	 end process;

	debounce : entity work.Debouncer(Behavioral)
     generic map(
			kHzClkFreq		=> 50_000,
			mSecMinInWidth => 100,
			inPolarity		=> '0',
			outPolarity 	=> '1'
		)
		port map(
			refClk 	 => CLOCK_50,
			dirtyIn	 => KEY(0),
			pulsedOut => s_click
		);

	reaction_game: entity work.ReactionGame(Structural)
		port map(
			clk           => CLOCK_50,
			reset         => s_reset,
			click         => s_click,
			reaction_time => s_reaction_time,
			state         => s_state
		);

	bin2bcd: entity work.Bin2BCD(Behavioral)
		port map(
			binIn	  => s_reaction_time,
			bcdMili => s_mili,
			bcdCent => s_cent,
			bcdDec  => s_dec,
			bcdUni  => s_uni,
			bcdTen  => s_ten
		);
		
	bin7mili: entity work.Bin7SegDecoder(Behavioral)
		port map(
			enable	 => not s_reset,
			binInput  => s_mili,
			decOut_n  => HEX0
		);
	
	bin7cent: entity work.Bin7SegDecoder(Behavioral)
		port map(
			enable	 => not s_reset,
			binInput  => s_cent,
			decOut_n  => HEX1
		);
		
	bin7dec: entity work.Bin7SegDecoder(Behavioral)
		port map(
			enable	 => not s_reset,
			binInput  => s_dec,
			decOut_n  => HEX2
		);
		
	bin7uni: entity work.Bin7SegDecoder(Behavioral)
		port map(
			enable	 => not s_reset,
			binInput  => s_uni,
			decOut_n  => HEX3
		);
		
	bin7ten: entity work.Bin7SegDecoder(Behavioral)
		port map(
			enable	 => not s_reset,
			binInput  => s_ten,
			decOut_n  => HEX4
		);
		
	LEDG(8) <= '1' when s_state = "011" else '0';
	
	LEDG(7 downto 0) <= (others => '1') when s_state = "011" else (others => '0');
	
	LEDR <= (others => '1') when s_state = "010" else (others => '0');
end;