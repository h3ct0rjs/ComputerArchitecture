library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_wm is
    Port ( RDin : in  STD_LOGIC_VECTOR (5 downto 0);
           o15 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDest : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0)
           );
end MUX_wm;

architecture Behavioral of MUX_wm is

begin
process(RDin,  RFDest, o15) begin
  if (RFDest = '1') then
    nRD <= o15;
  else
    nRD <= RDin;
  end if;
end process;

end Behavioral;
