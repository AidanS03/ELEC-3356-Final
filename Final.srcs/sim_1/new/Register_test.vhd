----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2023 03:32:26 PM
-- Design Name: 
-- Module Name: Register_test - Behavioral
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

entity Register_test is
--  Port ( );
end Register_test;

architecture Behavioral of Register_test is
component Register3bit is 
    port(in1   : in STD_LOGIC_VECTOR(0 to 2);
        load  : in STD_LOGIC;
        clr : in STD_LOGIC; 
        clk : in STD_LOGIC; 
        out1   : out STD_LOGIC_VECTOR(0 to 2));
end component;
signal in1, out1 : std_logic_vector(0 to 2);
signal load, clr, clk : std_logic;

begin
tb : Register3bit port map(in1 => in1, 
    out1 => out1,
    load => load,
    clr => clr,
    clk => clk);
    
process 
begin
    in1 <= "111";
    load <= '1';
    clr <= '0';
    clk <= '0';
    wait for 100ns;
    
    clk <= '1';
    wait for 100ns;
    
    clk <= '0';
    load <= '0';
    in1 <= "010";
    wait for 100ns;
    
    clk <= '1';
    wait for 100ns;
    
    clr <= '1';
    wait;
    
    
end process;


end Behavioral;
