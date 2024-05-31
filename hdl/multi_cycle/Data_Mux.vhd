--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE ic_Mux--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity Data_Mux is
       port( 
				 BancoR: in STD_LOGIC_VECTOR(31 downto 0);
				 Offset : in STD_LOGIC_VECTOR(31 downto 0);
				 Salida_Data_Mux :out STD_LOGIC_VECTOR(31 downto 0);
				 Select_Data_Mux :in STD_LOGIC);
				 
end Data_Mux;

architecture Data_MuxArch of Data_Mux is

begin


Salida_Data_Mux(0)<=(BancoR(0) and  not Select_Data_Mux) or (Offset(0) and  Select_Data_Mux);--con 0 optenemos la extension de signo con los 12 bits seguidos.
Salida_Data_Mux(1)<=(BancoR(1) and not Select_Data_Mux) or (Offset(1) and   Select_Data_Mux);
Salida_Data_Mux(2)<=(BancoR(2) and not Select_Data_Mux) or (Offset(2) and  Select_Data_Mux);
Salida_Data_Mux(3)<=(BancoR(3) and not Select_Data_Mux) or (Offset(3) and   Select_Data_Mux);
Salida_Data_Mux(4)<=(BancoR(4) and not Select_Data_Mux) or (Offset(4) and  Select_Data_Mux);
Salida_Data_Mux(5)<=(BancoR(5) and not Select_Data_Mux) or (Offset(5) and  Select_Data_Mux);
Salida_Data_Mux(6)<=(BancoR(6) and not Select_Data_Mux) or (Offset(6) and  Select_Data_Mux);
Salida_Data_Mux(7)<=(BancoR(7) and not Select_Data_Mux) or (Offset(7) and  Select_Data_Mux);
Salida_Data_Mux(8)<=(BancoR(8) and  not Select_Data_Mux) or (Offset(8) and  Select_Data_Mux);
Salida_Data_Mux(9)<=(BancoR(9) and not Select_Data_Mux) or (Offset(9) and  Select_Data_Mux);
Salida_Data_Mux(10)<=(BancoR(10) and not Select_Data_Mux) or (Offset(10) and  Select_Data_Mux);
Salida_Data_Mux(11)<=(BancoR(11) and  not Select_Data_Mux) or (Offset(11) and  Select_Data_Mux);
Salida_Data_Mux(12)<=(BancoR(12) and  not Select_Data_Mux) or (Offset(12) and  Select_Data_Mux);
Salida_Data_Mux(13)<=(BancoR(13) and  not Select_Data_Mux) or (Offset(13) and  Select_Data_Mux);
Salida_Data_Mux(14)<=(BancoR(14) and  not Select_Data_Mux) or (Offset(14) and  Select_Data_Mux);
Salida_Data_Mux(15)<=(BancoR(15) and  not Select_Data_Mux) or (Offset(15) and  Select_Data_Mux);
Salida_Data_Mux(16)<=(BancoR(16) and not Select_Data_Mux) or (Offset(16) and  Select_Data_Mux);
Salida_Data_Mux(17)<=(BancoR(17) and  not Select_Data_Mux) or (Offset(17) and  Select_Data_Mux);
Salida_Data_Mux(18)<=(BancoR(18) and  not Select_Data_Mux) or (Offset(18) and  Select_Data_Mux);
Salida_Data_Mux(19)<=(BancoR(19) and not Select_Data_Mux) or (Offset(19) and  Select_Data_Mux);
Salida_Data_Mux(20)<=(BancoR(20) and  not Select_Data_Mux) or (Offset(20) and  Select_Data_Mux);
Salida_Data_Mux(21)<=(BancoR(21) and  not Select_Data_Mux) or (Offset(21) and  Select_Data_Mux);
Salida_Data_Mux(22)<=(BancoR(22) and not Select_Data_Mux) or (Offset(22) and  Select_Data_Mux);
Salida_Data_Mux(23)<=(BancoR(23) and not Select_Data_Mux) or (Offset(23) and  Select_Data_Mux);
Salida_Data_Mux(24)<=(BancoR(24) and  not Select_Data_Mux) or (Offset(24) and  Select_Data_Mux);
Salida_Data_Mux(25)<=(BancoR(25) and  not Select_Data_Mux) or (Offset(25) and  Select_Data_Mux);
Salida_Data_Mux(26)<=(BancoR(26) and  not Select_Data_Mux) or (Offset(26) and  Select_Data_Mux);
Salida_Data_Mux(27)<=(BancoR(27) and  not Select_Data_Mux) or (Offset(27) and  Select_Data_Mux);
Salida_Data_Mux(28)<=(BancoR(28) and  not Select_Data_Mux) or (Offset(28) and  Select_Data_Mux);
Salida_Data_Mux(29)<=(BancoR(29) and not Select_Data_Mux) or (Offset(29) and  Select_Data_Mux);
Salida_Data_Mux(30)<=(BancoR(30) and not Select_Data_Mux) or (Offset(30) and  Select_Data_Mux);
Salida_Data_Mux(31)<=(BancoR(31) and  not Select_Data_Mux) or (Offset(31) and  Select_Data_Mux);

end Data_MuxArch;

