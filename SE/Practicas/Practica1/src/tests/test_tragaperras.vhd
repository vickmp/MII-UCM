--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:20:44 09/24/2021
-- Design Name:   
-- Module Name:   C:/Users/Victor/Desktop/newp1/p1/tragaperras_test2.vhd
-- Project Name:  p1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tragaperras
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
 
ENTITY tragaperras_test IS
END tragaperras_test;
 
ARCHITECTURE behavior OF tragaperras_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tragaperras
    PORT(
         play_game : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         big_reward : OUT  std_logic;
         small_reward : OUT  std_logic;
         num1 : OUT  std_logic_vector(1 downto 0);
         num2 : OUT  std_logic_vector(1 downto 0);
         num3 : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal play_game : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';

 	--Outputs
   signal big_reward : std_logic;
   signal small_reward : std_logic;
   signal num1 : std_logic_vector(1 downto 0);
   signal num2 : std_logic_vector(1 downto 0);
   signal num3 : std_logic_vector(1 downto 0);
	
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tragaperras PORT MAP (
          play_game => play_game,
          clk => clk,
          rst => rst,
          big_reward => big_reward,
          small_reward => small_reward,
          num1 => num1,
          num2 => num2,
          num3 => num3
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
		rst <= '0';

      wait for clk_period*20;

      -- insert stimulus here 
		play_game <= '1';
		wait for clk_period*18;
		play_game <= '0';
		wait for clk_period*10;
      play_game <= '1';
		wait for clk_period*8;
		play_game <= '0';
		wait for clk_period*30;
      play_game <= '1';
		wait for clk_period*12;
		play_game <= '0';
   end process;

END;
