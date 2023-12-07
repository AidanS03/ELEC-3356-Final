----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 08:23:15 PM
-- Design Name: 
-- Module Name: 7-Seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSeg is
    Port (DisplaySelect, RowColSelect, saveNum, saveIdx, reset, clk : in std_logic; 
        numIn : in std_logic_vector(0 to 3);
        loadVal, WriteEn, Mux2Sel, Mux1Sel, loadRow, loadCol, flipDisplay : out std_logic;
        BinaryOut : out std_logic_vector(0 to 3);
        EnableLED : out std_Logic_Vector(0 to 1));
end SevenSeg;

architecture Behavioral of SevenSeg is
type statenames is (start, valueDisplay, saveValue, RowColDisplay, Row, SaveRow, Col, SaveCol);
signal currentState, nextState : statenames;
signal tempNum : std_logic_vector(0 to 3);

--save state
begin
    process(reset, clk)
    begin
        if reset = '1' then 
            currentState <= start;
        elsif rising_edge(clk) then 
            currentState <= nextState;
        end if;
    end process;
        
--find next state
    process(currentState, DisplaySelect, RowColSelect, saveIdx, saveNum)
    begin
        case currentState is
            when start => 
                if DisplaySelect = '1' then 
                    nextstate <= valueDisplay;
                elsif DisplaySelect = '0' then
                    nextstate <= RowColDisplay;
                else
                    nextstate <= start;
                end if;
            when valueDisplay => 
                if saveNum = '1' then 
                    nextstate <= valueDisplay;
                elsif DisplaySelect = '0' then
                    nextstate <= RowColDisplay;
                elsif DisplaySelect = '1' then
                    nextstate <= saveValue;
                else
                    nextstate <= valueDisplay;
                end if;
            when SaveValue => 
                if DisplaySelect = '1' then 
                    nextstate <= valueDisplay;
                elsif DisplaySelect = '0' then
                    nextstate <= RowColDisplay;
                else
                    nextstate <= SaveValue;
                end if;
            when RowColDisplay =>
                if DisplaySelect = '0' then
                    if RowColSelect = '0' then 
                        nextstate <= Row;
                    elsif ROwColSelect = '1' then 
                        nextstate <= Col;
                    else
                        nextstate <= RowColDisplay;
                    end if;
                elsif DisplaySelect = '1' then
                    nextstate <= valueDisplay;
                end if;
            when Row => 
                if saveIdx = '1' then 
                    nextstate <= saveRow;
                elsif RowColSelect = '1' then 
                    nextstate <= Row;
                elsif RowColSelect = '0' then 
                    nextstate <= Col;
                else
                    nextstate <= Row;
                end if;
            when Col => 
                if saveIdx = '1' then 
                    nextstate <= saveCol;
                elsif RowColSelect = '1' then 
                    nextstate <= Row;
                elsif RowColSelect = '0' then 
                    nextstate <= Col;
                else
                    nextstate <= Col;
                end if;
            when saveRow => 
                if RowColSelect = '1' then 
                    nextstate <= Row;
                elsif RowColSelect = '0' then
                    nextstate <= Col;
                else
                    nextstate <= saveRow;
                end if;
            when saveCol => 
                if RowColSelect = '1' then 
                    nextstate <= Row;
                elsif RowColSelect = '0' then
                    nextstate <= Col;
                else
                    nextstate <= saveCol;
                end if;   
        end case;
    end process;

    --output
    process(currentstate)
    begin
        loadVal <= '0';
        loadRow <= '0';
        loadCol <= '0';
        WriteEn <= '0';
        Mux2Sel <= '1';
        Mux1Sel <= '1';
        BinaryOut <= numIn;
        EnableLED <= "11";
        case currentstate is
            when saveValue => 
                BinaryOut <= numIn;
                loadVal <= '1';
                WriteEn <= '1';
                Mux2Sel <= '1';                
        end case;
    end process;
end Behavioral;
