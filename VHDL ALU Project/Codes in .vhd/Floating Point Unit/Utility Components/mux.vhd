
------------------------------Multiplexer (3 Bit) - chooses between Ea and Eb--------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX is
    Port ( Ea : in  UNSIGNED (2 downto 0);
           Eb : in  UNSIGNED (2 downto 0);
			  Sign : in STD_LOGIC := '0';
           ErTemp : out  UNSIGNED (2 downto 0));
end MUX;

architecture Behavioral of MUX is

begin
with Sign select
	ErTemp <= Ea when '0',
				  Eb when others;
end Behavioral;

