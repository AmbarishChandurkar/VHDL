----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:01 01/25/2019 
-- Design Name: 
-- Module Name:    Full_adder - Beh_Full_adder 
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

entity Full_adder is
    Port ( a : in  BIT;
           b : in  BIT;
           c : in  BIT;
           Sum : out  BIT;
           Carry : out  BIT);
end Full_adder;

architecture Beh_Full_adder of Full_adder is

begin
	process(a,b,c)
	begin
		Sum <= (a xor(b xor c));
		Carry <= ((a and b) or (b and c) or (c and a));
	end process;
end Beh_Full_adder;

