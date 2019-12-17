
--------------------------------Floating Point Multiplier-----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity floating_point_mul_8bit is
    Port ( a : in  unsigned(7 downto 0);
           b : in  unsigned(7 downto 0);
           prod : out  unsigned(7 downto 0);
           suc_flag : out  std_logic);
end floating_point_mul_8bit;

architecture Behavioral of floating_point_mul_8bit is

begin
	process(a,b)
	--declaring variable for each part of the floating point number
	variable sign_a,sign_b,sign_z,suc_var: std_logic;									
	variable exp_a,exp_b,exp_z: unsigned(3 downto 0);
	variable man_a,man_b: unsigned(4 downto 0);
	variable man_z: unsigned(9 downto 0);
	begin
	--checking infinite value in inputs
	if (a(6 downto 4)="111" or b(6 downto 4)="111") then
	suc_flag<='0';
	prod<="01110000";
	else
		
		--assigning value to each variable
			sign_a:=a(7);
			sign_b:=b(7);
			exp_a(2 downto 0):=a(6 downto 4);	
			exp_a(3):='0';
			exp_b(2 downto 0):=b(6 downto 4);
			exp_b(3):='0';
			man_a(3 downto 0):=a(3 downto 0);
			man_b(3 downto 0):=b(3 downto 0);
			man_a(4):='1';
			man_b(4):='1';
		--success if no one lowers success flag  
			suc_var:='1';
		
		--difference between exponents
			exp_z:=exp_a+exp_b;
			exp_z:=exp_z-"0011";
		--checking underflow
			if exp_z(3)='1' then
				suc_var:='0';
			end if;
			
		--multiplying mantissas
			man_z:=resize(man_a*man_b,10);

		--normalising
			if (man_z(9)='1') then
				man_z:=man_z srl 1;
				exp_z:=exp_z+"0001";
			end if;
			
		--raising overflow flag and lowering sucess flag	
			if (exp_z(3)='1') then
				suc_var:='0';
			end if;
			
		-- calculating sign of product
			sign_z:=sign_a xor sign_b;
			
		--Assigning final values to prod
			prod(3 downto 0)<=man_z(7 downto 4);
			prod(6 downto 4)<=exp_z(2 downto 0);
			prod(7)<=sign_z;
			suc_flag<=suc_var;
		end if;
		end process;
end Behavioral;

