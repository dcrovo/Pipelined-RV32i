--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE BancoDeRegistros-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity BancoDeRegistros is
    port(
        clk, clear: in std_logic;
        rs1, rs2, rd: in std_logic_vector(4 downto 0);
        RegWrite: in std_logic;
        ReadData1, ReadData2: out std_logic_vector(31 downto 0);
        WriteData: in std_logic_vector(31 downto 0)
    ); 
end BancoDeRegistros;

architecture Behavioral of BancoDeRegistros is
    type regfile is array (31 downto 0) of std_logic_vector(31 downto 0);
    signal RF: regfile := (others => (others => '0'));
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if RegWrite = '1' then
                RF(to_integer(unsigned(rd))) <= WriteData;
            end if;
        end if;
    end process;
    ReadData1 <= RF(to_integer(unsigned(rs1)));
    ReadData2 <= RF(to_integer(unsigned(rs2)));
end Behavioral;
