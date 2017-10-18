library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
		PORT(  Crs2      : IN std_logic_vector(31 DOWNTO 0); 
             SEUimm13      : IN std_logic_vector(31 DOWNTO 0); 
             i    : IN std_logic; 
             Oper2 : OUT std_logic_vector(31 DOWNTO 0));
end MUX;

architecture Behavioral of MUX is

begin

PROCESS (i, Crs2, SEUimm13) IS
       BEGIN
         CASE i IS
           WHEN '0' => Oper2 <= Crs2;
           WHEN '1' => Oper2 <= SEUimm13; 
           WHEN OTHERS => Oper2 <= (others => '1');
         END CASE;
END PROCESS;

end Behavioral;