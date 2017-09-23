library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity registro is
    Port ( reset : in  STD_LOGIC;
			  data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end registro;

architecture Behavioral of registro is

signal init: std_logic_vector(31 downto 0):=(others=>'0');

begin
	process(reset, clk, data_in)
	begin
		if reset = '1' then
			data_out <= init;
		else
			if rising_edge(clk) then
				data_out <= data_in;
			end if;
		end if;
	end process;

end Behavioral;