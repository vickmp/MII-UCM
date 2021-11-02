library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.ALL;

entity divisor1 is
    port (
        rst: in STD_LOGIC;
        clk_in: in STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end divisor1;

architecture divisor1_arch of divisor1 is
  -- Señales internas
  SIGNAL cuenta: std_logic_vector(26 downto 0);
  SIGNAL clk, clk_aux: std_logic;
  begin
  -- Asignacion
  clk <= clk_in;
  clk_out <= clk_aux;
  -- Divisor
  contador: PROCESS( rst, clk )
  BEGIN
    IF (rst='1') THEN
		clk_aux <= '0';
      cuenta<= (OTHERS=>'0');
	 ELSIF(clk'EVENT AND clk='1') THEN
      IF (cuenta="101111101011110000100000000") THEN
        clk_aux <= not clk_aux;
        cuenta<= (OTHERS=>'0');
      ELSE
        cuenta <= cuenta+'1';
      END IF;
    END IF;
  END PROCESS contador;
end divisor1_arch;