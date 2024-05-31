--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE amMux-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity amMux is
    port(
        A, B: in std_logic_vector(31 downto 0);
        Sel: in std_logic;
        Y: out std_logic_vector(31 downto 0)
    );
end amMux;

architecture Behavioral of amMux is
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
