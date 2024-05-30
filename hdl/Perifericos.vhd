--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Control_Unit DE RVI32--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity Perifericos is
       port( 
		       
				 
				 Read_ROM : in std_logic;
				 ROM_Direccion : in std_logic_vector(14 DOWNTO 0);
				 ROM_Salida : out std_logic_vector(31 DOWNTO 0);
				 
				 RAM_Datain : in std_logic_vector(31 DOWNTO 0);
				 RAM_Write_MD : in std_logic;
				 RAM_Read_MD : in std_logic;
				 RAM_Direccion : in std_logic_vector(14 DOWNTO 0);
				 RAM_Salida : out std_logic_vector(31 DOWNTO 0);
	             clear : in std_logic;
				 clk : in std_logic
				 );
				 
end Perifericos;

architecture PerifericosArch of Perifericos is

signal CABLE_DCP_ROM : std_logic_vector(14 DOWNTO 0);
signal CABLE_ROM_INST_REG : std_logic_vector(31 DOWNTO 0);
signal CABLE_CONTROL_ROM : std_logic;


signal CABLE_DIRECCION_RAM: std_logic_vector(14 DOWNTO 0);
signal CABLE_READ_MD: std_logic;
signal CABLE_WRITE_MD: std_logic;
signal CABLE_RAM_DATA_REG: std_logic_vector(31 DOWNTO 0);
signal CABLE_Salida_Data_Mux : std_logic_vector(31 DOWNTO 0);
--------------------------------------------------------------------------
 begin
 
CABLE_CONTROL_ROM<=Read_ROM;
CABLE_DCP_ROM<=ROM_Direccion;
ROM_Salida<=CABLE_ROM_INST_REG;

CABLE_Salida_Data_Mux<=RAM_Datain;
CABLE_WRITE_MD<=RAM_Write_MD;
CABLE_READ_MD<=RAM_Read_MD;
CABLE_DIRECCION_RAM<=RAM_Direccion;
RAM_Salida<=CABLE_RAM_DATA_REG;
 ------------------------------------------------
 -----------------------------Uniion de subsitemas internos del procesador con la arquitectura de mayor jerarquia---------------------------------------------------------------------------------
 U1 : entity work.rom port map(CLEAR,CABLE_DCP_ROM,clk,CABLE_CONTROL_ROM,CABLE_ROM_INST_REG);
 U2 : entity work.RAM port map(clk,CABLE_Salida_Data_Mux ,CABLE_DIRECCION_RAM,CABLE_READ_MD,CABLE_WRITE_MD,clear,CABLE_RAM_DATA_REG);

 end PerifericosArch;
 