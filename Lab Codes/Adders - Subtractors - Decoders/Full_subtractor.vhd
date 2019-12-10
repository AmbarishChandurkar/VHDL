----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:16 01/25/2019 
-- Design Name: 
-- Module Name:    Full_subtractor - Beh_Full_subtractor 
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

entity Full_subtractor is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           Difference : out  STD_LOGIC;
           Borrow : out  STD_LOGIC);
end Full_subtractor;

architecture Beh_Full_subtractor of Full_subtractor is

begin
process(a,b,c)
	begin
		Difference <= (a xor b xor c);
		Borrow <= (((not a) and (b xor c)) or (b and c));
	end process;
end Beh_Full_subtractor;

