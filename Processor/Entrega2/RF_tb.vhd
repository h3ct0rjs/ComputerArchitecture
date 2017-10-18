LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY RF_tb IS
END RF_tb;
ARCHITECTURE behavior OF RF_tb IS 
    COMPONENT RF
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Rst : IN  std_logic;
         Dwr : IN  std_logic_vector(31 downto 0);
         ORs1 : OUT  std_logic_vector(31 downto 0);
         ORs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Rst : std_logic := '0';
   signal Dwr : std_logic_vector(31 downto 0) := (others => '0');

 	
   signal ORs1 : std_logic_vector(31 downto 0);
   signal ORs2 : std_logic_vector(31 downto 0);
BEGIN
   uut: RF PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Rst => Rst,
          Dwr => Dwr,
          ORs1 => ORs1,
          ORs2 => ORs2
        );
   stim_proc: process
   begin
		Dwr <= "00000000000000000000000000001000";
		Rd <= "00011";
	   
		rs1 <= "00011";
		rs2 <= "00010";
		
		wait for 30 ns;
		
		rs1 <= "10000";
		rs2 <= "10001";
		
		wait for 30 ns;   
	end process;
END;
