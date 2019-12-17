
-----------------------Normalise and Round (Uses IEEE Rules of Normalisation and Chopping-----------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NormaliseAndRound is
    Port ( M : in  UNSIGNED (9 downto 0);
           X : in  INTEGER := 0;
			  ShiftDirection : in STD_LOGIC := '0';
           Mr : buffer  UNSIGNED (3 downto 0));
end NormaliseAndRound;

architecture Behavioral of NormaliseAndRound is

begin
process(M,X,ShiftDirection)
	variable TempM : UNSIGNED (9 downto 0) := "0000000000";
	variable TempMM : UNSIGNED (3 downto 0);
	begin
		TempM := M;
		if ShiftDirection = '1' then -- Shift right
			TempM := M srl 1;
			TempMM := TempM(9 downto 6);
		else
			TempM := M sll X; -- Normalisation Done
			TempMM := TempM(8 downto 5); --Implied Bit Removed and Chopping also Done
		end if;
		Mr <= TempMM;		
	end process;
end Behavioral;

