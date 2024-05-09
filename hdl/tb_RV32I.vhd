library ieee;
use ieee.std_logic_1164.all;
LIBRARY altera_mf;
USE altera_mf.all;


entity tb_RV32I is
end tb_RV32I;

architecture tb of tb_RV32I is

    component RV32I
        port (
		    --start : in std_logic;
				 clear :in std_logic;
				 ------ROM----
				Salida_Registro_Direccion_CP : out std_logic_vector(14 DOWNTO 0);
				Entrada_Registro_Inst : in  std_logic_vector(31 DOWNTO 0);
				Read_ROM : out std_logic;
				 -----ROM-----
				 Salida_Data_Mux : out std_logic_vector(31 DOWNTO 0);
				 Read_RAM : out std_logic;
				 Write_RAM : out std_logic;
				 Salida_Registro_ALU_OUT : out std_logic_vector(14 DOWNTO 0);
				 Entrada_Registro_Data_Reg : in std_logic_vector(31 DOWNTO 0);
				 ---puntas de prueba----
	        --BR : out std_logic_vector(31 DOWNTO 0);
		     --IRMUX :out  std_logic_vector(31 DOWNTO 0);
	          enablers1: out std_logic;
			    enablers2: out std_logic;
			    readrs1: out std_logic;
		       readrs2: out std_logic;
			  --REGBR1 : out  std_logic_vector(31 DOWNTO 0);
			  --REGBR2 : out  std_logic_vector(31 DOWNTO 0);
			  --wire24_20: out  std_logic_vector(4 DOWNTO 0);
			  --wire19_15: out  std_logic_vector(4 DOWNTO 0);
			  --wire11_7: out  std_logic_vector(4 DOWNTO 0);
				 writebr: out std_logic;
	        --DataentradaBr:out  std_logic_vector(31 DOWNTO 0);
			  --SalidaRegALU:out  std_logic_vector(31 DOWNTO 0);
				 ExceALU: out std_logic;
			    enableALUOUT: out std_logic;
		       EnablePC: out std_logic;
			  --SlectamMux: out std_logic;
				 SlectiMux: out std_logic;
				 SelectiRMux: out std_logic;
				 enabledireccioncp: out std_logic;
				 enabledata: out std_logic;
			    selectdatamux: out std_logic;
				 ReadRam: out std_logic;
		     --salidaALU2:out std_logic;
			  --controlALU2: out  std_logic_vector(3 DOWNTO 0);
			  --andBranch:out std_logic;
           --ALUOPCODE: out  std_logic_vector(16 DOWNTO 0);
			  --selecticMux:out std_logic;
		     --exceContador:out std_logic;
			  --salidaiMux: out  std_logic_vector(14 DOWNTO 0);
			  --salidaicMux: out  std_logic_vector(14 DOWNTO 0);
			  --salidasumcon: out  std_logic_vector(14 DOWNTO 0);
			  --salidapcReg: out  std_logic_vector(14 DOWNTO 0);
			    EnableInst:out std_logic;
			  --EnableSumcon:out std_logic;
			    SalidaBancoDeRegistros : out std_logic_vector(31 DOWNTO 0);
				 ----------------------
				 clk : in std_logic
		 
		  );
    end component;



	 
	 --------------------
	 --Cables de senal --
	 --------------------

		signal		 clear : std_logic;
				 ------ROM----
		signal		Salida_Registro_Direccion_CP :  std_logic_vector(14 DOWNTO 0):="000000000000000";
		signal		Entrada_Registro_Inst :   std_logic_vector(31 DOWNTO 0):="00000000000000000000000000000000";
		signal		Read_ROM :  std_logic := '0';
				 -----ROM-----
		signal		 Salida_Data_Mux :  std_logic_vector(31 DOWNTO 0):="00000000000000000000000000000000";
		signal		 Read_RAM :  std_logic := '0';
		signal		 Write_RAM :  std_logic := '0';
		signal		 Salida_Registro_ALU_OUT :  std_logic_vector(14 DOWNTO 0):="000000000000000";
		signal		 Entrada_Registro_Data_Reg :  std_logic_vector(31 DOWNTO 0):="00000000000000000000000000000000";

	   signal       enablers1:  std_logic := '0';
		signal	    enablers2:  std_logic := '0';
		signal	    readrs1:  std_logic := '0';
		signal      readrs2:  std_logic := '0';

		signal		 writebr:  std_logic := '0';

		signal		 ExceALU:  std_logic := '0';
		signal	    enableALUOUT:  std_logic := '0';
		signal       EnablePC:  std_logic := '0';
	
		signal		 SlectiMux:  std_logic := '0';
		signal		 SelectiRMux:  std_logic := '0';
		signal		 enabledireccioncp:  std_logic := '0';
		signal		 enabledata:  std_logic := '0';
		signal	    selectdatamux:  std_logic := '0';
		signal		 ReadRam: std_logic := '0';
		   
		signal	    EnableInst: std_logic;
			  --EnableSumcon:out std_logic;
		signal	    SalidaBancoDeRegistros :  std_logic_vector(31 DOWNTO 0);
				 ----------------------
		signal		 clk :  std_logic;
	
	
	
	 
    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : RV32I
    port map (
	 
	 clear => clear,
				 ------ROM----
	Salida_Registro_Direccion_CP=> Salida_Registro_Direccion_CP,
	Entrada_Registro_Inst => Entrada_Registro_Inst,
	Read_ROM => Read_ROM,
				 -----ROM-----
	Salida_Data_Mux => Salida_Data_Mux,
	Read_RAM =>  Read_RAM,
	Write_RAM => Write_RAM,
	Salida_Registro_ALU_OUT => Salida_Registro_ALU_OUT,
	Entrada_Registro_Data_Reg=> Entrada_Registro_Data_Reg,
   enablers1 => enablers1,
	enablers2 => enablers2,
	readrs1  => readrs1,
	readrs2 => readrs2,
	writebr => writebr,
	ExceALU => ExceALU,
	enableALUOUT => enableALUOUT,
	EnablePC =>  EnablePC,
	SlectiMux => SlectiMux,
	SelectiRMux => SelectiRMux,
	enabledireccioncp=> enabledireccioncp,
	enabledata => enabledata,
	selectdatamux => selectdatamux,
   ReadRam => ReadRam,
	EnableInst => EnableInst,
   SalidaBancoDeRegistros=> SalidaBancoDeRegistros,
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
        clear <= '0';
        wait for 110 ns;
        clear <= '1';
        wait for 40 ns;
        clear <= '0';
		  Entrada_Registro_Inst     <= "00000000000100000000011110010011";
		  Entrada_Registro_Data_Reg <= "00000000000000000000000000110011";
        wait for 1400 ns ;
		  Entrada_Registro_Inst     <= "00001111111100000000011100010011";
		  Entrada_Registro_Data_Reg <= "00000000000000000000000001100001";
		  wait;
        

    end process;

end tb;
