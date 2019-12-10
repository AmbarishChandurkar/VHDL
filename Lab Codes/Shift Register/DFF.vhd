----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:25:26 03/15/2019 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
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

entity DFF is
    Port ( D : in  BIT;
           Clk : in  BIT;
           Q : out  BIT;
           QBAR : out  BIT);
end DFF;

architecture Behavioral of DFF is

begin
	process(D,Clk)
	begin
		if (Clk'event and Clk = '1') then
			Q <= D;
			QBAR <= not D;
		else
			null;
		end if;
	end process;
end Behavioral;

