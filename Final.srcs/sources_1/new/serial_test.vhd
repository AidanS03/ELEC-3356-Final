-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity serial_test is
	port(CLK100MHZ : in std_logic;
    	 reset : in std_logic;
         txbit : out std_logic
         );
end serial_test;

architecture bhv of serial_test is
	component uart is
      port(clk_100mhz : in std_logic;
           reset : in std_logic;
           uart_start : in std_logic;
           data_to_send : in std_logic_vector(7 downto 0);
           uart_done : out std_logic;
           txbit : out std_logic
           );
	end component;
    
begin

u0: uart port map (
		clk_100mhz => clk100MHZ,
        reset => reset,
        uart_start => '1',
        data_to_send => "00110101",
        uart_done => open,
        txbit => txbit
        );


end bhv;