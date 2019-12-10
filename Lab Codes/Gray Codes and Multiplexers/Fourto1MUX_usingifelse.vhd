----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:47:35 02/01/2019 
-- Design Name: 
-- Module Name:    Fourto1MUX_usingifelse - Behavioral 
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

entity Fourto1MUX_usingifelse is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           E : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           y : out  STD_LOGIC);
end Fourto1MUX_usingifelse;

architecture Behavioral of Fourto1MUX_usingifelse is

begin
	process(a,b,c,d,E,s1,s2)
	begin
			if E = '1' then
				if (s2 = '0' and s1 = '0') then
					y <= a;
				elsif (s2 = '0' and s1 = '1') then
					y <= b;
				elsif (s2 = '1' and s1 = '0') then
					y <= c;
				else
					y <= d;
				end if;
			else 
				y <= '0';
			end if;
	end process;
end Behavioral;

