
-------Contol Logic (Determines the final Sign of output and Add-subtract operation that need to be done)----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlLogic is
    Port ( Sa : in  STD_LOGIC; --Sign of FP no. a
           Sb : in  STD_LOGIC; --Sign of FP no. b
           AS : in  STD_LOGIC; --The Operation Desired by the user
           S4 : in  STD_LOGIC; --Sign of the mantissa difference
           S3 : in  STD_LOGIC; --Sign of Exponent Difference
           Sr : out  STD_LOGIC; --Sign of Final Result
           AddSub : out  STD_LOGIC); --Operation signal to the mantissa adder or subtractor
end ControlLogic;

architecture Behavioral of ControlLogic is

begin

	AddSub <= Sa xor Sb xor AS;
	Sr <= (S4 and (not Sa)) or (Sa and (not S4) and (not S3)) or (AS and (not Sb) and S4) or (Sb and (not AS) and S3);

end Behavioral;

