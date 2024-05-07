--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE amMux--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity amMux is
       port( 
				 Salida_ALU_OUT : in STD_LOGIC_VECTOR(31 downto 0);
				 Salida_Data_Reg : in STD_LOGIC_VECTOR(31 downto 0);
				 Salida_amMux :out STD_LOGIC_VECTOR(31 downto 0);
				 Select_amMux :in STD_LOGIC);
				 
end amMux;

architecture amMuxArch of amMux is

begin


Salida_amMux(0)<=(Salida_ALU_OUT(0) and not Select_amMux) or (Salida_Data_Reg(0) and Select_amMux);--
Salida_amMux(1)<=(Salida_ALU_OUT(1) and not Select_amMux) or (Salida_Data_Reg(1) and Select_amMux);
Salida_amMux(2)<=(Salida_ALU_OUT(2) and not Select_amMux) or (Salida_Data_Reg(2) and Select_amMux);
Salida_amMux(3)<=(Salida_ALU_OUT(3) and not Select_amMux) or (Salida_Data_Reg(3) and Select_amMux);
Salida_amMux(4)<=(Salida_ALU_OUT(4) and not Select_amMux) or (Salida_Data_Reg(4) and Select_amMux);
Salida_amMux(5)<=(Salida_ALU_OUT(5) and not Select_amMux) or (Salida_Data_Reg(5) and Select_amMux);
Salida_amMux(6)<=(Salida_ALU_OUT(6) and not Select_amMux) or (Salida_Data_Reg(6) and Select_amMux);
Salida_amMux(7)<=(Salida_ALU_OUT(7) and not Select_amMux) or (Salida_Data_Reg(7) and Select_amMux);
Salida_amMux(8)<=(Salida_ALU_OUT(8) and not Select_amMux) or (Salida_Data_Reg(8) and Select_amMux);
Salida_amMux(9)<=(Salida_ALU_OUT(9) and not Select_amMux) or (Salida_Data_Reg(9) and Select_amMux);
Salida_amMux(10)<=(Salida_ALU_OUT(10) and not Select_amMux) or (Salida_Data_Reg(10) and Select_amMux);
Salida_amMux(11)<=(Salida_ALU_OUT(11) and not Select_amMux) or (Salida_Data_Reg(11) and Select_amMux);
Salida_amMux(12)<=(Salida_ALU_OUT(12) and not Select_amMux) or (Salida_Data_Reg(12) and Select_amMux);
Salida_amMux(13)<=(Salida_ALU_OUT(13) and not Select_amMux) or (Salida_Data_Reg(13) and Select_amMux);
Salida_amMux(14)<=(Salida_ALU_OUT(14) and not Select_amMux) or (Salida_Data_Reg(14) and Select_amMux);
Salida_amMux(15)<=(Salida_ALU_OUT(15) and not Select_amMux) or (Salida_Data_Reg(15) and Select_amMux);
Salida_amMux(16)<=(Salida_ALU_OUT(16) and not Select_amMux) or (Salida_Data_Reg(16) and Select_amMux);
Salida_amMux(17)<=(Salida_ALU_OUT(17) and not Select_amMux) or (Salida_Data_Reg(17) and Select_amMux);
Salida_amMux(18)<=(Salida_ALU_OUT(18) and not Select_amMux) or (Salida_Data_Reg(18) and Select_amMux);
Salida_amMux(19)<=(Salida_ALU_OUT(19) and not Select_amMux) or (Salida_Data_Reg(19) and Select_amMux);
Salida_amMux(20)<=(Salida_ALU_OUT(20) and not Select_amMux) or (Salida_Data_Reg(20) and Select_amMux);
Salida_amMux(21)<=(Salida_ALU_OUT(21) and not Select_amMux) or (Salida_Data_Reg(21) and Select_amMux);
Salida_amMux(22)<=(Salida_ALU_OUT(22) and not Select_amMux) or (Salida_Data_Reg(22) and Select_amMux);
Salida_amMux(23)<=(Salida_ALU_OUT(23) and not Select_amMux) or (Salida_Data_Reg(23) and Select_amMux);
Salida_amMux(24)<=(Salida_ALU_OUT(24) and not Select_amMux) or (Salida_Data_Reg(24) and Select_amMux);
Salida_amMux(25)<=(Salida_ALU_OUT(25) and not Select_amMux) or (Salida_Data_Reg(25) and Select_amMux);
Salida_amMux(26)<=(Salida_ALU_OUT(26) and not Select_amMux) or (Salida_Data_Reg(26) and Select_amMux);
Salida_amMux(27)<=(Salida_ALU_OUT(27) and not Select_amMux) or (Salida_Data_Reg(27) and Select_amMux);
Salida_amMux(28)<=(Salida_ALU_OUT(28) and not Select_amMux) or (Salida_Data_Reg(28) and Select_amMux);
Salida_amMux(29)<=(Salida_ALU_OUT(29) and not Select_amMux) or (Salida_Data_Reg(29) and Select_amMux);
Salida_amMux(30)<=(Salida_ALU_OUT(30) and not Select_amMux) or (Salida_Data_Reg(30) and Select_amMux);
Salida_amMux(31)<=(Salida_ALU_OUT(31) and not Select_amMux) or (Salida_Data_Reg(31) and Select_amMux);


end amMuxArch;
