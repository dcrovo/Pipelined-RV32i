--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro ALU_OUT--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity ALU_OUT is
       port( 
		       clk : in std_logic;
				 reset: in std_logic;
				 Q_Salida_ALU_OUT: out STD_LOGIC_VECTOR(31 downto 0);
				 Enable_ALU_OUT : in STD_LOGIC;
				 Salida_ALU1: in STD_LOGIC_vector(31 downto 0)
				 
				 );
				 
end ALU_OUT;


architecture ALU_OUTArch of ALU_OUT is


 begin

 
 process(clk,Enable_ALU_OUT,reset)
 begin
 if(reset='1')then
Q_Salida_ALU_OUT(0)<='0';
Q_Salida_ALU_OUT(1)<='0';
 Q_Salida_ALU_OUT(2)<='0';
 Q_Salida_ALU_OUT(3)<='0';
 Q_Salida_ALU_OUT(4)<='0';
 Q_Salida_ALU_OUT(5)<='0';
 Q_Salida_ALU_OUT(6)<='0';
 Q_Salida_ALU_OUT(7)<='0';
 Q_Salida_ALU_OUT(8)<='0';
 Q_Salida_ALU_OUT(9)<='0';
 Q_Salida_ALU_OUT(10)<='0';
 Q_Salida_ALU_OUT(11)<='0';
 Q_Salida_ALU_OUT(12)<='0';
 Q_Salida_ALU_OUT(13)<='0';
 Q_Salida_ALU_OUT(14)<='0';
 Q_Salida_ALU_OUT(15)<='0';
 Q_Salida_ALU_OUT(16)<='0';
 Q_Salida_ALU_OUT(17)<='0';
 Q_Salida_ALU_OUT(18)<='0';
 Q_Salida_ALU_OUT(19)<='0';
 Q_Salida_ALU_OUT(20)<='0';
 Q_Salida_ALU_OUT(21)<='0';
 Q_Salida_ALU_OUT(22)<='0';
 Q_Salida_ALU_OUT(23)<='0';
 Q_Salida_ALU_OUT(24)<='0';
 Q_Salida_ALU_OUT(25)<='0';
 Q_Salida_ALU_OUT(26)<='0';
 Q_Salida_ALU_OUT(27)<='0';
 Q_Salida_ALU_OUT(28)<='0'; 
 Q_Salida_ALU_OUT(29)<='0';
 Q_Salida_ALU_OUT(30)<='0';
 Q_Salida_ALU_OUT(31)<='0'; 
 else if(rising_edge(clk) and Enable_ALU_OUT='1')then
    Q_Salida_ALU_OUT<=Salida_ALU1;
  
	 end if;
	  end if;
  end process;
 
  
 end ALU_OUTArch;
