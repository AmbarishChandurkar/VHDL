----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:40:29 02/09/2019 
-- Design Name: 
-- Module Name:    Threeto8_DECODER_usingIfElse - Behavioral 
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

entity Threeto8_DECODER_usingIfElse is
    Port ( D0 : in  STD_LOGIC; --D0,D1,D2 is DATA input
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           En : in  STD_LOGIC; --En is Enable
           Y : out  STD_LOGIC_VECTOR (7 downto 0)); -- Y is output Vector, All are Active High
end Threeto8_DECODER_usingIfElse;

architecture Behavioral of Threeto8_DECODER_usingIfElse is

begin
process(En,D0,D1,D2)
		begin
			if En = '1' then
				if (D2 = '0' and D1 = '0' and D0 = '0') then
					Y <= "00000001";
				elsif (D2 = '0' and D1 = '0' and D0 = '1') then
					Y <= "00000010";
				elsif (D2 = '0' and D1 = '1' and D0 = '0') then
					Y <= "00000100";
				elsif (D2 = '0' and D1 = '1' and D0 = '1') then
					Y <= "00001000";
				elsif (D2 = '1' and D1 = '0' and D0 = '0') then
					Y <= "00010000";
				elsif (D2 = '1' and D1 = '0' and D0 = '1') then
					Y <= "00100000";
				elsif (D2 = '1' and D1 = '1' and D0 = '0') then
					Y <= "01000000";
				else
					Y <= "10000000";
				end if;
			else 
				Y <= "11111111"; -- Output when Enable is low
			end if;
	end process;
end Behavioral;