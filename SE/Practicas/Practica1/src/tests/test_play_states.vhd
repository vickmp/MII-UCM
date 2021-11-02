--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:47:23 09/23/2021
-- Design Name:   
-- Module Name:   C:/Users/Victor/Desktop/newp1/p1/play_test.vhd
-- Project Name:  p1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: play_states
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
 
ENTITY play_test IS
END play_test;
 
ARCHITECTURE behavior OF play_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT play_states
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         play : IN  std_logic;
         load1 : OUT  std_logic;
         load2 : OUT  std_logic;
         load3 : OUT  std_logic;
			visu: OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal play : std_logic := '0';


 	--Outputs
   signal load1 : std_logic;
   signal load2 : std_logic;
   signal load3 : std_logic;
	signal visu : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: play_states PORT MAP (
          clk => clk,
          reset => reset,
          play => play,
          load1 => load1,
          load2 => load2,
          load3 => load3,
			 visu => visu
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
      -- insert stimulus here 
		-- S0 to S1	
		wait for 100 ns;
		play <= '1';
		wait for 100 ns;
		play <= '0';
		wait for 20 ns;
		-- S1 to S2
		play <= '1';
		wait for 100 ns;
		play <= '0';
		wait for 20 ns;
		-- S2 to S0
		play <= '1';
		wait for 100 ns;
		play <= '0';
		wait for 20 ns;

   end process;

END;
