--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro Inst_Reg--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity Inst_Reg_2 is
       port( 
		         clk : in std_logic;
				 reset : in std_logic;
				 Q_Salida_Inst_Reg_2: out STD_LOGIC_VECTOR (6 downto 0);
				 Enable_Inst_Reg_2 : in STD_LOGIC;
				 D_Instruccion_2 : in STD_LOGIC_vector(6 downto 0)
				 );
				 
end Inst_Reg_2;

architecture Inst_RegArch of Inst_Reg_2 is

 begin

 process(clk,reset,Enable_Inst_Reg_2)
 begin
 if(reset='1')then
Q_Salida_Inst_Reg_2 <= (others => '0');

 else if(rising_edge(clk) and Enable_Inst_Reg_2='1')then
    Q_Salida_Inst_Reg_2<=D_Instruccion_2;

	 end if;
	  end if;
  end process;
 end Inst_RegArch;
