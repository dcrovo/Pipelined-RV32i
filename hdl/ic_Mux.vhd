--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE ic_Mux--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity ic_Mux is
       port( 
				 Incremento : in STD_LOGIC_VECTOR(14 downto 0);
				 Offset : in STD_LOGIC_VECTOR(14 downto 0);
				 Salida_ic_Mux :out STD_LOGIC_VECTOR(14 downto 0);
				 Select_ic_Mux :in STD_LOGIC);
				 
end ic_Mux;

architecture ic_MuxArch of ic_Mux is

begin


Salida_ic_Mux(0)<=(Incremento(0) and not Select_ic_Mux) or (Offset(0) and Select_ic_Mux);--con 1 optenemos la extension de signo con los 12 bits seguidos.
Salida_ic_Mux(1)<=(Incremento(1) and not Select_ic_Mux) or (Offset(1) and Select_ic_Mux);
Salida_ic_Mux(2)<=(Incremento(2) and not Select_ic_Mux) or (Offset(2) and Select_ic_Mux);
Salida_ic_Mux(3)<=(Incremento(3) and not Select_ic_Mux) or (Offset(3) and Select_ic_Mux);
Salida_ic_Mux(4)<=(Incremento(4) and not Select_ic_Mux) or (Offset(4) and Select_ic_Mux);
Salida_ic_Mux(5)<=(Incremento(5) and not Select_ic_Mux) or (Offset(5) and Select_ic_Mux);
Salida_ic_Mux(6)<=(Incremento(6) and not Select_ic_Mux) or (Offset(6) and Select_ic_Mux);
Salida_ic_Mux(7)<=(Incremento(7) and not Select_ic_Mux) or (Offset(7) and Select_ic_Mux);
Salida_ic_Mux(8)<=(Incremento(8) and not Select_ic_Mux) or (Offset(8) and Select_ic_Mux);
Salida_ic_Mux(9)<=(Incremento(9) and not Select_ic_Mux) or (Offset(9) and Select_ic_Mux);
Salida_ic_Mux(10)<=(Incremento(10) and not Select_ic_Mux) or (Offset(10) and Select_ic_Mux);
Salida_ic_Mux(11)<=(Incremento(11) and not Select_ic_Mux) or (Offset(11) and Select_ic_Mux);
Salida_ic_Mux(12)<=(Incremento(12) and not Select_ic_Mux) or (Offset(12) and Select_ic_Mux);
Salida_ic_Mux(13)<=(Incremento(13) and not Select_ic_Mux) or (Offset(13) and Select_ic_Mux);
Salida_ic_Mux(14)<=(Incremento(14) and not Select_ic_Mux) or (Offset(14) and Select_ic_Mux);



end ic_MuxArch;

