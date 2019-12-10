----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:46 02/01/2019 
-- Design Name: 
-- Module Name:    Fourto1MUX_usingGates - Behavioral 
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

entity Fourto1MUX_usingGates is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           y : out  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           E : in  STD_LOGIC);
end Fourto1MUX_usingGates;

architecture Behavioral of Fourto1MUX_usingGates is

begin
process(a,b,c,d,s1,s2,E)
	variable s1bar,s2bar : STD_LOGIC;
	begin
		s1bar := not s1;
		s2bar := not s2;
		y <= ((E and s2bar and s1bar and a) or (E and s2bar and s1 and b) or (E and s2 and s1bar and c) or (E and s2 and s1 and d));
	end process;
end Behavioral;

