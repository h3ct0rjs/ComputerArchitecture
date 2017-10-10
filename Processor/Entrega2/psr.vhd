library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
			  Rst : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  Ncwp : in STD_LOGIC_VECTOR (1 downto 0); -- no conectado 
           Carry : out  STD_LOGIC;
			  Cwp : out STD_LOGIC_VECTOR(1 downto 0)); -- no conectado
end PSR;

architecture Behavioral of PSR is

begin
process(clk,Rst,NZVC)
begin
	if (rising_edge(clk)) then 
		if (Rst = '1') then 
			Carry <= '0';
			Cwp <= "00";
		else
			Cwp <= Ncwp;
			Carry <=NZVC(0);
		end if;
	end if;
end process;

end Behavioral;
