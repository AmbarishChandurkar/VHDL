----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:35:38 01/25/2019 
-- Design Name: 
-- Module Name:    Threeto8_decoder - Beh_Threeto8_decoder 
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

entity Threeto8_decoder is
    Port ( a : in STD_LOGIC ;
			  b : in STD_LOGIC ;
			  c : in STD_LOGIC ;
           Strobe : in  STD_LOGIC;
           OutputVector : out  STD_LOGIC_VECTOR(0 to 7));
end Threeto8_decoder;

architecture Beh_Threeto8_decoder of Threeto8_decoder is

begin
	process(a,b,c)
	variable abar,bbar,cbar : STD_LOGIC;
	begin
	abar := not a;
	bbar := not b;
	cbar := not c;
	if Strobe = '0' then
		OutputVector(0) <= ((abar and bbar) and cbar);
		OutputVector(1) <= ((abar and bbar) and c);
		OutputVector(2) <= ((abar and b) and cbar);
		OutputVector(3) <= ((abar and b) and c);
		OutputVector(4) <= ((a and bbar) and cbar);
		OutputVector(5) <= ((a and bbar) and c);
		OutputVector(6) <= ((a and b) and cbar);
		OutputVector(7) <= ((a and b) and c);
	else
		OutputVector <= "00000000";
	end if;
end process;
end Beh_Threeto8_decoder;