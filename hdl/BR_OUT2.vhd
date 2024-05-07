--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro BR_OUT2--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity BR_OUT2 is
       port( 
		       clk : in std_logic;
				 reset: in std_logic;
				 Q_Salida_BR_OUT2: out STD_LOGIC_VECTOR(31 downto 0);
				 Enable_BR_OUT2 : in STD_LOGIC;
				 DataOut_rs2_rs1: in STD_LOGIC_vector(31 downto 0)
				 
				 );
				 
end BR_OUT2;


architecture BR_OUT2Arch of BR_OUT2 is


 begin

 process(clk,reset,Enable_BR_OUT2)
 begin
 if(reset='1')then

Q_Salida_BR_OUT2(0)<='0';
Q_Salida_BR_OUT2(1)<='0';
Q_Salida_BR_OUT2(2)<='0';
Q_Salida_BR_OUT2(3)<='0';
Q_Salida_BR_OUT2(4)<='0';
Q_Salida_BR_OUT2(5)<='0';
Q_Salida_BR_OUT2(6)<='0';
Q_Salida_BR_OUT2(7)<='0';
Q_Salida_BR_OUT2(8)<='0';
Q_Salida_BR_OUT2(9)<='0';
Q_Salida_BR_OUT2(10)<='0';
Q_Salida_BR_OUT2(11)<='0';
Q_Salida_BR_OUT2(12)<='0';
Q_Salida_BR_OUT2(13)<='0';
Q_Salida_BR_OUT2(14)<='0';
Q_Salida_BR_OUT2(15)<='0';
Q_Salida_BR_OUT2(16)<='0';
Q_Salida_BR_OUT2(17)<='0';
Q_Salida_BR_OUT2(18)<='0';
Q_Salida_BR_OUT2(19)<='0';
Q_Salida_BR_OUT2(20)<='0';
Q_Salida_BR_OUT2(21)<='0';
Q_Salida_BR_OUT2(22)<='0';
Q_Salida_BR_OUT2(23)<='0';
Q_Salida_BR_OUT2(24)<='0';
Q_Salida_BR_OUT2(25)<='0';
Q_Salida_BR_OUT2(26)<='0';
Q_Salida_BR_OUT2(27)<='0';
Q_Salida_BR_OUT2(28)<='0';
Q_Salida_BR_OUT2(29)<='0';
Q_Salida_BR_OUT2(30)<='0';
Q_Salida_BR_OUT2(31)<='0';

 ELSE if(rising_edge(clk) and Enable_BR_OUT2='1')then
    Q_Salida_BR_OUT2<=DataOut_rs2_rs1;
  
	 end if;
	  END IF;
  end process;
 end BR_OUT2Arch;
