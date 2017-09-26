library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( DAT_in : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           DAT_out : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is
begin

process (clk,rst)
begin

if (rising_edge (Clk)) then 
  if(rst = '0') then
		DAT_out <= Dat_In;
	else
		DAT_out <= "00000000000000000000000000000000";
	end if;
end if;

end process;
end Behavioral;
