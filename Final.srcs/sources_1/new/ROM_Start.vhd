----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2023 11:35:25 AM
-- Design Name: 
-- Module Name: ROM_Start - Behavioral
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

entity ROM_Start is
    Port (address : in std_logic_vector(0 to 4);
        dataOut : out std_logic_vector(0 to 2));
end ROM_Start;

architecture Behavioral of ROM_Start is
type ROM_type is array(0 to 20) of std_logic_vector(0 to 2);
signal ROMarray : ROM_type := ("010", 
                               "000", "010", 
                               "000", "101", 
                               "001", "000", 
                               "010", "000", 
                               "010", "101", 
                               "011", "000", 
                               "011", "100", 
                               "101", "010", 
                               "101", "011", 
                               "101", "101");
--                              ^Row    ^Col for each start location
begin
    dataOut <= ROMarray(to_integer(unsigned(address)));

end Behavioral;
