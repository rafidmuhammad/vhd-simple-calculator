library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;

entity display7S is
  port (
    sel                    : in  std_logic_vector(1 downto 0);
    -- selektor operasi
    r_operation            : in  std_logic_vector(3 downto 0);
    -- hasil operasi
    a_7S, b_7S, c_7S, d_7S : out std_logic_vector(6 downto 0) -- display keseluruhan operasi
  );
end entity;

architecture display7S_arc of display7S is
begin
  process (sel, r_operation)
  begin
    case r_operation is -- display hasil operasi
      when "0000" => a_7S <= "0000001"; -- '0'
      when "0001" => a_7S <= "1001111"; -- '1'
      when "0010" => a_7S <= "0010010"; -- '2'
      when "0011" => a_7S <= "0000110"; -- '3'
      when "0100" => a_7S <= "1001100"; -- '4'
      when "0101" => a_7S <= "0100100"; -- '5'
      when "0110" => a_7S <= "0100000"; -- '6'
      when "0111" => a_7S <= "0001111"; -- '7'
      when "1000" => a_7S <= "0000000"; -- '8'
      when "1001" => a_7S <= "0000100"; -- '9'
      when others => a_7S <= "1111111";
    end case;
    b_7S <= "1110110"; -- display karakter "="
    c_7S <= "1111010"; -- display karakter "r"
    case sel is -- display pilihan selektor
      when "00" => d_7S <= "0000001"; -- '0'
      when "01" => d_7S <= "1001111"; -- '1'
      when "10" => d_7S <= "0010010"; -- '2'
      when "11" => d_7S <= "0000110"; -- '3'
    end case;
  end process;
end architecture;
