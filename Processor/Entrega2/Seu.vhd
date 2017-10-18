-- Create Date:    16:41:40 09/28/2017 
-- Design Name: 
-- Module Name:    Mod5Seu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Mod5Seu is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           SEUimm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end Mod5Seu;

architecture Behavioral of Mod5Seu is

begin
	process (imm13)
	begin 
		if imm13(12) = '1' then
			SEUimm32 <= "1111111111111111111"&imm13;
		else 
			SEUimm32<= "0000000000000000000"&imm13;
		end if;
	end process;
	
end Behavioral;
