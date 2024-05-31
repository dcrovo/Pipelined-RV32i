--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE ANDb-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ANDb is
    port(
        A, B: in std_logic;
        Y: out std_logic
    );
end ANDb;

architecture Behavioral of ANDb is
begin
    Y <= A and B;
end Behavioral;