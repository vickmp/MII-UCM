----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:47:17 09/24/2021 
-- Design Name: 
-- Module Name:    practica1 - practica1_arch 
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

entity practica1 is
	port(
		clk_in, rst, btn : in std_logic;
		num1, num2, num3 : out std_logic_vector(1 downto 0);
		big_reward : out std_logic_vector(5 downto 0);
		small_reward: out std_logic
	);
end practica1;

architecture practica1_arch of practica1 is
	-- Components
	component divisor1 is
		 port (
			  rst: in STD_LOGIC;
			  clk_in: in STD_LOGIC;
			  clk_out: out STD_LOGIC );
	end component;

	component debouncer is
		port(
		   rst: IN std_logic;
			clk: IN std_logic;
			x: IN std_logic;
			xDeb: OUT std_logic;
			xDebFallingEdge: OUT std_logic;
			xDebRisingEdge: OUT std_logic );
	end component;
	
	component tragaperras is
		port(
			play_game: in std_logic;
			clk: in std_logic;
			rst: in std_logic;
			big_reward: out std_logic;
			small_reward: out std_logic;
			num1, num2, num3: out std_logic_vector(1 downto 0) );
	end component;
	
	-- Signals
	signal clk1hz, reset : std_logic;
	signal debounce_btn, play : std_logic;
	signal xdebfall, xdebrising : std_logic;
	signal res1, res2, res3 : std_logic_vector(1 downto 0);
	signal br_aux: std_logic;
	signal br, sr : std_logic;

begin
	-- Negate rst
	reset <= not rst; 
	-- Instances
	divis : divisor1 port map (
		rst => reset,
		clk_in => clk_in,
		clk_out => clk1hz );
	
	button_deb : debouncer port map (
		rst => reset,
		clk => clk_in,
		x => btn,
		xDeb => debounce_btn,
		xDebFallingEdge => xdebfall,
		xDebRisingEdge => xdebrising );
		
	-- Negate button input
	play <= not debounce_btn;
	
	tp: tragaperras port map (
		play_game => play,
		clk => clk_in,
		rst => reset,
		big_reward => br,
		small_reward => sr,
		num1 => res1,
		num2 => res2,
		num3 => res3 );
		
	-- Outputs
	num1 <= res1;
	num2 <= res2;
	num3 <= res3;
	-- Rewards
	small_reward <= sr and clk1hz;
	br_aux <= br and clk1hz;
	with br_aux select
		big_reward <= "111111" when '1', 
		"000000" when others;
end practica1_arch;

