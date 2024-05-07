--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro DATA_REG--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity DATA_REG is
       port( 
		       clk : in std_logic;
				 reset : in std_logic;
				 Q_Salida_DATA_REG: out STD_LOGIC_VECTOR(31 downto 0);
				 Enable_DATA_REG : in STD_LOGIC;
				 Data: in STD_LOGIC_vector(31 downto 0)
				 
				 );
				 
end DATA_REG;


architecture DATA_REGArch of DATA_REG is


 begin

 process(clk,reset, Enable_DATA_REG)
 begin
 if(reset='1')then
 
Q_Salida_DATA_REG(0)<='0';
Q_Salida_DATA_REG(1)<='0';
Q_Salida_DATA_REG(2)<='0';
Q_Salida_DATA_REG(3)<='0';
Q_Salida_DATA_REG(4)<='0';
Q_Salida_DATA_REG(5)<='0';
Q_Salida_DATA_REG(6)<='0';
Q_Salida_DATA_REG(7)<='0';
Q_Salida_DATA_REG(8)<='0';
Q_Salida_DATA_REG(9)<='0';
Q_Salida_DATA_REG(10)<='0';
Q_Salida_DATA_REG(11)<='0';
Q_Salida_DATA_REG(12)<='0';
Q_Salida_DATA_REG(13)<='0';
Q_Salida_DATA_REG(14)<='0';
Q_Salida_DATA_REG(15)<='0';
Q_Salida_DATA_REG(16)<='0';
Q_Salida_DATA_REG(17)<='0';
Q_Salida_DATA_REG(18)<='0';
Q_Salida_DATA_REG(19)<='0';
Q_Salida_DATA_REG(20)<='0';
Q_Salida_DATA_REG(21)<='0';
Q_Salida_DATA_REG(22)<='0';
Q_Salida_DATA_REG(23)<='0';
Q_Salida_DATA_REG(24)<='0';
Q_Salida_DATA_REG(25)<='0';
Q_Salida_DATA_REG(26)<='0';
Q_Salida_DATA_REG(27)<='0';
Q_Salida_DATA_REG(28)<='0';
Q_Salida_DATA_REG(29)<='0';
Q_Salida_DATA_REG(30)<='0';
Q_Salida_DATA_REG(31)<='0';

 ELSE if(rising_edge(clk) and Enable_DATA_REG='1')then
    Q_Salida_DATA_REG<=Data;
  
	 end if;
	 END IF;
  end process;
 end DATA_REGArch;
