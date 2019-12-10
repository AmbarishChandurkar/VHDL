----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:59 01/25/2019 
-- Design Name: 
-- Module Name:    Half_adder - Beh_half_adder 
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

entity Half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  Sum : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end Half_adder;

architecture Beh_half_adder of Half_adder is

begin
	process(a,b)
	begin
		Sum <= (a xor b);
		Carry <= (a and b);
	end process;
end Beh_half_adder;

architecture Conc_half_adder of Half_adder is

begin
		Sum <= (a xor b); 
		Carry <= (a and b); 
end Conc_half_adder;

