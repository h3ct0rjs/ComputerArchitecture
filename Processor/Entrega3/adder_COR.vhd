library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity adder_COR is
    Port ( OP1 : in  STD_LOGIC_VECTOR (29 downto 0);
           OP2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Addout : out std_logic_vector (31 downto 0)
          );
end adder_COR;

architecture Behavioral of adder_COR is
signal tmp : std_logic_vector (31 downto 0);
begin
  tmp(29 downto 0)  <= OP1;
  tmp(31 downto 30) <= "00";
  Addout <= tmp + OP2;
end Behavioral;
