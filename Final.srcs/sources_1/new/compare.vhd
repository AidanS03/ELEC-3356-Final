library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compare is
  Port (RAMin : in std_logic_vector(7 downto 0);
    ROMin : in std_logic_vector(2 downto 0);
    tf : out std_logic);
end compare;

architecture Behavioral of compare is
begin
  process(RAMin, ROMin)
  begin
    case RAMin is
      when "00000000" =>
        -- Skip comparison if RAM is zero
        tf <= '0';
      when others =>
                 -- Sign bits are the same, compare as unsigned
          if RAMin(2 downto 0) = ROMin then
            tf <= '1';
          else
            tf <= '0';
          end if;
    end case;
  end process;
end Behavioral;