library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;

entity adder is
  port (
    x, y   : in  std_logic_vector(3 downto 0); -- input angka
    output : out std_logic_vector(3 downto 0)  -- output hasil operasi
  );
end entity;

architecture adder_arc of adder is
begin
  process (x, y)
  begin -- algoritma utama operasi penjumlahan
    output <= unsigned(x) + unsigned(y);
  end process;
end architecture;
