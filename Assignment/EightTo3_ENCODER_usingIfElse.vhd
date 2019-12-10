----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:07:01 02/09/2019 
-- Design Name: 
-- Module Name:    EightTo3_ENCODER_usingIfElse - Behavioral 
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

entity EightTo3_ENCODER_usingIfElse is
    Port ( D0 : in  STD_LOGIC; --D0 to D7 is DATA input
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           D3 : in  STD_LOGIC;
           D4 : in  STD_LOGIC;
           D5 : in  STD_LOGIC;
           D6 : in  STD_LOGIC;
           D7 : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (2 downto 0); -- Y is output Vector, All are Active High
           En : in  STD_LOGIC); --En is Enable
end EightTo3_ENCODER_usingIfElse;

architecture Behavioral of EightTo3_ENCODER_usingIfElse is

begin
process (D0,D1,D2,D3,D4,D5,D6,D7,En)
	variable D : STD_LOGIC_VECTOR (7 downto 0); -- A Temporary Signal Vector is created for Select input
	begin													  -- This simplifies If - Else syntax
		D(0) := D0;
		D(1) := D1;
		D(2) := D2;
		D(3) := D3;
		D(4) := D4;
		D(5) := D5;
		D(6) := D6;
		D(7) := D7;
		if En = '1' then
			if (D = "00000001") then
				Y <= "000";
			elsif (D = "00000010") then
				Y <= "001";
			elsif (D = "00000100") then
				Y <= "010";
			elsif (D = "00001000") then
				Y <= "011";
			elsif (D = "00010000") then
				Y <= "100";
			elsif (D = "00100000") then
				Y <= "101";
			elsif (D = "01000000") then
				Y <= "110";
			elsif (D = "10000000") then
				Y <= "111";
			else
				Y <= "000";
			end if;
		else
			Y <= "000";
		end if;
	end process;
end Behavioral;