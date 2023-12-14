library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TwoTo1DArray is
    Port (row : in STD_LOGIC_VECTOR (2 downto 0);
          col : in STD_LOGIC_VECTOR (2 downto 0);
          address : out STD_LOGIC_VECTOR(5 downto 0));
    
end TwoTo1DArray;

architecture Behavioral of TwoTo1DArray is

component Mult3Bit is
    Port ( in1 : in STD_LOGIC_VECTOR (2 downto 0);
           in2 : in STD_LOGIC_VECTOR (2 downto 0);
           product : out STD_LOGIC_VECTOR (5 downto 0)
           );
end component;

component Adder6Bit is
    Port ( num1 : in STD_LOGIC_VECTOR (5 downto 0);
           num2 : in STD_LOGIC_VECTOR (5 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (5 downto 0);
           Cout : out STD_LOGIC);
end component;

signal product, Col6Bit : std_logic_vector(5 downto 0);
signal Sum: std_logic_vector (2 downto 0);
signal Cout : std_logic;

begin
--Use a multiplier and adder to calculate the address in the sudoku board
--Formula: (Row*6) + Column = Address in sudoko board from 0-35.

Multiply: Mult3Bit port map (in1 => row,
                             in2 => "110", --Decimal number 6 = 110 in binary
                             product => product);

Col6Bit <= "000" & col;
Adder: Adder6Bit port map (num1 => product,
                           num2 => Col6Bit,
                           Cin => '0',
                           Sum => address,
                           Cout => Cout);


end Behavioral;
