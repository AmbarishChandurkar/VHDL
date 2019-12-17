
------------------------------------3)	 INTEGER DIVISION----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity divison1 is
    Port ( a : in  unsigned(7 downto 0);
           b : in  unsigned(7 downto 0);
			  q : out unsigned(7 downto 0); 
--			  r : out unsigned(7 downto 0));
				suc_flag:out std_logic);
end divison1;

architecture Behave of divison1 is
--signal q : unsigned(7 downto 0) := "00000000";  ----------- quotient
--signal r : unsigned(7 downto 0) := "00000000";   ------------- remainder
begin

process(a, b)

variable s7 : unsigned(7 downto 0) := "00000000";
variable s8 : unsigned(7 downto 0) := "00000000";
variable s6 : unsigned(7 downto 0) := "00000000";
variable s3 : unsigned(7 downto 0) := "00000000";
variable m : unsigned(7 downto 0) := "00000000";
variable t : unsigned(14 downto 0) := "000000000000000";
variable check1 : STD_LOGIC;
variable check2 : STD_LOGIC;

begin

if (a(7) = '1')                   ------------------- Checking if dividend is negative or positive in 2's complement form
then
 check1 := '1';
 s3 := unsigned(a);
 s3 := not(s3);
 s3 := s3 + "00000001";
else
 check1 := '0';
 s3 := unsigned(a);  
end if;

t(6 downto 0) := (s3(6 downto 0));
t(14 downto 7) := "00000000";


if (b(7) = '1')                      ------------------- Checking if divisor is negative or positive in 2's complement form
then
 check2 := '1';
 s3 := unsigned(b);
 s3 := not(s3);
 s3 := s3 + "00000001";
else
 check2 := '0';
 s3 := unsigned(b);  
end if;

m := s3;

for k in 6 downto 0                ----------------- Division
loop
t := t sll 1;
t(14 downto 7) := t(14 downto 7) - m;

if (t(14) = '1')
then
	t(0) := '0';
	t(14 downto 7) := t(14 downto 7) + m;
else
	t(0) := '1';
end if;
end loop;

if(check1 = '0' and check2 = '0')      ---------- Making quotient negative if any of dividend and divisor is negative 
then                                   ---------- Making remainder negative if any of dividend is negative 
 s7 := t(14 downto 7);
 s6(6 downto 0) := t(6 downto 0);
 
elsif(check1 = '1' and check2 = '1')
then
 s6(6 downto 0) := t(6 downto 0);
 s3 := t(14 downto 7);
 s8 := "00000000";
 s7 := s8 - s3;
 
elsif(check1 = '1' and check2 = '0')
then
 s3(6 downto 0) := (t(6 downto 0));
 s8 := "00000000";
 s3(7) := '0';
 s6 := s8 - s3;
 s3 := (t(14 downto 7));
 s7 := s8 - s3;
 
elsif(check1 = '0' and check2 = '1')
then
 s7 := t(14 downto 7);
 s3(6 downto 0) := (t(6 downto 0));
 s3(7) := '0';
 s6 := s8 - s3;
end if;

--r  <= s7;
q <= s6;
suc_flag<='1';
end process;
end Behave;
