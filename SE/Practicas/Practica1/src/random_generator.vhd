----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:51:43 09/20/2021 
-- Design Name: 
-- Module Name:    random_generator - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity random_generator is
	port (
		clk : in std_logic;
		reset : in std_logic;
		load : in std_logic;
		random : out std_logic_vector(1 downto 0));
end random_generator;

architecture random_generator_arch of random_generator is
  signal rg_reg: std_logic_vector(1 downto 0);
  begin
  process(clk, reset)
  begin
    if(reset='1') then
		rg_reg <= (others=>'0');
	 elsif(clk'event and clk='1') then
	   if(load='1') then
		  random <= rg_reg;
		else
		  rg_reg(0) <= rg_reg(1);
		  rg_reg(1) <= rg_reg(0) xnor rg_reg(1);
		end if;
	 end if;
  end process;
end random_generator_arch;

