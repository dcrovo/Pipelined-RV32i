--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro Inst_Reg--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity Inst_Reg is
       port( 
		       clk : in std_logic;
				 reset : in std_logic;
				 Q_Salida_Inst_Reg: out STD_LOGIC_VECTOR(31 downto 0);
				 Enable_Inst_Reg : in STD_LOGIC;
				 D_Instruccion : in STD_LOGIC_vector(31 downto 0)
				 
				 );
				 
end Inst_Reg;


architecture Inst_RegArch of Inst_Reg is

 begin

 process(clk,reset,Enable_Inst_Reg)
 begin
 if(reset='1')then
Q_Salida_Inst_Reg(0)<='0';
Q_Salida_Inst_Reg(1)<='0';
Q_Salida_Inst_Reg(2)<='0';
Q_Salida_Inst_Reg(3)<='0';
Q_Salida_Inst_Reg(4)<='0';
Q_Salida_Inst_Reg(5)<='0';
Q_Salida_Inst_Reg(6)<='0';
Q_Salida_Inst_Reg(7)<='0';
Q_Salida_Inst_Reg(8)<='0';
Q_Salida_Inst_Reg(9)<='0';
Q_Salida_Inst_Reg(10)<='0';
Q_Salida_Inst_Reg(11)<='0';
Q_Salida_Inst_Reg(12)<='0';
Q_Salida_Inst_Reg(13)<='0';
Q_Salida_Inst_Reg(14)<='0';
Q_Salida_Inst_Reg(15)<='0';
Q_Salida_Inst_Reg(16)<='0';
Q_Salida_Inst_Reg(17)<='0';
Q_Salida_Inst_Reg(18)<='0';
Q_Salida_Inst_Reg(19)<='0';
Q_Salida_Inst_Reg(20)<='0';
Q_Salida_Inst_Reg(21)<='0';
Q_Salida_Inst_Reg(22)<='0';
Q_Salida_Inst_Reg(23)<='0';
Q_Salida_Inst_Reg(24)<='0';
Q_Salida_Inst_Reg(25)<='0';
Q_Salida_Inst_Reg(26)<='0';
Q_Salida_Inst_Reg(27)<='0';
Q_Salida_Inst_Reg(28)<='0';
Q_Salida_Inst_Reg(29)<='0';
Q_Salida_Inst_Reg(30)<='0';
Q_Salida_Inst_Reg(31)<='0';

 else if(rising_edge(clk) and Enable_Inst_Reg='1')then
    Q_Salida_Inst_Reg<=D_Instruccion;
  
	 end if;
	  end if;
  end process;
 end Inst_RegArch;
