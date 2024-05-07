--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Control_Unit DE RVI32--
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
entity unidadcontrol is
       port( 
		       start : in std_logic;
				 Enable_PC : out STD_LOGIC;
				 WriteBR : out STD_LOGIC;
				 Read_rs1 : out STD_LOGIC;
		       EnableInst_Reg : out STD_LOGIC;
				 Read_ROM : out STD_LOGIC;
				 Enable_DireccionCP : out STD_LOGIC;
				 Read_rs2 : out STD_LOGIC;
				 EnableBR_OUT2 : out STD_LOGIC;
				 Select_jump_Mux : out STD_LOGIC;
				 Branch_AND : out STD_LOGIC;
				 amMux : out STD_LOGIC;
				 iRMux : out STD_LOGIC;
				 iMux : out STD_LOGIC;
				 Exce_Sum_con : out STD_LOGIC;
				 Exce_ALU : out STD_LOGIC;
				 EnableBR_OUT1 : out STD_LOGIC;
				 Enable_ALU_OUT: out STD_LOGIC;
				 Write_MD : out STD_LOGIC;
				 Read_MD : out STD_LOGIC;
				 Enable_Data_Reg : out STD_LOGIC;
				 opcodeC : in std_logic_vector(6 downto 0);
				 clk : in std_logic
				 );
				 
end unidadcontrol;



architecture unidadcontrolArch of unidadcontrol is

-----------------------------------------
signal jump_Mux_Opcode : std_logic;
signal R_Opcode : std_logic;
signal B_Opcode : std_logic;
signal I_Opcode : std_logic;
signal S_Opcode : std_logic;
signal L_Opcode : std_logic;
------------------------------------------

-------------------Cables para Enable_PC-----------------
signal Enable_PC_wire0 : std_logic;
signal Enable_PC_wire1 : std_logic;
----------------Cables para Read_ROM---------------------
signal Read_ROM_wire0 : std_logic;
signal Read_ROM_wire1 : std_logic;
signal Read_ROM_wire2 : std_logic;
signal Read_ROM_wire3 : std_logic;
----------------------------------------------------------
-------------------Cables para EnableInst_Reg-------------
signal EnableInst_Reg_wire0 : std_logic;
signal EnableInst_Reg_wire1 : std_logic;

-------------------Cables para EnableInst_Reg-------------
signal Select_jump_Mux_wire0 : std_logic;
signal Select_jump_Mux_wire1 : std_logic;
----------------------------------------------------------
-------------------Cables para EnableInst_Reg-------------
signal Enable_DireccionCP_wire0 : std_logic;
signal Enable_DireccionCP_wire1 : std_logic;
signal Enable_DireccionCP_wire2 : std_logic;
signal Enable_DireccionCP_wire3 : std_logic;
signal Enable_DireccionCP_wire4 : std_logic;
signal Enable_DireccionCP_wire5 : std_logic;
----------------------------------------------------------
----------------Cables para Read_rs1---------------------
signal Read_rs1_wire0 : std_logic;
signal Read_rs1_wire1 : std_logic;
signal Read_rs1_wire2 : std_logic;
signal Read_rs1_wire3 : std_logic;
----------------------------------------------------------

-------------------Cables para sumcon-------------
signal Exce_Sum_con_wire0 : std_logic;
signal Exce_Sum_con_wire1  : std_logic;
signal Exce_Sum_con_wire2 : std_logic;
signal Exce_Sum_con_wire3  : std_logic;
signal Exce_Sum_con_wire4 : std_logic;
signal Exce_Sum_con_wire5  : std_logic;
----------------------------------------------------------
-------------------Cables para EnableBR_OUT1-------------
signal EnableBR_OUT1_wire0 : std_logic;
signal EnableBR_OUT1_wire1 : std_logic;
----------------------------------------------------------
----------------Cables para Read_rs2---------------------
signal Read_rs2_wire0 : std_logic;
signal Read_rs2_wire1 : std_logic;
signal Read_rs2_wire2 : std_logic;
signal Read_rs2_wire3 : std_logic;
----------------------------------------------------------
-------------------Cables para EnableBR_OUT1-------------
signal EnableBR_OUT2_wire0 : std_logic;
signal EnableBR_OUT2_wire1 : std_logic;
----------------------------------------------------------
----------------Cables para Exccec_ALU---------------------
signal Exce_ALU_wire0 : std_logic;
signal Exce_ALU_wire1 : std_logic;
signal Exce_ALU_wire2 : std_logic;
signal Exce_ALU_wire3 : std_logic;
----------------------------------------------------------
-------------------Cables para IRMUX------------
signal iRMux_wire0 : std_logic;
signal iRMux_wire1 : std_logic;
signal iRMux_wire2 : std_logic;
signal iRMux_wire3 : std_logic;
signal iRMux_wire4 : std_logic;
signal iRMux_wire5 : std_logic;

----------------------------------------------------------
-------------------Cables para Enable_ALU_OUT-------------
signal Enable_ALU_OUT_wire0 : std_logic;
signal Enable_ALU_OUT_wire1 : std_logic;
----------------------------------------------------------

----------------Cables para Exccec_ALU---------------------
signal Exce_ALU_wire4 : std_logic;
signal Exce_ALU_wire5 : std_logic;
signal Exce_ALU_wire6 : std_logic;
signal Exce_ALU_wire7 : std_logic;
signal Exce_ALU_wire8 : std_logic;
signal Exce_ALU_wire9 : std_logic;
signal Exce_ALU_wire10 : std_logic;
signal Exce_ALU_wire11 : std_logic;
signal Exce_ALU_wire12 : std_logic;
signal Exce_ALU_wire13 : std_logic;
signal Exce_ALU_wire14 : std_logic;
signal Exce_ALU_wire15 : std_logic;
----------------------------------------------------------
----------------Cables para Exccec_ALU---------------------
signal iMux_wire0 : std_logic;
signal iMux_wire1 : std_logic;
signal iMux_wire2 : std_logic;
signal iMux_wire3 : std_logic;
----------------------------------------------------------
-------------------Cables para Enable_ALU_OUT-------------
signal Enable_ALU_OUT_wire2 : std_logic;
signal Enable_ALU_OUT_wire3 : std_logic;
----------------------------------------------------------
-------------------Cables para amMux-------------
signal amMux_wire0 : std_logic;
signal amMux_wire1 : std_logic;
----------------------------------------------------------

-------------------Cables para writeBR-------------
signal WriteBR_wire0 : std_logic;
signal WriteBR_wire1 : std_logic;
----------------------------------------------------------



signal Branch_AND_wire0 : std_logic;
signal Branch_AND_wire1 : std_logic;
signal Branch_AND_wire2: std_logic;
signal Branch_AND_wire3: std_logic;

signal Write_MD_wire0 : std_logic;
signal Write_MD_wire1 : std_logic;
 
signal Read_MD_wire0 :std_logic;
signal Read_MD_wire1 :std_logic;
signal Read_MD_wire2 :std_logic;
signal Read_MD_wire3 :std_logic;

signal Enable_Data_Reg_wire0 : std_logic;
signal Enable_Data_Reg_wire1 : std_logic;
----------------------------------------------------------

--------------Entradas y salida de cada Flip Flop de la One HOT----------------
signal DEntradaEstado0: std_logic;
signal DEntradaEstado1: std_logic;
signal DEntradaEstado2: std_logic;
signal DEntradaEstado3: std_logic;
signal DEntradaEstado4: std_logic;
signal DEntradaEstado5: std_logic;
signal DEntradaEstado6: std_logic;
signal DEntradaEstado7: std_logic;
signal DEntradaEstado8: std_logic;
signal DEntradaEstado9: std_logic;
signal DEntradaEstado10: std_logic;
signal DEntradaEstado11: std_logic;
signal DEntradaEstado12: std_logic;
signal DEntradaEstado13: std_logic;
signal DEntradaEstado14: std_logic;
signal DEntradaEstado15: std_logic;
signal DEntradaEstado16: std_logic;
signal DEntradaEstado17: std_logic;
signal DEntradaEstado18: std_logic;
signal DEntradaEstado19: std_logic;
signal DEntradaEstado20: std_logic;
signal DEntradaEstado21: std_logic;
signal DEntradaEstado22: std_logic;
signal DEntradaEstado23: std_logic;
signal DEntradaEstado24: std_logic;
signal DEntradaEstado25: std_logic;
signal DEntradaEstado26: std_logic;
signal DEntradaEstado27: std_logic;
signal DEntradaEstado28: std_logic;
signal DEntradaEstado29: std_logic;
signal DEntradaEstado30: std_logic;
signal DEntradaEstado31: std_logic;
signal DEntradaEstado32: std_logic;
signal DEntradaEstado33: std_logic;
signal DEntradaEstado34: std_logic;
signal DEntradaEstado35: std_logic;
signal DEntradaEstado36: std_logic;
signal DEntradaEstado37: std_logic;
signal DEntradaEstado38: std_logic;

signal QSalidaEstado0: std_logic;
signal QSalidaEstado1: std_logic;
signal QSalidaEstado2: std_logic;
signal QSalidaEstado3: std_logic;
signal QSalidaEstado4: std_logic;
signal QSalidaEstado5: std_logic;
signal QSalidaEstado6: std_logic;
signal QSalidaEstado7: std_logic;
signal QSalidaEstado8: std_logic;
signal QSalidaEstado9: std_logic;
signal QSalidaEstado10: std_logic;
signal QSalidaEstado11: std_logic;
signal QSalidaEstado12: std_logic;
signal QSalidaEstado13: std_logic;
signal QSalidaEstado14: std_logic;
signal QSalidaEstado15: std_logic;
signal QSalidaEstado16: std_logic;
signal QSalidaEstado17: std_logic;
signal QSalidaEstado18: std_logic;
signal QSalidaEstado19: std_logic;
signal QSalidaEstado20: std_logic;
signal QSalidaEstado21: std_logic;
signal QSalidaEstado22: std_logic;
signal QSalidaEstado23: std_logic;
signal QSalidaEstado24: std_logic;
signal QSalidaEstado25: std_logic;
signal QSalidaEstado26: std_logic;
signal QSalidaEstado27: std_logic;
signal QSalidaEstado28: std_logic;
signal QSalidaEstado29: std_logic;
signal QSalidaEstado30: std_logic;
signal QSalidaEstado31: std_logic;
signal QSalidaEstado32: std_logic;
signal QSalidaEstado33: std_logic;
signal QSalidaEstado34: std_logic;
signal QSalidaEstado35: std_logic;
signal QSalidaEstado36: std_logic;
signal QSalidaEstado37: std_logic;
signal QSalidaEstado38: std_logic;


--------------------------------------------------------------------------
 begin
 -----------------------------------------Condiciones de transiccion---------------------------------------------------------------------------------
 jump_Mux_Opcode<=(opcodeC(0) and opcodeC(1) and not opcodeC(2) and opcodeC(3) and opcodeC(4) and opcodeC(5) and opcodeC(6));
 R_Opcode<=(not opcodeC(6) and opcodeC(5) and opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));
 B_Opcode<=(opcodeC(6) and opcodeC(5) and not opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));
 I_Opcode<=(not opcodeC(6) and not opcodeC(5) and opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));
 S_Opcode<=(not opcodeC(6) and opcodeC(5) and not opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));
 L_Opcode<=(not opcodeC(6) and not opcodeC(5) and not opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));

  DEntradaEstado0<=start;
  DEntradaEstado1<=QSalidaEstado0 or QSalidaEstado28 or QSalidaEstado32;
  DEntradaEstado2<=QSalidaEstado1;
  DEntradaEstado3<=QSalidaEstado2 or QSalidaEstado8;
  DEntradaEstado4<=QSalidaEstado3;
  DEntradaEstado5<=QSalidaEstado4;
  DEntradaEstado6<=QSalidaEstado5;
  DEntradaEstado7<=(QSalidaEstado6 and jump_Mux_Opcode);
  DEntradaEstado8<=QSalidaEstado7;
  DEntradaEstado9<=(QSalidaEstado6 and not jump_Mux_Opcode);
  DEntradaEstado10<=QSalidaEstado9;
  DEntradaEstado11<=QSalidaEstado10;
  DEntradaEstado12<=QSalidaEstado11;
  DEntradaEstado13<=QSalidaEstado12;
  DEntradaEstado14<=QSalidaEstado13;
  DEntradaEstado15<=QSalidaEstado14;
  DEntradaEstado16<=QSalidaEstado15;
  DEntradaEstado17<=(QSalidaEstado16 and(R_Opcode or B_Opcode)) ;
  DEntradaEstado18<=QSalidaEstado17;
  DEntradaEstado19<=QSalidaEstado18 and not B_Opcode;
  DEntradaEstado20<=QSalidaEstado19;
  DEntradaEstado21<=QSalidaEstado16 and I_Opcode;
  DEntradaEstado22<=QSalidaEstado21;
  DEntradaEstado23<=QSalidaEstado22;
  DEntradaEstado24<=QSalidaEstado23;
  DEntradaEstado25<=(QSalidaEstado20 and not S_Opcode) or (QsalidaEstado24 and not L_Opcode) or QSalidaEstado38 ;
  DEntradaEstado26<=QSalidaEstado25;
  DEntradaEstado27<=QSalidaEstado26 or QSalidaEstado34 ;
  DEntradaEstado28<=QSalidaEstado27;
  DEntradaEstado29<=QSalidaEstado18 and B_Opcode;
  DEntradaEstado30<=QSalidaEstado29;
  DEntradaEstado31<=QSalidaEstado30;
  DEntradaEstado32<=QSalidaEstado31;
  DEntradaEstado33<=QSalidaEstado20 and S_Opcode;
  DEntradaEstado34<=QSalidaEstado33;
  DEntradaEstado35<=QSalidaEstado24 and L_Opcode;
  DEntradaEstado36<=QSalidaEstado35;
  DEntradaEstado37<=QSalidaEstado36;
  DEntradaEstado38<=QSalidaEstado37;
  
	
  Enable_PC_wire0<=QSalidaEstado1;
  Enable_PC_wire1<=QSalidaEstado2;
  
  Read_ROM_wire0<=QSalidaEstado3;
  Read_ROM_wire1<=QSalidaEstado4;
  Read_ROM_wire2<=QSalidaEstado5;
  Read_ROM_wire3<=QSalidaEstado6;
  
  EnableInst_Reg_wire0<=QSalidaEstado5;
  EnableInst_Reg_wire1<=QSalidaEstado6;
  
  Select_jump_Mux_wire0<=QSalidaEstado7;
  Select_jump_Mux_wire1<=QsalidaEstado8;
  
  Enable_DireccionCP_wire0<=QSalidaEstado7;
  Enable_DireccionCP_wire1<=QSalidaEstado8;
  
  Read_rs1_wire0<=QSalidaEstado9;
  Read_rs1_wire1<=QSalidaEstado10;
  Read_rs1_wire2<=QSalidaEstado11;
  Read_rs1_wire3<=QSalidaEstado12;
  
  Exce_Sum_con_wire0<=QSalidaEstado9;
  Exce_Sum_con_wire1<=QSalidaEstado10;
  
  EnableBR_OUT1_wire0<=QSalidaEstado11;
  EnableBR_OUT1_wire1<=QSalidaEstado12;
  
  Read_rs2_wire0<=QSalidaEstado13;
  Read_rs2_wire1<=QSalidaEstado14;
  Read_rs2_wire2<=QSalidaEstado15;
  Read_rs2_wire3<=QSalidaEstado16;
  
  EnableBR_OUT2_wire0<=QSalidaEstado15;
  EnableBR_OUT2_wire1<=QSalidaEstado16;
  
  Exce_ALU_wire0<=QSalidaEstado17;
  Exce_ALU_wire1<=QSalidaEstado18;
  Exce_ALU_wire2<=QSalidaEstado19;
  Exce_ALU_wire3<=QSalidaEstado20;
  
  iRMux_wire0<=QSalidaEstado17;
  iRMux_wire1<=QSalidaEstado18;
  
  Enable_ALU_OUT_wire0<=QSalidaEstado19;
  Enable_ALU_OUT_wire1<=QSalidaEstado20;
  
  Exce_ALU_wire4<=QSalidaEstado21;
  Exce_ALU_wire5<=QSalidaEstado22;
  Exce_ALU_wire6<=QSalidaEstado23;
  Exce_ALU_wire7<=QSalidaEstado24;
  
  iMux_wire0<=QSalidaEstado21;
  iMux_wire1<=QSalidaEstado22;
  iMux_wire2<=QSalidaEstado23;
  iMux_wire3<=QSalidaEstado24;
  
  Enable_ALU_OUT_wire2<=QSalidaEstado23;
  Enable_ALU_OUT_wire3<=QSalidaEstado24;
  
  Exce_ALU_wire8<=QSalidaEstado21;
  Exce_ALU_wire9<=QSalidaEstado22;
  Exce_ALU_wire10<=QSalidaEstado23;
  Exce_ALU_wire11<=QSalidaEstado24;
  
  amMux_wire0<=QSalidaEstado25;
  amMux_wire1<=QSalidaEstado26;
  
  WriteBR_wire0<=QSalidaEstado25;
  WriteBR_wire1<=QSalidaEstado26;
  
   Enable_DireccionCP_wire2<=QsalidaEstado27;
	Enable_DireccionCP_wire3<=QSalidaEstado28;
	
 iRMux_wire2<=QSalidaEstado29;
 iRMux_wire3<=QSalidaEstado30;
 iRMux_wire4<=QSalidaEstado31;
 iRMux_wire5<=QSalidaEstado32;
  
  Exce_ALU_wire12<=QSalidaEstado29;
  Exce_ALU_wire13<=QSalidaEstado30;
  Exce_ALU_wire14<=QSalidaEstado31;
  Exce_ALU_wire15<=QSalidaEstado32; 
  
 Exce_Sum_con_wire2<=QSalidaEstado29;
 Exce_Sum_con_wire3<=QSalidaEstado30;
 Exce_Sum_con_wire4<=QSalidaEstado31;
 Exce_Sum_con_wire5<=QSalidaEstado32; 
 
 Branch_AND_wire0<=QSalidaEstado29;
 Branch_AND_wire1<=QSalidaEstado30;
 Branch_AND_wire2<=QSalidaEstado31;
 Branch_AND_wire3<=QSalidaEstado32; 
 
  Enable_DireccionCP_wire4<=QSalidaEstado31;
  Enable_DireccionCP_wire5<=QSalidaEstado32; 
  
  Write_MD_wire0<=QSalidaEstado33;
  Write_MD_wire1<=QSalidaEstado34; 
  
Read_MD_wire0<=QSalidaEstado35;
Read_MD_wire1<=QSalidaEstado36;
Read_MD_wire2<=QSalidaEstado37;
Read_MD_wire3<=QSalidaEstado38; 

Enable_Data_Reg_wire0<=QSalidaEstado37;
Enable_Data_Reg_wire1<=QSalidaEstado38;

 
 process(clk)
 begin
 if(clk'event and clk ='1')then--Estado0--
  QSalidaEstado0<=DEntradaEstado0;
   QSalidaEstado1<=DEntradaEstado1;
	 QSalidaEstado2<=DEntradaEstado2;
	 QSalidaEstado3<=DEntradaEstado3;
	  QSalidaEstado4<=DEntradaEstado4;
	   QSalidaEstado5<=DEntradaEstado5;
		QSalidaEstado6<=DEntradaEstado6;
		  QSalidaEstado7<=DEntradaEstado7;
		    QSalidaEstado8<=DEntradaEstado8;
		 QSalidaEstado9<=DEntradaEstado9;
  QSalidaEstado10<=DEntradaEstado10;
  QSalidaEstado11<=DEntradaEstado11;
    QSalidaEstado12<=DEntradaEstado12;
	   QSalidaEstado13<=DEntradaEstado13;
		  QSalidaEstado14<=DEntradaEstado14;
		  QSalidaEstado15<=DEntradaEstado15;
		  QSalidaEstado16<=DEntradaEstado16;
		  QSalidaEstado17<=DEntradaEstado17;
		   QSalidaEstado18<=DEntradaEstado18;
			 QSalidaEstado19<=DEntradaEstado19;
			   QSalidaEstado20<=DEntradaEstado20;
				 QSalidaEstado21<=DEntradaEstado21;
				 QSalidaEstado22<=DEntradaEstado22;
				 QSalidaEstado23<=DEntradaEstado23;
				 
				 QSalidaEstado24<=DEntradaEstado24;
				   QSalidaEstado25<=DEntradaEstado25;
					  QSalidaEstado26<=DEntradaEstado26;
					    QSalidaEstado27<=DEntradaEstado27;
						   QSalidaEstado28<=DEntradaEstado28;
							
							  QSalidaEstado29<=DEntradaEstado29;
							    QSalidaEstado30<=DEntradaEstado30;
							   QSalidaEstado31<=DEntradaEstado31;
								
								   QSalidaEstado32<=DEntradaEstado32;
									  QSalidaEstado33<=DEntradaEstado33;
									    QSalidaEstado34<=DEntradaEstado34;
										  QSalidaEstado35<=DEntradaEstado35;
										    QSalidaEstado36<=DEntradaEstado36;
											   QSalidaEstado37<=DEntradaEstado37;
  QSalidaEstado38<=DEntradaEstado38;
  end if;
  end process;
   


  ------------------------SALIDA DE CONTROL----------------------------------------
 Read_ROM<=Read_ROM_wire0 or Read_ROM_wire1 or Read_ROM_wire2 or Read_ROM_wire3;
 Enable_PC<=Enable_PC_wire0 or Enable_PC_wire1; 
 EnableInst_Reg<=EnableInst_Reg_wire0 or EnableInst_Reg_wire1;
 Select_jump_Mux<=Select_jump_Mux_wire0 or Select_jump_Mux_wire1;
 Enable_DireccionCP<= Enable_DireccionCP_wire0 or Enable_DireccionCP_wire1 or Enable_DireccionCP_wire2 or Enable_DireccionCP_wire3 or Enable_DireccionCP_wire4 or Enable_DireccionCP_wire5;
 Read_rs1<=Read_rs1_wire0 or Read_rs1_wire1 or Read_rs1_wire2 or Read_rs1_wire3;
 Exce_Sum_con<=Exce_Sum_con_wire0 or Exce_Sum_con_wire1 or Exce_Sum_con_wire2 or Exce_Sum_con_wire3 or Exce_Sum_con_wire4 or Exce_Sum_con_wire5;
 EnableBR_OUT1<=EnableBR_OUT1_wire0 or EnableBR_OUT1_wire1;
 Read_rs2<=Read_rs2_wire0 or Read_rs2_wire1 or Read_rs2_wire2 or Read_rs2_wire3;
 EnableBR_OUT2<=EnableBR_OUT2_wire0 or EnableBR_OUT2_wire1;
 iRMux<=iRMux_wire0 or iRMux_wire1 or iRMux_wire2 or iRMux_wire3 or iRMux_wire4 or iRMux_wire5 ;
 Exce_ALU<=Exce_ALU_wire0 or Exce_ALU_wire1 or Exce_ALU_wire2 or Exce_ALU_wire3 or Exce_ALU_wire4 or Exce_ALU_wire5 or Exce_ALU_wire6 or Exce_ALU_wire7 or Exce_ALU_wire8 or Exce_ALU_wire9 or Exce_ALU_wire10 or Exce_ALU_wire11 or Exce_ALU_wire12 or Exce_ALU_wire13 or Exce_ALU_wire14 or Exce_ALU_wire15;
 Enable_ALU_OUT<=Enable_ALU_OUT_wire0 or Enable_ALU_OUT_wire1 or Enable_ALU_OUT_wire2 or Enable_ALU_OUT_wire3;
 iMux<=iMux_wire0 or iMux_wire1 or iMux_wire2 or iMux_wire3;
 amMux<=amMux_wire0 or amMux_wire1;
 WriteBR<=WriteBR_wire0 or WriteBR_wire1;
 Write_MD<=Write_MD_wire0 or Write_MD_wire1;
 Read_MD<=Read_MD_wire0 or Read_MD_wire1 or Read_MD_wire2 or Read_MD_wire3 ;
 Enable_Data_Reg<=Enable_Data_Reg_wire0 or Enable_Data_Reg_wire1;
 Branch_AND<=Branch_AND_wire0 or Branch_AND_wire1 or Branch_AND_wire2 or Branch_AND_wire3;
 -----------------------------------------------------------------------------------
 
 end unidadcontrolArch;