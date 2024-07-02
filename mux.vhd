library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;

entity mux is
  port (
    sel           : in  std_logic_vector(1 downto 0); -- selektor operasi
    com, sub, add : in  std_logic_vector(3 downto 0); -- hasil operasi komparasi, pengurangan, penjumlahan
    output        : out std_logic_vector(3 downto 0)  -- output selektor
  );
end entity;

architecture mux_arc of mux is
begin
  process (sel, com, sub, add)
  begin
    if sel = "00" then
      output <= com; -- ketika selektor = 0, memilih hasil operasi komparasi 
    elsif sel = "01" then
      output <= sub; -- ketika selektor = 1, memilih hasil operasi pengurangan 
    elsif sel = "10" then
      output <= add; -- ketika selektor = 2, memilih hasil operasi penjumlahan 
    else
      output <= "0000";
    end if;
  end process;
end architecture;
