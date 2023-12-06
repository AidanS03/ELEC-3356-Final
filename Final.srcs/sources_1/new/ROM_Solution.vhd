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

entity ROM_Solution is
    Port (address : in std_logic_vector(0 to 5 );
        dataOut : out std_logic_vector(0 to 2));
end ROM_Solution;

architecture Behavioral of ROM_Solution is
type ROM_type is array(0 to 35) of std_logic_vector(0 to 2);
signal ROMarray : ROM_type :=("001", "011", "101", "100", "110", "010",
                              "110", "100", "010", "101", "001", "011",
                              "100", "001", "110", "011", "010", "101",
                              "101", "010", "011", "001", "100", "110", 
                              "011", "110", "001", "010", "101", "100", 
                              "010", "101", "100", "110", "011", "001");
--above array is organized into sudoku grid   ^that is column 2 of the grid
begin
    dataOut <= ROMarray(to_integer(unsigned(address)));

end Behavioral;
