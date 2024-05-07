--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro Direccion_CP--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity Direccion_CP is
       port( 
		       clk : in std_logic;
				 reset  : in std_logic;
				Q_Salida_Direccion_CP: out STD_LOGIC_VECTOR(14 downto 0);
				 Enable_Direccion_CP : in STD_LOGIC;
				 D_Salida_Jump_Mux : in STD_LOGIC_vector(14 downto 0)
				
				 );
				 
end Direccion_CP;

architecture Direccion_CPArch of Direccion_CP is


 begin
 
 
 process(clk,reset,Enable_Direccion_CP)
 begin
 if(reset='1')then
 
Q_Salida_Direccion_CP(0)<='0';
Q_Salida_Direccion_CP(1)<='0';
Q_Salida_Direccion_CP(2)<='0';
Q_Salida_Direccion_CP(3)<='0';
Q_Salida_Direccion_CP(4)<='0';
Q_Salida_Direccion_CP(5)<='0';
Q_Salida_Direccion_CP(6)<='0';
Q_Salida_Direccion_CP(7)<='0';
Q_Salida_Direccion_CP(8)<='0';
Q_Salida_Direccion_CP(9)<='0';
Q_Salida_Direccion_CP(10)<='0';
Q_Salida_Direccion_CP(11)<='0';
Q_Salida_Direccion_CP(12)<='0';
Q_Salida_Direccion_CP(13)<='0';
Q_Salida_Direccion_CP(14)<='0';

 
 else if(rising_edge(clk) and Enable_Direccion_CP='1')then
    Q_Salida_Direccion_CP<=D_Salida_Jump_Mux;
	  
	 end if;
	  end if;
  end process;
   

 end Direccion_CPArch;