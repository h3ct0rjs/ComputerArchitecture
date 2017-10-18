--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:27:44 09/28/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Procesador/Modulo5Seu/Mod5Seu_tb.vhd
-- Project Name:  Modulo5Seu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mod5Seu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
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
 
ENTITY Mod5Seu_tb IS
END Mod5Seu_tb;
 
ARCHITECTURE behavior OF Mod5Seu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mod5Seu
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         SEUimm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal SEUimm32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mod5Seu PORT MAP (
          imm13 => imm13,
          SEUimm32 => SEUimm32
        );


   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		imm13 <="0000000000010";
		wait for 100 ns;	
      -- insert stimulus here 
		imm13 <="1000000000000";
      wait;
   end process;

END;
