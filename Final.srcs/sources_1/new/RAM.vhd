----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 01:36:33 PM
-- Design Name: 
-- Module Name: RAM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port (address : in std_logic_vector(0 to 5); 
        dataIn : in std_logic_vector(0 to 2);
        writeEN : in std_logic;
        clk : in std_logic;
        dataOut : out std_logic_vector(0 to 7));
end RAM;

architecture Behavioral of RAM is
type RAM_type is array(0 to 35) of std_logic_vector(0 to 2);
signal RAMarray : RAM_type;

begin
process(clk)
begin
    if rising_edge(clk) then
        if writeEn = '1' then 
            RAMarray(to_integer(unsigned(address))) <= dataIn;
        end if;
    end if;
end process;
dataOut <= "00000" & RAMarray(to_integer(unsigned(address)));

end Behavioral;
