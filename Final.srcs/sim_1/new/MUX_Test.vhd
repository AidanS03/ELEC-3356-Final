----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2023 03:49:34 PM
-- Design Name: 
-- Module Name: MUX_Test - Behavioral
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

entity MUX_Test is
--  Port ( );
end MUX_Test;

architecture Behavioral of MUX_Test is
Component MUX is
    Port (Num1 : in std_logic_vector(0 to 2);
        Num2 : in std_logic_vector(0 to 2);
        MUXselect : in std_logic;
        Output : out std_logic_vector(0 to 2));
end component;
signal Num1, Num2, output : std_logic_vector(0 to 2);
signal MUXselect : std_logic;
begin
tb : MUX port map(Num1 => Num1,
    Num2 => Num2,
    MUXselect => Muxselect, 
    Output => output);
    
process
begin
    Num1 <= "010";
    Num2 <= "101";
    Muxselect <= '0';
    wait for 100ns;
    
    MUXselect <= '1';
    wait;    
end process;

end Behavioral;
