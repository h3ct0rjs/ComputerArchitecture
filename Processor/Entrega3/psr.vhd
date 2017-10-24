library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port (  NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
            Rst : in  STD_LOGIC;
            clk : in  STD_LOGIC;
            Ncwp : in STD_LOGIC_VECTOR (4 downto 0);
            Carry : out STD_LOGIC;
            Cwp : out STD_LOGIC_VECTOR (4 downto 0);
            icc : out STD_LOGIC_VECTOR (3 downto 0)
          );
end PSR;

architecture Behavioral of PSR is

begin
  process(clk, Rst, NZVC, Ncwp)
  begin
    if (rising_edge(clk)) then
      if (Rst = '1') then
        Carry <= '0';
        Cwp <= (others => '0');
        icc <= (others => '0');
      else
        Carry <=NZVC(0);
        icc <= NZCV;
        Cwp <= Ncwp;
      end if;
    end if;
  end process;

end Behavioral;
