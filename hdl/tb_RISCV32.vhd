-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 16.8.2020 04:34:54 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_RISCV32 is
end tb_RISCV32;

architecture tb of tb_RISCV32 is

    component RISCV32
        port (
		  	Direccion_CP :  out std_logic_vector(14 DOWNTO 0);
		   DirecionRAM:out std_logic_vector(14 DOWNTO 0);
			SalidaBancoDeRegistros: out std_logic_vector( 31 DOWNTO 0);
		   enablers1: out std_logic;--0
			enablers2: out std_logic;--1
			readrs1: out std_logic;--2
		   readrs2: out std_logic;--3
			writebr: out std_logic;--4
			ExceALU: out std_logic;--5
			enableALUOUT: out std_logic;--6
			EnablePC: out std_logic;--7
			--SlectamMux: out std_logic;
			SlectiMux: out std_logic;--8
			SelectiRMux: out std_logic;--9
			enabledireccioncp: out std_logic;--10
			enabledata: out std_logic;--11
			selectdatamux: out std_logic;--12
			ReadRam: out std_logic;--13
			EnableInst:out std_logic;--14
			ReadROM : out std_logic;--15
			

	      reset : in std_logic;--BOTON-CERO
			clkOUT  : out std_logic;--CLK
			clkOUT2 : out std_logic;--CLK
			clkOUT3 : out std_logic;--CLK
			----------------------------------------------------
			clk : in std_logic
		 
		  );
    end component;



	 
	 --------------------
	 --Cables de senal --
	 --------------------
	 
	 	signal	Direccion_CP :   std_logic_vector(14 DOWNTO 0);
		signal   DirecionRAM: std_logic_vector(14 DOWNTO 0);
		signal	SalidaBancoDeRegistros:  std_logic_vector( 31 DOWNTO 0);
		signal   enablers1:  std_logic;--0
		signal	enablers2:  std_logic;--1
		signal	readrs1:  std_logic;--2
		signal   readrs2:  std_logic;--3
		signal	writebr:  std_logic;--4
		signal	ExceALU:  std_logic;--5
		signal	enableALUOUT:  std_logic;--6
		signal	EnablePC:  std_logic;--7
			--SlectamMux: out std_logic;
		signal	SlectiMux:  std_logic;--8
		signal	SelectiRMux:  std_logic;--9
		signal	enabledireccioncp:  std_logic;--10
		signal	enabledata: std_logic;--11
		signal	selectdatamux:  std_logic;--12
		signal	ReadRam:  std_logic;--13
		signal	EnableInst: std_logic;--14
		signal	ReadROM :  std_logic;--15
			

	   signal   reset :  std_logic;--BOTON-CERO
		signal	clkOUT  :  std_logic;--CLK
		signal	clkOUT2 :  std_logic;--CLK
		signal	clkOUT3 :  std_logic;--CLK
			----------------------------------------------------
		signal	clk :  std_logic;
	 
	 
	
	 
    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : RISCV32
    port map (
	 
	  
	 Direccion_CP => Direccion_CP,
	 DirecionRAM => DirecionRAM,
	 SalidaBancoDeRegistros=> SalidaBancoDeRegistros,
	 enablers1 => enablers1,
	 enablers2 => enablers2,
	 readrs1 => readrs1,
	 readrs2 => readrs2,
	 writebr => writebr,
	 ExceALU => ExceALU,
	 enableALUOUT => enableALUOUT,
	 EnablePC => EnablePC,
	 SlectiMux => SlectiMux,
	 SelectiRMux => SelectiRMux,
	 enabledireccioncp => enabledireccioncp,
	 enabledata => enabledata,
	 selectdatamux => selectdatamux,
	 ReadRam => ReadRam,
	 EnableInst => EnableInst,
	 ReadROM => ReadROM,
	 reset => reset,
	 clkOUT  => clkOUT,
	 clkOUT2 => clkOUT2,
    clkOUT3 => clkOUT3,
	 clk => clk
	
	 );

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
        reset <= '1';
        wait for 110 ns;
        reset <= '0';
        wait for 60 ns;
        reset <= '1';
        wait;
        

    end process;

end tb;
