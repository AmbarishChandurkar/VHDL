----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:25 02/09/2019 
-- Design Name: 
-- Module Name:    EightTo1_MUX_usingCase - Behavioral 
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

entity EightTo1_MUX_usingCase is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;  -- Signal 'a' to 'h' are 8 Active High Data inputs
           d : in  STD_LOGIC;
           e : in  STD_LOGIC;
           f : in  STD_LOGIC;
           g : in  STD_LOGIC;
           h : in  STD_LOGIC;
           s1 : in  STD_LOGIC; -- Signals s1,s2,s3 are Active High Select Inputs
           s2 : in  STD_LOGIC;
           s3 : in  STD_LOGIC;
           En : in  STD_LOGIC; -- En is Active High Enable
           Y : out  STD_LOGIC); -- Y is Active High Output
end EightTo1_MUX_usingCase;

architecture Behavioral of EightTo1_MUX_usingCase is

begin
	process (a,b,c,d,e,f,g,h,s1,s2,s3,En)
	variable s : STD_LOGIC_VECTOR (2 downto 0); -- A Temporary Signal Vector is created for Select input
	begin													  -- Since only one identifier is allowed in Case statement
		s(0) := s1;
		s(1) := s2;
		s(2) := s3;
		if En = '1' then
			case s is
				when "000" => Y <= a; -- Different Selections for Different Select Inputs
				when "001" => Y <= b;
				when "010" => Y <= c;
				when "011" => Y <= d;
				when "100" => Y <= e;
				when "101" => Y <= f;
				when "110" => Y <= g;
				when others => Y <= h;
			end case;
		else 
			Y <= '0';
		end if;
	end process;
end Behavioral;

