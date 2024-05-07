--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Sum_con DE RVI32--
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
entity Sum_con is
       port( 
				 Salida_Sum_con : out STD_LOGIC_VECTOR(14 downto 0);
				 Salida_ic_Mux : in STD_LOGIC_VECTOR(14 downto 0);
				 Exce_sum_con : in STD_LOGIC;
				 Salida_PC_Reg : in STD_LOGIC_VECTOR(14 downto 0));
end Sum_con;



architecture Sum_conArch of Sum_con is
signal AlmacenamientoX: std_logic_vector(14 downto 0);
signal AlmacenamientoY: std_logic_vector(14 downto 0);
signal Resultado: std_logic_vector(14 downto 0);
signal AlmacIy: std_logic;

signal CarryS0, CarryS1,CarryS2,CarryS3,CarryS4,CarryS5,CarryS6,CarryS7,CarryS8,CarryS9,CarryS10,CarryS11,CarryS12,CarryS13: std_logic;

begin
AlmacIy<='1';
AlmacenamientoX<=Salida_PC_Reg;
AlmacenamientoY<=Salida_ic_Mux;

----------SUM-------
Resultado(0) <= ((AlmacenamientoX(0) and (AlmacenamientoY(0)xnor not AlmacIy)) or (not AlmacenamientoX(0) and (AlmacenamientoY(0) xor not AlmacIy))); 
CarryS0 <= (AlmacenamientoX(0) and (AlmacenamientoY(0)));  

Resultado(1) <= (AlmacenamientoX(1) and (AlmacenamientoY(1) xnor CarryS0)) or (not AlmacenamientoX(1) and (AlmacenamientoY(1) xor CarryS0)); 
CarryS1 <= (AlmacenamientoX(1) and (AlmacenamientoY(1) xor CarryS0)) or (AlmacenamientoY(1) and CarryS0); 

Resultado(2) <= (AlmacenamientoX(2)and (AlmacenamientoY(2)xnor CarryS1)) or (not AlmacenamientoX(2)and (AlmacenamientoY(2)xor CarryS1)); 
CarryS2 <= (AlmacenamientoX(2)and (AlmacenamientoY(2)xor CarryS1)) or (AlmacenamientoY(2)and CarryS1); 

Resultado(3) <= (AlmacenamientoX(3)and (AlmacenamientoY(3)xnor CarryS2)) or (not AlmacenamientoX(3)and  (AlmacenamientoY(3)xor CarryS2)); 
CarryS3 <= (AlmacenamientoX(3)and (AlmacenamientoY(3)xor CarryS2)) or (AlmacenamientoY(3)and CarryS2); 

Resultado(4) <= (AlmacenamientoX(4)and (AlmacenamientoY(4)xnor CarryS3)) or (not AlmacenamientoX(4)and (AlmacenamientoY(4)xor CarryS3)); 
CarryS4 <= (AlmacenamientoX(4)and (AlmacenamientoY(4)xor CarryS3)) or (AlmacenamientoY(4)and CarryS3); 

Resultado(5) <= (AlmacenamientoX(5) and (AlmacenamientoY(5) xnor CarryS4)) or (not AlmacenamientoX(5) and (AlmacenamientoY(5) xor CarryS4)); 
CarryS5 <= (AlmacenamientoX(5) and (AlmacenamientoY(5) xor CarryS4)) or (AlmacenamientoY(5) and CarryS4); 

Resultado(6) <= (AlmacenamientoX(6) and (AlmacenamientoY(6) xnor CarryS5)) or (not AlmacenamientoX(6) and (AlmacenamientoY(6) xor CarryS5)); 
CarryS6 <= (AlmacenamientoX(6) and (AlmacenamientoY(6) xor CarryS5)) or (AlmacenamientoY(6) and CarryS5); 

Resultado(7) <= (AlmacenamientoX(7) and (AlmacenamientoY(7) xnor CarryS6)) or (not AlmacenamientoX(7) and (AlmacenamientoY(7) xor CarryS6)); 
CarryS7 <= (AlmacenamientoX(7) and (AlmacenamientoY(7) xor CarryS6)) or (AlmacenamientoY(7) and CarryS6); 

Resultado(8) <= (AlmacenamientoX(8) and (AlmacenamientoY(8) xnor CarryS7)) or (not AlmacenamientoX(8) and (AlmacenamientoY(8) xor CarryS7)); 
CarryS8 <= (AlmacenamientoX(8) and (AlmacenamientoY(8) xor CarryS7)) or (AlmacenamientoY(8) and CarryS7); 

Resultado(9) <= (AlmacenamientoX(9) and (AlmacenamientoY(9) xnor CarryS8)) or (not AlmacenamientoX(9) and (AlmacenamientoY(9) xor CarryS8));
CarryS9 <= (AlmacenamientoX(9) and (AlmacenamientoY(9) xor CarryS8)) or (AlmacenamientoY(9) and CarryS8); 

Resultado(10) <= (AlmacenamientoX(10) and (AlmacenamientoY(10) xnor CarryS9)) or (not AlmacenamientoX(10) and (AlmacenamientoY(10) xor CarryS9)); 
CarryS10 <= (AlmacenamientoX(10) and (AlmacenamientoY(10) xor CarryS9)) or (AlmacenamientoY(10) and CarryS9); 

Resultado(11) <= (AlmacenamientoX(11) and (AlmacenamientoY(11) xnor CarryS10)) or (not AlmacenamientoX(11) and (AlmacenamientoY(11) xor CarryS10)); 
CarryS11 <= (AlmacenamientoX(11) and (AlmacenamientoY(11) xor CarryS10)) or (AlmacenamientoY(11) and CarryS10); 

Resultado(12) <= (AlmacenamientoX(12) and (AlmacenamientoY(12) xnor CarryS11)) or (not AlmacenamientoX(12) and (AlmacenamientoY(12) xor CarryS11)); 
CarryS12 <= (AlmacenamientoX(12) and (AlmacenamientoY(12) xor CarryS11)) or (AlmacenamientoY(12) and CarryS11); 

Resultado(13) <= (AlmacenamientoX(13) and (AlmacenamientoY(13) xnor CarryS12)) or (not AlmacenamientoX(13) and (AlmacenamientoY(13) xor CarryS12)); 
CarryS13 <= (AlmacenamientoX(13) and (AlmacenamientoY(13) xor CarryS12)) or (AlmacenamientoY(13) and CarryS12);


Resultado(14) <= (AlmacenamientoX(14) and (AlmacenamientoY(14) xnor CarryS13)) or (not AlmacenamientoX(14) and (AlmacenamientoY(14) xor CarryS13)); 

Salida_Sum_con(0)<=Resultado(0) and Exce_sum_con;
Salida_Sum_con(1)<=Resultado(1) and Exce_sum_con;
Salida_Sum_con(2)<=Resultado(2) and Exce_sum_con;
Salida_Sum_con(3)<=Resultado(3) and Exce_sum_con;
Salida_Sum_con(4)<=Resultado(4) and Exce_sum_con;
Salida_Sum_con(5)<=Resultado(5) and Exce_sum_con;
Salida_Sum_con(6)<=Resultado(6) and Exce_sum_con;
Salida_Sum_con(7)<=Resultado(7) and Exce_sum_con;
Salida_Sum_con(8)<=Resultado(8) and Exce_sum_con;
Salida_Sum_con(9)<=Resultado(9) and Exce_sum_con;
Salida_Sum_con(10)<=Resultado(10) and Exce_sum_con;
Salida_Sum_con(11)<=Resultado(11) and Exce_sum_con;
Salida_Sum_con(12)<=Resultado(12) and Exce_sum_con;
Salida_Sum_con(13)<=Resultado(13) and Exce_sum_con;
Salida_Sum_con(14)<=Resultado(14) and Exce_sum_con;

end Sum_conArch;

