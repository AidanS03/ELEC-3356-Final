library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mult3Bit is
    Port ( in1 : in STD_LOGIC_VECTOR (2 downto 0);
           in2 : in STD_LOGIC_VECTOR (2 downto 0);
           product : out STD_LOGIC_VECTOR (5 downto 0)
           );
end Mult3Bit;

architecture Behavioral of Mult3Bit is

component Adder3Bit is
    Port ( num1 : in STD_LOGIC_VECTOR (2 downto 0);
           num2 : in STD_LOGIC_VECTOR (2 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC);
end component;

    signal sum1, sum2 : std_logic_vector(2 downto 0);
    signal cout1, cout2, a2, a1, a0, b2, b1, b0, aa2, aa1, aa0, bb2, bb1, bb0  : std_logic;

begin

product(0) <= in1(0) and in2(0);
a2 <= (in1(2) and in2(1));
a1 <= (in1(1) and in2(1));
a0 <= (in1(0) and in2(1));
b2 <= '0';
b1 <= (in1(2) and in2(0));
b0 <= (in1(1) and in2(0)); 

Adder1: Adder3Bit port map (num1(2) => a2,
                            num1(1) => a1,
                            num1(0) => a0,
                            num2(2) => b2,
                            num2(1) => b1,
                            num2(0) => b0,
                            Cin => '0',
                            Sum => sum1,
                            Cout => cout1);

aa2 <= (in1(2) and in2(2));
aa1 <= (in1(1) and in2(2));
aa0 <= (in1(0) and in2(2));
bb2 <= cout1;
bb1 <= sum1(2);
bb0 <= sum1(1);
 
Adder2: Adder3Bit port map (num1(2) => aa2,
                            num1(1) => aa1,
                            num1(0) => aa0,
                            num2(2) => bb2,
                            num2(1) => bb1,
                            num2(0) => bb0,
                            Cin => cout1,
                            Sum => sum2,
                            Cout => product(5));

product(1) <= sum1(0);
product(2) <= sum2(0);
product(3) <= sum2(1);
product(4) <= sum2(2);


end Behavioral;