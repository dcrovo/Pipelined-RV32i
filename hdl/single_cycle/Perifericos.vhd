--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Perifericos-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Perifericos is
    port(
        clk: in std_logic;
        clear: in std_logic;
        Read_ROM: in std_logic;
        ROM_Direccion: in std_logic_vector(14 downto 0);
        ROM_Salida: out std_logic_vector(31 downto 0);
        RAM_Datain: in std_logic_vector(31 downto 0);
        RAM_Write_MD: in std_logic;
        RAM_Read_MD: in std_logic;
        RAM_Direccion: in std_logic_vector(14 downto 0);
        RAM_Salida: out std_logic_vector(31 downto 0)
    );
end Perifericos;

architecture Behavioral of Perifericos is
    type ram_type is array (0 to 16383) of std_logic_vector(31 downto 0);
    signal RAM: ram_type := (others => (others => '0'));
    type rom_type is array (0 to 16383) of std_logic_vector(31 downto 0);
    signal ROM: rom_type := (others => (others => '0'));
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if clear = '1' then
                ROM <= (others => (others => '0'));
                RAM <= (others => (others => '0'));
            else
                if Read_ROM = '1' then
                    ROM_Salida <= ROM(to_integer(unsigned(ROM_Direccion)));
                end if;
                if RAM_Read_MD = '1' then
                    RAM_Salida <= RAM(to_integer(unsigned(RAM_Direccion)));
                end if;
                if RAM_Write_MD = '1' then
                    RAM(to_integer(unsigned(RAM_Direccion))) <= RAM_Datain;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
