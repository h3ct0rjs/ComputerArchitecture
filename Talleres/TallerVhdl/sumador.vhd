library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity sumador is
    Port ( value1 : in  STD_LOGIC_VECTOR (31 downto 0);
           value2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador;

architecture Behavioral of sumador is


begin
	process (value1, value2)
		begin
			result <= value2 + value1;
	end process;

end Behavioral;