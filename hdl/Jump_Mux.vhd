--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Jump_Mux--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity Jump_Mux is
       port( 
				 Salida_Sum_con : in STD_LOGIC_VECTOR(14 downto 0);
				 Offset : in STD_LOGIC_VECTOR(14 downto 0);
				 Salida_Jump_Mux :out STD_LOGIC_VECTOR(14 downto 0);
				 Select_Jump_Mux :in STD_LOGIC);
				 
end Jump_Mux;

architecture Jump_MuxArch of Jump_Mux is

begin


Salida_Jump_Mux(0)<=(Salida_Sum_con(0) and not Select_Jump_Mux) or (Offset(0) and Select_Jump_Mux);--con 1 optenemos la extension de signo con los 12 bits seguidos.
Salida_Jump_Mux(1)<=(Salida_Sum_con(1) and not Select_Jump_Mux) or (Offset(1) and Select_Jump_Mux);
Salida_Jump_Mux(2)<=(Salida_Sum_con(2) and not Select_Jump_Mux) or (Offset(2) and Select_Jump_Mux);
Salida_Jump_Mux(3)<=(Salida_Sum_con(3) and not Select_Jump_Mux) or (Offset(3) and Select_Jump_Mux);
Salida_Jump_Mux(4)<=(Salida_Sum_con(4) and not Select_Jump_Mux) or (Offset(4) and Select_Jump_Mux);
Salida_Jump_Mux(5)<=(Salida_Sum_con(5) and not Select_Jump_Mux) or (Offset(5) and Select_Jump_Mux);
Salida_Jump_Mux(6)<=(Salida_Sum_con(6) and not Select_Jump_Mux) or (Offset(6) and Select_Jump_Mux);
Salida_Jump_Mux(7)<=(Salida_Sum_con(7) and not Select_Jump_Mux) or (Offset(7) and Select_Jump_Mux);
Salida_Jump_Mux(8)<=(Salida_Sum_con(8) and not Select_Jump_Mux) or (Offset(8) and Select_Jump_Mux);
Salida_Jump_Mux(9)<=(Salida_Sum_con(9) and not Select_Jump_Mux) or (Offset(9) and Select_Jump_Mux);
Salida_Jump_Mux(10)<=(Salida_Sum_con(10) and not Select_Jump_Mux) or (Offset(10) and Select_Jump_Mux);
Salida_Jump_Mux(11)<=(Salida_Sum_con(11) and not Select_Jump_Mux) or (Offset(11) and Select_Jump_Mux);
Salida_Jump_Mux(12)<=(Salida_Sum_con(12) and not Select_Jump_Mux) or (Offset(12) and Select_Jump_Mux);
Salida_Jump_Mux(13)<=(Salida_Sum_con(13) and not Select_Jump_Mux) or (Offset(13) and Select_Jump_Mux);
Salida_Jump_Mux(14)<=(Salida_Sum_con(14) and not Select_Jump_Mux) or (Offset(14) and Select_Jump_Mux);



end Jump_MuxArch;
