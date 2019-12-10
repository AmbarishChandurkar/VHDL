----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:32:13 04/12/2019 
-- Design Name: 
-- Module Name:    ThreeInpMajGate - Behavioral 
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

entity ThreeInpMajGate is
    Port ( Input : in  STD_LOGIC_VECTOR (2 downto 0);
           Output : out  STD_LOGIC);
end ThreeInpMajGate;

architecture Behavioral of ThreeInpMajGate is

begin
	process(Input)
	variable TempOut : STD_LOGIC;
	begin
		case Input is
			when "000" => TempOut := '0';
			when "001" => TempOut := '0';
			when "010" => TempOut := '0';
			when "011" => TempOut := '1';
			when "100" => TempOut := '0';
			when "101" => TempOut := '1';
			when "110" => TempOut := '1';
			when others => TempOut := '1';
		end case;
		Output <= TempOut;
	end process;
end Behavioral;