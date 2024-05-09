
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
entity RISCV32 is
       port( 
		      
				 Direccion_CP :  out std_logic_vector(14 DOWNTO 0);
				 --Data_Mux : out std_logic_vector(31 DOWNTO 0);
				 ROM : out std_logic_vector(31 DOWNTO 0);
				 DirecionRAM:out std_logic_vector(14 DOWNTO 0);
				SalidaBancoDeRegistros: out std_logic_vector( 31 DOWNTO 0);
				 RAM :out std_logic_vector(31 DOWNTO 0);
				 --salidacontador:  out std_logic_vector(14 DOWNTO 0);-
				 --boton : out std_logic;
				 --salidaicMuxs:  out std_logic_vector(14 DOWNTO 0);
				 --salidaPCREG:  out std_logic_vector(14 DOWNTO 0);
				 --salidareset : out std_logic;
             --BR : out std_logic_vector(31 DOWNTO 0);
			--------------------SALIDAS DE CONTROL-----------
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
			writeRAM: out std_logic;
			--pulseOUT: out std_logic;--PULse
			--CLEAROUT: out std_logic;--CLEAR
			
			
			----------------------------------------------------
				 clk : in std_logic
				 );
				 
end RISCV32;

architecture RISCV32Arch of RISCV32 is

		 ------ROM----
				signal Salida_Registro_Direccion_CP :  std_logic_vector(14 DOWNTO 0);
				signal Entrada_Registro_Inst :  std_logic_vector(31 DOWNTO 0);
				signal Read_ROM : std_logic;
				 -----ROM-----
				 
				 signal Salida_Data_Mux : std_logic_vector(31 DOWNTO 0);
				 signal Read_RAM : std_logic;
				 signal Write_RAM : std_logic;
				 signal Salida_Registro_ALU_OUT : std_logic_vector(14 DOWNTO 0);
				 signal Entrada_Registro_Data_Reg : std_logic_vector(31 DOWNTO 0);
             signal pulse : std_logic;
				  signal clear : std_logic;
				 --------prueba----
				 --signal salidaicMux : std_logic_vector(14 DOWNTO 0);
				 --signal pcreg : std_logic_vector(14 DOWNTO 0);
--------------------------------------------------------------------------
 begin
Direccion_CP<=Salida_Registro_Direccion_CP ;
 --Data_Mux<=Salida_Data_Mux;
 ROM<=Entrada_Registro_Inst;
 RAM<= Entrada_Registro_Data_Reg;
 DirecionRAM<= Salida_Registro_ALU_OUT; 
 ReadROM<=Read_ROM; 
 writeRAM <= Write_RAM;
 ------------------------
--salidaicMuxs<=salidaicMux;
--salidaPCREG<=pcreg;
clkOUT<=not clk;
clkOUT2<=not clk;
clkOUT3<=not clk;
--pulse<= NOT start;
clear<= not reset;
--clearOUT<=clear;
--boton<=start;

 -----------------------------Uniion de subsitemas internos del procesador con la arquitectura de mayor jerarquia---------------------------------------------------------------------------------
 UA : entity work.RV32I port map(clear,Salida_Registro_Direccion_CP,Entrada_Registro_Inst,Read_ROM,Salida_Data_Mux, Read_RAM , Write_RAM, Salida_Registro_ALU_OUT,Entrada_Registro_Data_Reg,enablers1,enablers2,readrs1,readrs2,writebr,ExceALU,enableALUOUT,EnablePC,	SlectiMux,SelectiRMux, enabledireccioncp,enabledata, selectdatamux,ReadRam, EnableInst,SalidaBancoDeRegistros,clk);
 UB : entity work.Perifericos port map(Read_ROM,Salida_Registro_Direccion_CP,Entrada_Registro_Inst,Salida_Data_Mux,Write_RAM,Read_RAM, Salida_Registro_ALU_OUT , Entrada_Registro_Data_Reg,clear,clk);

 end RISCV32Arch;