library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testMultiplier is
--  Port ( );
end testMultiplier;

architecture Behavioral of testMultiplier is

    component fullmultiplier is
    Port ( in1 : in STD_LOGIC_VECTOR (0 to 1);
           in2 : in STD_LOGIC_VECTOR (0 to 1);
           product : out STD_LOGIC_VECTOR (0 to 3)
           );
    end component;
       
    signal in1, in2: STD_LOGIC_VECTOR (0 to 1);
    signal product : std_logic_vector (0 to 3);

begin
tb: fullmultiplier port map (in1 => in1,
                             in2 => in2,
                             product => product);
process
begin
        in1 <= "00";
        in2 <= "00";
        wait for 100ns;                      

        in1 <= "00";
        in2 <= "01";
        wait for 100ns;                      

        in1 <= "01";
        in2 <= "01";
        wait for 100ns;                      

        in1 <= "01";
        in2 <= "11";
        wait for 100ns;  
        
        in1 <= "11";
        in2 <= "11";
        wait for 100ns;                              

    wait;
    end process;
end Behavioral;
