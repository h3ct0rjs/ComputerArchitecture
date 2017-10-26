library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_DM is
    Port ( PC : in  STD_LOGIC_VECTOR (4 downto 0);
           RFsource : in std_logic_vector (1 downto 0);
           DataToMem : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUResult : in  STD_LOGIC_VECTOR (31 downto 0);
           DataToReg : out  STD_LOGIC_VECTOR (31 downto 0)
          );
end MUX_DM;

architecture Behavioral of MUX_DM is

begin
process(PC, RFsource, DataToMem, ALUResult) begin
  if(RFsource = "00") then
    DataToReg <= DataToMem;
  elsif(RFsource = "01") then
    DataToReg <= ALUResult;
  else
    DataToReg(4 downto 0) <= PC;
    DataToReg(31 downto 5) <= (others => '0');
  end if;
end process;

end Behavioral;
