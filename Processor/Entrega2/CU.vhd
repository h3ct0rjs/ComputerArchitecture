
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CU is
    Port ( op : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           op3 : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
           aluop : out  STD_LOGIC_VECTOR(5 DOWNTO 0));
end CU;

architecture Behavioral of CU is
begin
	
	process(op, op3)
		begin
		
			if(op = "10") then --formato3
			
				case op3 is
				
					when 	"000000" => --Add
						aluop <= "000000";
												
					when 	"000100" => --Sub
						aluop <= "000001";
						
					when "000001"	 => -- And
						aluop <= "000010";
												
					when "000101"	 => --Andn
						aluop <= "000011";
					
					when "000010"	 => --or
						aluop <= "000100";
												
					when "000110"	 => --orn
						aluop <= "000101";
					
					when "000011"	 => --xor
						aluop <= "000110";
												
					when 	"000111" => --xnor
						aluop <= "000111";
						
					when 	"010100" => --SUBcc
						aluop <= "001000";
					
					when 	"001100" => --SUBx
						aluop <= "001001";
					
					when 	"011100" => --SUBxcc
						aluop <= "001010";
					
					when 	"010001" => --ANDcc
						aluop <= "001011";
						
					when 	"010101" => --ANDNcc
						aluop <= "001100";	
						
					when 	"010010" => --ORcc
						aluop <= "001101";	
						
					when 	"010110" => --ORNcc
						aluop <= "001110";	
						
					when 	"010011" => --XORcc
						aluop <= "001111";
						
					when 	"010111" => --XNORcc
						aluop <= "010000";
						
					when 	"001000" => --ADDx
						aluop <= "010001";
					
					when 	"011000" => --ADDxcc
						aluop <= "010010";
						
					when 	"010000" => --ADDcc
						aluop <= "010011";
					when "100101" =>AluOp <= "100101";--SLL Shift Left Logical 
					when "100110" =>AluOp <= "100110";--SRL Shift Right Logical 
					when "111100" =>AluOp <= "111100";--Save
					when "111101" =>AluOp <= "111101";--RESTORE
					when others =>
						aluop <= (others=>'1'); --error
					end case;
			else
				aluop <= (others=>'1'); --No existe
			end if;
			
			
		end process;	
	
	

end Behavioral;

