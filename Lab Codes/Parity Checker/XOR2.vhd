----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:26:27 03/08/2019 
-- Design Name: 
-- Module Name:    XOR2 - Behavioral 
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

entity XORgate2 is
    Port ( inp1 : in  STD_LOGIC;
           inp2 : in  STD_LOGIC;
           outp : out  STD_LOGIC);
end XORgate2;

architecture Behavioral of XORgate2 is

begin

	outp <= inp1 xor inp2;
end Behavioral;

