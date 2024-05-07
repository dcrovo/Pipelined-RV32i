-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 16.8.2020 04:34:54 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_RISCV32 is
end tb_RISCV32;

architecture tb of tb_RISCV32 is

    component RISCV32
        port (start        : in std_logic;
              Direccion_CP : out std_logic_vector (15 downto 0);
              Data_Mux     : out std_logic_vector (31 downto 0);
              ROM          : out std_logic_vector (31 downto 0);
              clk          : in std_logic);
    end component;

    signal start        : std_logic;
    signal Direccion_CP : std_logic_vector (15 downto 0);
    signal Data_Mux     : std_logic_vector (31 downto 0);
    signal ROM          : std_logic_vector (31 downto 0);
    signal clk          : std_logic;

    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : RISCV32
    port map (start        => start,
              Direccion_CP => Direccion_CP,
              Data_Mux     => Data_Mux,
              ROM          => ROM,
              clk          => clk);

	clock_driver_proc: process
	begin
		clk <= '0';
		wait for TbPeriod / 2;
		clk <= '1';
		wait for TbPeriod / 2;
	end process clock_driver_proc;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- Reset generation
        -- EDIT: Check that reset is really your reset signal
        start <= '0';
        wait for 20 ns;
        start <= '1';
        wait for 20 ns;
        start <= '0';
        wait;
        

    end process;

end tb;
