
--------------------------------------Floating Point Divide Unit-----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity division2 is
    Port ( a  : in  unsigned(7 DOWNTO 0);
           b : in  unsigned(7 DOWNTO 0);
			  q : out unsigned(7 downto 0) := "00000000";
			  suc_flag: out std_logic);
end division2;

architecture Behave1 of division2 is
signal overflow,underflow: std_logic:='0';
begin
process(a, b)
variable m : unsigned(5 downto 0) := "000000";
variable n : unsigned(4 downto 0) := "00000";
variable g : unsigned(4 downto 0) := "00000";
variable exp1 : unsigned(4 downto 0) := "00000";
variable exp2 : unsigned(4 downto 0) := "00000";
variable u1 : unsigned(4 downto 0) := "00000";
variable u2 : unsigned(4 downto 0) := "00000";
variable t : unsigned(10 downto 0) := "00000000000";
variable q1 : unsigned(7 downto 0) := "00000000";
variable check1 : STD_LOGIC;
variable check2 : STD_LOGIC;
begin
 
if (a(6 downto 0) = "0000000" and b(6 downto 0) = "0000000")    ---------------- Always taking positive QNaN
then
	q1 := "01111111";
elsif (a(6 downto 0) = "0000000")                --------- Always taking positive zero
then
	q1 := "00000000";
elsif (b(6 downto 0) = "0000000")                ---------- Always taking positive infinity
then
	q1 := "01110000";
else
	exp1(2 downto 0) := unsigned(a(6 downto 4));
	exp2(2 downto 0) := unsigned(b(6 downto 4));
	u1 := exp1 - exp2;
	u2 := "00011";
	u1 := u2 + u1;
	
	if (u1(4) = '1' or u1 = "00000")
	then
		underflow <= '1';
		q1 := "00000000";
	elsif ((u1(4) = '0' and u1(3) = '1') or (u1 = "00111"))
	then
		overflow <= '1';
		q1 := "00000000";
	else 
      if(a(7) = '1')
      then
			check1 := '1';
		else
			check1 := '0';
		end if;
         t(3 downto 0) := unsigned(a(3 downto 0));
			t(10 downto 5) := "000000";
			t(4) := '1';
			
		if(b(7) = '1')
      then
			check2 := '1';
		else
			check2 := '0';
		end if;
			m(3 downto 0) := unsigned(b(3 downto 0));
			m(5 downto 4) := "01";
			
		for k in 4 downto 0
		loop
		t := t sll 1;
		t(10 downto 5) := t(10 downto 5) - m;
		if (t(10) = '1')
		then
			t(0) := '0';
			t(10 downto 5) := t(10 downto 5) + m;
		else
			t(0) := '1';
		end if;
		end loop;
		
		n := t(4 downto 0);
		g := "00001";
		
		for i in 0 to 4
      loop
			n := n sll 1;
			u1 := u1 - g; 
			if(n(4) = '1')
			then
				exit;
			end if;
		end loop;
		
		if (u1(4) = '1' or u1 = "00000")
	   then
			underflow <= '1';
			q1 := "00000000";
		elsif ((u1(4) = '0' and u1(3) = '1') or (u1 = "00111"))
		then
			overflow <= '1';
			q1 := "00000000";
		else 
			if ((check1 = '1' and check2 = '0') or (check1 = '0' and check2 = '1'))
			then
				q1(7) :=  '1';
				q1(6 downto 4) := u1(2 downto 0);
				q1(3 downto 0) := n(3 downto 0);
			else
				q1(7) :=  '0';
				q1(6 downto 4) := u1(2 downto 0);
				q1(3 downto 0) := n(3 downto 0);
			end if;
		end if;
	end if;
end if;
q <= q1;
suc_flag<=overflow or underflow;
end process;
end Behave1;
