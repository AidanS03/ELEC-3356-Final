----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2023 12:18:27 PM
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX6Bit is
    Port (Num1 : in std_logic_vector(0 to 5);
        Num2 : in std_logic_vector(0 to 5);
        MUXselect : in std_logic;
        Output : out std_logic_vector(0 to 5));
end MUX6Bit;

architecture Behavioral of MUX6Bit is

begin
    with MUXselect select
        Output <= Num1 when '0',
            Num2 when '1',
            "000000" when others;
end Behavioral;