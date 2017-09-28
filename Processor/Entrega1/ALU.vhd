library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ALU is
    Port ( Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(ALUOP, Oper1, Oper2)
	begin
		case ALUOP is
		
			when 	"000000" => 
				Salida <= Oper1 + Oper2;
										
			when 	"000001" => 
				Salida <= Oper1 - Oper2;
				
			when 	"000010" => 
				Salida <= Oper1 and Oper2;
										
			when 	"000011" => 
				Salida <= Oper1 and not Oper2;
			
			when 	"000100" => 
				Salida <= Oper1 or Oper2;
										
			when 	"000101" => 
				Salida <= Oper1 or not Oper2;
			
			when 	"000110" => 
				Salida <= Oper1 xor Oper2;
										
			when 	"000111" => 
				Salida <= Oper1 xnor Oper2;
			
			when others =>
				Salida <= (others=>'1');
			
			end case;

	end process;	

end Behavioral;