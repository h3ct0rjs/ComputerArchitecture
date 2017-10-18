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
			if(op = "10") then 
				case op3 is
				
					when "000000" => --Add
						aluop <= "000000";
												
					when "000100" => --Sub
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
												
					when "000111" => --xnor
						aluop <= "000111";
					
					when others =>
						aluop <= (others=>'1');
					end case;
			else
				aluop <= (others=>'1');
			end if;
end process; 
end Behavioral;
