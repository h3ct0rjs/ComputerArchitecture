library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity DataMemory is
    Port ( WrEnMem : in  STD_LOGIC;
           RdEnMem : in  STD_LOGIC;
           reset : in std_logic;
           crd : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUResult : in  STD_LOGIC_VECTOR (31 downto 0);
           DataToMem : out  STD_LOGIC_VECTOR (31 downto 0)
          );
end DataMemory;

architecture Behavioral of DataMemory is

type ram_type is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);

signal memory : ram_type := (others => x"00000000");

begin
  process (WrEnMem,RdEnMem, reset, crd, ALUResult)
  begin
      if(reset = '1' or (WrEnMem='0' and RdEnMem='0')) then
        DataToMem <= (others => '0');
      elsif(WrEnMem = '1' and RdEnMem = '0') then
        memory(conv_integer(ALUResult)) <= scrd;
      elsif(RdEnMem = '1' and WrEnMem = '0') then
        DataToMem <= memory(conv_integer(ALUResult));
      end if;
  end process;

end Behavioral;
