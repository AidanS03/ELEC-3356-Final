library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullmultiplier is
    Port ( in1 : in STD_LOGIC_VECTOR (0 to 1);
           in2 : in STD_LOGIC_VECTOR (0 to 1);
           product : out STD_LOGIC_VECTOR (0 to 3)
           );
end fullmultiplier;

architecture Behavioral of fullmultiplier is

begin

   product(0) <= in1(0) and in2(0);

   product(1) <= (in1(0) and in2(1)) xor (in1(1) and in2(0));
    
   product(2) <= ((in1(0) and in2(1)) and (in1(1) and in2(0))) xor (in1(1) and in2(1));
   
   product(3)<= ((in1(0) and in2(1)) and (in1(1) and in2(0))) and (in1(1) and in2(1));



end Behavioral;
