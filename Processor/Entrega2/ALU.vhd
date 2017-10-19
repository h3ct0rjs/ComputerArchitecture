library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ALU is
    Port ( Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
			carry : in std_logic;
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(ALUOP,Oper1,Oper2)
	begin
		case ALUOP is
		
			when 	"000000" => --ADD
				Salida <= Oper1 + Oper2;
			
			when 	"000001" => --SUB
				Salida <= Oper1 - Oper2;
				
			when 	"000010" => --AND
				Salida <= Oper1 and Oper2;
										
			when 	"000011" => --ANDN
				Salida <= Oper1 and not Oper2;
			
			when 	"000100" => --OR
				Salida <= Oper1 or Oper2;
										
			when 	"000101" => --ORN
				Salida <= Oper1 or not Oper2;
			
			when 	"000110" => --XOR
				Salida <= Oper1 xor Oper2;
										
			when 	"000111" => --XNOR
				Salida <= Oper1 xnor Oper2;
			
			when 	"001000" => --SUBcc
				Salida <= Oper1 - Oper2;
			
			when 	"001001" => -- SUBx
				Salida <= Oper1 - Oper2 - Carry;
			
			when 	"001010" => --SUBxcc
				Salida <= Oper1 - Oper2 - Carry;
			
			when 	"001011" => --ANDcc
				Salida <= Oper1 and Oper2;
			
			when 	"001100" => --ANDNcc
				Salida <= Oper1 and not Oper2;
			
			when 	"001101" => --ORcc
				Salida <= Oper1 or Oper2;
			
			when 	"001110" => --ORNcc
				Salida <= Oper1 or not Oper2;
			
			when 	"001111" => --XORcc
				Salida <= Oper1 xor Oper2;
			
			when 	"010000" => --XNORcc
				Salida <= Oper1 xnor Oper2;
			
			when 	"010001" => --ADDx
				Salida <= Oper1 + Oper2 + Carry;
			
			when 	"010010" => --ADDxcc
				Salida <= Oper1 + Oper2 + Carry;
			
			when 	"010011" => --ADDcc 
				Salida <= Oper1 + Oper2;
				
			when "100101" => --sll
				Salida <= std_logic_vector(unsigned(Oper1) sll to_integer(unsigned(Oper2)));
				
			when "100110" => --srl
				Salida <= std_logic_vector(unsigned(Oper1) srl to_integer(unsigned(Oper2)));	
				
			--SAVE 57
			when "111001" => Salida <= Oper1 + Oper2;
			--RESTORE 58
			when "111101" => Salida <= Oper1 + Oper2;
				
			when others =>
				Salida <= (others=>'1'); --error
			
			end case;

	end process;	


end Behavioral;
