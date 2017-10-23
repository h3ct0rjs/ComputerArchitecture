--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:31:23 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/DELL/Desktop/Processor3/Processor/MUX_wm_tb.vhd
-- Project Name:  Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_wm
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
 
ENTITY MUX_wm_tb IS
END MUX_wm_tb;
 
ARCHITECTURE behavior OF MUX_wm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_wm
    PORT(
         RDin : IN  std_logic_vector(5 downto 0);
         o15 : IN  std_logic_vector(5 downto 0);
         RFDest : IN  std_logic;
         nRD : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RDin : std_logic_vector(5 downto 0) := (others => '0');
   signal o15 : std_logic_vector(5 downto 0) := (others => '0');
   signal RFDest : std_logic := '0';

 	--Outputs
   signal nRD : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_wm PORT MAP (
          RDin => RDin,
          o15 => o15,
          RFDest => RFDest,
          nRD => nRD
        );
 
   -- Stimulus process
   stim_proc: process
   begin
		RFDest <= '1';
		RDin <= "010000";
		o15 <= "010001";
		
		wait for 20 ns;
		RFDest <= '0';
		RDin <= "010010";
		o15 <= "010011";
		
		
      wait;
   end process;

END;
