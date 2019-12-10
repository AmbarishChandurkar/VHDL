----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:28 02/09/2019 
-- Design Name: 
-- Module Name:    OneTo8_DEMUX_usingCase - Behavioral 
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

entity OneTo8_DEMUX_usingCase is
    Port ( Inp : in  STD_LOGIC; --'Inp' is DATA input
           s1 : in  STD_LOGIC; -- s1,s2,s3 are Select Inputs
           s2 : in  STD_LOGIC;
           s3 : in  STD_LOGIC;
			  En : in STD_LOGIC; --En is Enable
           Y : out  STD_LOGIC_VECTOR (7 downto 0)); -- Y is output Vector, All are Active High
end OneTo8_DEMUX_usingCase;

architecture Behavioral of OneTo8_DEMUX_usingCase is

begin
process (Inp,s1,s2,s3,En)
	variable s : STD_LOGIC_VECTOR (2 downto 0); -- A Temporary Signal Vector is created for Select input
	begin													  -- Since only one identifier is allowed in Case statement
		s(0) := s1;
		s(1) := s2;
		s(2) := s3;
		Y <= "00000000"; --Initialisation of Output
		if En = '1' then
			case s is
				when "000" => Y(0) <= Inp;
				when "001" => Y(1) <= Inp;
				when "010" => Y(2) <= Inp; --Changing the required Bit Only
				when "011" => Y(3) <= Inp;
				when "100" => Y(4) <= Inp;
				when "101" => Y(5) <= Inp;
				when "110" => Y(6) <= Inp;
				when others => Y(7) <= Inp;
			end case;
		else 
			Y <= "00000000";
		end if;
	end process;

end Behavioral;

