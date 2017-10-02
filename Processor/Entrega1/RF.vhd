library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RF is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           rst : in  STD_LOGIC;
           Dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           ORs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ORs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is

type ram_type is array (0 to 31) of std_logic_vector (31 downto 0);
signal registers : ram_type :=(others => x"00000000");

begin
process(Rs1,Rs2,Rd,Rst,Dwr,registers)
begin
	if(Rst='1')then
		ORs1 <= "00000000000000000000000000000000";
		ORs2 <= "00000000000000000000000000000000";
	else 
		if(rd/="00000")then
				registers(conv_integer(rd)) <= dwr; 
		end if;
		Ors1 <= registers(conv_integer(rs1));
		Ors2 <= registers(conv_integer(rs2));
	end if;
	
end process;
end Behavioral;
