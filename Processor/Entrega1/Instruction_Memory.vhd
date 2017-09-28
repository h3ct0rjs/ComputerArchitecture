library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity IM is
    port (
		  rst  : in std_logic;
        addr : in  std_logic_vector(31 downto 0);
        data : out std_logic_vector(31 downto 0)
    );
end IM;
 
architecture behavioral of IM is
    type memoria_rom is array (0 to 63) of std_logic_vector (31 downto 0);
    signal ROM : memoria_rom := (
"00000101000111100011111001111001", 
"01111111101001001110101011000000",
"10111001010111000001010101011001",
"11011011100001011000001001010100",
"01101111010000011011010011101111",
"00001001111101111010000011000100",
"10011001001110110101011110011101",
"01000100101011000011110101010110",
"01111001110100011100111101001001",
"10001111101000011010111000001010",
"01100110110100001000110111011100",
"00001100101101000111101110100100",
"11100000011111010000010010100110",
"11010110000000000100111110010001",
"11001100100000011101111110101100",
"00011010111110110001001101100001",
"01100111011101001110011001100010",
"11001101001101010011100011110001",
"10100011011010111011000101000000",
"10010101001000101101011001010101",
"00010101000110111010010100011000",
"10101100111000000000110000000000",
"11111100010100100100100101101010",
"01001001100000100001000101111110",
"11100101111011101111111000110000",
"01110011010011001111110101001000",
"01101101100010011000000000111010",
"00000100110000011010110010111010",
"11100001100011111101010101101100",
"01010001000000111010110101000011",
"01110110111001011100111011001100",
"00101110000010000111011101110001",
"10010110100100111010100110100010",
"00111110100111111001111010010100",
"10101011010111001011110101101011",
"10000110000110101111001111110111",
"11100111000001010110000101010000",
"11110000110010100101111001001011",
"10110101100100100001110111000111",
"10001010011110001011101000001110",
"10100110011011000010111001101111",
"10101100000101000111110011011110",
"01001110010010110101001001011010",
"01000001000100001000001101110110",
"01001000101100001010001011100100",
"00110111001101001111010000011101",
"11001100101010111110101001011111",
"01010001110011110110010111111001",
"11110001110101011000011011101010",
"11100110111011000110110100111110",
"11001001010000101000101100100001",
"11000100001001100110000010011111",
"11011101001101111010111100111000",
"11100000011011111111001110011001",
"10001001111110100100000000110101",
"00000000001001100010110100011110",
"01011110110101111110110100010001",
"10100110011001101110100101011001",
"11100111001011110001101100101111",
"11010110100011001110100011111010",
"01110101010101111011111100110000",
"10101110001011001010011000000100",
"00101110110110011011111100010110",
"01100001110001001101000101111010" -- Fila con datos 56 a 63                                                  
    );
begin
	process(rst, addr)
	begin
	 if (rst = '1') then
			data <= "00000000000000000000000000000000";
		else
			data <= ROM(conv_integer(addr));
	 end if;
	end process;
end behavioral;




--from random import randint

--n = 64

--for i in xrange(n):
   -- x = randint(0, 1<<32)
    --num = str(bin(x))[2:]
    --num = (32 - len(num)) * '0' + num
    --print "\"" + num + "\","