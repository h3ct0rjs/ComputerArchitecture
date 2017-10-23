library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR_Modifier is
    Port ( AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           OP1 : in  STD_LOGIC;
           OP2 : in  STD_LOGIC;
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_Modifier;

architecture Behavioral of PSR_Modifier is

begin
process(AluResult,OP1,OP2,AluOp)
begin
			if(aluOp = "000001" or AluOp = "000011")then--ADDCC ADDXCC
		NZVC(3) <= AluResult(31);	
		if(AluResult = X"00000000")then
			NZVC(2) <= '1';
		else
			NZVC(2) <= '0';
		end if;
		NZVC(1) <= (OP1 and OP2 and (not AluResult(31))) or ((OP1) and (not OP2) and AluResult(31));
		NZVC(0) <= (OP1 and OP2) or ((not AluResult(31)) and (OP1 or OP2));
	else
		if(AluOp = "000101")then--SUBCC
			NZVC(3) <= AluResult(31);
			if(AluResult = X"00000000")then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= ((OP1 and (not OP2) and (not AluResult(31))) or ((not OP1) and OP2 and AluResult(31)));
			NZVC(0) <= ((not OP1) and OP2) or (AluResult(31) and ((not OP1) or OP2));
		else
			if(AluOp = "000101" or AluOp = "000111" or AluOp = "001001" or AluOp = "001011" or AluOp = "001101" or AluOp = "001111")then
				NZVC(3) <= AluResult(31);
				if(AluResult = X"00000000")then
					NZVC(2) <= '1';
				else
					NZVC(2) <= '0';
				end if;
				NZVC(1) <= '0';
				NZVC(0) <= '0';
			else
				nzvc <= "1000";
			end if;
		end if;
	end if;
end process;

end Behavioral;
