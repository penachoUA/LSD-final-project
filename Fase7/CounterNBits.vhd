library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CounterNBits is
	generic(
		N	   : natural := 4;
		MIN   : natural := 0;
		MAX   : natural := 15;
	   START : natural := 0
	);
	port(
		reset		: in  std_logic;
		clk		: in  std_logic;
		enable1 	: in  std_logic;
		enable2 	: in  std_logic;
		valOut	: out std_logic_vector(N-1 downto 0);
		termCnt	: out std_logic
	);
end;

architecture Behavioral of CounterNBits is
	constant start_value : unsigned(N-1 downto 0) := to_unsigned(START, N);
	constant min_value   : unsigned(N-1 downto 0) := to_unsigned(MIN, N);
	
	signal cnt_value		: unsigned(N-1 downto 0) := start_value;
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				cnt_value <= start_value;
				termCnt <= '0';
			elsif ((enable1 = '1') and (enable2 = '1')) then
				if cnt_value = MAX then
					cnt_value <= min_value;
					termCnt <= '0';
				else
					cnt_value <= cnt_value + 1;
					if cnt_value = (MAX - 1) then
						termCnt <= '1';
					else
						termCnt <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;

	valOut <= std_logic_vector(cnt_value);
end;