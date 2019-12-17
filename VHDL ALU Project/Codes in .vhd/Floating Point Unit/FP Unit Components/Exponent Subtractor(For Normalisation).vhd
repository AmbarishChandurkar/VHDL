
-------------------Exponent Subtractor(Used to adjust resultant exponent in case of Normalisation)-------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ExpSubtractor is
    Port ( X : in  INTEGER := 0;
			  TempEr : in UNSIGNED(2 downto 0);
			  Er : buffer UNSIGNED (2 downto 0);
			  ShiftDirection : in STD_LOGIC);
           
end ExpSubtractor;

architecture Behavioral of ExpSubtractor is

begin
process(X,TempEr,ShiftDirection)
	variable BitX : UNSIGNED (2 downto 0) := "000";
	variable sum_ans : UNSIGNED (3 downto 0) := "0000";
	variable carry_ans : UNSIGNED (4 downto 0) := "00000";
	variable Ernew : UNSIGNED (3 downto 0) := "0000"; --1 bit extra for knowing the sign
	variable Xnew : UNSIGNED (3 downto 0) := "0000";
	variable TempOperand : UNSIGNED (3 downto 0) := "0000";
	variable TempCarry : UNSIGNED (4 downto 0) := "00001";
	begin
		case X is
			when 0 => BitX := "000";
			when 1 => BitX := "001";
			when 2 => BitX := "010";
			when 3 => BitX := "011";
			when 4 => BitX := "100";
			when 5 => BitX := "101";
			when 6 => BitX := "110";
			when others => null;
		end case;	
		
		
		if ShiftDirection = '0' then -- Shift is left, so subtract
			carry_ans(0) := '1'; 
			Ernew(2 downto 0) := TempEr; --remaining bits as usual
			Xnew(2 downto 0) := BitX xor "111"; --2's complement of X. (Refer the rule of subtraction using 2's complement)
					
			for i in 0 to 3 loop
				sum_ans(i) := (Ernew(i) xor Xnew(i)) xor carry_ans(i);
				carry_ans(i+1) := (Ernew(i) and Xnew(i)) or (Ernew(i) and carry_ans(i)) or (Xnew(i) and carry_ans(i));
			end loop;
			
			if sum_ans(3) = '1' then
				Er <= sum_ans(2 downto 0); --Ans is +ve, so no change
			else
				sum_ans(2 downto 0) := sum_ans(2 downto 0) xor "111"; -- Ans is -ve, so ans is 2's complement of itself
				for i in 0 to 3 loop
						TempCarry(i+1) := (sum_ans(i) and TempOperand(i)) or (sum_ans(i) and TempCarry(i)) or (TempOperand(i) and TempCarry(i));
						sum_ans(i) := (sum_ans(i) xor TempOperand(i)) xor TempCarry(i);
				end loop; -- This part is to add 1 to sum_ans in order to complete the 2's complement
				Er <= sum_ans(2 downto 0);
			end if;
			--Sign <= not sum_ans(3); -- Zero is +ve, One is -ve, But in program it comes opposite
		
		else -- shift is right so add
			Ernew(2 downto 0) := Temper;
			Xnew(2 downto 0) := "001";
			for i in 0 to 3 loop
				sum_ans(i) := (Ernew(i) xor Xnew(i)) xor carry_ans(i);
				carry_ans(i+1) := (Ernew(i) and Xnew(i)) or (Ernew(i) and carry_ans(i)) or (Xnew(i) and carry_ans(i));
			end loop;
			Er <= sum_ans(2 downto 0);
		end if;
	end process;
end Behavioral;

