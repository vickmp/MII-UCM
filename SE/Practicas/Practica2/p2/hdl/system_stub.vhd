-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    Clk_pin : in std_logic;
    Rst_pin : in std_logic;
    RX_pin : in std_logic;
    TX_pin : out std_logic;
    leds : inout std_logic_vector(0 to 7);
    switches : inout std_logic_vector(0 to 7)
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      Clk_pin : in std_logic;
      Rst_pin : in std_logic;
      RX_pin : in std_logic;
      TX_pin : out std_logic;
      leds : inout std_logic_vector(0 to 7);
      switches : inout std_logic_vector(0 to 7)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      Clk_pin => Clk_pin,
      Rst_pin => Rst_pin,
      RX_pin => RX_pin,
      TX_pin => TX_pin,
      leds => leds,
      switches => switches
    );

end architecture STRUCTURE;

