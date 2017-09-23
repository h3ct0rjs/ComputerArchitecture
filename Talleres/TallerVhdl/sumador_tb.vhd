--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- Create Date:   16:32:32 09/21/2017
-- Project Name:  Tarea
-- VHDL Test Bench Created by ISE for module: sumador
-- Dependencies:
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sumador_tb IS
END sumador_tb;
 
ARCHITECTURE behavior OF sumador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador
    PORT(
         value1 : IN  std_logic_vector(31 downto 0);
         value2 : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal value1 : std_logic_vector(31 downto 0) := (others => '0');
   signal value2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          value1 => value1,
          value2 => value2,
          result => result
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		value1 <= "00000000000000000000000000000100";
		value2 <= "00000000000000001110000000000111";
      -- insert stimulus here 

      wait;
   end process;

END;
