-- Testbench for OR gate
library ieee;
  use ieee.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use ieee.std_logic_signed.all;

entity tb_subtractor is
  -- empty
end entity;

architecture tb of tb_subtractor is

  -- DUT component
  component subtractor is
    port (
      x, y : in  signed(3 downto 0);
      f    : out signed(3 downto 0)
    );
  end component;

  signal x_in, y_in, f_out : signed(3 downto 0);

begin

  -- Connect DUT
  DUT: subtractor port map (x_in, y_in, f_out);

  process
  begin
    x_in <= "0010";
    y_in <= "0001";
    wait for 1 ns;
    assert (f_out = 1) report "Fail 1/3" severity error;

    x_in <= "0110";
    y_in <= "0010";
    wait for 1 ns;
    assert (f_out = 4) report "Fail 2/3" severity error;

    x_in <= "1001";
    y_in <= "0001";
    wait for 1 ns;
    assert (f_out = - 8) report "Fail 3/3" severity error;

    x_in <= "0101";
    y_in <= "0111";
    wait for 1 ns;
    assert (f_out = - 2) report "Fail 4/4" severity error;

    assert (false) report "TEST DONE" severity note;
    wait;
  end process;
end architecture;
