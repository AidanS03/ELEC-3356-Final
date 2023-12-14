library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Register3bit is 
    port(
    in1   : in STD_LOGIC_VECTOR(0 to 2);
    load  : in STD_LOGIC;
    clr : in STD_LOGIC; 
    clk : in STD_LOGIC; 
    out1   : out STD_LOGIC_VECTOR(0 to 2));
end Register3bit;

architecture Behavioral of Register3bit is

begin
    process(clk)
    begin
        if clr = '1' then
            out1 <= "000";
        elsif rising_edge(clk) then
            if load = '1' then
                out1 <= in1;
            end if;
        end if;
    end process;
end Behavioral;


