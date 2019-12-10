----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:01 02/01/2019 
-- Design Name: 
-- Module Name:    Fourto1MUX_usingCase - Behavioral 
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

entity Fourto1MUX_usingCase is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           E : in  STD_LOGIC;
           s1 : in STD_LOGIC;
			  s2 : in STD_LOGIC;
           y : out  STD_LOGIC);
end Fourto1MUX_usingCase;

architecture Behavioral of Fourto1MUX_usingCase is

begin
	process(a,b,c,d,s1,s2,E)
	variable s : STD_LOGIC_VECTOR (1 downto 0);
	begin
	s(0):= s1;
	s(1):= s2; 
	if E = '1' then
		case s is
			when "00" => y <= a;
			when "01" => y <= b;
			when "10" => y <= c;
			when others => y <= d;
		end case;
	else
		y <= '0';
	end if;
	end process;
end Behavioral;

