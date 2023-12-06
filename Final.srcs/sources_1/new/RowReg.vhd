library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RowReg is 
    port(
    in1   : in STD_LOGIC_VECTOR(0 to 2);
    load  : in STD_LOGIC;
    clr : in STD_LOGIC; 
    clk : in STD_LOGIC; 
    out1   : out STD_LOGIC_VECTOR(0 to 2) 
);
end RowReg;

architecture Behavioral OF RowReg IS

begin
    process(clk, clr)
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


