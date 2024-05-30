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
Q_Salida_Inst_Reg <= (others => '0');


 else if(rising_edge(clk) and Enable_Inst_Reg='1')then
    Q_Salida_Inst_Reg<=D_Instruccion;
  
	 end if;
	  end if;
  end process;
 end Inst_RegArch;
