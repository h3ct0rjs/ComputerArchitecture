library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PSR_Modifier is
    Port (
           rst : in STD_LOGIC;
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           OP1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OP2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0)
          );
end PSR_Modifier;

architecture Behavioral of PSR_Modifier is
begin
  process(AluResult, OP1, OP2, AluOp)
  begin
    if (rst = '1') then
      NZVC <= (others => '0');
    else
    -- addcc or addxcc
    if (AluOp = "010011" or AluOp = "010010") then
      NZVC(3) <= AluResult(31);
      if (AluResult = X"00000000") then
        NZVC(2) <= '1';
      else
        NZVC(2) <= '0';
      end if;
      NZVC(1) <= (OP1(31) and OP2(31) and (not AluResult(31))) or ((not OP1(31)) and (not OP2(31)) and AluResult(31));
      NZVC(0) <= (OP1(31) and OP2(31)) or ((not AluResult(31)) and (OP1(31) or OP2(31)) );
    end if;

    --subcc or subxcc
    if (AluOp = "001000" or AluOp = "001010") then
      NZVC(3) <= AluResult(31);
      if (AluResult = X"00000000") then
        NZVC(2) <= '1';
      else
        NZVC(2) <= '0';
      end if;
      NZVC(1) <= (OP1(31) and (not OP2(31)) and (not AluResult(31))) or ((not OP1(31)) and OP2(31) and AluResult(31));
      NZVC(0) <= ((not OP1(31)) and OP2(31)) or (AluResult(31) and ((not OP1(31)) or OP2(31)));
    end if;

    -- operadores logicos
    --  andcc or andncc or orcc or orncc or xorcc or xnorcc
    if (AluOp = "001011" or AluOp = "001100" or AluOp = "001101" or AluOp = "001110" or AluOp = "001111" or AluOp = "010000") then
      NZVC(3) <= AluResult(31);
      if (AluResult = X"00000000") then
        NZVC(2) <= '1';
      else
        NZVC(2) <= '0';
      end if;
      NZVC(1) <= '0';
      NZVC(0) <= '0';
    else
      NZVC <= "1000";
    end if;

  end if;

end process;

end Behavioral;
