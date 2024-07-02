library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;

entity comparator is
  port (
    x, y   : in  std_logic_vector(3 downto 0);
    output : out std_logic_vector(3 downto 0)
  );
end entity;

architecture rtl of comparator is
begin
  process (x, y)
  begin
    if x < y then
      output <= "0001";
    elsif x > y then
      output <= "0010";
    elsif x = y then
      output <= "0011";
    end if;
  end process; -- identifier
end architecture;
