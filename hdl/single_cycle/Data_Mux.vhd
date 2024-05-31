--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Data_Mux-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Data_Mux is
    port(
        A, B: in std_logic_vector(31 downto 0);
        Sel: in std_logic;
        Y: out std_logic_vector(31 downto 0)
    );
end Data_Mux;

architecture Behavioral of Data_Mux is
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
