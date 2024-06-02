library IEEE;
use IEEE.std_logic_1164.all;

entity BlinkGen_tb is
end;

architecture Stimulus of BlinkGen_tb is
    signal s_clk   : std_logic;
    signal s_blink : std_logic;

begin
    uut: entity work.BlinkGen(Behavioral)
        generic map(
            STEPS => 4
        )
        port map(
            clk   => s_clk,
            blink => s_blink
        );
        
    clk_proc: process
    begin
        s_clk <= '0'; wait for 100 ns;
        s_clk <= '1'; wait for 100 ns;
    end process;
    
    stim_proc: process
    begin
        wait for 2000 ns;
        
        wait;
    end process;
end;
