----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:09 02/01/2019 
-- Design Name: 
-- Module Name:    BintoGray_usingCase - Behavioral 
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

entity BintoGray_usingCase is
    Port ( b0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           g0 : out  STD_LOGIC;
           g1 : out  STD_LOGIC;
           g2 : out  STD_LOGIC);
end BintoGray_usingCase;

architecture Behavioral of BintoGray_usingCase is

begin
	process(b0,b1,b2)
	variable bin : STD_LOGIC_VECTOR (2 downto 0);
	begin
		bin(0) := b0;
		bin(1) := b1;
		bin(2) := b2;
		case bin is
			when "000" => g2 <= '0';g1 <= '0';g0 <= '0';
			when "001" => g2 <= '0';g1 <= '0';g0 <= '1';
			when "010" => g2 <= '0';g1 <= '1';g0 <= '1';
			when "011" => g2 <= '0';g1 <= '1';g0 <= '0';
			when "100" => g2 <= '1';g1 <= '1';g0 <= '0';
			when "101" => g2 <= '1';g1 <= '1';g0 <= '1';
			when "110" => g2 <= '1';g1 <= '0';g0 <= '1';
			when others => g2 <= '1';g1 <= '0';g0 <= '0';
		end case;
	end process;
end Behavioral;

