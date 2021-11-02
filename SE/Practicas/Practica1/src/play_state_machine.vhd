library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity play_states is 
    port(
        clk, reset, play : in std_logic;
        load1, load2, load3, visu : out std_logic
    ); 
end play_states;

architecture play_states_arch of play_states is
   type states is (S0, S1, S2);
   signal currentState: states;
	signal aux_play: std_logic;
	begin
	-- State machine
	stateControler: process(clk, reset, play)
	begin
		if (reset = '1') then
			aux_play <= '0';
			currentState <= S0;
			visu <= '0';
      elsif (clk'event and clk='1') then
			-- handle states
			case currentState is 
				when S0 =>
					if (play='1' and aux_play='0') then
						currentState <=S1;
						visu <= '0';
					else 
						currentState <=S0;
					end if;
				when S1 =>
					if (play='1' and aux_play='0') then
						currentState <=S2;
					else 
						currentState <=S1;
					end if; 
				when S2 =>
					if (play='1' and aux_play='0') then
						currentState <=S0;
						visu <= '1';
					else 
						currentState <=S2;
					end if; 
			end case;
			-- avoid long press time
			if (play = '1') then
				aux_play <= '1';
			else
				aux_play <= '0';
			end if;
		end if;
	end process stateControler;
	-- Outputs
	load1 <= '1' when currentState=S0 and play='1' and aux_play='0' else '0';
	load2 <= '1' when currentState=S1 and play='1' and aux_play='0' else '0';
	load3 <= '1' when currentState=S2 and play='1' and aux_play='0' else '0';
end play_states_arch;