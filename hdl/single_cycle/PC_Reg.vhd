--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE PC_Reg-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity PC_Reg is
    port(
        clk, clear: in std_logic;
        PC_in: in std_logic_vector(14 downto 0);
        PC_out: out std_logic_vector(14 downto 0);
        Enable: in std_logic
    );
end PC_Reg;

architecture Behavioral of PC_Reg is
    signal Reg: std_logic_vector(14 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if clear = '1' then
                Reg <= (others => '0');
            elsif Enable = '1' then
                Reg <= PC_in;
            end if;
        end if;
    end process;
    PC_out <= Reg;
end Behavioral;