library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1 is
    generic (
        G_size : integer := 32
    );
    port(
        a, b : in std_logic_vector(G_size - 1 downto 0);
        sel : in std_logic;
        y : out std_logic_vector(G_size - 1 downto 0)
    );
end mux2_1;

architecture behavioral of mux2_1 is
begin
    process(a, b, sel)
    begin
        if sel = '1' then
            y <= b;
        else
            y <= a;
        end if;
    end process;
end behavioral;