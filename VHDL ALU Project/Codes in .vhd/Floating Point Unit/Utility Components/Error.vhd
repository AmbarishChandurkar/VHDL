
--------------------------Error Block (Detects Overflow,Underflow,Infinity or NaN)---------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Error is
    Port ( Mr : in  UNSIGNED (3 downto 0);
           Er : in  UNSIGNED (2 downto 0);
           E : out  STD_LOGIC);
end Error;

architecture Behavioral of Error is

begin
process(Mr,Er)
variable Temperr : STD_LOGIC;
	begin
		if (Er = "000" and Mr /= "0000") or (Er = "111" and Mr = "0000") or (Er = "111" and Mr /= "0000") then
			Temperr := '1';
		else
			Temperr := '0';
		end if;
		E <= Temperr;
end process;
end Behavioral;

