-- Testbench for comparator 
library IEEE;
  use IEEE.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;

entity testbench is
  -- empty
end entity;

architecture tb of testbench is

  -- DUT component
  component comparator is
    port (
      A, B   : in  std_logic_vector(3 downto 0);
      output : out std_logic_vector(3 downto 0)
    );
  end component;

  signal a_in, b_in, q_out : std_logic_vector(3 downto 0);

begin

  -- Connect DUT
  DUT: comparator port map (a_in, b_in, q_out);

  process
  begin
    a_in <= "0001";
    b_in <= "0000";
    wait for 1 ns;
    assert (q_out = "0010") report "Fail 0/0" severity error;

    a_in <= "0001";
    b_in <= "1111";
    wait for 1 ns;
    assert (q_out = "0001") report "Fail 0/0" severity error;

    a_in <= "0001";
    b_in <= "0001";
    wait for 1 ns;
    assert (q_out = "0011") report "Fail 0/0" severity error;

    assert false report "Test done." severity note;
    wait;
  end process;
end architecture;
