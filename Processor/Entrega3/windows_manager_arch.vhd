library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Notas:
-- La idea de este modulo es expandir la cantidad de registros disponibles
-- con 5 bits yo solo tengo 2**5 -1 registros. Las ventanas nos dejar ir moviendonos
-- para tener mas ventanas, en nuestra arquitectura de 40 a 520.
-- Los registros globales siempre van a estar en la misma posicion, los unicos que se mueven son los locales,outs, inputs.
--Basado en https://www.educreations.com/lesson/view/procesador-sparc-v8-soportando-windowing/13230159/
-- analizar el estado del psr en los primeros 5 bits que son cwp
--save: cwp<=cwp-1  >> cwp<='0'
--restore: cwp<=cwp+1 >> cwp<='1'

entity windows_manager_arch is
    Port (
           rst : in std_logic;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           CWP : in  STD_LOGIC_VECTOR (4 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           nCWP : out  STD_LOGIC_VECTOR (4 downto 0);
           no7 : out  STD_LOGIC_VECTOR (5 downto 0)
         );
end windows_manager_arch;

architecture Behavioral of windows_manager_arch is

begin
process(rs1, rs2, rd, op, op3, CWP)
  begin

    no7 <= conv_std_logic_vector(15 + (conv_integer(cwp) * 16), 6);

    --save
    if(op = "10" and op3 = "111100")then
      nCWP <= "0000";
    end if;

    --restore
    if(op = "10" and op3 = "111101")then
      nCWP <= "1111";
    end if;

    --si es locales y salida, usa la logica del video:
    -- 10 y 23
    if (rs1 >= "01000" and rs1 <= "10111") then
      nrs1 <= conv_std_logic_vector(conv_integer(rs1) + (conv_integer(cwp) * 16), 6);
    end if;

    if (rs2 >= "01000" and rs2 <= "10111") then
      nrs2 <= conv_std_logic_vector(conv_integer(rs2) + (conv_integer(cwp) * 16), 6);
    end if;

    if (rd >= "01000" and rd <= "10111") then
      nrd <= conv_std_logic_vector(conv_integer(rd) + (conv_integer(cwp) * 16), 6);
    end if;


    --si es entrada
    if (rs1 >= "11000" and rs1 <= "11111") then
      nrs1 <= conv_std_logic_vector(conv_integer(rs1) - (conv_integer(cwp) * 16), 6);
    end if;

    if (rs2 >= "11000" and rs2 <= "11111") then
      nrs2 <= conv_std_logic_vector(conv_integer(rs2) - (conv_integer(cwp) * 16), 6);
    end if;

    if (rd >= "11000" and rd <= "11111") then
      nrd <= conv_std_logic_vector(conv_integer(rd) - (conv_integer(cwp) * 16), 6);
    end if;


    --si son globales esas siempre van a quedar en la misma parte
    if (rs1 >= "00000" and rs1 <= "00111") then
      nrs1 <= '0' & rs1;
    end if;

    if (rs2 >= "00000" and rs2 <= "00111") then
      nrs2 <= '0' & rs2;
    end if;

    if (rd >= "00000" and rd <= "00111") then
      nrd <= '0' & rd;
    end if;
end process;

end Behavioral;
