
-------------------Leading Zeros detector(Finds any zeros between binary point and first 1---------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LeadZeroDet is
    Port ( M : in  UNSIGNED (9 downto 0) :="0000000000";
			  Carry : in STD_LOGIC;
           X : out  INTEGER := 0;
           ShiftDirection : out  STD_LOGIC);
end LeadZeroDet;

architecture Behavioral of LeadZeroDet is

begin
process(M,Carry)
	variable LeadZeros : INTEGER := 0;
	variable TempM : UNSIGNED (9 downto 0) :="0000000000"; 
	begin
	TempM := M;
	if Carry = '1' then --1.Ma + 1.Mb case
		X <= 1;
		Shiftdirection <= '1';
	else
		if M(9 downto 0) = "0000000000" then
			LeadZeros := 10;
		elsif M(9 downto 1) = "000000000" then
			LeadZeros := 9;
		elsif M(9 downto 2) = "00000000" then
			LeadZeros := 8;
		elsif M(9 downto 3) = "0000000" then
			LeadZeros := 7;
		elsif M(9 downto 4) = "000000" then
			LeadZeros := 6;
		elsif M(9 downto 5) = "00000" then
			LeadZeros := 5;
		elsif M(9 downto 6) = "0000" then
			LeadZeros := 4;
		elsif M(9 downto 7) = "000" then
			LeadZeros := 3;
		elsif M(9 downto 8) = "00" then
			LeadZeros := 2;
		elsif M(9) = '0' then
			LeadZeros := 1;
		else
	      LeadZeros := 0;
		end if;
		X <= LeadZeros;
		Shiftdirection <= '0';
	end if;
	end process;
end Behavioral;

