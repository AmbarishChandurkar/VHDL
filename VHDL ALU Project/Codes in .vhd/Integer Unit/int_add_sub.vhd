--------------------------------------------------------------------------------------------
------------------------- COMPONENTS USED IN MAIN ARCHITECTURE------------------------------
--------------------------------------------------------------------------------------------

------------------------- 1) INTEGER ADDER SUBTRACTOR---------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AdderSubtractor is
	 generic (N : natural := 7); --This is 8 bit adder-subtractor by default
    Port ( InpA : in  UNSIGNED (N downto 0);
			  InpB : in  UNSIGNED (N downto 0);
				Opr : in STD_LOGIC := '0'; -- '0' means Add(Default) , '1' means Subtract
           Sum : out  Unsigned (N downto 0);
			  Error : out STD_LOGIC);
end AdderSubtractor;

architecture Behavioral of AdderSubtractor is

begin
	process(Opr,InpA,InpB)
	variable sum_ans : UNSIGNED (N downto 0);
	variable carry_ans : UNSIGNED (N+1 downto 0);
	variable InpBnew : UNSIGNED (N downto 0);
	begin
		carry_ans(0) := Opr; 
		
		for i in 0 to N loop
			InpBnew(i) := InpB(i) xor Opr;
			sum_ans(i) := (InpA(i) xor InpBnew(i)) xor carry_ans(i);
			carry_ans(i+1) := (InpA(i) and InpBnew(i)) or (InpA(i) and carry_ans(i)) or (InpBnew(i) and carry_ans(i));
		end loop;
		
		Error <= not((carry_ans(N) xor carry_ans(N+1)) or Carry_ans(N));
		Sum <= sum_ans;
		
	end process;

end Behavioral;