--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE RAM-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity RAM is
    port(
        clk: in std_logic;
        addr: in std_logic_vector(31 downto 0);
        we: in std_logic;
        din: in std_logic_vector(31 downto 0);
        dout: out std_logic_vector(31 downto 0)
    );
end RAM;

architecture Behavioral of RAM is
    type ram_type is array (0 to 1023) of std_logic_vector(31 downto 0);
    signal RAM: ram_type := (
        0 => x"00000002",  -- 2
        1 => x"00000004",  -- 4
        2 => x"00000006",  -- 6
        3 => x"00000008",  -- 8
        4 => x"0000000A",  -- 10
        5 => x"0000000C",  -- 12
        6 => x"0000000E",  -- 14
        7 => x"00000010",  -- 16
        8 => x"00000012",  -- 18
        9 => x"00000014",  -- 20
        10 => x"00000016", -- 22
        11 => x"00000018", -- 24
        12 => x"0000001A", -- 26
        13 => x"0000001C", -- 28
        14 => x"0000001E", -- 30
        15 => x"00000020", -- 32
        16 => x"00000022", -- 34
        17 => x"00000024", -- 36
        18 => x"00000026", -- 38
        19 => x"00000028", -- 40
        20 => x"0000002A", -- 42
        21 => x"0000002C", -- 44
        22 => x"0000002E", -- 46
        23 => x"00000030", -- 48
        24 => x"00000032", -- 50
        25 => x"00000034", -- 52
        26 => x"00000036", -- 54
        27 => x"00000038", -- 56
        28 => x"0000003A", -- 58
        29 => x"0000003C", -- 60
        30 => x"0000003E", -- 62
        31 => x"00000040", -- 64
        32 => x"00000042", -- 66
        33 => x"00000044", -- 68
        34 => x"00000046", -- 70
        35 => x"00000048", -- 72
        36 => x"0000004A", -- 74
        37 => x"0000004C", -- 76
        38 => x"0000004E", -- 78
        39 => x"00000050", -- 80
        40 => x"00000052", -- 82
        41 => x"00000054", -- 84
        42 => x"00000056", -- 86
        43 => x"00000058", -- 88
        44 => x"0000005A", -- 90
        45 => x"0000005C", -- 92
        46 => x"0000005E", -- 94
        47 => x"00000060", -- 96
        others => (others => '0')
    );
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                RAM(to_integer(unsigned(addr(9 downto 0)))) <= din;
            end if;
            dout <= RAM(to_integer(unsigned(addr(9 downto 0))));
        end if;
    end process;
end Behavioral;