library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_signed.all;

entity subtractor is
  port (
    x, y   : in  std_logic_vector(3 downto 0);
    output : out std_logic_vector(3 downto 0)
  );
end entity;

architecture rtl of subtractor is
begin
  process (x, y)
  begin
    output <= x - y;
  end process; -- identifier
end architecture;
