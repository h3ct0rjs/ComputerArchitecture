library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder_SEU22 is
    Port ( OP1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OP2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AddOut : out  STD_LOGIC_VECTOR (31 downto 0)
          );
end adder_SEU22;

architecture Behavioral of adder_SEU22 is

begin
  AddOut <= OP1 + OP2;
end Behavioral;
