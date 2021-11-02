----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:53:37 09/23/2021 
-- Design Name: 
-- Module Name:    tragaperras - tragaperras_arch 
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

entity tragaperras is
	port(
		play_game: in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		big_reward: out std_logic;
		small_reward: out std_logic;
		num1, num2, num3: out std_logic_vector(1 downto 0)
	);
end tragaperras;

architecture tragaperras_arch of tragaperras is
	-- Components definition
	component play_states is
		port(
        clk, reset, play : in std_logic;
        load1, load2, load3, visu : out std_logic);
	end component;
	component random_generator is
		port(
			clk : in std_logic;
			reset : in std_logic;
			load : in std_logic;
			random : out std_logic_vector(1 downto 0));
	end component;
	component comparator is
		port(
			random1, random2, random3 : in std_logic_vector(1 downto 0);
			small_reward, big_reward : out std_logic);
	end component;
	-- Signals definitions
	signal ld1, ld2, ld3: std_logic;
	signal br, sr, visualize : std_logic;
   signal n1, n2, n3 : std_logic_vector(1 downto 0);
	
begin
	-- Instances definitions
	play_state_machine: play_states port map(
		play => play_game,
		clk => clk,
		reset => rst,
		load1 => ld1,
		load2 => ld2,
		load3 => ld3,
		visu => visualize );
	rg_1: random_generator port map(
		clk => clk,
		reset => rst,
		load => ld1,
		random => n1 );
	rg_2: random_generator port map(
		clk => clk,
		reset => rst,
		load => ld2,
		random => n2 );
	rg_3: random_generator port map(
		clk => clk,
		reset => rst,
		load => ld3,
		random => n3 );
	num_comparator: comparator port map(
		random1 => n1, 
		random2 => n2, 
		random3 => n3,
		small_reward => sr, 
		big_reward => br );
	-- Outputs
	num1 <= n1;
	num2 <= n2;
	num3 <= n3;
	small_reward <= sr and visualize;
	big_reward <= br and visualize;
end tragaperras_arch;