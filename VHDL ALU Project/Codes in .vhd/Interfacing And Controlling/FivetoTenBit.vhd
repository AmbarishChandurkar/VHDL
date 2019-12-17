
-----Five to Ten Bit Converter : (Appends zeros to the mantissa to make them 10 bit long)-------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FivetoTenBit is
    Port ( Min : in  UNSIGNED (4 downto 0);
           Mout : out  UNSIGNED (9 downto 0));
end FivetoTenBit;

architecture Behavioral of FivetoTenBit is

begin
process(Min)
	
	variable Min_new : UNSIGNED (9 downto 0); 
	begin
		for i in 0 to 9 loop --First make all Bits to zero
				Min_new(i) := '0';
		end loop;
			Min_new(9 downto 5) := Min; 
			Mout <= Min_new; 
	end process;
end Behavioral;

