----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:08:15 03/22/2019 
-- Design Name: 
-- Module Name:    FourBitAdderusingGenerate - Behavioral 
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

entity FourBitAdderusingGenerate is
    Port ( A : in  BIT_VECTOR (3 downto 0);
           B : in  BIT_VECTOR (3 downto 0);
           Cin : in  BIT;
           Cout : out  BIT;
           S : out  BIT_VECTOR (3 downto 0));
end FourBitAdderusingGenerate;

architecture Structural of FourBitAdderusingGenerate is


component Full_adder is
    Port ( a : in  BIT;
           b : in  BIT;
           c : in  BIT;
           Sum : out  BIT;
           Carry : out  BIT);
end component;

signal car : BIT_VECTOR (4 downto 0);

begin 
	car(0) <= Cin;
	GK : for K in 3 downto 0 generate
		FAL : Full_adder port map(car(k),A(k),B(k),S(k),car(k+1));
	end generate GK;
	Cout <= car(4);
end Structural;

