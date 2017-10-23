--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:07:59 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/DELL/Desktop/Processor3/Processor/windows_manager_arch_tb.vhd
-- Project Name:  Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: windows_manager_arch
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
 
ENTITY windows_manager_arch_tb IS
END windows_manager_arch_tb;
 
ARCHITECTURE behavior OF windows_manager_arch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT windows_manager_arch
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         CWP : IN  std_logic;
         nrs1 : OUT  std_logic_vector(5 downto 0);
         nrs2 : OUT  std_logic_vector(5 downto 0);
         nrd : OUT  std_logic_vector(5 downto 0);
         nCWP : OUT  std_logic;
         no7 : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal CWP : std_logic := '0';

 	--Outputs
   signal nrs1 : std_logic_vector(5 downto 0);
   signal nrs2 : std_logic_vector(5 downto 0);
   signal nrd : std_logic_vector(5 downto 0);
   signal nCWP : std_logic;
   signal no7 : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: windows_manager_arch PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          CWP => CWP,
          nrs1 => nrs1,
          nrs2 => nrs2,
          nrd => nrd,
          nCWP => nCWP,
          no7 => no7
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      rs1 <= "10000";
		rs2 <= "10001";
		rd <= "10010";
		cwp <= '0';
		op <= "10";
		op3 <="000000";
		
		wait for 20 ns;
		
		cwp <= '1';
		
		wait for 20 ns;
		
		rs1 <= "11000";
		rs2 <= "11001";
		rd <= "11010";
		
		wait for 20 ns;
		op <= "10"; 
		op3 <= "111101";
		
		wait for 20 ns;
		
		rs1 <= "00000";
		rs2 <= "00001";
		rd <= "00010";
		
		wait for 20 ns;
		
		cwp <= '1';

wait;
   end process;

END;
