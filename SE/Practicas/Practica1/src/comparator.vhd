----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:30:32 09/23/2021 
-- Design Name: 
-- Module Name:    comparator - comparator_arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is 
	port(
		random1, random2, random3 : in std_logic_vector(1 downto 0);
      small_reward, big_reward : out std_logic
	);
end comparator;

architecture comparator_arch of comparator is
begin	
	random_comparator: process( random1, random2, random3 )
	begin
		if (random1 = random2 and random1 = random3) then
			big_reward <= '1';
			small_reward <= '0';
		elsif (random1 = random2 or random1 = random3 or random2 = random3) then
			big_reward <= '0';
			small_reward <= '1';
		else
			big_reward <= '0';
			small_reward <= '0';
		end if;
   end process random_comparator;
end comparator_arch;

