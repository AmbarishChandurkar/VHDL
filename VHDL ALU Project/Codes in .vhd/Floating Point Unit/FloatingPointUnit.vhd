
---------------------------------------FLOATING POINT UNIT----------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FloatingPointUnit is
    Port ( Sa : in  STD_LOGIC;
           Ea : in  UNSIGNED (2 downto 0);
           Ma : in  UNSIGNED (3 downto 0);
           Sb : in  STD_LOGIC;
           Eb : in  UNSIGNED (2 downto 0);
           Mb : in  UNSIGNED (3 downto 0);
			  AddSubtract : in STD_LOGIC;
           Sr : out  STD_LOGIC;
           Er : Buffer  UNSIGNED (2 downto 0);
           Mr : Buffer  UNSIGNED (3 downto 0);
			  ErrorFlag : out STD_LOGIC);
end FloatingPointUnit;

architecture Structural of FloatingPointUnit is

----------------------------------Component Declearations------------------------------------------
component LeadZeroDet is
    Port ( M : in  UNSIGNED (9 downto 0) :="0000000000";
			  Carry : in STD_LOGIC;
           X : out  INTEGER := 0;
           ShiftDirection : out  STD_LOGIC);
end component LeadZeroDet;

component MUX is
    Port ( Ea : in  UNSIGNED (2 downto 0);
           Eb : in  UNSIGNED (2 downto 0);
			  Sign : in STD_LOGIC := '0';
           ErTemp : out  UNSIGNED (2 downto 0));
end component MUX;

component FivetoTenBit is
    Port ( Min : in  UNSIGNED (4 downto 0);
           Mout : out  UNSIGNED (9 downto 0));
end component FivetoTenBit;

component MantissaSubtractor is
	 Port ( Ma : in  UNSIGNED (9 downto 0) := "0000000000"; --No of STD_LOGICs are : 4(Mantissa) + 1(Implied STD_LOGIC), sign STD_LOGIC is considered in sum_ans variable
			  Mb : in  UNSIGNED (9 downto 0) := "0000000000"; --Earlier was 3 downto 0
			  AddSub : in STD_LOGIC;
			  Magnitude : out  UNSIGNED (9 downto 0) := "0000000000";
			  Carry : out STD_LOGIC := '0'; -- This can be generated in case of addition of 1.Ma + 1.Mb
			  Sign : out STD_LOGIC);
end component MantissaSubtractor;

component NormaliseAndRound is
    Port ( M : in  UNSIGNED (9 downto 0);
           X : in  INTEGER := 0;
			  ShiftDirection : in STD_LOGIC := '0';
           Mr : Buffer  UNSIGNED (3 downto 0));
end component NormaliseAndRound;

component SHIFTER is
	-- generic (N : natural := 5); --This is the input size of Mantissa,Including implied bit
    Port ( Min : in  UNSIGNED (4 downto 0):= "00000"; --1.M means total 1+4 bits (1 of implied bit,and 4 of mantissa)
           Shift : in  UNSIGNED(2 downto 0) := "000"; -- since exponent are of 3bits, their differenec is also 3 bits
           Mout : out  UNSIGNED (9 downto 0) := "0000000000"); --Max shift possible is 5, so we have included them
end component SHIFTER;

component SWAP is
	 generic (N : natural := 4); --This is the input size of Mantissa,Excluding implied bit
    Port ( Ma : in  UNSIGNED (N-1 downto 0); --As per decided convention
           Mb : in  UNSIGNED (N-1 downto 0);
			  SwapIn : in STD_LOGIC;
           Mout1 : out  UNSIGNED (N downto 0); --Output size increses as we attach the implied bit here itself
			  Mout2 : out  UNSIGNED (N downto 0));
end component SWAP;

component SignMag3BitSub is
	 Port ( Ea : in  UNSIGNED (2 downto 0) := "000";
			  Eb : in  UNSIGNED (2 downto 0) := "000";
			  MagofDiff : out  UNSIGNED (2 downto 0) := "000";
			  Sign : out STD_LOGIC);
end component SignMag3BitSub;

component ControlLogic is
    Port ( Sa : in  STD_LOGIC; --Sign of FP no. a
           Sb : in  STD_LOGIC; --Sign of FP no. b
           AS : in  STD_LOGIC; --The Operation Desired by the user
           S4 : in  STD_LOGIC; --Sign of the mantissa difference
           S3 : in  STD_LOGIC; --Sign of Exponent Difference
           Sr : out  STD_LOGIC; --Sign of Final Result
			  
           AddSub : out  STD_LOGIC); --Operation signal to the mantissa adder or subtractor
end component ControlLogic;

component ExpSubtractor is
    Port ( X : in  INTEGER := 0;
			  TempEr : in UNSIGNED(2 downto 0);
			  Er : Buffer UNSIGNED (2 downto 0);
			  ShiftDirection : in STD_LOGIC);
           
end component ExpSubtractor;

component Error is
    Port ( Mr : in  UNSIGNED (3 downto 0);
           Er : in  UNSIGNED (2 downto 0);
           E : out  STD_LOGIC);
end component Error;

-------------------------------------------Component Instantiation -----------------------------------------------
signal Sign,ShiftDirection,S4,addsub,carry : STD_LOGIC := 'U';
Signal MagofDiff,erTemp : UNSIGNED(2 downto 0);
signal magnitude,Shifted_SmallerM,TenBitLargerM : UNSIGNED(9 DOWNTO 0);
signal M_with_ELarger,M_with_ESmaller : UNSIGNED(4 downto 0);
signal X:INTEGER;
begin

	ExpSub1 : SignMag3BitSub port map(Ea,Eb,MagofDiff,Sign);
	Swapper : SWAP port map(Ma,Mb,Sign,M_with_ELarger,M_with_ESmaller);
	Shiftr : SHIFTER port map(M_with_ESmaller,MagofDiff,Shifted_SmallerM);
	FivetoTenB : FivetoTenBit port map(M_with_ELarger,TenBitLargerM);
	Control : ControlLogic port map(Sa,Sb,AddSubtract,S4,Sign,Sr,AddSub);
	MantAddSub : MantissaSubtractor port map(TenBitLargerM,Shifted_SmallerM,AddSub,Magnitude,Carry,S4);
	LZD : LeadZeroDet port map(Magnitude,Carry,X,ShiftDirection);
	NormRnd : NormaliseAndRound port map(Magnitude,X,Shiftdirection,Mr);
	Mux1 : MUX port map(Ea,Eb,Sign,ErTemp);
	ExpSub2 : ExpSubtractor port map(X,ErTemp,Er,ShiftDirection);
	ErrorBlock : Error port map(Mr,Er,ErrorFlag);
	
end Structural;

