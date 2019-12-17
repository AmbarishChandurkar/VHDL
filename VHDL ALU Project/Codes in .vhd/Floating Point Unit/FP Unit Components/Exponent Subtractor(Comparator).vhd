---------------------------------------------------------------------------------------------------
----------------------------------COMPONENTS OF FLOATING POINT UNIT--------------------------------
---------------------------------------------------------------------------------------------------

-------------------------------Exponent Subtractor(Comparator)------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Sign Magnitude implementation
entity SignMag3BitSub is
	 Port ( Ea : in  UNSIGNED (2 downto 0) := "000";
			  Eb : in  UNSIGNED (2 downto 0) := "000";
			  MagofDiff : out  UNSIGNED (2 downto 0) := "000";
			  Sign : out STD_LOGIC);
end SignMag3BitSub;

architecture Behavioral of SignMag3BitSub is

begin
	process(Ea,Eb)
	variable sum_ans : UNSIGNED (3 downto 0) := "0000";
	variable carry_ans : UNSIGNED (4 downto 0) := "00000";
	variable Eanew : UNSIGNED (3 downto 0) := "0000"; --1 bit extra for knowing the sign
	variable Ebnew : UNSIGNED (3 downto 0) := "0000";
	variable TempOperand : UNSIGNED (3 downto 0) := "0000";
	variable TempCarry : UNSIGNED (4 downto 0) := "00001";
	begin
		carry_ans(0) := '1'; 
		Eanew(2 downto 0) := Ea; --remaining bits as usual
		Ebnew(2 downto 0) := Eb xor "111"; --2's complement of Eb. (Refer the rule of subtraction using 2's complement)
				
		for i in 0 to 3 loop
			sum_ans(i) := (Eanew(i) xor Ebnew(i)) xor carry_ans(i);
			carry_ans(i+1) := (Eanew(i) and Ebnew(i)) or (Eanew(i) and carry_ans(i)) or (Ebnew(i) and carry_ans(i));
		end loop;
		
		if sum_ans(3) = '1' then
			MagofDiff <= sum_ans(2 downto 0); --Ans is +ve, so no change
		else
			sum_ans(2 downto 0) := sum_ans(2 downto 0) xor "111"; -- Ans is -ve, so ans is 2's complement of itself
			for i in 0 to 3 loop
					TempCarry(i+1) := (sum_ans(i) and TempOperand(i)) or (sum_ans(i) and TempCarry(i)) or (TempOperand(i) and TempCarry(i));
					sum_ans(i) := (sum_ans(i) xor TempOperand(i)) xor TempCarry(i);
			end loop; -- This part is to add 1 to sum_ans in order to complete the 2's complement
			MagofDiff <= sum_ans(2 downto 0);
		end if;
		Sign <= not sum_ans(3); -- Zero is +ve, One is -ve, But in program it comes opposite
		
 end process;
end Behavioral;

