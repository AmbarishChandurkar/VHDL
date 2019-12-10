----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:21:43 02/22/2019 
-- Design Name: 
-- Module Name:    FA - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FA is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sumout : out  STD_LOGIC);
end FA;

architecture Structural of FA is

component Half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  Sum : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end component Half_adder;

for H1,H2 : Half_adder
	use entity work.Half_adder(Beh_half_adder);

for H3 : Half_adder
	use entity work.Half_adder(Conc_half_adder);

signal c_ignore,s1,c2,c1 : STD_LOGIC;
begin
	H1 : Half_adder port map(a,b,s1,c1);
	H2 : Half_adder port map(s1,cin,sumout,c2);
	H3 : Half_adder port map(c1,c2,cout,c_ignore);
end Structural;

