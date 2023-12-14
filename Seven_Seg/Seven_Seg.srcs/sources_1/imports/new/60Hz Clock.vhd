----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2023 02:30:40 PM
-- Design Name: 
-- Module Name: 60Hz Clock - Behavioral
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

entity Hz60Clock is
    Port (MHz12Clk : in std_logic;
        Hz60Clk : out std_logic );
end Hz60Clock;

architecture Behavioral of Hz60Clock is
signal count : integer:= 1;
signal lastpulse : std_logic:= '0';
begin

process(MHz12Clk)
begin
    if rising_edge(MHz12Clk) then 
        if count = 100000 then 
            lastPulse <= not lastPulse;
            Hz60Clk <= lastPulse;
            count <= 1;
        else
            count <= count + 1;
        end if;
    end if;
end process;

end Behavioral;
