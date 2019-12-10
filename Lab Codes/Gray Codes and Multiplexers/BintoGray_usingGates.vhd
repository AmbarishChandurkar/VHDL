----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:34:19 02/01/2019 
-- Design Name: 
-- Module Name:    BintoGray_usingGates - Behavioral 
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

entity BintoGray_usingGates is
    Port ( b0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           g0 : out  STD_LOGIC;
           g1 : out  STD_LOGIC;
           g2 : out  STD_LOGIC);
end BintoGray_usingGates;

architecture Behavioral of BintoGray_usingGates is

begin
	process(b0,b1,b2)
	begin
		g2 <= b2;
		g1 <= b2 xor b1;
		g0 <= b1 xor b0;
	end process;
end Behavioral;

