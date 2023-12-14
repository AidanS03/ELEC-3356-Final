----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2023 12:53:03 PM
-- Design Name: 
-- Module Name: Full7Seg - Behavioral
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

entity Full7Seg is
    Port (Row, Col : in std_logic_vector(0 to 2);
        Val : in std_logic_vector(0 to 7);
        clk, SevenSegSelect : in std_logic;
        SegInput : out std_logic_vector(0 to 2);
        ST : out std_logic );
end Full7Seg;

architecture Behavioral of Full7Seg is
Component MUX is
    Port (Num1 : in std_logic_vector(0 to 2);
        Num2 : in std_logic_vector(0 to 2);
        MUXselect : in std_logic;
        Output : out std_logic_vector(0 to 2));
end Component;

Component ORgate is
    Port (In1, In2 : in std_logic;
        Output : out std_logic );
end Component;

signal MUX1out : std_logic_Vector(0 to 2);
begin

RowColMUX : MUX port map(Num1 => Row, --test value to make sure im getting waht i expect
    Num2 => Col, --test value to make sure im getting waht i expect
    MUXselect => clk, 
    Output => MUX1Out);
    
AddValMUX : MUX port map(Num1 => MUX1Out,
    Num2 => Val(0 to 2), --test value to make sure im getting waht i expect
    MUXselect => SevenSegSelect, 
    Output => SegInput);
    
stOR : ORgate port map (In1 => clk, 
    In2 => SevenSegSelect,
    output => ST);

end Behavioral;
