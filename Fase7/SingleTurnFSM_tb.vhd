library IEEE;
use IEEE.std_logic_1164.all;

entity SingleTurnFSM_tb is
end;

architecture Stimulus of SingleTurnFSM_tb is
    signal s_clk      : std_logic;
    signal s_reset    : std_logic;
    signal s_clickA   : std_logic;
    signal s_clickB   : std_logic;
    signal s_timeExp  : std_logic;
    signal s_randTime : std_logic_vector(31 downto 0) := x"0000_0001"; -- Short time value for simulation;
    signal s_newTime  : std_logic;
    signal s_timeVal  : std_logic_vector(31 downto 0);
    signal s_ledOn    : std_logic;
    signal s_winA     : std_logic;
    signal s_winB     : std_logic;
    signal s_lossA    : std_logic;
    signal s_lossB    : std_logic;
    signal s_state    : std_logic_vector(2 downto 0);
begin
    uut: entity work.SingleTurnFSM(Behavioral)
        port map(
            clk      => s_clk,
            reset    => s_reset,
            clickA   => s_clickA,
            clickB   => s_clickB,
            timeExp  => s_timeExp,
            randTime => s_randTime,
            newTime  => s_newTime,
            timeVal  => s_timeVal,
            ledOn    => s_ledOn,
            winA     => s_winA,
            winB     => s_winB,
            lossA    => s_lossA,
            lossB    => s_lossB,
            state    => s_state
        );

    clk_proc: process
    begin
        s_clk <= '0'; wait for 100 ns;
        s_clk <= '1'; wait for 100 ns;
    end process;

    stim_proc: process
    begin
		  s_clickA  <= '0';
		  s_clickB  <= '0';
		  s_timeExp <= '0';
	 
        s_reset <= '1';
        wait for 200 ns;
		  s_reset <= '0';
        wait for 200 ns;

		  -- Starts at IDLE
		  
		  -- DELAY
        s_clickA <= '1';
		  wait for 100 ns;
		  s_clickA <= '0';
		  wait for 300 ns;
		  
		  -- PLAY
		  s_timeExp <= '1';
		  wait for 200 ns;
		  s_timeExp <= '0';
		  wait for 200 ns;
		  
		  -- WIN_A
		  s_clickA <= '1';
		  wait for 400 ns; -- can't change until clickB
		  s_clickA <= '0';
		  wait for 200 ns;
		  s_clickB <= '1';
		  wait for 100 ns;
		  s_clickB <= '0';
		  wait for 100 ns;
		  
		  -- Back to DELAY
		  
		  -- PLAY
		  s_timeExp <= '1';
		  wait for 200 ns;
		  s_timeExp <= '0';
		  wait for 200 ns;
		  
		  -- WIN_B
		  s_clickB <= '1';
		  wait for 400 ns; -- can't change until clickA
		  s_clickB <= '0';
		  wait for 200 ns;
		  s_clickA <= '1';
		  wait for 100 ns;
		  s_clickA <= '0';
		  wait for 100 ns;
		  
		  -- Back to DELAY
		  
		  -- LOSS_A
		  s_clickA  <= '1';
		  wait for 100 ns;
		  s_clickA  <= '0';
		  wait for 100 ns;
		  s_timeExp <= '1';
		  wait for 200 ns;
		  s_timeExp <= '0';
		  wait for 200 ns;
		  
		  -- Back to DELAY
		  
		  -- LOSS_B
		  s_clickB  <= '1';
		  wait for 100 ns;
		  s_clickB  <= '0';
		  wait for 100 ns;
		  s_timeExp <= '1';
		  wait for 200 ns;
		  s_timeExp <= '0';
		  wait for 200 ns;
		  
		  -- Back to IDLE
		  s_reset <= '1';
		  wait for 200 ns;
		  s_reset <= '0';
		  wait for 200 ns;
		  
		  -- DELAY
		  s_clickB <= '1';
		  wait for 100 ns;
		  s_clickB <= '0';
		  wait for 300 ns;
		  
		  -- Both win
		  s_timeExp <= '1';
		  wait for 200 ns;
		  s_timeExp <= '0';
		  wait for 200 ns;
		  
		  s_clickA  <= '1';
		  s_clickB  <= '1';
		  wait for 100 ns;
		  s_clickA  <= '0';
		  s_clickB  <= '0';
		  wait for 200 ns;
		  
		  
		  -- Back to DELAY
		  
		  -- Both lose
		  s_clickA  <= '1';
		  s_clickB  <= '1';
		  wait for 100 ns;
		  s_clickA  <= '0';
		  s_clickB  <= '0';
		  wait for 200 ns;
		  
		  s_timeExp <= '1';
		  wait for 100 ns;
		  s_timeExp <= '0';
		  wait for 100 ns;		  
		  
		  -- Back to DELAY
        wait;

    end process;

end;