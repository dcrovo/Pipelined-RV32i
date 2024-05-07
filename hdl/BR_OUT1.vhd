--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro BR_OUT1--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity BR_OUT1 is
       port( 
		       clk : in std_logic;
				 reset: in std_logic;
				 Q_Salida_BR_OUT1: out STD_LOGIC_VECTOR(31 downto 0);
				 Enable_BR_OUT1 : in STD_LOGIC;
				 DataOut_rs2_rs1: in STD_LOGIC_vector(31 downto 0)
				 
				 );
				 
end BR_OUT1;


architecture BR_OUT1Arch of BR_OUT1 is

 begin

 process(clk,reset,Enable_BR_OUT1)
 begin
 if(reset='1')then

Q_Salida_BR_OUT1(0)<='0';
Q_Salida_BR_OUT1(1)<='0';
Q_Salida_BR_OUT1(2)<='0';
Q_Salida_BR_OUT1(3)<='0';
Q_Salida_BR_OUT1(4)<='0';
Q_Salida_BR_OUT1(5)<='0';
Q_Salida_BR_OUT1(6)<='0';
Q_Salida_BR_OUT1(7)<='0';
Q_Salida_BR_OUT1(8)<='0';
Q_Salida_BR_OUT1(9)<='0';
Q_Salida_BR_OUT1(10)<='0';
Q_Salida_BR_OUT1(11)<='0';
Q_Salida_BR_OUT1(12)<='0';
Q_Salida_BR_OUT1(13)<='0';
Q_Salida_BR_OUT1(14)<='0';
Q_Salida_BR_OUT1(15)<='0';
Q_Salida_BR_OUT1(16)<='0';
Q_Salida_BR_OUT1(17)<='0';
Q_Salida_BR_OUT1(18)<='0';
Q_Salida_BR_OUT1(19)<='0';
Q_Salida_BR_OUT1(20)<='0';
Q_Salida_BR_OUT1(21)<='0';
Q_Salida_BR_OUT1(22)<='0';
Q_Salida_BR_OUT1(23)<='0';
Q_Salida_BR_OUT1(24)<='0';
Q_Salida_BR_OUT1(25)<='0';
Q_Salida_BR_OUT1(26)<='0';
Q_Salida_BR_OUT1(27)<='0';
Q_Salida_BR_OUT1(28)<='0';
Q_Salida_BR_OUT1(29)<='0';
Q_Salida_BR_OUT1(30)<='0';
Q_Salida_BR_OUT1(31)<='0';

else if(rising_edge(clk)and Enable_BR_OUT1='1')then
    Q_Salida_BR_OUT1<=DataOut_rs2_rs1;
  
	 end if;
	  end if;
  end process;
 end BR_OUT1Arch;
