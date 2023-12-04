----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 05:39:19 PM
-- Design Name: 
-- Module Name: RAM_Test - Behavioral
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

entity RAM_Test is
--  Port ( );
end RAM_Test;

architecture Behavioral of RAM_Test is
component RAM is
    Port (address : in std_logic_vector(0 to 5); 
        dataIn : in std_logic_vector(0 to 2);
        writeEN : in std_logic;
        clk : in std_logic;
        dataOut : out std_logic_vector(0 to 2));
end component;
signal address : std_logic_vector(0 to 5);
signal dataIn, dataOut : std_logic_vector(0 to 2);
signal writeEn, clk : std_logic;
begin
tb : RAM port map(address => address,
    dataIn => dataIn,
    writeEn => writeEN,
    clk => clk,
    dataOut => dataOut);
process
begin
    clk <= '0';
    writeEn <= '0';
    wait for 100ns;
    
    address <= "000000";
    dataIn <= "101";
    clk <= '1';
    wait for 100ns;
    
    clk <= '0';
    wait for 100ns;
    
    address <= "000000";
    dataIn <= "101";
    writeEn <= '1';
    clk <= '1';
    wait;
        
end process;

end Behavioral;
