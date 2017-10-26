library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Sumador is
    Port ( Operador1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end Sumador;

architecture Behavioral of sumador is

begin
process(Operador1)
begin

 Resultado <= Operador1 +  1;

end process;

end Behavioral;
