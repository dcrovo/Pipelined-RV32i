--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE iRMux--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity iRMux is
       port( 
				 Salida_iMux : in STD_LOGIC_VECTOR(31 downto 0);
				 Salida_BR_OUT2 : in STD_LOGIC_VECTOR(31 downto 0);
				 Salida_iRMux :out STD_LOGIC_VECTOR(31 downto 0);
				 Select_iRMux :in STD_LOGIC);
				 
end iRMux;

architecture iRMuxArch of iRMux is

begin


Salida_iRMux(0)<=(Salida_iMux(0) and not Select_iRMux) or (Salida_BR_OUT2(0) and Select_iRMux);--con 1 optenemos la extension de signo con los 12 bits seguidos.
Salida_iRMux(1)<=(Salida_iMux(1) and not Select_iRMux) or (Salida_BR_OUT2(1) and Select_iRMux);
Salida_iRMux(2)<=(Salida_iMux(2) and not Select_iRMux) or (Salida_BR_OUT2(2) and Select_iRMux);
Salida_iRMux(3)<=(Salida_iMux(3) and not Select_iRMux) or (Salida_BR_OUT2(3) and Select_iRMux);
Salida_iRMux(4)<=(Salida_iMux(4) and not Select_iRMux) or (Salida_BR_OUT2(4) and Select_iRMux);
Salida_iRMux(5)<=(Salida_iMux(5) and not Select_iRMux) or (Salida_BR_OUT2(5) and Select_iRMux);
Salida_iRMux(6)<=(Salida_iMux(6) and not Select_iRMux) or (Salida_BR_OUT2(6) and Select_iRMux);
Salida_iRMux(7)<=(Salida_iMux(7) and not Select_iRMux) or (Salida_BR_OUT2(7) and Select_iRMux);
Salida_iRMux(8)<=(Salida_iMux(8) and not Select_iRMux) or (Salida_BR_OUT2(8) and Select_iRMux);
Salida_iRMux(9)<=(Salida_iMux(9) and not Select_iRMux) or (Salida_BR_OUT2(9) and Select_iRMux);
Salida_iRMux(10)<=(Salida_iMux(10) and not Select_iRMux) or (Salida_BR_OUT2(10) and Select_iRMux);
Salida_iRMux(11)<=(Salida_iMux(11) and not Select_iRMux) or (Salida_BR_OUT2(11) and Select_iRMux);
Salida_iRMux(12)<=(Salida_iMux(12) and not Select_iRMux) or (Salida_BR_OUT2(12) and Select_iRMux);
Salida_iRMux(13)<=(Salida_iMux(13) and not Select_iRMux) or (Salida_BR_OUT2(13) and Select_iRMux);
Salida_iRMux(14)<=(Salida_iMux(14) and not Select_iRMux) or (Salida_BR_OUT2(14) and Select_iRMux);
Salida_iRMux(15)<=(Salida_iMux(15) and not Select_iRMux) or (Salida_BR_OUT2(15) and Select_iRMux);
Salida_iRMux(16)<=(Salida_iMux(16) and not Select_iRMux) or (Salida_BR_OUT2(16) and Select_iRMux);
Salida_iRMux(17)<=(Salida_iMux(17) and not Select_iRMux) or (Salida_BR_OUT2(17) and Select_iRMux);
Salida_iRMux(18)<=(Salida_iMux(18) and not Select_iRMux) or (Salida_BR_OUT2(18) and Select_iRMux);
Salida_iRMux(19)<=(Salida_iMux(19) and not Select_iRMux) or (Salida_BR_OUT2(19) and Select_iRMux);
Salida_iRMux(20)<=(Salida_iMux(20) and not Select_iRMux) or (Salida_BR_OUT2(20) and Select_iRMux);
Salida_iRMux(21)<=(Salida_iMux(21) and not Select_iRMux) or (Salida_BR_OUT2(21) and Select_iRMux);
Salida_iRMux(22)<=(Salida_iMux(22) and not Select_iRMux) or (Salida_BR_OUT2(22) and Select_iRMux);
Salida_iRMux(23)<=(Salida_iMux(23) and not Select_iRMux) or (Salida_BR_OUT2(23) and Select_iRMux);
Salida_iRMux(24)<=(Salida_iMux(24) and not Select_iRMux) or (Salida_BR_OUT2(24) and Select_iRMux);
Salida_iRMux(25)<=(Salida_iMux(25) and not Select_iRMux) or (Salida_BR_OUT2(25) and Select_iRMux);
Salida_iRMux(26)<=(Salida_iMux(26) and not Select_iRMux) or (Salida_BR_OUT2(26) and Select_iRMux);
Salida_iRMux(27)<=(Salida_iMux(27) and not Select_iRMux) or (Salida_BR_OUT2(27) and Select_iRMux);
Salida_iRMux(28)<=(Salida_iMux(28) and not Select_iRMux) or (Salida_BR_OUT2(28) and Select_iRMux);
Salida_iRMux(29)<=(Salida_iMux(29) and not Select_iRMux) or (Salida_BR_OUT2(29) and Select_iRMux);
Salida_iRMux(30)<=(Salida_iMux(30) and not Select_iRMux) or (Salida_BR_OUT2(30) and Select_iRMux);
Salida_iRMux(31)<=(Salida_iMux(31) and not Select_iRMux) or (Salida_BR_OUT2(31) and Select_iRMux);


end iRMuxArch;
