----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:28:59 03/22/2019 
-- Design Name: 
-- Module Name:    TheoryExample_IfGenerate 
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

entity TheoryExample_IfGenerate is
    Port ( clock : in  BIT;
           count : in  BIT;
           Q : inout BIT_VECTOR (0 to 3));
end TheoryExample_IfGenerate;

architecture If_gen of TheoryExample_IfGenerate is

component DFF is
    Port ( D : in  BIT;
           Clk : in  BIT;
           Q : out  BIT;
           QBAR : out  BIT);
end component;

begin

GK : for K in 0 to 3 generate
	GK0 : if K = 0 generate
		DFF1 : DFF port map(count,clock,Q(k),open);
	end generate GK0;
	
	GK3 : if K>0 generate 
		DFF3 : DFF port map (Q(k-1),clock,Q(k),open);
	end generate GK3;
end generate GK;


end If_gen;

