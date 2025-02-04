library IEEE;
use IEEE.std_logic_1164.all;

entity SystemFSM_tb is
end;

architecture Stimulus of SystemFSM_tb is
    signal s_clk         : std_logic;
    signal s_reset       : std_logic;
    signal s_endConf     : std_logic;
    signal s_victory     : std_logic;
    signal s_loss        : std_logic;
    signal s_timeExp     : std_logic;
    signal s_newTime     : std_logic;
    signal s_timeVal     : std_logic_vector(31 downto 0);
    signal s_resetScore  : std_logic;
    signal s_state       : std_logic_vector(1 downto 0);
begin
    uut: entity work.SystemFSM(Behavioral)
        port map(
            clk         => s_clk,
            reset       => s_reset,
            endConf     => s_endConf,
            victory     => s_victory,
            loss        => s_loss,
            timeExp     => s_timeExp,
            newTime     => s_newTime,
            timeVal     => s_timeVal,
            resetScore  => s_resetScore,
            state       => s_state
        );

    clk_proc: process
    begin
        s_clk <= '0'; wait for 100 ns;
        s_clk <= '1'; wait for 100 ns;
    end process;

    stim_proc: process
    begin
		  s_timeExp <= '0';
		  s_endConf <= '0';
		  s_victory <= '0';
		  s_loss    <= '0';
		  
		  -- Reset
		  s_reset <= '1'; 
        wait for 200 ns;
        s_reset <= '0'; 
        wait for 200 ns;

        -- Starts at CONF
        s_endConf <= '1';
		  wait for 200 ns;
		  s_endConf <= '0';
		  wait for 200 ns;
		  
		  -- Remains at GAME
		  wait for 400 ns;
		  -- If joint loss, resets score
		  s_loss <= '1';
		  wait for 200 ns;
		  s_loss <= '0';
		  wait for 200 ns;
		  
		  -- Still at Game
		  wait for 200 ns;
		  
		  -- Move to FINAL after win
		  s_victory <= '1';
		  wait for 200 ns;
		  s_victory <= '0';
		  wait for 200 ns;

		  -- Move back to CONF
		  s_timeExp <= '1';
		  wait for 200 ns;
		  s_timeExp <= '0';
		  wait for 200 ns;
		  
        wait;
    end process;
end;