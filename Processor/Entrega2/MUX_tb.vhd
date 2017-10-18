--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:18:38 09/28/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/TEMPORAL/ALU/MUX_tb.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX
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
 
ENTITY MUX_tb IS
END MUX_tb;
 
ARCHITECTURE behavior OF MUX_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         Crs2 : IN  std_logic_vector(31 downto 0);
         SEUimm13 : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         Oper2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal SEUimm13 : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal Oper2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          Crs2 => Crs2,
          SEUimm13 => SEUimm13,
          i => i,
          Oper2 => Oper2
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Crs2 <= "00000000000000001110000000000111";
		SEUimm13 <= "00000000000000000000111010000111";
      i <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
