----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 05:38:48 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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

entity ROM is
    Port (address : in std_logic_vector(0 to 35 );
        dataOut : out std_logic_vector(0 to 2));
end ROM;

architecture Behavioral of ROM is
type ROM_type is array(0 to 35) of std_logic_vector(0 to 2);
signal ROMarray : ROM_type;

begin
    ROMarray(1) <= "001";
    ROMarray(2) <= "010";
    ROMarray(3) <= "010";
    dataOut <= ROMarray(to_integer(unsigned(address)));

end Behavioral;
