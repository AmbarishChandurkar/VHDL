----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:41:49 02/22/2019 
-- Design Name: 
-- Module Name:    FourBitAdder - Structural 
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

entity FourBitAdder is
	 generic (N : natural := 3); 
    Port ( a : in  STD_LOGIC_VECTOR (N downto 0);
           b : in  STD_LOGIC_VECTOR (N downto 0);
           c3 : out  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (N downto 0));
end FourBitAdder;

architecture Structural of FourBitAdder is

component FA is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sumout : out  STD_LOGIC);
end component FA;

signal c : STD_LOGIC_VECTOR (N-1 downto 0);

begin
	F1 : FA port map(a(0),b(0),'0',c(0),s(0));
	F2 : FA port map(a(1),b(1),c(0),c(1),s(1));
	F3 : FA port map(a(2),b(2),c(1),c(2),s(2));
	F4 : FA port map(a(3),b(3),c(2),c3,s(3));

end Structural;

