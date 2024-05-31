--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE iMux--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity iMux is
       port( 
				 Salida_32bitsI : in STD_LOGIC_VECTOR(31 downto 0);
				 Salida_32bits : in STD_LOGIC_VECTOR(31 downto 0);
				 Salida_iMux :out STD_LOGIC_VECTOR(31 downto 0);
				 Select_iMux :in STD_LOGIC);
				 
end iMux;

architecture iMuxArch of iMux is

begin


Salida_iMux(0)<=(Salida_32Bits(0) and not Select_iMux) or (Salida_32BitsI(0) and Select_iMux);--con 1 optenemos la extension de signo con los 12 bits seguidos.
Salida_iMux(1)<=(Salida_32Bits(1) and not Select_iMux) or (Salida_32BitsI(1) and Select_iMux);
Salida_iMux(2)<=(Salida_32Bits(2) and not Select_iMux) or (Salida_32BitsI(2) and Select_iMux);
Salida_iMux(3)<=(Salida_32Bits(3) and not Select_iMux) or (Salida_32BitsI(3) and Select_iMux);
Salida_iMux(4)<=(Salida_32Bits(4) and not Select_iMux) or (Salida_32BitsI(4) and Select_iMux);
Salida_iMux(5)<=(Salida_32Bits(5) and not Select_iMux) or (Salida_32BitsI(5) and Select_iMux);
Salida_iMux(6)<=(Salida_32Bits(6) and not Select_iMux) or (Salida_32BitsI(6) and Select_iMux);
Salida_iMux(7)<=(Salida_32Bits(7) and not Select_iMux) or (Salida_32BitsI(7) and Select_iMux);
Salida_iMux(8)<=(Salida_32Bits(8) and not Select_iMux) or (Salida_32BitsI(8) and Select_iMux);
Salida_iMux(9)<=(Salida_32Bits(9) and not Select_iMux) or (Salida_32BitsI(9) and Select_iMux);
Salida_iMux(10)<=(Salida_32Bits(10) and not Select_iMux) or (Salida_32BitsI(10) and Select_iMux);
Salida_iMux(11)<=(Salida_32Bits(11) and not Select_iMux) or (Salida_32BitsI(11) and Select_iMux);
Salida_iMux(12)<=(Salida_32Bits(12) and not Select_iMux) or (Salida_32BitsI(12) and Select_iMux);
Salida_iMux(13)<=(Salida_32Bits(13) and not Select_iMux) or (Salida_32BitsI(13) and Select_iMux);
Salida_iMux(14)<=(Salida_32Bits(14) and not Select_iMux) or (Salida_32BitsI(14) and Select_iMux);
Salida_iMux(15)<=(Salida_32Bits(15) and not Select_iMux) or (Salida_32BitsI(15) and Select_iMux);
Salida_iMux(16)<=(Salida_32Bits(16) and not Select_iMux) or (Salida_32BitsI(16) and Select_iMux);
Salida_iMux(17)<=(Salida_32Bits(17) and not Select_iMux) or (Salida_32BitsI(17) and Select_iMux);
Salida_iMux(18)<=(Salida_32Bits(18) and not Select_iMux) or (Salida_32BitsI(18) and Select_iMux);
Salida_iMux(19)<=(Salida_32Bits(19) and not Select_iMux) or (Salida_32BitsI(19) and Select_iMux);
Salida_iMux(20)<=(Salida_32Bits(20) and not Select_iMux) or (Salida_32BitsI(20) and Select_iMux);
Salida_iMux(21)<=(Salida_32Bits(21) and not Select_iMux) or (Salida_32BitsI(21) and Select_iMux);
Salida_iMux(22)<=(Salida_32Bits(22) and not Select_iMux) or (Salida_32BitsI(22) and Select_iMux);
Salida_iMux(23)<=(Salida_32Bits(23) and not Select_iMux) or (Salida_32BitsI(23) and Select_iMux);
Salida_iMux(24)<=(Salida_32Bits(24) and not Select_iMux) or (Salida_32BitsI(24) and Select_iMux);
Salida_iMux(25)<=(Salida_32Bits(25) and not Select_iMux) or (Salida_32BitsI(25) and Select_iMux);
Salida_iMux(26)<=(Salida_32Bits(26) and not Select_iMux) or (Salida_32BitsI(26) and Select_iMux);
Salida_iMux(27)<=(Salida_32Bits(27) and not Select_iMux) or (Salida_32BitsI(27) and Select_iMux);
Salida_iMux(28)<=(Salida_32Bits(28) and not Select_iMux) or (Salida_32BitsI(28) and Select_iMux);
Salida_iMux(29)<=(Salida_32Bits(29) and not Select_iMux) or (Salida_32BitsI(29) and Select_iMux);
Salida_iMux(30)<=(Salida_32Bits(30) and not Select_iMux) or (Salida_32BitsI(30) and Select_iMux);
Salida_iMux(31)<=(Salida_32Bits(31) and not Select_iMux) or (Salida_32BitsI(31) and Select_iMux);


end iMuxArch;