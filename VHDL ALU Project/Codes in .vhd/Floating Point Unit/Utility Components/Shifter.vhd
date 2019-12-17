
--------------Shifter (Adjusts the binary point according to the Exponents)--------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SHIFTER is
	 --generic (N : natural := 5); --This is the input size of Mantissa,Including implied bit
    Port ( Min : in  UNSIGNED (4 downto 0):= "00000"; --1.M means total 1+4 bits (1 of implied bit,and 4 of mantissa)
           Shift : in  UNSIGNED(2 downto 0) := "000"; -- since exponent are of 3bits, their differenec is also 3 bits
           Mout : out  UNSIGNED (9 downto 0) := "0000000000"); --Max shift possible is 5, so we have included them
end SHIFTER;

architecture Behavioral of SHIFTER is

begin
process(Shift,Min)
	variable ShiftInt : INTEGER range 0 to 5;
	variable Min_new : UNSIGNED (9 downto 0) := "0000000000"; --Max shift possible is 5, so we have included them
	variable Shifted : UNSIGNED (9 downto 0) := "0000000000";
	begin
		case Shift is -- Select appropriate number of shift in integer
			when "000" => ShiftInt := 0;
			when "001" => ShiftInt := 1;
			when "010" => ShiftInt := 2;
			when "011" => ShiftInt := 3;
			when "100" => ShiftInt := 4;
			when "101" => ShiftInt := 5;
			when others => null;
		end case;
			for i in 9 downto 5 loop --First make all Bits to zero
				Min_new(i) := Min(i-5);
			end loop;
			--Min_new(9 downto 5) := Min(4 downto 0); -- For N=5, Min_new(9 downto 5) := Min(4 downto 0)
																							  -- We equate first 5 bits of min to Shiftable Min_new
			Shifted := Min_new srl ShiftInt; -- Shift right by required no. of shifts
			Mout <= Shifted;
	end process;
end Behavioral;

