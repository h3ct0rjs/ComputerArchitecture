
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CU is
Port ( OP  : in  STD_LOGIC_VECTOR (1 downto 0);
       OP3  : in  STD_LOGIC_VECTOR (5 downto 0);
       icc : in  STD_LOGIC_VECTOR (3 downto 0);
       Cond : in  STD_LOGIC_VECTOR (3 downto 0);

       wren : out  STD_LOGIC;
       PCsource : out  STD_LOGIC_VECTOR (1 downto 0);
       ALUOP : out  STD_LOGIC_VECTOR (7 downto 0);
       RdEnMem : out  STD_LOGIC;
       WrEnMem : out  STD_LOGIC;
       RFsource : out  STD_LOGIC_VECTOR (1 downto 0);
       RFdest : out  STD_LOGIC
      );
end CU;

architecture Behavioral of CU is
signal calcicc : std_logic := '0';
begin

  process(op, op3, icc, cond)
  begin
    --valores for defecto
    PCsource <= "11";
    RFsource <= "01";
    wren <= '0';
    RdEnMem <= '0';
    WrEnMem <= '0';
    RFdest <= '0';

    if(op = "10") then --formato3
      wren <= '1';
      case op3 is

      when 	"000000" => --Add
        aluop <= "000000"; --0

      when 	"000100" => --Sub
        aluop <= "000001"; --1

      when "000001"	 => -- And
        aluop <= "000010"; --2

      when "000101"	 => --Andn
      aluop <= "000011"; --3

      when "000010"	 => --or
        aluop <= "000100"; --4

      when "000110"	 => --orn
        aluop <= "000101"; --5

      when "000011"	 => --xor
        aluop <= "000110"; --6

      when 	"000111" => --xnor
        aluop <= "000111"; --7

      when 	"010100" => --SUBcc
        aluop <= "001000"; --8

      when 	"001100" => --SUBx
        aluop <= "001001"; --9

      when 	"011100" => --SUBxcc
        aluop <= "001010"; --10

      when 	"010001" => --ANDcc
        aluop <= "001011"; --11

      when 	"010101" => --ANDNcc
        aluop <= "001100"; --12

      when 	"010010" => --ORcc
        aluop <= "001101"; --13

      when 	"010110" => --ORNcc
        aluop <= "001110"; --14

      when 	"010011" => --XORcc
        aluop <= "001111"; --15

      when 	"010111" => --XNORcc
        aluop <= "010000"; --16

      when 	"001000" => --ADDx
        aluop <= "010001"; --17

    when 	"011000" => --ADDxcc
      aluop <= "010010"; --18

    when 	"010000" => --ADDcc
      aluop <= "010011"; --19

    when "100101" =>
      AluOp <= "100101";--SLL Shift Left Logical 37

    when "100110" =>
      AluOp <= "100110";--SRL Shift Right Logical 38

    when "111100" =>
      AluOp <= "111100";--Save 60

    when "111101" =>
      AluOp <= "111101";--RESTORE 61

    when "111000" =>
      ALUOP <= "010100";
      RFsource <= "10";--selecciona PC como datatoreg
      PCsource <= "00";--operacion de la alu
      RFdest <= '0';--seleccion nRD

    when others =>
      aluop <= (others=>'1'); --error
  end case;

  elsif (op = "11") then
    case OP3 is
      when "000000" =>--load word
        ALUOP <= "010101"; --21
        RdEnMem <= '1';--activa lectura en memoria
        WrEnMem <= '0';
        RFsource <= "00";--selecciona dato de memoria como datatoreg
        wren <= '1';
      when "000100" =>--store word
        ALUOP <= x"010110"; --22
        WrEnMem <= '1';--activa escritura en memoria
        RdEnMem <= '0';
      when others =>
        ALUOP <= "000000";
      end case;

  elsif(OP = "01") then
    ALUOP <= "000000";
    wren <='0';
    RFsource <= "10";--selecciona PC como datatoreg
    RFdest <= '1';--selecciona no7 como registro de destino
    PCsource <=  "01";--selecciona disp30 como source del PC
    WrEnMem <= '0';
    RdEnMem <= '1';

  elsif(OP = "00") then
    --NZCV
    wren <= '0';
    ALUOP <= "000000";
    case cond is

      when "1000" =>
        PCsource <= "10";--BA escoge disp22 como source

      when "1001" =>--BNE
        calcicc <= not icc(2);
        if(calcicc = '1') then
          PCsource <= "10";
        end if;

      when "0001" =>--BE
        calcicc <= icc(2);
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "1010" =>--BG
        calcicc <= not (icc(2) or (icc(3) xor icc(0)));
        if(calcicc = '1') then
          PCsource <= "10";
        end if;

      when "0010" =>--BLE
        calcicc <= icc(2) or (icc(3) xor icc(0));
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "1011" =>--BGE
        calcicc <= not(icc(3) xor icc(0));
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "0011" =>--BL
        calcicc <= (icc(3) xor icc(0));
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "1100" =>--BGU
        calcicc <= not(icc(1) or icc(2));
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "0100" =>--BLEU
        calcicc <= (icc(1) or icc(2));
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "1101" =>--BCC
        calcicc <= not icc(1);
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "0101" =>--BCS
        calcicc <=  icc(1);
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "1110" =>--BPOS
        calcicc <= not icc(3);
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "0110" =>--BNEG
        calcicc <=  icc(3);
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "1111" =>--BVC
        calcicc <= not icc(0);
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when "0111" =>--BVS
        calcicc <=  icc(0);
        if(calcicc='1') then
          PCsource <= "10";
        end if;

      when others =>
        PCsource <="00";
    end case;
  end if;
  end process;

end Behavioral;
