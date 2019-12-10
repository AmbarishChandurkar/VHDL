----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:26 01/24/2019 
-- Design Name: 
-- Module Name:    basic_gate - beh_basic_gate 
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

entity basic_gate is
    Port ( A : in  STD_LOGIC; 
           B : in  STD_LOGIC;
           C : out  STD_LOGIC; -- AND Gate
           D : out  STD_LOGIC; -- OR Gate
           E : out  STD_LOGIC; -- NOT Gate
           F : out  STD_LOGIC; -- XOR Gate
           G : out  STD_LOGIC; -- XNOR Gate
           H : out  STD_LOGIC; -- NAND Gate
           I : out  STD_LOGIC); -- NOR Gate
end basic_gate;

architecture beh_basic_gate of basic_gate is

begin
	C <= (A and B);
	D <= (A or B);
	E <=  not A;
	F <= (A xor B);
	G <= (A xnor B);
	H <= (A nand B);
	I <= (A nor B);

end beh_basic_gate;

