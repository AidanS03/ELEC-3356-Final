library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder3Bit is
    Port ( num1 : in STD_LOGIC_VECTOR (2 downto 0);
           num2 : in STD_LOGIC_VECTOR (2 downto 0);
           Sum : out STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC);
end Adder3Bit;

architecture Behavioral of Adder3Bit is
    component fulladder is
        Port (A : in STD_LOGIC;
              B : in STD_LOGIC;
              Cin : in STD_LOGIC;
              Sum : out STD_LOGIC;
              Cout : out STD_LOGIC);
    end component;
     
     signal tempCin: std_logic_vector (3 downto 0);
begin
    tempCin(0) <= '0';
    
    b0: fulladder port map (A => num1(0),
                            B => num2(0),
                            Cin => tempCin(0),
                            Sum => Sum(0),
                            Cout => tempCin(1));
                          
    b1: fulladder port map (A => num1(1),
                            B => num2(1),
                            Cin => tempCin(1),
                            Sum => Sum(1),
                            Cout => tempCin(2));
                            
    b2: fulladder port map (A => num1(2),
                            B => num2(2),
                            Cin => tempCin(2),
                            Sum => Sum(2),
                            Cout => tempCin(3)); 
                            
    --b3: fulladder port map (A => num1(3),
    --                       B => num2(3),
    --                        Cin => tempCin(3),
    --                        Sum => Sum(3),
    --                        Cout => tempCin(4));                                              

    Cout <= tempCin(4);
end Behavioral;
