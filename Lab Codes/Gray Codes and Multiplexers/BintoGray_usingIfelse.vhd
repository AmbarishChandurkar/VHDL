----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:58 02/01/2019 
-- Design Name: 
-- Module Name:    BintoGray_usingIfelse - Behavioral 
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

entity BintoGray_usingIfelse is
    Port ( b0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           g0 : out  STD_LOGIC;
           g1 : out  STD_LOGIC;
           g2 : out  STD_LOGIC);
end BintoGray_usingIfelse;

architecture Behavioral of BintoGray_usingIfelse is

begin
	process(b0,b1,b2)
	begin
		if (b2 = '0' and b1 = '0' and b0 = '0') then
			g2 <= '0';
			g1 <= '0';
			g0 <= '0';
		elsif (b2 = '0' and b1 = '0' and b0 = '1') then
			g2 <= '0';
			g1 <= '0';
			g0 <= '1';
		elsif (b2 = '0' and b1 = '1' and b0 = '0') then
			g2 <= '0';
			g1 <= '1';
			g0 <= '1';
		elsif (b2 = '0' and b1 = '1' and b0 = '1') then
			g2 <= '0';
			g1 <= '1';
			g0 <= '0';
		elsif (b2 = '1' and b1 = '0' and b0 = '0') then
			g2 <= '1';
			g1 <= '1';
			g0 <= '0';
		elsif (b2 = '1' and b1 = '0' and b0 = '1') then
			g2 <= '1';
			g1 <= '1';
			g0 <= '1';
		elsif (b2 = '1' and b1 = '1' and b0 = '0') then
			g2 <= '1';
			g1 <= '0';
			g0 <= '1';
		elsif (b2 = '1' and b1 = '1' and b0 = '1') then
			g2 <= '1';
			g1 <= '0';
			g0 <= '0';
		end if;
end process;		
end Behavioral;

