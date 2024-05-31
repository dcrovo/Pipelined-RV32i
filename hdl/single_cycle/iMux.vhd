--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE iMux-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity iMux is
    generic (
        G_size : integer := 32
    );
    port(
        A, B: in std_logic_vector(G_size - 1  downto 0);
        Sel: in std_logic;
        Y: out std_logic_vector(G_size - 1 downto 0)
    );
end iMux;

architecture Behavioral of iMux is
begin
    process(A, B, Sel)
    begin
        if Sel = '1' then
            Y <= B;
        else
            Y <= A;
        end if;
    end process;
end Behavioral;