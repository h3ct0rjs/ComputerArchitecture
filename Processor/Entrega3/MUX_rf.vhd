library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_rf is
  Port( Crs2      : in std_logic_vector(31 downto 0);
        SEUimm13  : in std_logic_vector(31 downto 0);
        i         : in std_logic;
        Oper2     : out std_logic_vector(31 downto 0)
       );
end MUX_rf;

architecture Behavioral of MUX_rf is

begin
  process (i, Crs2, SEUimm13) is
    begin
     case i is
       when '0' => Oper2 <= Crs2;
       when '1' => Oper2 <= SEUimm13;
       when others => Oper2 <= (others => '1');
     end case;
  end process;

end Behavioral;
