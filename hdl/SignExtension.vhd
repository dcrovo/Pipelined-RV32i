--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE SignExtension DE RVI32--
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
entity SignExtension is
       port( 
				 Salida_32bitsI : out STD_LOGIC_VECTOR(31 downto 0);
				 Salida_32bits : out STD_LOGIC_VECTOR(31 downto 0);
				 Bits31al25 :in STD_LOGIC_VECTOR(6 downto 0);
				 Bits24al20 :in STD_LOGIC_VECTOR(4 downto 0);
				 Bits11al7 :in STD_LOGIC_VECTOR(4 downto 0));
end SignExtension;

architecture SignExtensionArch of SignExtension is
signal concatenacionI: std_logic_vector(31 downto 0);
signal concatenacion: std_logic_vector(31 downto 0);
begin

concatenacionI(0)<=Bits24al20(0);
concatenacionI(1)<=Bits24al20(1);
concatenacionI(2)<=Bits24al20(2);
concatenacionI(3)<=Bits24al20(3);
concatenacionI(4)<=Bits24al20(4);
concatenacionI(5)<=Bits31al25(0);
concatenacionI(6)<=Bits31al25(1);
concatenacionI(7)<=Bits31al25(2);
concatenacionI(8)<=Bits31al25(3);
concatenacionI(9)<=Bits31al25(4);
concatenacionI(10)<=Bits31al25(5);
concatenacionI(11)<=Bits31al25(6);
concatenacionI(12)<='0';
concatenacionI(13)<='0';
concatenacionI(14)<='0';
concatenacionI(15)<='0';
concatenacionI(16)<='0';
concatenacionI(17)<='0';
concatenacionI(18)<='0';
concatenacionI(19)<='0';
concatenacionI(20)<='0';
concatenacionI(21)<='0';
concatenacionI(22)<='0';
concatenacionI(23)<='0';
concatenacionI(24)<='0';
concatenacionI(25)<='0';
concatenacionI(26)<='0';
concatenacionI(27)<='0';
concatenacionI(28)<='0';
concatenacionI(29)<='0';
concatenacionI(30)<='0';
concatenacionI(31)<='0';

concatenacion(0)<=Bits11al7(0);
concatenacion(1)<=Bits11al7(1);
concatenacion(2)<=Bits11al7(2);
concatenacion(3)<=Bits11al7(3);
concatenacion(4)<=Bits11al7(4);
concatenacion(5)<=Bits31al25(0);
concatenacion(6)<=Bits31al25(1);
concatenacion(7)<=Bits31al25(2);
concatenacion(8)<=Bits31al25(3);
concatenacion(9)<=Bits31al25(4);
concatenacion(10)<=Bits31al25(5);
concatenacion(11)<=Bits31al25(6);
concatenacion(12)<=Bits31al25(6);
concatenacion(13)<=Bits31al25(6);
concatenacion(14)<=Bits31al25(6);
concatenacion(15)<=Bits31al25(6);
concatenacion(16)<=Bits31al25(6);
concatenacion(17)<=Bits31al25(6);
concatenacion(18)<=Bits31al25(6);
concatenacion(19)<=Bits31al25(6);
concatenacion(20)<=Bits31al25(6);
concatenacion(21)<=Bits31al25(6);
concatenacion(22)<=Bits31al25(6);
concatenacion(23)<=Bits31al25(6);
concatenacion(24)<=Bits31al25(6);
concatenacion(25)<=Bits31al25(6);
concatenacion(26)<=Bits31al25(6);
concatenacion(27)<=Bits31al25(6);
concatenacion(28)<=Bits31al25(6);
concatenacion(29)<=Bits31al25(6);
concatenacion(30)<=Bits31al25(6);
concatenacion(31)<=Bits31al25(6);

Salida_32bitsI<=concatenacionI;
Salida_32bits<=concatenacion;

end SignExtensionArch;