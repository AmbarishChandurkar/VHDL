
------------------------Swapper (Identifies mantissa of smaller and larger number)-------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SWAP is
	 generic (N : natural := 4); --This is the input size of Mantissa,Excluding implied bit
    Port ( Ma : in  UNSIGNED (N-1 downto 0); --As per decided convention
           Mb : in  UNSIGNED (N-1 downto 0);
			  SwapIn : in STD_LOGIC;
           Mout1 : out  UNSIGNED (N downto 0); --Output size increses as we attach the implied bit here itself
			  Mout2 : out  UNSIGNED (N downto 0));
end SWAP;

architecture Behavioral of SWAP is

begin
	process(SwapIn)
	
	variable Manew, Mbnew : UNSIGNED(N downto 0);
	begin
		Manew(N) := '1';
		Mbnew(N) := '1'; -- Attach implied Bit at MSB
		if SwapIn = '0' then
			Manew(N-1 downto 0) := Ma; Mbnew(N-1 downto 0) := Mb;
		else
			Manew(N-1 downto 0) := Mb; Mbnew(N-1 downto 0) := Ma;
		end if;
		Mout1 <= Manew; Mout2 <= Mbnew;
	end process;
end Behavioral;

