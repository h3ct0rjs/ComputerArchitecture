library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU22 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           seuOut : out  STD_LOGIC_VECTOR (31 downto 0)
          );
end SEU22;

architecture Behavioral of SEU22 is

begin
seuOut(21 downto 0) <= disp22;

  process(disp22) begin
    if(disp22(21) = '0') then
      seuOut(31 downto 22) <= (others => '0');
    else
      seuOut(31 downto 22) <= (others=>'1');
    end if;
  end process;
end Behavioral;
