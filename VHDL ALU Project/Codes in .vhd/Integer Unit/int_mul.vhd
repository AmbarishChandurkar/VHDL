
----------------------------------------2)	INTEGER MULTIPLIER---------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--ENTITY
entity int_mul is
	generic (IN_S:NATURAL:=8-1);
	
	port(num1,num2: in unsigned(IN_S downto 0);
		
		prod:out unsigned(IN_S downto 0);
		suc_flag: out std_logic);
end int_mul;
--ARCHITECTURE
architecture Behavioral of int_mul is
signal sig:unsigned(IN_S downto 0);
begin

process(num1,num2)
	variable a,m:unsigned(IN_S-1 downto 0);
	variable mul,sum:unsigned(IN_S downto 0):="00000000";
	variable carry: std_logic;
	begin
--INITAILISING VARIABLES
		suc_flag<='1';
		a:=num1(IN_S-1 downto 0);
		m:= num2(IN_S-1 downto 0);
		for k in 0 to ((IN_S-1)) loop
			if (m(k)='1') then
				carry:='0';
--Adding each summand
				for n in 0 to (IN_S-1) loop
					sum(n):=a(n) xor (mul(n) xor carry);
					carry:=(a(n) and carry) or (mul(n) and carry) or (a(n) and mul(n));
				end loop;
			end if;
--storing the sum of each new summand
			mul:=sum;
			if carry='1' then
				suc_flag<='0';
			end if;
--SHIFTING THE OPERAND
			a:= a sll 1;
		end loop;
		sig<=mul;
--GIVING RESULT TO OUTPUT
		prod(IN_S-1 downto 0)<=mul((IN_S-1) downto 0);
		prod(IN_S)<=num1(IN_S) xor num2(IN_S);

	end process;
end Behavioral;

