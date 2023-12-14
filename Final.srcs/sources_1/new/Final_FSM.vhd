----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2023 03:00:39 PM
-- Design Name: 
-- Module Name: Final_FSM - Behavioral
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

entity Final_FSM is
    Port (FSMeqTarget1, SaveNum, SaveIDX, RowColSelect, CheckAns, FSMeqTarget2, FSMnotEq, FSMuartDone, clk, reset : in std_logic;
        FSMCount1, FSMLoadRow, FSMmux1Sel, FSMLoadCol, FSMmux2Sel, FSMmux3Sel, FSMWriteEn, FSMLoadVal, FSMCount3, FSMuartStart, FSMcount2 : out std_logic );
end Final_FSM;

architecture Behavioral of Final_FSM is
    type statenames is (start, increaseCount1, startSaveRow, increaseCount2, startSaveCol, WriteRAM, WaitForInput, SaveVal, Address, SaveRow, SaveCol, Compare, notEQ, SendUART, UARTdone);
    signal currentstate, nextstate : statenames;
    
--save state
begin
    process(clk, reset)
    begin
        if reset = '1' then 
            currentstate <= start;
        elsif rising_edge(clk) then 
            currentstate <= nextstate;
        end if;
    end process;
    
--find next state
    process(currentstate, FSMeqTarget1, SaveNum, SaveIDX, RowColSelect, CheckAns, FSMeqTarget2, FSMnotEq, FSMuartDone)
    begin
        case currentstate is 
            when start =>
                nextstate <= increaseCount1;
            when increaseCount1 => 
                nextstate <= startSaveRow;
            when startSaveRow =>
                nextstate <= increaseCount2;
            when increaseCount2 => 
                nextstate <= startSaveCol;
            when startSaveCol => 
                nextstate <= WriteRAM;
            when WriteRAM => 
                if FSMeqTarget1 = '1' then 
                    nextstate <= WaitForInput;
                elsif  FSMeqTarget1 = '0' then
                    nextstate <= increaseCount1;
                end if;
            when WaitForInput => 
                if SaveNum = '1' then 
                    nextstate <= SaveVal;
                elsif SaveIDX = '1' then 
                    nextstate <= Address;
                elsif checkAns = '1' then 
                    nextstate <= compare;
                else
                    nextstate <= WaitForInput;
                end if;
            when SaveVal => 
                nextstate <= WaitForInput;
            when Address =>
                if RowColSelect = '1' then 
                    nextstate <= SaveRow;
                elsif RowColSelect = '0' then 
                    nextstate <= SaveCol;
                end if;
            when SaveRow =>
                nextstate <= WaitForInput;
            when SaveCol => 
                nextstate <= WaitForInput;
            when Compare => 
                if FSMnotEq = '1' then 
                    nextstate <= notEQ;
                elsif FSMnotEq = '0' then
                    nextstate <= SendUART;
                end if;
            when notEQ => 
                nextstate <= SendUART;
            when SendUART => 
                nextstate <= UARTdone;
            when UARTdone => 
                if FSMuartDone = '0' then 
                    nextstate <= UARTdone;
                elsif FSMuartDone = '1' then 
                    nextstate <= compare;
                end if;
            when others => 
                nextstate <= start;
        end case;
    end process;
    
--output
    process(currentstate)
    begin
    --defaults
        FSMLoadRow <= '0';
        FSMLoadCol <= '0';
        FSMLoadVal <= '0';
        FSMCount1 <= '0';
        FSMCount2 <= '0';
        FSMCount3 <= '0';
        FSMWriteEn <= '0';
        FSMuartStart <= '0';
        case currentstate is 
            when increaseCount1 => 
                FSMCount1 <= '1';
            when startSaveRow => 
                FSMLoadRow <= '1';
                FSMmux1Sel <= '1';
            when increaseCount2 =>
                FSMCount1 <= '1';
            when startSaveCol => 
                FSMLoadCol <= '1';
                FSMmux1Sel <= '1';
            when WriteRAM => 
                FSMmux2Sel <= '1';
                FSMWriteEn <= '1';
            when SaveVal => 
                FSMLoadVal <= '1';
                FSMmux2Sel <= '0';
                FSMWriteEn <= '1';
            when Address => 
                FSMmux1Sel <= '0';
            when SaveRow => 
                FSMLoadRow <= '1';
            when SaveCol =>
                FSMLoadCol <= '1';
            when notEQ => 
                FSMCount3 <= '1';
            when SendUART => 
                FSMuartStart <= '1';
                FSMCount2 <= '1';
            when compare =>
                FSMmux3Sel <= '1';
            when others =>                                  
        end case;
    end process;
      


end Behavioral;
