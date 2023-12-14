----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 01:24:57 PM
-- Design Name: 
-- Module Name: Data_Path - Behavioral
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

entity Data_Path is
    Port (BoardSwitch, ModuleSwitch : in std_logic_vector(0 to 2);
         saveNumber, saveIndex, checkAns, FSMWriteEn, CLK12MHZ, FSMmux3Sel, FSMmux2Sel, FSMmux1Sel, FSMSendUART, FSMCount1 : in std_logic;
         FSMloadRow, FSMloadCol, FSMloadVal, reset, FSMCount2, FSMCount3, ValAddSelect : in std_logic;
         LEDout : out std_logic_vector(0 to 3);
         To7Seg : out std_logic_vector(0 to 2);
         TxOut, FSMuartDone, ST, FSMeqTarget1, FSMeqTarget2, FSMNotEq : out std_logic);
end Data_Path;

architecture Behavioral of Data_Path is

component RAM is
    Port (address : in std_logic_vector(0 to 5); 
        dataIn : in std_logic_vector(0 to 2);
        writeEN : in std_logic;
        clk : in std_logic;
        dataOut : out std_logic_vector(0 to 7));
end component;

component ROM_Solution is
    Port (address : in std_logic_vector(0 to 5 );
        dataOut : out std_logic_vector(0 to 2));
end component;

component ROM_Start is
    Port (address : in std_logic_vector(0 to 4);
        dataOut : out std_logic_vector(0 to 2));
end component;

component MUX is
    Port (Num1 : in std_logic_vector(0 to 2);
        Num2 : in std_logic_vector(0 to 2);
        MUXselect : in std_logic;
        Output : out std_logic_vector(0 to 2));
end component;

component uart is
    port(clk_100mhz : in std_logic;
           reset : in std_logic;
           uart_start : in std_logic;
           data_to_send : in std_logic_vector(7 downto 0);
           uart_done : out std_logic;
           txbit : out std_logic);
end component;

component Register3bit is 
    port(in1   : in STD_LOGIC_VECTOR(0 to 2);
        load  : in STD_LOGIC;
        clr : in STD_LOGIC; 
        clk : in STD_LOGIC; 
        out1   : out STD_LOGIC_VECTOR(0 to 2));
end component;

component Full7Seg is
    Port (Row, Col : in std_logic_vector(0 to 2);
        Val : in std_logic_vector(0 to 7);
        clk, SevenSegSelect : in std_logic;
        SegInput : out std_logic_vector(0 to 2);
        ST : out std_logic );
end component;

component counter21 is
    Port (clk : in std_logic;
        rst : in std_logic;
        output : out std_logic_vector(0 to 4);
        FSMTF : out std_logic);
end component;

component counter36 is
    Port (clk : in std_logic;
        rst : in std_logic;
        output : out std_logic_vector(0 to 5);
        FSMTF : out std_logic );
end component;

component Adder8Bit is
    Port ( num1 : in STD_LOGIC_VECTOR (7 downto 0);
           num2 : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (7 downto 0);
           Cout : out STD_LOGIC);
end component;

component TwoTo1DArray is
    Port (row : in STD_LOGIC_VECTOR (2 downto 0);
          col : in STD_LOGIC_VECTOR (2 downto 0);
          address : out STD_LOGIC_VECTOR(5 downto 0));    
end component;

component compare is
  Port (RAMin : in std_logic_vector(7 downto 0);
    ROMin : in std_logic_vector(2 downto 0);
    tf : out std_logic);
end component;

component Hz60Clock is
    Port (MHz12Clk : in std_logic;
        Hz60Clk : out std_logic );
end component;

component MUX6Bit is
    Port (Num1 : in std_logic_vector(0 to 5);
        Num2 : in std_logic_vector(0 to 5);
        MUXselect : in std_logic;
        Output : out std_logic_vector(0 to 5));
end component;

component Counter15 is
    Port (clk : in std_logic;
        rst : in std_logic;
        output : out std_logic_vector(0 to 3);
        FSMTF : out std_logic); --output of One Shot Counter to see if it hit its numerical value limit, then reset when it does 
end component;

signal OneDOut, Counter2Out, MUX3Out : std_logic_vector(0 to 5);
signal ASCIIOut, RAMout : std_logic_vector(7 downto 0);
signal Counter1Out : std_logic_vector(0 to 4);
signal Mux2Out, ValRegOut, Mux1Out, RowRegOut, ColRegOut, StartROMout, SolROMout : std_logic_vector(0 to 2);
Signal trash, Clk60Hz : std_logic;

begin

GameRAM : RAM port map (address => MUX3Out,
    dataIn => Mux2Out,
    writeEn => FSMWriteEN,
    clk => Clk60Hz,
    dataOut => RAMout);
    
SolutionROM : ROM_Solution port map (address => MUX3Out,
    dataOut => SolROMout);
    
StartROM : ROM_Start port map (address => Counter1Out, 
    dataOut => StartROMout);
    
ValRomMUX : MUX port map (num1 => ValRegOut,
    num2 => SolROMout, 
    MUXSelect => FSMmux2Sel,
    output => MUX2Out);
    
RowColMUX : MUX port map (num1 => BoardSwitch, 
    num2 => StartROMout, 
    MuxSelect => FSMmux1Sel,
    output => MUX1out);
    
RowReg : Register3bit port map (in1 => MUX1out,
    load => FSMloadRow,
    clr => reset, 
    clk => Clk60Hz,
    out1 => RowRegOut);
    
ColReg : Register3bit port map (in1 => MUX1out,
    load => FSMloadCol,
    clr => reset, 
    clk => Clk60Hz,
    out1 => ColRegOut);
    
ValReg : Register3bit port map (in1 => ModuleSwitch,
    load => FSMloadVal,
    clr => reset, 
    clk => Clk60Hz,
    out1 => ValRegOut);
    
SendUART : uart port map(clk_100mhz => CLK12MHZ, 
    reset => reset, 
    uart_start => FSMSendUART, 
    data_to_send => ASCIIOut, 
    uart_done => FSMuartDone,
    Txbit => TxOut);
    
SevenSegmentControl : Full7Seg port map(Row => RowRegOut, 
    Col => ColRegOut,
    Val => RAMout, 
    clk => Clk60Hz, 
    SevenSegSelect => ValAddSelect,
    SegInput => To7Seg, 
    ST => ST);

StartRomCounter : Counter21 port map(clk => FSMCount1,
    rst => reset, 
    Output => Counter1Out, 
    FSMTF => FSMeqTarget1);
    
UARTCounter : Counter36 port map(clk => FSMCount2,
    rst => reset, 
    Output => Counter2Out, 
    FSMTF => FSMeqTarget2);
    
IncorrectCounter : Counter15 port map(clk => FSMCount3, 
    rst => reset, 
    Output => LEDout, 
    FSMTF => trash);
    
ASCIIadder : Adder8Bit port map(num1 => "00110000", 
    num2 => RAMout,--different sizes but I think it will be okay bc RAMout is going in and its the smaller one 
    Cin => '0', 
    Sum => ASCIIout, -- these also different so might break but lot of work to c hnage
    Cout => trash);
    
AddressMUX : MUX6Bit port map(num1 => Counter2Out,
    num2 => OneDOut, 
    MuxSelect => FSMmux3Sel, 
    output => MUX3Out);
    
AddressConversion : TwoTo1DArray port map(row => RowRegOut, 
    col => ColRegOut,
    address => OneDOut);
    
ValCompare : compare port map(RAMin => RAMout, 
    ROMin => SolROMout, 
    tf => FSMNotEq);
    
Prescaler : Hz60Clock port map(MHz12Clk => CLK12MHZ, 
    Hz60Clk => Clk60Hz);
   
end Behavioral;


