--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro PC_Reg--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity PC_Reg is
       port( 
		       clk : in std_logic;
				 reset : in std_logic;
				 Q_Salida_PC_Reg: out STD_LOGIC_VECTOR(14 downto 0);
				 Enable_PC_Reg : in STD_LOGIC;
				 D_Salida_Direccion_CP : in STD_LOGIC_vector(14 downto 0)
				 
				 );
				 
end PC_Reg;


architecture PC_RegArch of PC_Reg is


 begin

 process(clk,reset,Enable_PC_Reg)
 begin
 if(reset='1' and rising_edge(clk))then
Q_Salida_PC_Reg(0)<='0';
Q_Salida_PC_Reg(1)<='0';
Q_Salida_PC_Reg(2)<='0';
Q_Salida_PC_Reg(3)<='0';
Q_Salida_PC_Reg(4)<='0';
Q_Salida_PC_Reg(5)<='0';
Q_Salida_PC_Reg(6)<='0';
Q_Salida_PC_Reg(7)<='0';
Q_Salida_PC_Reg(8)<='0';
Q_Salida_PC_Reg(9)<='0';
Q_Salida_PC_Reg(10)<='0';
Q_Salida_PC_Reg(11)<='0';
Q_Salida_PC_Reg(12)<='0';
Q_Salida_PC_Reg(13)<='0';
Q_Salida_PC_Reg(14)<='0';


 else if(rising_edge(clk) and Enable_PC_Reg='1')then
    Q_Salida_PC_Reg<=D_Salida_Direccion_CP;
	 end if;
	  end if;
  end process;
 end PC_RegArch;
