----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:42:14 02/09/2019 
-- Design Name: 
-- Module Name:    EightTo1_MUX_usingIfElse - Behavioral 
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

entity EightTo1_MUX_usingIfElse is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           e : in  STD_LOGIC;
           f : in  STD_LOGIC;  -- Signal 'a' to 'h' are 8 Active High Data inputs
           g : in  STD_LOGIC;
           h : in  STD_LOGIC;
           s1 : in  STD_LOGIC; -- Signals s1,s2,s3 are Active High Select Inputs
           s2 : in  STD_LOGIC;
           s3 : in  STD_LOGIC;
           En : in  STD_LOGIC; -- En is Active High Enable
           Y : out  STD_LOGIC); -- Y is Active High Output
end EightTo1_MUX_usingIfElse;

architecture Behavioral of EightTo1_MUX_usingIfElse is

begin
process(a,b,c,d,e,f,g,h,En,s1,s2,s3)
	begin
			if En = '1' then
				if (s3 = '0' and s2 = '0' and s1 = '0') then
					y <= a;
				elsif (s3 = '0' and s2 = '0' and s1 = '1') then
					y <= b;
				elsif (s3 = '0' and s2 = '1' and s1 = '0') then
					y <= c;
				elsif (s3 = '0' and s2 = '1' and s1 = '1') then
					y <= d;
				elsif (s3 = '1' and s2 = '0' and s1 = '0') then
					y <= e;
				elsif (s3 = '1' and s2 = '0' and s1 = '1') then
					y <= f;
				elsif (s3 = '1' and s2 = '1' and s1 = '0') then
					y <= g;
				else
					y <= h;
				end if;
			else 
				y <= '0';
			end if;
	end process;
end Behavioral;

