----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2023 03:27:50 PM
-- Design Name: 
-- Module Name: ROM_Start_Test - Behavioral
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

entity ROM_Start_Test is
--  Port ( );
end ROM_Start_Test;

architecture Behavioral of ROM_Start_Test is
    component ROM_Start is
    Port (address : in std_logic_vector(0 to 4);
        dataOut : out std_logic_vector(0 to 3));
end component;
signal address : std_logic_vector(0 to 4);
signal dataOut : std_logic_vector(0 to 3);
begin
    tb : ROM_Start port map(address => address,
        dataOut => dataOut);
process
begin
    address <= "00000";
    wait for 100ns;
    
    address <= "00001";
    wait for 100ns;
    
    address <= "00010";
    wait for 100ns;
    
    address <= "10011";
    wait for 100ns;
    
    address <= "10100";
    wait;
end process;

end Behavioral;
