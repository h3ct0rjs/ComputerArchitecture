library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_COR is
    Port ( ALUaddress : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_dis30 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_seu : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_4 : in  STD_LOGIC_VECTOR (4 downto 0);
           PCsource : in  STD_LOGIC_VECTOR (1 downto 0);
           MUXout : out  STD_LOGIC_VECTOR (4 downto 0)
          );
end MUX_COR;

architecture Behavioral of MUX_COR is
begin
  process(ALUaddress, PC_dis30, PC_seu, PC_4, PCsource) begin

  case PCsource is
  	when "00"  =>
  		MUXout <= ALUaddress(4 downto 0);
  	when "01"  =>
  		MUXout <= PC_dis30(4 downto 0);
  	when "10"  =>
  		MUXout <= PC_seu(4 downto 0);
  	when "11"  =>
  		MUXout <= PC_4;

  	when others =>
  		MUXout <= PC_4;
  end case;

  end process;
end Behavioral;
