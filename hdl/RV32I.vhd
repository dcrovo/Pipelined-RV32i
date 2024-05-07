--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Control_Unit DE RVI32--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
library ALTERA;
use ALTERA.altera_primitives_components.all;
-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity RV32I is
       port( 
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
			--	controlALU2: out  std_logic_vector(3 DOWNTO 0);
				--andBranch:out std_logic;
           --ALUOPCODE: out  std_logic_vector(16 DOWNTO 0);
			 --selecticMux:out std_logic;
		 --exceContador:out std_logic;
			-- salidaiMux: out  std_logic_vector(14 DOWNTO 0);
			 --salidaicMux: out  std_logic_vector(14 DOWNTO 0);
			 --salidasumcon: out  std_logic_vector(14 DOWNTO 0);
			  --salidapcReg: out  std_logic_vector(14 DOWNTO 0);
			 EnableInst:out std_logic;
			--EnableSumcon:out std_logic;
			SalidaBancoDeRegistros : out std_logic_vector(31 DOWNTO 0);
				 ----------------------
				 clk : in std_logic
				 );
				 
				 
end RV32I;

architecture RV32IArch of RV32I is

signal CABLE_DCP_ROM : std_logic_vector(14 DOWNTO 0);
signal CABLE_ROM_INST_REG : std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_ROM : std_logic;
signal CABLE_CONTROL_DIRECCION_CP : std_logic;
signal CABLE_MUXJUMP_DIRECCION_CP : std_logic_vector (14 downto 0);
signal CABLE_CONTROL_INST_REG : std_logic;
signal CABLE_INTS_REG_EXT : std_logic_vector(31 DOWNTO 0);
signal CABLE_31_25: std_logic_vector(6 downto 0);
signal CABLE_24_20: std_logic_vector(4 downto 0);
signal CABLE_11_7: std_logic_vector(4 downto 0);
signal CABLE_SALIDA_32BITSI: std_logic_vector(31 DOWNTO 0);
signal CABLE_SALIDA_32BITS : std_logic_vector(31 DOWNTO 0);
signal CABLE_19_15: std_logic_vector(4 downto 0);
signal CABLE_BR_BR_OUT : std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_READ_RS2 : std_logic;
signal CABLE_CONTROL_READ_RS1 : std_logic;
signal CABLE_CONTROL_WRITE_BR : std_logic;
signal CABLE_AM_MUX_BR : std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_iMux : std_logic;
signal CABLE_iMux_iRMux : std_logic_vector(31 DOWNTO 0);
signal CABLE_BR_OUT1_ALU: std_logic_vector(31 DOWNTO 0);
signal CABLE_BR_OUT2_iRMux: std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_BR_OUT1 : std_logic;
signal CABLE_CONTROL_BR_OUT2 : std_logic;
signal CABLE_iRMux_ALU: std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_iRMux : std_logic;
signal CABLE_ALU_ALU_OUT: std_logic_vector(31 DOWNTO 0);
signal CABLE_ALU_AND: std_logic;
signal CABLE_CONTROL_ALU: std_logic_vector(2 DOWNTO 0);
signal CABLE_CONTROL_EXCE_ALU: std_logic;
signal CABLE_CONTROL_AND: std_logic;
signal CABLE_AND_icMux: std_logic;
signal CABLE_ALU_OUT_RAM: std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_ALU_OUT: std_logic;
signal CABLE_DATA_REG_amMux: std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_amMux: std_logic;
signal CABLE_DIRECCION_RAM: std_logic_vector(14 DOWNTO 0);
signal CABLE_READ_MD: std_logic;
signal CABLE_WRITE_MD: std_logic;
signal CABLE_RAM_DATA_REG: std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_DATA_REG: std_logic;
signal CABLE_OFFSET: std_logic_vector(14 DOWNTO 0);
signal CABLE_OFFSET32: std_logic_vector(31 DOWNTO 0);
signal CABLE_INCREMENTO: std_logic_vector(14 DOWNTO 0);
signal CABLE_IC_MUX_SUM_CON: std_logic_vector(14 DOWNTO 0);
signal CABLE_Exce_sum_con: std_logic;
signal CABLE_PC_REG_SUM_CON: std_logic_vector(14 DOWNTO 0);
signal CABLE_CONTROL_PC_Reg: std_logic;
signal CABLE_sum_con_sumcon_Reg: std_logic_vector(14 DOWNTO 0);
signal CABLE_sumcon_Reg_jump_mux: std_logic_vector(14 DOWNTO 0);
signal CABLE_CONTROL_jump_mux: std_logic;
signal CABLE_DECODER_ALU: std_logic_vector(16 DOWNTO 0);
signal CABLE_14_12: std_logic_vector(2 DOWNTO 0);
signal CABLE_6_0: std_logic_vector(6 DOWNTO 0);
signal CABLE_CONTROL_ALU2: std_logic_vector(3 DOWNTO 0);
signal incremento : std_logic_vector(14 DOWNTO 0);
signal CABLE_Salida_Data_Mux : std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_sumcon_Reg: std_logic;
signal CABLE_CONTROL_Data_Mux: std_logic;
signal reset: std_logic;
--------------------------------------------------------------------------
 begin
 -----------------------------------union de cables-----------------
 incremento(0)<='1';
 incremento(1)<='0';
 incremento(2)<='0';
 incremento(3)<='0';
 incremento(4)<='0';
 incremento(5)<='0';
 incremento(6)<='0';
 incremento(7)<='0';
 incremento(8)<='0';
 incremento(9)<='0';
 incremento(10)<='0';
 incremento(11)<='0';
 incremento(12)<='0';
 incremento(13)<='0';
 incremento(14)<='0';

 
 
 CABLE_31_25(6)<=CABLE_INTS_REG_EXT(31);
 CABLE_31_25(5)<=CABLE_INTS_REG_EXT(30);
 CABLE_31_25(4)<=CABLE_INTS_REG_EXT(29);
 CABLE_31_25(3)<=CABLE_INTS_REG_EXT(28);
 CABLE_31_25(2)<=CABLE_INTS_REG_EXT(27);
 CABLE_31_25(1)<=CABLE_INTS_REG_EXT(26);
 CABLE_31_25(0)<=CABLE_INTS_REG_EXT(25);
 CABLE_24_20(4)<=CABLE_INTS_REG_EXT(24);
 CABLE_24_20(3)<=CABLE_INTS_REG_EXT(23);
 CABLE_24_20(2)<=CABLE_INTS_REG_EXT(22);
 CABLE_24_20(1)<=CABLE_INTS_REG_EXT(21);
 CABLE_24_20(0)<=CABLE_INTS_REG_EXT(20);
 CABLE_11_7(4)<=CABLE_INTS_REG_EXT(11);
 CABLE_11_7(3)<=CABLE_INTS_REG_EXT(10);
 CABLE_11_7(2)<=CABLE_INTS_REG_EXT(9);
 CABLE_11_7(1)<=CABLE_INTS_REG_EXT(8);
 CABLE_11_7(0)<=CABLE_INTS_REG_EXT(7);
 CABLE_19_15(4)<=CABLE_INTS_REG_EXT(19);
 CABLE_19_15(3)<=CABLE_INTS_REG_EXT(18);
 CABLE_19_15(2)<=CABLE_INTS_REG_EXT(17);
 CABLE_19_15(1)<=CABLE_INTS_REG_EXT(16);
 CABLE_19_15(0)<=CABLE_INTS_REG_EXT(15);

 CABLE_DIRECCION_RAM(0)<=CABLE_ALU_OUT_RAM(0);
 CABLE_DIRECCION_RAM(1)<=CABLE_ALU_OUT_RAM(1);
 CABLE_DIRECCION_RAM(2)<=CABLE_ALU_OUT_RAM(2);
 CABLE_DIRECCION_RAM(3)<=CABLE_ALU_OUT_RAM(3);
 CABLE_DIRECCION_RAM(4)<=CABLE_ALU_OUT_RAM(4);
 CABLE_DIRECCION_RAM(5)<=CABLE_ALU_OUT_RAM(5);
 CABLE_DIRECCION_RAM(6)<=CABLE_ALU_OUT_RAM(6);
 CABLE_DIRECCION_RAM(7)<=CABLE_ALU_OUT_RAM(7);
 CABLE_DIRECCION_RAM(8)<=CABLE_ALU_OUT_RAM(8);
 CABLE_DIRECCION_RAM(9)<=CABLE_ALU_OUT_RAM(9);
 CABLE_DIRECCION_RAM(10)<=CABLE_ALU_OUT_RAM(10);
 CABLE_DIRECCION_RAM(11)<=CABLE_ALU_OUT_RAM(11);
 CABLE_DIRECCION_RAM(12)<=CABLE_ALU_OUT_RAM(12);
 CABLE_DIRECCION_RAM(13)<=CABLE_ALU_OUT_RAM(13);
 CABLE_DIRECCION_RAM(14)<=CABLE_ALU_OUT_RAM(14);

 
CABLE_OFFSET(0)<=CABLE_iMux_iRMux(0);
CABLE_OFFSET(1)<=CABLE_iMux_iRMux(1);
CABLE_OFFSET(2)<=CABLE_iMux_iRMux(2);
CABLE_OFFSET(3)<=CABLE_iMux_iRMux(3);
CABLE_OFFSET(4)<=CABLE_iMux_iRMux(4);
CABLE_OFFSET(5)<=CABLE_iMux_iRMux(5);
CABLE_OFFSET(6)<=CABLE_iMux_iRMux(6);
CABLE_OFFSET(7)<=CABLE_iMux_iRMux(7);
CABLE_OFFSET(8)<=CABLE_iMux_iRMux(8);
CABLE_OFFSET(9)<=CABLE_iMux_iRMux(9);
CABLE_OFFSET(10)<=CABLE_iMux_iRMux(10);
CABLE_OFFSET(11)<=CABLE_iMux_iRMux(11);
CABLE_OFFSET(12)<=CABLE_iMux_iRMux(12);
CABLE_OFFSET(13)<=CABLE_iMux_iRMux(13);
CABLE_OFFSET(14)<=CABLE_iMux_iRMux(14);

 
 
CABLE_OFFSET32(0)<=CABLE_iMux_iRMux(0);
CABLE_OFFSET32(1)<=CABLE_iMux_iRMux(1);
CABLE_OFFSET32(2)<=CABLE_iMux_iRMux(2);
CABLE_OFFSET32(3)<=CABLE_iMux_iRMux(3);
CABLE_OFFSET32(4)<=CABLE_iMux_iRMux(4);
CABLE_OFFSET32(5)<=CABLE_iMux_iRMux(5);
CABLE_OFFSET32(6)<=CABLE_iMux_iRMux(6);
CABLE_OFFSET32(7)<=CABLE_iMux_iRMux(7);
CABLE_OFFSET32(8)<=CABLE_iMux_iRMux(8);
CABLE_OFFSET32(9)<=CABLE_iMux_iRMux(9);
CABLE_OFFSET32(10)<=CABLE_iMux_iRMux(10);
CABLE_OFFSET32(11)<=CABLE_iMux_iRMux(11);
CABLE_OFFSET32(12)<=CABLE_iMux_iRMux(12);
CABLE_OFFSET32(13)<=CABLE_iMux_iRMux(13);
CABLE_OFFSET32(14)<=CABLE_iMux_iRMux(14);
CABLE_OFFSET32(15)<=CABLE_iMux_iRMux(15);
CABLE_OFFSET32(16)<=CABLE_iMux_iRMux(16);
CABLE_OFFSET32(17)<=CABLE_iMux_iRMux(17);
CABLE_OFFSET32(18)<=CABLE_iMux_iRMux(18);
CABLE_OFFSET32(19)<=CABLE_iMux_iRMux(19);
CABLE_OFFSET32(20)<=CABLE_iMux_iRMux(20);
CABLE_OFFSET32(21)<=CABLE_iMux_iRMux(21);
CABLE_OFFSET32(22)<=CABLE_iMux_iRMux(22);
CABLE_OFFSET32(23)<=CABLE_iMux_iRMux(23);
CABLE_OFFSET32(24)<=CABLE_iMux_iRMux(24);
CABLE_OFFSET32(25)<=CABLE_iMux_iRMux(25);
CABLE_OFFSET32(26)<=CABLE_iMux_iRMux(26);
CABLE_OFFSET32(27)<=CABLE_iMux_iRMux(27);
CABLE_OFFSET32(28)<=CABLE_iMux_iRMux(28);
CABLE_OFFSET32(29)<=CABLE_iMux_iRMux(29);
CABLE_OFFSET32(30)<=CABLE_iMux_iRMux(30);
CABLE_OFFSET32(31)<=CABLE_iMux_iRMux(31);

 
  CABLE_14_12(2)<=CABLE_INTS_REG_EXT(14);
  CABLE_14_12(1)<=CABLE_INTS_REG_EXT(13);
  CABLE_14_12(0)<=CABLE_INTS_REG_EXT(12);
  
  CABLE_6_0(6)<=CABLE_INTS_REG_EXT(6);
  CABLE_6_0(5)<=CABLE_INTS_REG_EXT(5);
  CABLE_6_0(4)<=CABLE_INTS_REG_EXT(4);
  CABLE_6_0(3)<=CABLE_INTS_REG_EXT(3);
  CABLE_6_0(2)<=CABLE_INTS_REG_EXT(2);
  CABLE_6_0(1)<=CABLE_INTS_REG_EXT(1);
  CABLE_6_0(0)<=CABLE_INTS_REG_EXT(0);
	 
	 
  CABLE_DECODER_ALU(16)<=CABLE_31_25(6);
  CABLE_DECODER_ALU(15)<=CABLE_31_25(5);
  CABLE_DECODER_ALU(14)<=CABLE_31_25(4);
  CABLE_DECODER_ALU(13)<=CABLE_31_25(3);
  CABLE_DECODER_ALU(12)<=CABLE_31_25(2);
  CABLE_DECODER_ALU(11)<=CABLE_31_25(1);
  CABLE_DECODER_ALU(10)<=CABLE_31_25(0);
  CABLE_DECODER_ALU(9)<=CABLE_14_12(2);
  CABLE_DECODER_ALU(8)<=CABLE_14_12(1);
  CABLE_DECODER_ALU(7)<=CABLE_14_12(0);
  CABLE_DECODER_ALU(6)<=CABLE_6_0(6);
  CABLE_DECODER_ALU(5)<=CABLE_6_0(5);
  CABLE_DECODER_ALU(4)<=CABLE_6_0(4);
  CABLE_DECODER_ALU(3)<=CABLE_6_0(3);
  CABLE_DECODER_ALU(2)<=CABLE_6_0(2);
  CABLE_DECODER_ALU(1)<=CABLE_6_0(1);
  CABLE_DECODER_ALU(0)<=CABLE_6_0(0);
  
  
  Salida_Registro_Direccion_CP<=CABLE_DCP_ROM;
  Read_ROM<=CABLE_CONTROL_ROM;
  CABLE_ROM_INST_REG<=Entrada_Registro_Inst;
  
  Salida_Data_Mux<=CABLE_Salida_Data_Mux;
  Write_RAM<=CABLE_WRITE_MD;
  Read_RAM<=CABLE_READ_MD;
  
  Salida_Registro_ALU_OUT<=CABLE_DIRECCION_RAM;
  
  CABLE_RAM_DATA_REG<=Entrada_Registro_Data_Reg;
  ------puntas de prueba-----------
 -- BR<=CABLE_BR_BR_OUT;
 --REGBR1<=CABLE_BR_OUT1_ALU;
 --REGBR2<=CABLE_BR_OUT2_iRMUx;
  --IRMUX<=CABLE_iRMux_ALU;
	enablers1<=CABLE_CONTROL_BR_OUT1;
	readrs1<=CABLE_CONTROL_READ_RS1;
	enablers2<=CABLE_CONTROL_BR_OUT2;
	readrs2<=CABLE_CONTROL_READ_RS2;
	--wire24_20<=CABLE_24_20;
--wire19_15<=CABLE_19_15;
	--wire11_7<=CABLE_11_7;
	writebr<=CABLE_CONTROL_WRITE_BR;
		--DataentradaBr<=CABLE_AM_MUX_BR;
       --SalidaRegALU<=CABLE_ALU_OUT_RAM;
		 ExceALU<=CABLE_CONTROL_EXCE_ALU;
	   enableALUOUT<=CABLE_CONTROL_ALU_OUT;
		EnablePC<=CABLE_CONTROL_PC_Reg;
		--SlectamMux<=CABLE_CONTROL_amMux;
		SlectiMux<=CABLE_CONTROL_iMux;
		SelectiRMux<=CABLE_CONTROL_iRMux;
		 enabledireccioncp<=CABLE_CONTROL_DIRECCION_CP;
		 enabledata<=CABLE_CONTROL_DATA_REG;
	selectdatamux<=CABLE_CONTROL_Data_Mux;
	ReadRam<=CABLE_READ_MD;
		--selectjumpmux<=CABLE_CONTROL_jump_mux;
		 ---SalidaALU2<=CABLE_ALU_AND;
		 --controlALU2<=CABLE_CONTROL_ALU2;
		 --andBranch<=CABLE_CONTROL_AND;
		 --ALUOPCODE<=CABLE_DECODER_ALU;
		 --selecticMux<=CABLE_AND_icMux;
		--exceContador<=CABLE_Exce_sum_con;
		--salidaiMux<=CABLE_OFFSET;
		--salidasumcon<=CABLE_sum_con_sumcon_Reg;
	  -- salidaicMux<=CABLE_IC_MUX_SUM_CON;
	--salidapcReg<=CABLE_PC_REG_SUM_CON;
	--salidadireccioncero<=CABLE_CONTROL_DIRECCIONCERO;
	EnableInst<=CABLE_CONTROL_INST_REG;
	SalidaBancoDeRegistros<=CABLE_BR_BR_OUT;
	--EnableSumcon<=CABLE_CONTROL_sumcon_Reg;
	 --salidareset<=reset;
	 --Cable_direccION_RAM<=CABLE_ALU_OUT_RAM;
 -----------------------------Uniion de subsitemas internos del procesador con la arquitectura de mayor jerarquia---------------------------------------------------------------------------------
 --U1 : entity work.rom port map(CABLE_DCP_ROM,clk,CABLE_CONTROL_ROM,CABLE_ROM_INST_REG);
 U2 : entity work.Direccion_CP port map(clk,clear,CABLE_DCP_ROM,CABLE_CONTROL_DIRECCION_CP,CABLE_MUXJUMP_DIRECCION_CP);
 U3 : entity work.Inst_Reg port map(clk,clear,CABLE_INTS_REG_EXT ,CABLE_CONTROL_INST_REG,CABLE_ROM_INST_REG );
 U4 : entity work.SignExtension port map(CABLE_SALIDA_32BITSI,CABLE_SALIDA_32BITS,CABLE_31_25,CABLE_24_20,CABLE_11_7);
 U5 : entity work.BancoDeRegistros port map(clk,clear,CABLE_11_7,CABLE_24_20,CABLE_19_15,CABLE_CONTROL_WRITE_BR,CABLE_CONTROL_READ_RS1,CABLE_CONTROL_READ_RS2,CABLE_BR_BR_OUT,CABLE_AM_MUX_BR);
 U6 : entity work.iMux port map(CABLE_SALIDA_32BITSI,CABLE_SALIDA_32BITS,CABLE_iMux_iRMux,CABLE_CONTROL_iMux);
 U7 : entity work.BR_OUT1 port map(clk,clear,CABLE_BR_OUT1_ALU,CABLE_CONTROL_BR_OUT1,CABLE_BR_BR_OUT);
 U8 : entity work.BR_OUT2 port map(clk,clear,CABLE_BR_OUT2_iRMUx,CABLE_CONTROL_BR_OUT2,CABLE_BR_BR_OUT);
 U9 : entity work.iRMux port map(CABLE_iMux_iRMux,CABLE_BR_OUT2_iRMux,CABLE_iRMux_ALU,CABLE_CONTROL_iRMux);
 U10 : entity work.ALU32 port map(CABLE_ALU_ALU_OUT,CABLE_ALU_AND,CABLE_CONTROL_ALU,CABLE_CONTROL_ALU2,CABLE_iRMux_ALU,CABLE_BR_OUT1_ALU,CABLE_CONTROL_EXCE_ALU);
 U11 : entity work.ANDb port map(CABLE_CONTROL_AND,CABLE_ALU_AND,CABLE_AND_icMux);
 U12 : entity work.ALU_OUT port map(clk,clear,CABLE_ALU_OUT_RAM,CABLE_CONTROL_ALU_OUT,CABLE_ALU_ALU_OUT);
 U13 : entity work.amMux port map(CABLE_ALU_OUT_RAM,CABLE_DATA_REG_amMux,CABLE_AM_MUX_BR,CABLE_CONTROL_amMux);
 --U14 : entity work.RAM port map(clk,CABLE_Salida_Data_Mux ,CABLE_DIRECCION_RAM,CABLE_READ_MD,CABLE_DIRECCION_RAM,CABLE_WRITE_MD,CABLE_RAM_DATA_REG);
 U15 : entity work.Data_Reg port map(clk,clear,CABLE_DATA_REG_amMux,CABLE_CONTROL_DATA_REG,CABLE_RAM_DATA_REG);
 U16 : entity work.ic_Mux port map(incremento,CABLE_OFFSET,CABLE_IC_MUX_SUM_CON,CABLE_AND_icMux);
 U17 : entity work.jump_Mux port map(CABLE_sumcon_Reg_jump_mux,CABLE_OFFSET, CABLE_MUXJUMP_DIRECCION_CP,CABLE_CONTROL_jump_mux);
 U18 : entity work.PC_Reg port map(clk,clear,CABLE_PC_REG_SUM_CON,CABLE_CONTROL_PC_Reg,CABLE_DCP_ROM);
 U19 : entity work.Sum_con port map(CABLE_sum_con_sumcon_Reg,CABLE_IC_MUX_SUM_CON,CABLE_Exce_sum_con,CABLE_PC_REG_SUM_CON);
 U20 : entity work.Alu_Decoder port map(CABLE_DECODER_ALU,CABLE_CONTROL_ALU2,CABLE_CONTROL_ALU);
 U21 : entity work.sumcon_Reg port map(clk,clear,CABLE_sumcon_Reg_jump_mux,CABLE_CONTROL_sumcon_Reg,CABLE_sum_con_sumcon_Reg);
 U22 : entity work.Data_Mux port map(CABLE_BR_OUT2_iRMUx,CABLE_OFFSET32,CABLE_Salida_Data_Mux ,CABLE_CONTROL_Data_Mux);
 U23 : entity work.MainDecoder port map(clear,CABLE_CONTROL_PC_Reg,CABLE_CONTROL_WRITE_BR,CABLE_CONTROL_READ_RS1,CABLE_CONTROL_INST_REG,CABLE_CONTROL_ROM,CABLE_CONTROL_DIRECCION_CP, CABLE_CONTROL_READ_RS2,CABLE_CONTROL_BR_OUT2,CABLE_CONTROL_jump_mux,CABLE_CONTROL_AND,CABLE_CONTROL_amMux,CABLE_CONTROL_iRMux,CABLE_CONTROL_iMux,CABLE_Exce_sum_con,CABLE_CONTROL_EXCE_ALU,CABLE_CONTROL_BR_OUT1,CABLE_CONTROL_ALU_OUT,CABLE_WRITE_MD,CABLE_READ_MD,CABLE_CONTROL_DATA_REG,CABLE_6_0,CABLE_CONTROL_sumcon_Reg,CABLE_CONTROL_Data_Mux,clk );
 end RV32IArch;

 