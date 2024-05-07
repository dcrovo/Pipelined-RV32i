--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Registro DATA_REG--
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
entity sumcon_Reg is
       port( 
		       clk : in std_logic;
				 reset: in std_logic;
				 SalidaSumcon_Reg: out STD_LOGIC_VECTOR(14 downto 0);
				 Enable_sumcon_reg : in STD_LOGIC;
				Salida_sumcon: in STD_LOGIC_vector(14 downto 0)
				 
				 );
				 
end sumcon_Reg;


architecture sumcon_RegArch of sumcon_reg is


 begin

 process(clk,reset,Enable_sumcon_reg)
 begin
 if(reset='1')then
 SalidaSumcon_Reg(0)<='0';
 SalidaSumcon_Reg(1)<='0';
 SalidaSumcon_Reg(2)<='0';
 SalidaSumcon_Reg(3)<='0';
 SalidaSumcon_Reg(4)<='0';
 SalidaSumcon_Reg(5)<='0';
 SalidaSumcon_Reg(6)<='0';
 SalidaSumcon_Reg(7)<='0';
 SalidaSumcon_Reg(8)<='0';
 SalidaSumcon_Reg(9)<='0';
 SalidaSumcon_Reg(10)<='0';
 SalidaSumcon_Reg(11)<='0';
 SalidaSumcon_Reg(12)<='0';
 SalidaSumcon_Reg(13)<='0';
 SalidaSumcon_Reg(14)<='0';

 else if(rising_edge(clk) and Enable_sumcon_reg='1')then
    SalidaSumcon_Reg<=Salida_sumcon;
  
	 end if;
	  end if;
  end process;
 end sumcon_RegArch;
