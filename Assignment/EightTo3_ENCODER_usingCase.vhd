----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:54:42 02/09/2019 
-- Design Name: 
-- Module Name:    EightTo3_ENCODER_usingCase - Behavioral 
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

entity EightTo3_ENCODER_usingCase is
    Port ( D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC; --D0 to D7 is DATA input
           D2 : in  STD_LOGIC;
           D3 : in  STD_LOGIC;
           D4 : in  STD_LOGIC;
           D5 : in  STD_LOGIC;
           D6 : in  STD_LOGIC;
           D7 : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (2 downto 0); -- Y is output Vector, All are Active High
           En : in  STD_LOGIC); --En is Enable
end EightTo3_ENCODER_usingCase;

architecture Behavioral of EightTo3_ENCODER_usingCase is

begin
process (D0,D1,D2,D3,D4,D5,D6,D7,En)
	variable D : STD_LOGIC_VECTOR (7 downto 0); -- A Temporary Signal Vector is created for Data input
	begin													  -- Since only one identifier is allowed in Case statement
		D(0) := D0;
		D(1) := D1;
		D(2) := D2;
		D(3) := D3;
		D(4) := D4;
		D(5) := D5;
		D(6) := D6;
		D(7) := D7;
		if En = '1' then
			case D is
				when "00000001" => Y <= "000";
				when "00000010" => Y <= "001";
				when "00000100" => Y <= "010";
				when "00001000" => Y <= "011";
				when "00010000" => Y <= "100";
				when "00100000" => Y <= "101";
				when "01000000" => Y <= "110";
				when "10000000" => Y <= "111";
				when others => Y <= "000";
			end case;
		else 
			Y <= "000"; -- Output when Enable is low
		end if;
	end process;

end Behavioral;

