--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro AND--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity ANDb is
       port( 
		       Branch_AND : in std_logic;
				 Salida_ALU2 : in std_logic;
				 Select_ic_Mux : out std_logic
				 
				 );
				 
end ANDb;


architecture ANDbArch of ANDb is


 begin

 

   Select_ic_Mux<=Branch_AND and Salida_ALU2;
  
	 
 end ANDbArch;
