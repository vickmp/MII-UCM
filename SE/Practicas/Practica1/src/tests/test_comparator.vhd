--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:48:07 09/23/2021
-- Design Name:   
-- Module Name:   C:/Users/Victor/Desktop/newp1/p1/test_comparator.vhd
-- Project Name:  p1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparator
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
 
ENTITY test_comparator IS
END test_comparator;
 
ARCHITECTURE behavior OF test_comparator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparator
    PORT(
         random1 : IN  std_logic_vector(1 downto 0);
         random2 : IN  std_logic_vector(1 downto 0);
         random3 : IN  std_logic_vector(1 downto 0);
         small_reward : OUT  std_logic;
         big_reward : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal random1 : std_logic_vector(1 downto 0) := (others => '0');
   signal random2 : std_logic_vector(1 downto 0) := (others => '0');
   signal random3 : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal small_reward : std_logic;
   signal big_reward : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparator PORT MAP (
          random1 => random1,
          random2 => random2,
          random3 => random3,
          small_reward => small_reward,
          big_reward => big_reward
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		random1 <= "01";
      random2 <= "11";
      random3 <= "00";
		wait for 100 ns;
		random1 <= "10";
      random2 <= "11";
      random3 <= "11";
		wait for 100 ns;
		random1 <= "11";
      random2 <= "11";
      random3 <= "11";
		wait for 100 ns;
		random1 <= "10";
      random2 <= "11";
      random3 <= "11";
		wait for 100 ns;
		random1 <= "01";
      random2 <= "11";
      random3 <= "00";
		
      -- insert stimulus here 

   end process;

END;
