library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TopModule is
    Port ( boardSW : in STD_LOGIC_VECTOR(0 to 3);
           pmodSW : STD_LOGIC_VECTOR(0 to 3);
           buttonIn : in STD_LOGIC_VECTOR(0 to 2);
           CLK12MHZ, rst : in std_logic;
           outLED : out STD_LOGIC_VECTOR(0 to 3);
           seg7Out : out STD_LOGIC_VECTOR(0 to 2);
           outST, txBit : out STD_LOGIC);
           
end TopModule;

architecture Behavioral of TopModule is

component Data_Path is
    Port (BoardSwitch, ModuleSwitch : in std_logic_vector(0 to 2);
         saveNumber, saveIndex, checkAns, FSMWriteEn, CLK12MHZ, FSMmux3Sel, FSMmux2Sel, FSMmux1Sel, FSMSendUART, FSMCount1 : in std_logic;
         FSMloadRow, FSMloadCol, FSMloadVal, reset, FSMCount2, FSMCount3, ValAddSelect : in std_logic;
         LEDout : out std_logic_vector(0 to 3);
         To7Seg : out std_logic_vector(0 to 2);
         TxOut, FSMuartDone, ST, FSMeqTarget1, FSMeqTarget2, FSMNotEq : out std_logic);
end component;        

component Final_FSM is
    Port (FSMeqTarget1, SaveNum, SaveIDX, RowColSelect, CheckAns, FSMeqTarget2, FSMnotEq, FSMuartDone, clk, reset : in std_logic;
        FSMCount1, FSMLoadRow, FSMmux1Sel, FSMLoadCol, FSMmux2Sel, FSMmux3Sel, FSMWriteEn, FSMLoadVal, FSMCount3, FSMuartStart, FSMcount2 : out std_logic );
end component;

signal innerCount1, innerLoadRow, innermux1Sel, innerLoadCol, innermux2Sel, innerWriteEn, innerLoadVal, innerCount3, inneruartStart, innercount2, innerMUX3Sel, innerSendUART, innerUARTdone : std_logic;
signal innereqTarget1, innereqTarget2, innereqTarget3, innerNotEQ : std_logic;

begin
dataPath : Data_Path port map(BoardSwitch => boardSW(0 to 2), 
    ModuleSwitch => pmodSW(0 to 2), 
    saveNumber => buttonIn(0), 
    saveIndex => buttonIn(1), 
    checkAns => buttonIn(2), 
    FSMWriteEn => innerWriteEn, 
    CLK12MHZ => CLK12MHZ, 
    FSMmux3Sel => innerMUX3Sel, 
    FSMmux2Sel => innermux2Sel, 
    FSMmux1Sel => innermux1Sel, 
    FSMSendUART => innerSendUART, 
    FSMloadRow => innerLoadRow, 
    FSMloadCol => innerLoadCol, 
    FSMloadVal => innerLoadVal, 
    reset => rst,
    LEDout => outLED, 
    To7Seg => seg7Out, 
    txOut => txBit, 
    FSMuartDone => innerUARTdone, 
    ST => outST, 
    FSMeqTarget1 => innereqTarget1, 
    FSMeqTarget2 => innereqTarget2, 
    FSMNotEq => innerNotEq, 
    FSMCount1 => innerCount1,
    FSMCount2 => innerCount2,
    FSMCount3 => innerCount3, 
    ValAddSelect => pmodSW(3));
    
FSM : Final_FSM port map(FSMeqTarget1 => innereqTarget1, 
    SaveNum => buttonIn(0), 
    SaveIDX => buttonIn(1), 
    CheckAns => buttonIn(2), 
    RowColSelect => boardSW(3), 
    FSMeqTarget2 => innereqTarget2, 
    FSMnotEq => innerNotEq, 
    FSMuartDone => innerUARTdone, 
    clk => CLK12MHZ, 
    reset => rst, 
    FSMCount1 => innerCount1, 
    FSMLoadRow => innerLoadRow, 
    FSMmux1Sel => innermux1Sel, 
    FSMLoadCol => innerLoadCol, 
    FSMmux2Sel => innermux2Sel, 
    FSMWriteEn => innerWriteEn, 
    FSMLoadVal => innerLoadVal, 
    FSMCount3 => innerCount3, 
    FSMuartStart => innerSendUART, 
    FSMcount2 => innerCount2, 
    FSMmux3Sel => innerMUX3Sel);

end Behavioral;
