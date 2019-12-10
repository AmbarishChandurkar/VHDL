----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:34 02/09/2019 
-- Design Name: 
-- Module Name:    Threeto8_DECODER_usingCase - Behavioral 
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

entity Threeto8_DECODER_usingCase is
    Port ( D0 : in  STD_LOGIC; --D0,D1,D2 is DATA input
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (7 downto 0); -- Y is output Vector, All are Active High
           En : in  STD_LOGIC); --En is Enable
end Threeto8_DECODER_usingCase;

architecture Behavioral of Threeto8_DECODER_usingCase is

begin
process (D0,D1,D2,En)
	variable D : STD_LOGIC_VECTOR (2 downto 0); -- A Temporary Signal Vector is created for Data input
	begin													  -- Since only one identifier is allowed in Case statement
		D(0) := D0;
		D(1) := D1;
		D(2) := D2;
		if En = '1' then
			case D is
				when "000" => Y <= "00000001";
				when "001" => Y <= "00000010";
				when "010" => Y <= "00000100";
				when "011" => Y <= "00001000";
				when "100" => Y <= "00010000";
				when "101" => Y <= "00100000";
				when "110" => Y <= "01000000";
				when others => Y <= "10000000";
			end case;
		else 
			Y <= "11111111"; -- Output when Enable is low
		end if;
	end process;

end Behavioral;

