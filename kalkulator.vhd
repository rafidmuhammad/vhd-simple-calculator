library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;
  use work.all;

entity kalkulator is
  port (
    input1, input2                                 : in  std_logic_vector(3 downto 0); --input angka 
    in_sel                                         : in  std_logic_vector(1 downto 0); -- selektor operasi 
    result                                         : out std_logic_vector(3 downto 0); -- output hasil operasi 
    a_7segment, b_7segment, c_7segment, d_7segment : out std_logic_vector(6 downto 0)  -- display 7-segment
  );
end entity;

architecture kalkulator_arc of kalkulator is
  -- komponen selektor
  component mux is
    port (
      sel           : in  std_logic_vector(1 downto 0);
      com, sub, add : in  std_logic_vector(3 downto 0);
      output        : out std_logic_vector(3 downto 0)
    );
  end component;
  -- komponen operasi komparasi
  component comparator is
    port (
      x, y   : in  std_logic_vector(3 downto 0);
      output : out std_logic_vector(3 downto 0)
    );
  end component;
  -- komponen operasi pengurangan
  component subtractor is
    port (
      x, y   : in  std_logic_vector(3 downto 0);
      output : out std_logic_vector(3 downto 0)
    );
  end component;
  -- komponen operasi penjumlahan
  component adder is
    port (
      x, y   : in  std_logic_vector(3 downto 0);
      output : out std_logic_vector(3 downto 0)
    );
  end component;
  -- komponen display 7-segment
  component display7S is
    port (
      sel                    : in  std_logic_vector(1 downto 0);
      r_operation            : in  std_logic_vector(3 downto 0);
      a_7S, b_7S, c_7S, d_7S : out std_logic_vector(6 downto 0)
    );
  end component;
  signal r_com, r_sub, r_add, r_mux : std_logic_vector(3 downto 0);
begin
  -- alur data
  X_COM: comparator port map (input1, input2, r_com);
  X_SUB: subtractor port map (input1, input2, r_sub);
  X_ADD: adder port map (input1, input2, r_add);
  X_MUX: mux port map (in_sel, r_com, r_sub, r_add, r_mux);
  X_DIS: display7S
    port map (in_sel, r_mux, a_7segment,
              b_7segment, c_7segment, d_7segment);
  -- hasil
  result <= r_mux;
end architecture;
