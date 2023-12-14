----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2023 02:56:30 PM
-- Design Name: 
-- Module Name: Counter15 - Behavioral
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

entity Counter15 is
    Port (clk : in std_logic;
        rst : in std_logic;
        output : out std_logic_vector(0 to 3);
        FSMTF : out std_logic); --output of One Shot Counter to see if it hit its numerical value limit, then reset when it does 
end Counter15;

architecture Behavioral of Counter15 is
  signal count_value : unsigned(3 downto 0) := (others => '0');
    signal is_target_reached : std_logic := '0';  -- Intermediate signal
    
begin

    process(clk)
    begin
    
        if rising_edge(clk) then
            if rst = '1' then
                count_value <= (others => '0');
                is_target_reached <= '0';  -- Reset the intermediate signal
            else
                if count_value = 15 then
                    count_value <= (others => '0');
                    is_target_reached <= '1';  -- Set the intermediate signal
                else
                    count_value <= count_value + 1;
                    is_target_reached <= '0';  -- Reset the intermediate signal
                end if;
            end if;
        end if;
    end process;

    output <= std_logic_vector(count_value);
    FSMTF <= is_target_reached;  -- Use the intermediate signal
  
end Behavioral;
