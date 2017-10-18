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

type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
signal registers : ram_type :=(others => x"00000000");

begin
process(rs1,rs2,rd,dwr, rst)
	begin 
	
		registers(0) <= x"00000000";
		
		if rst = '0' then
			if(rd/="00000")then
				registers(conv_integer(rd)) <= Dwr; 
			end if;
			ORs1 <= registers(conv_integer(Rs1));
			ORs2 <= registers(conv_integer(Rs2));
		else 
			ORs1 <= (others => '0');
			ORs2 <= (others => '0');
			--registers(16) <= x"00000011";
			--registers(17) <= x"FFFFFFF7";
			--registers(18) <= x"0000000E";
		end if;
	end process;
end Behavioral;
