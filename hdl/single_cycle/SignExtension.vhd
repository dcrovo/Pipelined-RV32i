--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE SignExtension-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity SignExtension is
    port(
        Instr: in std_logic_vector(31 downto 0);
        ImmSel: in std_logic_vector(2 downto 0);
        Imm: out std_logic_vector(31 downto 0)
    );
end SignExtension;

architecture Behavioral of SignExtension is
begin
    process (Instr, ImmSel)
    begin
        case ImmSel is
            when "000" => Imm <= (others => '0'); -- Zero immediate
            when "001" => Imm <= (others => '1'); -- Ones immediate
            when "010" => Imm <= Instr(31 downto 20) & "00000000000000000000";-- (others => '0'); -- Immediate from instruction
            when others => Imm <= (others => '0');
        end case;
    end process;
    
end architecture;