----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:30 02/09/2019 
-- Design Name: 
-- Module Name:    OneTo8_DEMUX_usingIfElse - Behavioral 
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

entity OneTo8_DEMUX_usingIfElse is
    Port ( Inp : in  STD_LOGIC; --'Inp' is DATA input
           En : in  STD_LOGIC; --En is Enable
           s1 : in  STD_LOGIC; 
           s2 : in  STD_LOGIC;-- s1,s2,s3 are Select Inputs
           s3 : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (7 downto 0)); -- Y is output Vector, All are Active High
end OneTo8_DEMUX_usingIfElse;

architecture Behavioral of OneTo8_DEMUX_usingIfElse is

begin
process(Inp,En,s1,s2,s3)
		begin
		Y <= "00000000"; --Initialisation of Output
			if En = '1' then
				if (s3 = '0' and s2 = '0' and s1 = '0') then
					Y(0) <= Inp;
				elsif (s3 = '0' and s2 = '0' and s1 = '1') then
					Y(1) <= Inp;
				elsif (s3 = '0' and s2 = '1' and s1 = '0') then
					Y(2) <= Inp;
				elsif (s3 = '0' and s2 = '1' and s1 = '1') then
					Y(3) <= Inp;
				elsif (s3 = '1' and s2 = '0' and s1 = '0') then
					Y(4) <= Inp;
				elsif (s3 = '1' and s2 = '0' and s1 = '1') then
					Y(5) <= Inp;
				elsif (s3 = '1' and s2 = '1' and s1 = '0') then
					Y(6) <= Inp;
				else
					Y(7) <= Inp;
				end if;
			else 
				Y <= "00000000";
			end if;
	end process;

end Behavioral;

