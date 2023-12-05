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
        dataOut : out std_logic_vector(0 to 3));
end ROM_Start;

architecture Behavioral of ROM_Start is
type ROM_type is array(0 to 20) of std_logic_vector(0 to 3);
signal ROMarray : ROM_type := ("1010", "0000", "0010", "0000", "0101", "0001", "0000", "0010", "0000", "0010", 
    "0101", "0011", "0000", "0011", "0100", "0101", "0010", "0101", "0011", "0101", "0101");

begin
    dataOut <= ROMarray(to_integer(unsigned(address)));

end Behavioral;
