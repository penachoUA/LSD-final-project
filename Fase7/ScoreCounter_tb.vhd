library IEEE;
use IEEE.std_logic_1164.all;

entity ScoreCounter_tb is
end;

architecture Stimulus of ScoreCounter_tb is
    signal s_clk       : std_logic;
    signal s_reset     : std_logic;
    signal s_enable    : std_logic;
    signal s_increment : std_logic;
    signal s_decrement : std_logic;
    signal s_score     : std_logic_vector(6 downto 0);
begin
    uut: entity work.ScoreCounter(Behavioral)
        port map(
            clk       => s_clk,
            reset     => s_reset,
            enable    => s_enable,
            increment => s_increment,
            decrement => s_decrement,
            score     => s_score
        );
        
    clk_proc: process
    begin
        s_clk <= '0'; wait for 100 ns;
        s_clk <= '1'; wait for 100 ns;
    end process;
    
    stim_proc: process
    begin
        -- Reset
        s_reset <= '1';
        wait for 200 ns;
        s_reset <= '0';
        wait for 200 ns;
        
        -- Enable
        s_enable <= '1';
        wait for 200 ns;
        
        -- Increment
        s_increment <= '1';
        wait for 1500 ns;
        s_increment <= '0';
        
        -- Decrement
        s_decrement <= '1';
        wait for 500 ns;
        s_decrement <= '0';
		  
		  -- Disable
        s_enable <= '0';
        wait for 200 ns;
		  
		  s_increment <= '1';
        wait for 400 ns;
		  
		  -- Reset
		  s_reset <= '1';
        wait for 200 ns;

        wait;
    end process;
end;
