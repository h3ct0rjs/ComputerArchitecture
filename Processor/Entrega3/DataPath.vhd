library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity DataPath is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Data_Out : out  STD_LOGIC_VECTOR(31 downto 0)
			  );
end DataPath;

architecture Behavioral of DataPath is

	component PC is
	
		port (
		DAT_in : in std_logic_vector (31 downto 0);
		rst 		: in std_logic;
		clk 		: in std_logic;
		DAT_out : out std_logic_vector (31 downto 0)
		);
	end component PC;
	
	component Sumador is
	
		port (
		Operador1 : in std_logic_vector (31 downto 0);
		Operador2		: in std_logic_vector (31 downto 0);
		Resultado : out std_logic_vector (31 downto 0)
		);
	end component Sumador;
	
	component IM is
    port (
		  rst  : in std_logic;
        addr : in  std_logic_vector(31 downto 0);
        data : out std_logic_vector(31 downto 0)
    );
end component IM;
	
	signal addr: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
	signal mid_addr: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
	signal new_addr: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
	signal aumento: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal instruction: std_logic_vector(31 downto 0);
begin
	
  -- Instantiate nPC
  nPC : PC
    port map (
      rst   => rst,
      clk 	=> clk,
		DAT_in => new_addr,
      DAT_out   => mid_addr
      );
	
  -- Instantiate PC
  ProgC : PC
    port map (
      rst   => rst,
      clk 	=> clk,
		DAT_in => mid_addr,
      DAT_out  => addr
      );
		
  -- Instantiate Sumador
  Adder : Sumador
    port map (
		Operador1 => addr,
		Operador2 => aumento,
      Resultado => new_addr
      );
	
   -- Instantiate IM
  Instruction_mem : IM
    port map (
		rst  => rst,
      addr => addr, 
      data => Data_out
      );
		
	process(clk) 
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				aumento <= "00000000000000000000000000000000";
			else
				aumento <= "00000000000000000000000000000001";
			end if;
		end if;
	end process;
		

end Behavioral;
