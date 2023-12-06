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
         saveNumber, saveIndex, checkAns : in std_logic;
         LEDout : out std_logic_vector(0 to 5);
         TxOut : out std_logic);
end Data_Path;

architecture Behavioral of Data_Path is

component RAM is
    Port (address : in std_logic_vector(0 to 5); 
        dataIn : in std_logic_vector(0 to 2);
        writeEN : in std_logic;
        clk : in std_logic;
        dataOut : out std_logic_vector(0 to 2));
end component;

component ROM_Solution is
    Port (address : in std_logic_vector(0 to 5 );
        dataOut : out std_logic_vector(0 to 2));
end component;

component ROM_Start is
    Port (address : in std_logic_vector(0 to 4);
        dataOut : out std_logic_vector(0 to 3));
end component;

component MUX is
    Port (Num1 : in std_logic_vector(0 to 2);
        Num2 : in std_logic_vector(0 to 2);
        MUXselect : in std_logic;
        Output : out std_logic_vector(0 to 2));
end component;

component serial_test is
	port(CLK100MHZ : in std_logic;
    	 reset : in std_logic;
         txbit : out std_logic);
end component;

begin


end Behavioral;
