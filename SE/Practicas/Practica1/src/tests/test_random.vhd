--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:41:39 09/23/2021
-- Design Name:   
-- Module Name:   C:/Users/Victor/Desktop/newp1/p1/test_random.vhd
-- Project Name:  p1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: random_generator
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
 
ENTITY test_random IS
END test_random;
 
ARCHITECTURE behavior OF test_random IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT random_generator
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         load : IN  std_logic;
         random : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal load : std_logic := '0';

 	--Outputs
   signal random : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: random_generator PORT MAP (
          clk => clk,
          reset => reset,
          load => load,
          random => random
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '0';
      wait for clk_period*10;

      -- insert stimulus here 
		load <='1';
		wait for 20 ns;
		load <='0';
		wait for 60 ns;
		load <='1';
		wait for 50 ns;
		load <='0';
		wait for 10 ns;
		load <='1';
		wait for 30 ns;
		load <='0';
		wait for 40 ns;
		load <='1';
		wait for 30 ns;
		load <='0';

   end process;

END;
