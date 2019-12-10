----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:25:09 03/08/2019 
-- Design Name: 
-- Module Name:    ParityChecker - Behavioral 
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

entity ParityChecker is
    Port ( Even_Out : out  STD_LOGIC;
           Odd_Out : out  STD_LOGIC;
           Inp : in  STD_LOGIC_VECTOR (4 downto 0));
end ParityChecker;

architecture Behavioral of ParityChecker is

component NOT2 is
    Port ( inp : in  STD_LOGIC;
           outp : out  STD_LOGIC);
end component NOT2;

component XORgate2 is
    Port ( inp1 : in  STD_LOGIC;
           inp2 : in  STD_LOGIC;
           outp : out  STD_LOGIC);
end component XORgate2;

signal notb0,notb1,notb2,notb3,notb4,out1,out2,out3,E : STD_LOGIC;
begin

	N0 : NOT2 port map(Inp(0),notb0);
	N1 : NOT2 port map(Inp(1),notb1);
	N2 : NOT2 port map(Inp(2),notb2);
	N3 : NOT2 port map(Inp(3),notb3);
	N4 : NOT2 port map(Inp(4),notb4);
	
	X0 :  XORgate2 port map(notb0,notb1,out1);
	X1 :  XORgate2 port map(notb2,notb3,out2);
	X2 :  XORgate2 port map(out1,out2,out3);
	X3 :  XORgate2 port map(out3,notb4,Odd_Out);
	X4 :  XORgate2 port map(out3,notb4,E);
	Even_Out <= not E;

end Behavioral;

