----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:01 03/15/2019 
-- Design Name: 
-- Module Name:    ShiftRegister 
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

entity ShiftRegister is
    Port ( CLK : in  BIT;
           SerialIn : in  BIT;
           ParallelOut : inout  BIT_VECTOR (3 downto 0));
end ShiftRegister;

architecture Structural of ShiftRegister is

component DFF is
    Port ( D : in  BIT;
           Clk : in  BIT;
           Q : out  BIT;
           QBAR : out  BIT);
end component;

begin
	DFF1 : DFF port map(SerialIn,Clk,ParallelOut(3),open);
	DFF2 : DFF port map(ParallelOut(3),Clk,ParallelOut(2),open);
	DFF3 : DFF port map(ParallelOut(2),Clk,ParallelOut(1),open);
	DFF4 : DFF port map(ParallelOut(1),Clk,ParallelOut(0),open);

end Structural;

