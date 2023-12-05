----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2023 11:07:49 AM
-- Design Name: 
-- Module Name: ROM_Test - Behavioral
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

entity ROM_Test is
--  Port ( );
end ROM_Test;

architecture Behavioral of ROM_Test is
    component ROM_Solution is
        Port (address : in std_logic_vector(0 to 5 );
            dataOut : out std_logic_vector(0 to 2));
    end component;
    signal address : std_logic_vector(0 to 5);
    signal dataOut : std_logic_vector(0 to 2);
begin
    tb : ROM_Solution port map(address => address,
        dataOut => dataOut);
process
begin
    address <= "000001";
    wait for 100ns;
    
    address <= "000010";
    wait for 100ns;
    
    address <= "000011";
    wait for 100ns;
    
    address <= "100011";
    wait;    
end process;

end Behavioral;
