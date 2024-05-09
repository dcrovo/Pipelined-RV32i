---PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Control_Unit DE RVI32--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity MainDecoder is
       port( 
		       
				 clear : in std_logic;--
				 Enable_PC : out STD_LOGIC;--
				 WriteBR : out STD_LOGIC;--
				 Read_rs1 : out STD_LOGIC;--
		       EnableInst_Reg : out STD_LOGIC;--
				 Read_ROM : out STD_LOGIC;--
				 Enable_DireccionCP : out STD_LOGIC;--
				 Read_rs2 : out STD_LOGIC;--
				 EnableBR_OUT2 : out STD_LOGIC;--
				 Select_jump_Mux : out STD_LOGIC;--
				 Branch_AND : out STD_LOGIC;--
				 amMux : out STD_LOGIC;--
				 iRMux : out STD_LOGIC;--
				 iMux : out STD_LOGIC;--
				 Exce_Sum_con : out STD_LOGIC;--
				 Exce_ALU : out STD_LOGIC;--
				 EnableBR_OUT1 : out STD_LOGIC;--
				 Enable_ALU_OUT: out STD_LOGIC;--
				 Write_MD : out STD_LOGIC;--
				 Read_MD : out STD_LOGIC;--
				 Enable_Data_Reg : out STD_LOGIC;--
				 opcodeC : in std_logic_vector(6 downto 0);
				 Enable_sumcon : out STD_LOGIC;--
				 Select_Data_Mux : out STD_LOGIC;--
				 --------------
				 clk : in std_logic
				 );
				 
end MainDecoder;



architecture MainDecoderArch of MainDecoder is

-----------------------------------------
signal jump_Mux_Opcode : std_logic;
signal R_Opcode : std_logic;
signal B_Opcode : std_logic;
signal I_Opcode : std_logic;
signal S_Opcode : std_logic;
signal L_Opcode : std_logic;
signal Sw_Opcode : std_logic;
------------------------------------------

-------------------Cables para Enable_PC-----------------
signal Enable_PC_wire0 : std_logic;
signal Enable_PC_wire1 : std_logic;
signal Enable_PC_wire2 : std_logic;
signal Enable_PC_wire3 : std_logic;
----------------Cables para Read_ROM---------------------
signal Read_ROM_wire0 : std_logic;
signal Read_ROM_wire1 : std_logic;
signal Read_ROM_wire2 : std_logic;
signal Read_ROM_wire3 : std_logic;
signal Read_ROM_wire4 : std_logic;
signal Read_ROM_wire5 : std_logic;
signal Read_ROM_wire6 : std_logic;
signal Read_ROM_wire7 : std_logic;
----------------------------------------------------------
-------------------Cables para EnableInst_Reg-------------
signal EnableInst_Reg_wire0 : std_logic;
signal EnableInst_Reg_wire1 : std_logic;
signal EnableInst_Reg_wire2 : std_logic;
signal EnableInst_Reg_wire3 : std_logic;
-------------------Cables para EnableInst_Reg-------------
signal Select_jump_Mux_wire0 : std_logic;
signal Select_jump_Mux_wire1 : std_logic;

----------------------------------------------------------
-------FF Extra tiempos
signal auxiliar: std_logic;
signal auxiliar1: std_logic;
signal auxiliar2: std_logic;
signal auxiliar3: std_logic;

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
signal Read_rs1_wire4 : std_logic;
signal Read_rs1_wire5 : std_logic;
signal Read_rs1_wire6 : std_logic;
signal Read_rs1_wire7 : std_logic;
----------------------------------------------------------

-------------------Cables para sumcon-------------
signal Exce_Sum_con_wire0 : std_logic;
signal Exce_Sum_con_wire1  : std_logic;
signal Exce_Sum_con_wire2 : std_logic;
signal Exce_Sum_con_wire3  : std_logic;
signal Exce_Sum_con_wire8 : std_logic;
signal Exce_Sum_con_wire9  : std_logic;
signal Exce_Sum_con_wire10 : std_logic;
signal Exce_Sum_con_wire11  : std_logic;

signal Exce_Sum_con_wire4 : std_logic;
signal Exce_Sum_con_wire5  : std_logic;
signal Exce_Sum_con_wire6 : std_logic;
signal Exce_Sum_con_wire7  : std_logic;
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
signal Read_rs2_wire4 : std_logic;
signal Read_rs2_wire5 : std_logic;
signal Read_rs2_wire6 : std_logic;
signal Read_rs2_wire7 : std_logic;
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
signal iRMux_wire6 : std_logic;
signal iRMux_wire7 : std_logic;
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
signal iMux_wire8 : std_logic;
signal iMux_wire9 : std_logic;
----------------------------------------------------------
-------------------Cables para Enable_ALU_OUT-------------
signal Enable_ALU_OUT_wire2 : std_logic;
signal Enable_ALU_OUT_wire3 : std_logic;
----------------------------------------------------------
-------------------Cables para amMux-------------
signal amMux_wire0 : std_logic;
signal amMux_wire1 : std_logic;
signal amMux_wire2 : std_logic;
signal amMux_wire3 : std_logic;
----------------------------------------------------------

-------------------Cables para writeBR-------------
signal WriteBR_wire0 : std_logic;
signal WriteBR_wire1 : std_logic;
signal WriteBR_wire2 : std_logic;
signal WriteBR_wire3 : std_logic;
signal WriteBR_wire4 : std_logic;
signal WriteBR_wire5 : std_logic;

signal WriteBR_wire6 : std_logic;
signal WriteBR_wire7 : std_logic;
signal WriteBR_wire8 : std_logic;
signal WriteBR_wire9 : std_logic;
signal WriteBR_wire10 : std_logic;
signal WriteBR_wire11: std_logic;
----------------------------------------------------------

-------------------Cables para amMux-------------

----------------------------------------------------------

-------------------Cables para Enable_Data_Mux-------------
signal Select_Data_Mux_wire0 : std_logic;
signal Select_Data_Mux_wire1 : std_logic;
signal Select_Data_Mux_wire2 : std_logic;
signal Select_Data_Mux_wire3 : std_logic;


signal Branch_AND_wire0 : std_logic;
signal Branch_AND_wire1 : std_logic;
signal Branch_AND_wire2: std_logic;
signal Branch_AND_wire3: std_logic;

signal Write_MD_wire0 : std_logic;
signal Write_MD_wire1 : std_logic;
signal Write_MD_wire2 : std_logic;
signal Write_MD_wire3 : std_logic;
signal Write_MD_wire4 : std_logic;
signal Write_MD_wire5 : std_logic;

 
signal Read_MD_wire0 :std_logic;
signal Read_MD_wire1 :std_logic;
signal Read_MD_wire2 :std_logic;
signal Read_MD_wire3 :std_logic;
signal Read_MD_wire4 :std_logic;
signal Read_MD_wire5 :std_logic;
signal Read_MD_wire6 :std_logic;
signal Read_MD_wire7 :std_logic;

signal Enable_Data_Reg_wire0 : std_logic;
signal Enable_Data_Reg_wire1 : std_logic;

signal Enable_sumcon_wire0 : std_logic;
signal Enable_sumcon_wire1 : std_logic;
signal Enable_sumcon_wire2 : std_logic;
signal Enable_sumcon_wire3 : std_logic;


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
signal DEntradaEstado39: std_logic;
signal DEntradaEstado40: std_logic;
signal DEntradaEstado41: std_logic;
signal DEntradaEstado42: std_logic;
---------------------------
signal DEntradaEstado43: std_logic;
signal DEntradaEstado44: std_logic;
signal DEntradaEstado45: std_logic;
signal DEntradaEstado46: std_logic;
-------------------
signal DEntradaEstado47: std_logic;
signal DEntradaEstado48: std_logic;
signal DEntradaEstado49: std_logic;
signal DEntradaEstado50: std_logic;

signal DEntradaEstado51: std_logic;
signal DEntradaEstado52: std_logic;
signal DEntradaEstado53: std_logic;
signal DEntradaEstado54: std_logic;

signal DEntradaEstado55: std_logic;
signal DEntradaEstado56: std_logic;

signal DEntradaEstado57: std_logic;
signal DEntradaEstado58: std_logic;
signal DEntradaEstado59: std_logic;
signal DEntradaEstado60: std_logic;

signal DEntradaEstado61: std_logic;
signal DEntradaEstado62: std_logic;
signal DEntradaEstado63: std_logic;
signal DEntradaEstado64: std_logic;

-------FF Extra tiempos
signal DEntradaEstado65: std_logic;
signal DEntradaEstado66: std_logic;
signal DEntradaEstado67: std_logic;
signal DEntradaEstado68: std_logic;



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
signal QSalidaEstado39: std_logic;
signal QSalidaEstado40: std_logic;
signal QSalidaEstado41: std_logic;
signal QSalidaEstado42: std_logic;
-------------------------
signal QSalidaEstado43: std_logic;
signal QSalidaEstado44: std_logic;
signal QSalidaEstado45: std_logic;
signal QSalidaEstado46: std_logic;

signal QSalidaEstado47: std_logic;
signal QSalidaEstado48: std_logic;
signal QSalidaEstado49: std_logic;
signal QSalidaEstado50: std_logic;

signal QSalidaEstado51: std_logic;
signal QSalidaEstado52: std_logic;
signal QSalidaEstado53: std_logic;
signal QSalidaEstado54: std_logic;

signal QSalidaEstado55: std_logic;
signal QSalidaEstado56: std_logic;

signal QSalidaEstado57: std_logic;
signal QSalidaEstado58: std_logic;

signal QSalidaEstado59: std_logic;
signal QSalidaEstado60: std_logic;

signal QSalidaEstado61: std_logic;
signal QSalidaEstado62: std_logic;
signal QSalidaEstado63: std_logic;
signal QSalidaEstado64: std_logic;

-------FF Extra tiempos
signal QSalidaEstado65: std_logic;
signal QSalidaEstado66: std_logic;
signal QSalidaEstado67: std_logic;
signal QSalidaEstado68: std_logic;


 begin
 -----------------------------------------Condiciones de transiccion---------------------------------------------------------------------------------
 jump_Mux_Opcode<=(opcodeC(0) and opcodeC(1) and opcodeC(2) and  opcodeC(3) and not opcodeC(4) and opcodeC(5) and  opcodeC(6));--1101111
 R_Opcode<=(not opcodeC(6) and opcodeC(5) and opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--0110011
 B_Opcode<=(opcodeC(6) and opcodeC(5) and not opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--1100011
 I_Opcode<=(not opcodeC(6) and not opcodeC(5) and opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--0010011
 S_Opcode<=(not opcodeC(6) and opcodeC(5) and not opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--0100011
 L_Opcode<=(not opcodeC(6) and not opcodeC(5) and not opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--0000011
 Sw_Opcode<=(opcodeC(6) and opcodeC(5) and opcodeC(4) and opcodeC(3) and opcodeC(2) and opcodeC(1) and opcodeC(0));--1111111
 
-------------circuito de arranque---------------------

  --------------------------------------------------------  
DEntradaEstado1<= QSalidaEstado28 or QSalidaEstado32;
DEntradaEstado2<= QSalidaEstado1;
DEntradaEstado3<=QSalidaEstado2 or QSalidaEstado8;
DEntradaEstado4<=QSalidaEstado3;
--Agregar Tiempos--
DEntradaEstado61<=QSalidaEstado4 ;
DEntradaEstado62<=QSalidaEstado61 ;
DEntradaEstado63<=QSalidaEstado62;
DEntradaEstado64<=QSalidaEstado63;
DEntradaEstado5<=QSalidaEstado64 ;
---------------------------------------
  
  DEntradaEstado6<=QSalidaEstado5;
  DEntradaEstado7<=(QSalidaEstado6 and jump_Mux_Opcode);
  DEntradaEstado8<=QSalidaEstado7;
  DEntradaEstado9<=(QSalidaEstado6  and not jump_Mux_Opcode);
  DEntradaEstado10<=QSalidaEstado9;
  
  --Agregar Tiempos--
    DEntradaEstado51<=QSalidaEstado10;
	 DEntradaEstado52<=QSalidaEstado51;
	 DEntradaEstado53<=QSalidaEstado52;
	 DEntradaEstado54<=QSalidaEstado53;
    DEntradaEstado11<=QSalidaEstado54;
  ---------------------------------------
  DEntradaEstado12<=QSalidaEstado11;
  DEntradaEstado13<=QSalidaEstado12;
  
        --Agregar Tiempos--
   DEntradaEstado47<=QSalidaEstado13;
   DEntradaEstado48<=QSalidaEstado47;
	DEntradaEstado49<=QSalidaEstado48;
	DEntradaEstado50<=QSalidaEstado49;
   DEntradaEstado14<=QSalidaEstado50;
  ------------------------------------
  DEntradaEstado15<=QSalidaEstado14;
  DEntradaEstado16<=QSalidaEstado15;
  DEntradaEstado17<=(QSalidaEstado16 and(R_Opcode or B_Opcode or S_Opcode)) ;
  DEntradaEstado18<=QSalidaEstado17;
  DEntradaEstado19<=QSalidaEstado18 and not B_Opcode;
  DEntradaEstado20<=QSalidaEstado19;
  DEntradaEstado21<=QSalidaEstado16 and (I_Opcode or L_Opcode);
  DEntradaEstado22<=QSalidaEstado21;
  DEntradaEstado23<=QSalidaEstado22;
  DEntradaEstado24<=QSalidaEstado23;
  DEntradaEstado25<=(QSalidaEstado20 and not S_Opcode) or (QsalidaEstado24 and not L_Opcode)  ;
  --Agregar Tiempos--
   DEntradaEstado57<=QSalidaEstado25;
	DEntradaEstado58<=QSalidaEstado57;
  DEntradaEstado65<=QSalidaEstado58;
  DEntradaEstado66<=QSalidaEstado65;
  DEntradaEstado26<=QSalidaEstado66;
  -------------------------------------
  DEntradaEstado27<=QSalidaEstado26 or( QSalidaEstado38 or QSalidaEstado40 or QSalidaEstado42 );
  DEntradaEstado28<=QSalidaEstado27;
  DEntradaEstado29<=QSalidaEstado18 and B_Opcode;
  DEntradaEstado30<=QSalidaEstado29;
  DEntradaEstado31<=QSalidaEstado30;
  DEntradaEstado32<=QSalidaEstado31;
  ---------------------------------

  DEntradaEstado33<=QSalidaEstado24 and L_Opcode;
    ----Agrega Tiempo----
  DEntradaEstado43<=QSalidaEstado33;
  DEntradaEstado44<=QSalidaEstado43;
  DEntradaEstado45<=QSalidaEstado44;
  DEntradaEstado46<=QSalidaEstado45;
  DEntradaEstado34<=QSalidaEstado46;
 -------------------------------------------- 
  DEntradaEstado35<=QSalidaEstado34 ;
  DEntradaEstado36<=QSalidaEstado35;
  DEntradaEstado37<=QSalidaEstado36;
    ----Agrega Tiempo----
   DEntradaEstado59<=QSalidaEstado37;
	DEntradaEstado60<=QSalidaEstado59;
   DEntradaEstado67<=QSalidaEstado60;
	DEntradaEstado68<=QSalidaEstado67;
	DEntradaEstado38<=QSalidaEstado68;
     --------------------------------------------
  DEntradaEstado39<=(QSalidaEstado20 and S_Opcode);
  DEntradaEstado40<=QSalidaEstado39;
  DEntradaEstado41<=QSalidaEstado16 and Sw_Opcode;
    ----Agrega Tiempo----
  DEntradaEstado55<=QSalidaEstado41;
  DEntradaEstado56<=QSalidaEstado55;
  DEntradaEstado42<=QSalidaEstado56;
--------------------------------------------
  
 ---------------------------------------------------------------------------------------------------------- 
	
  Enable_PC_wire0<=QSalidaEstado1;
  Enable_PC_wire1<=QSalidaEstado2;
  
  Read_ROM_wire0<=QSalidaEstado3;
  Read_ROM_wire1<=QSalidaEstado4;
  Read_ROM_wire2<=QSalidaEstado5;
  Read_ROM_wire3<=QSalidaEstado6;
  Read_ROM_wire4<=QSalidaEstado61;
  Read_ROM_wire5<=QSalidaEstado62;
  Read_ROM_wire6<=QSalidaEstado63;
  Read_ROM_wire7<=QSalidaEstado64;
  
  EnableInst_Reg_wire0<=QSalidaEstado5;
  EnableInst_Reg_wire1<=QSalidaEstado6;
  
  iMux_wire8<=QSalidaEstado7;
  iMux_wire9<=QsalidaEstado8;
  
  Select_jump_Mux_wire0<=QSalidaEstado7;
  Select_jump_Mux_wire1<=QsalidaEstado8;
  
  Enable_DireccionCP_wire0<=QSalidaEstado7;
  Enable_DireccionCP_wire1<=QSalidaEstado8;
  
  Read_rs1_wire0<=QSalidaEstado9;
  Read_rs1_wire1<=QSalidaEstado10;
  Read_rs1_wire2<=QSalidaEstado11;
  Read_rs1_wire3<=QSalidaEstado12;
  Read_rs1_wire4<=QSalidaEstado51;
  Read_rs1_wire5<=QSalidaEstado52;
  Read_rs1_wire6<=QSalidaEstado53;
  Read_rs1_wire7<=QSalidaEstado54;
  
  Exce_Sum_con_wire0<=QSalidaEstado9;
  Exce_Sum_con_wire1<=QSalidaEstado10;
  
  EnableBR_OUT1_wire0<=QSalidaEstado11;
  EnableBR_OUT1_wire1<=QSalidaEstado12;
    Enable_sumcon_wire0<=QSalidaEstado11;
 Enable_sumcon_wire1<=QSalidaEstado12; 

  
  Exce_Sum_con_wire2<=QSalidaEstado11;
  Exce_Sum_con_wire3<=QSalidaEstado12;
  
  Exce_sum_con_wire8<=QSalidaEstado51;
  Exce_sum_con_wire9<=QSalidaEstado52;
  Exce_sum_con_wire10<=QSalidaEstado53;
  Exce_sum_con_wire11<=QSalidaEstado54;
	 
	 
  Read_rs2_wire0<=QSalidaEstado13;
  Read_rs2_wire1<=QSalidaEstado14;
  Read_rs2_wire2<=QSalidaEstado15;
  Read_rs2_wire3<=QSalidaEstado16;
  Read_rs2_wire4<=QSalidaEstado47;
  Read_rs2_wire5<=QSalidaEstado48;
  Read_rs2_wire6<=QSalidaEstado49;
  Read_rs2_wire7<=QSalidaEstado50;
  
  
  EnableBR_OUT2_wire0<=QSalidaEstado15;
  EnableBR_OUT2_wire1<=QSalidaEstado16;
  
  Exce_ALU_wire0<=QSalidaEstado17;
  Exce_ALU_wire1<=QSalidaEstado18;
  Exce_ALU_wire2<=QSalidaEstado19;
  Exce_ALU_wire3<=QSalidaEstado20;
  
  iRMux_wire0<=QSalidaEstado17;
  iRMux_wire1<=QSalidaEstado18;
  iRMux_wire2<=QSalidaEstado19;
  iRMux_wire3<=QSalidaEstado20;
  
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
  
  
  WriteBR_wire0<=QSalidaEstado25;
  WriteBR_wire1<=QSalidaEstado26;
  -------Extension1---------------
  WriteBR_wire2<=QSalidaEstado57;
  WriteBR_wire3<=QSalidaEstado58;
  WriteBR_wire4<=QSalidaEstado65;
  WriteBR_wire5<=QSalidaEstado66;
  
   Enable_DireccionCP_wire2<=QsalidaEstado27;
	Enable_DireccionCP_wire3<=QSalidaEstado28;
	
 iRMux_wire4<=QSalidaEstado29;
 iRMux_wire5<=QSalidaEstado30;
 iRMux_wire6<=QSalidaEstado31;
 iRMux_wire7<=QSalidaEstado32;
  
  Exce_ALU_wire12<=QSalidaEstado29;
  Exce_ALU_wire13<=QSalidaEstado30;
  Exce_ALU_wire14<=QSalidaEstado31;
  Exce_ALU_wire15<=QSalidaEstado32; 
  
Exce_Sum_con_wire4<=QSalidaEstado29;
Exce_Sum_con_wire5<=QSalidaEstado30;
Exce_Sum_con_wire6<=QSalidaEstado31;
Exce_Sum_con_wire7<=QSalidaEstado32; 
 
 Branch_AND_wire0<=QSalidaEstado29;
 Branch_AND_wire1<=QSalidaEstado30;
 Branch_AND_wire2<=QSalidaEstado31;
 Branch_AND_wire3<=QSalidaEstado32; 
 
  Enable_DireccionCP_wire4<=QSalidaEstado31;
  Enable_DireccionCP_wire5<=QSalidaEstado32; 
  
   Enable_sumcon_wire2<=QSalidaEstado31;
 Enable_sumcon_wire3<=QSalidaEstado32; 

  
Read_MD_wire0<=QSalidaEstado33;
Read_MD_wire1<=QSalidaEstado34;
Read_MD_wire2<=QSalidaEstado35;
Read_MD_wire3<=QSalidaEstado36; 
Read_MD_wire4<=QSalidaEstado43;
Read_MD_wire5<=QSalidaEstado44; 
Read_MD_wire6<=QSalidaEstado45;
Read_MD_wire7<=QSalidaEstado46; 

Enable_Data_Reg_wire0<=QSalidaEstado35;
Enable_Data_Reg_wire1<=QSalidaEstado36; 

WriteBR_wire6<=QSalidaEstado37;
WriteBR_wire7<=QSalidaEstado38;
---extension
WriteBR_wire8<=QSalidaEstado67;
WriteBR_wire9<=QSalidaEstado68;
WriteBR_wire10<=QSalidaEstado59;
WriteBR_wire11<=QSalidaEstado60;
-------------------------------
amMux_wire0<=QSalidaEstado37;
amMux_wire1<=QSalidaEstado38;
amMux_wire2<=QSalidaEstado39;
amMux_wire3<=QSalidaEstado40;

  Write_MD_wire0<=QSalidaEstado39;
  Write_MD_wire1<=QSalidaEstado40; 
  
  Select_Data_Mux_wire0<=QSalidaEstado41;
  Select_Data_Mux_wire1<=QSalidaEstado42;
  Select_Data_Mux_wire2<=QSalidaEstado55;
  Select_Data_Mux_wire3<=QSalidaEstado56;
  
  Write_MD_wire2<=QSalidaEstado41;
  Write_MD_wire3<=QSalidaEstado42;
  Write_MD_wire4<=QSalidaEstado55;
  Write_MD_wire5<=QSalidaEstado56;
  
 process(clk,clear)
 
 begin
  if(clear='1' and rising_edge(clk))then
      QSalidaEstado1<='1';
      QSalidaEstado2<='0';
      QSalidaEstado3<='0';
--Estado4--
      QSalidaEstado4<='0';
--Estado5--
      QSalidaEstado5<='0';
  --Estado6--
      QSalidaEstado6<='0';
--Estado7--
      QSalidaEstado7<='0';
--Estado8--
      QSalidaEstado8<='0';
  --Estado9--
     QSalidaEstado9<='0';
--Estado10--
     QSalidaEstado10<='0';
 --Estado11--
     QSalidaEstado11<='0';
 --Estado12--
     QSalidaEstado12<='0';
  --Estado13--
    QSalidaEstado13<='0';
 --Estado14--
     QSalidaEstado14<='0';
--Estado15--
     QSalidaEstado15<='0';
 --Estado16--
     QSalidaEstado16<='0';
  --Estado17--
     QSalidaEstado17<='0';
--Estado18--
     QSalidaEstado18<='0';
 --Estado19--
     QSalidaEstado19<='0';
--Estado20--
     QSalidaEstado20<='0';
 --Estado21--
     QSalidaEstado21<='0';
  --Estado22--
     QSalidaEstado22<='0';
--Estado23--
    QSalidaEstado23<='0';
--Estado24--
    QSalidaEstado24<='0';
 --Estado25--
   QSalidaEstado25<='0';
  --Estado26--
   QSalidaEstado26<='0';
--Estado27--
   QSalidaEstado27<='0';
--Estado28--
   QSalidaEstado28<='0';
--Estado29--
   QSalidaEstado29<='0';
--Estado30--
   QSalidaEstado30<='0';
  --Estado31--
   QSalidaEstado31<='0';
--Estado32--
   QSalidaEstado32<='0';
   QSalidaEstado33<='0';
   QSalidaEstado34<='0';
   QSalidaEstado35<='0';
   QSalidaEstado36<='0';
   QSalidaEstado37<='0';
   QSalidaEstado38<='0';
   QSalidaEstado39<='0';
   QSalidaEstado40<='0';
   QSalidaEstado41<='0';
   QSalidaEstado42<='0';
   QSalidaEstado43<='0';
   QSalidaEstado44<='0';
   QSalidaEstado45<='0';
   QSalidaEstado46<='0'; 
   QSalidaEstado47<='0';
   QSalidaEstado48<='0';
   QSalidaEstado49<='0';
   QSalidaEstado50<='0';
   QSalidaEstado51<='0';
   QSalidaEstado52<='0';
   QSalidaEstado53<='0';
   QSalidaEstado54<='0';
   QSalidaEstado55<='0';
   QSalidaEstado56<='0';
   QSalidaEstado57<='0';
   QSalidaEstado58<='0';
	QSalidaEstado59<='0';
   QSalidaEstado60<='0';
   QSalidaEstado61<='0';
   QSalidaEstado62<='0';
	QSalidaEstado63<='0';
   QSalidaEstado64<='0';
   QSalidaEstado65<='0';
   QSalidaEstado66<='0';
	QSalidaEstado67<='0';
   QSalidaEstado68<='0';
	

 ELSE if(rising_edge(clk))then--Estado0--

 
  QSalidaEstado1<=DEntradaEstado1;
  QSalidaEstado2<=DEntradaEstado2;
  QSalidaEstado3<=DEntradaEstado3;
--Estado4--
  QSalidaEstado4<=DEntradaEstado4;
--Estado5--
  QSalidaEstado5<=DEntradaEstado5;
  --Estado6--
  QSalidaEstado6<=DEntradaEstado6;
--Estado7--
  QSalidaEstado7<=DEntradaEstado7;
--Estado8--
  QSalidaEstado8<=DEntradaEstado8;
  --Estado9--
  QSalidaEstado9<=DEntradaEstado9;
--Estado10--
  QSalidaEstado10<=DEntradaEstado10;
 --Estado11--
  QSalidaEstado11<=DEntradaEstado11;
 --Estado12--
  QSalidaEstado12<=DEntradaEstado12;
  --Estado13--
  QSalidaEstado13<=DEntradaEstado13;
 --Estado14--
  QSalidaEstado14<=DEntradaEstado14;
--Estado15--
  QSalidaEstado15<=DEntradaEstado15;
 --Estado16--
  QSalidaEstado16<=DEntradaEstado16;
  --Estado17--
  QSalidaEstado17<=DEntradaEstado17;
--Estado18--
  QSalidaEstado18<=DEntradaEstado18;
 --Estado19--
  QSalidaEstado19<=DEntradaEstado19;
--Estado20--
  QSalidaEstado20<=DEntradaEstado20;
 --Estado21--
  QSalidaEstado21<=DEntradaEstado21;
  --Estado22--
  QSalidaEstado22<=DEntradaEstado22;
--Estado23--
  QSalidaEstado23<=DEntradaEstado23;
--Estado24--
  QSalidaEstado24<=DEntradaEstado24;
 --Estado25--
  QSalidaEstado25<=DEntradaEstado25;
  --Estado26--
  QSalidaEstado26<=DEntradaEstado26;
--Estado27--
  QSalidaEstado27<=DEntradaEstado27;
--Estado28--
  QSalidaEstado28<=DEntradaEstado28;
--Estado29--
  QSalidaEstado29<=DEntradaEstado29;
--Estado30--
  QSalidaEstado30<=DEntradaEstado30;
  --Estado31--
  QSalidaEstado31<=DEntradaEstado31;
--Estado32--
  QSalidaEstado32<=DEntradaEstado32;
--Estado33--
  QSalidaEstado33<=DEntradaEstado33;
--Estado34--
  QSalidaEstado34<=DEntradaEstado34;
  --Estado35--
  QSalidaEstado35<=DEntradaEstado35;
  --Estado35--
  QSalidaEstado36<=DEntradaEstado36;
--Estado37--
  QSalidaEstado37<=DEntradaEstado37;
  --Estado38--
  QSalidaEstado38<=DEntradaEstado38;
 --Estado39--
  QSalidaEstado39<=DEntradaEstado39;
 --Estado40--
  QSalidaEstado40<=DEntradaEstado40;
--Estado41--
  QSalidaEstado41<=DEntradaEstado41;
 --Estado42--
  QSalidaEstado42<=DEntradaEstado42;
  
  QSalidaEstado43<=DEntradaEstado43;
  QSalidaEstado44<=DEntradaEstado44;
   QSalidaEstado45<=DEntradaEstado45;
  QSalidaEstado46<=DEntradaEstado46;
  
    QSalidaEstado47<=DEntradaEstado47;
  QSalidaEstado48<=DEntradaEstado48;
   QSalidaEstado49<=DEntradaEstado49;
  QSalidaEstado50<=DEntradaEstado50;
  
   QSalidaEstado51<=DEntradaEstado51;
  QSalidaEstado52<=DEntradaEstado52;
   QSalidaEstado53<=DEntradaEstado53;
  QSalidaEstado54<=DEntradaEstado54;
     QSalidaEstado55<=DEntradaEstado55;
  QSalidaEstado56<=DEntradaEstado56;
    QSalidaEstado57<=DEntradaEstado57;
  QSalidaEstado58<=DEntradaEstado58;
   QSalidaEstado59<=DEntradaEstado59;
  QSalidaEstado60<=DEntradaEstado60;
    QSalidaEstado61<=DEntradaEstado61;
  QSalidaEstado62<=DEntradaEstado62;
   QSalidaEstado63<=DEntradaEstado63;
  QSalidaEstado64<=DEntradaEstado64;
   QSalidaEstado65<=DEntradaEstado65;
  QSalidaEstado66<=DEntradaEstado66;
   QSalidaEstado67<=DEntradaEstado67;
  QSalidaEstado68<=DEntradaEstado68;
  END IF ;
   END IF ;
  end process;
 auxiliar<=Read_rs1_wire0 or Read_rs1_wire1 or Read_rs1_wire2 or Read_rs1_wire3 or Read_rs1_wire4 or Read_rs1_wire5 or Read_rs1_wire6 or Read_rs1_wire7;
 auxiliar2<=iRMux_wire0 or iRMux_wire1 or iRMux_wire2 or iRMux_wire3 or iRMux_wire4 or iRMux_wire5 or iRMux_wire6 or iRMux_wire7;
 auxiliar3<=WriteBR_wire0 or WriteBR_wire1 or WriteBR_wire2 or WriteBR_wire3 or WriteBR_wire4 or WriteBR_wire5 or WriteBR_wire6 or WriteBR_wire7 or WriteBR_wire8 or WriteBR_wire9 or WriteBR_wire10 or WriteBR_wire11;

  ------------------------SALIDA DE CONTROL----------------------------------------
 Read_ROM<=Read_ROM_wire0 or Read_ROM_wire1 or Read_ROM_wire2 or Read_ROM_wire3 OR Read_ROM_wire4 or Read_ROM_wire5 or Read_ROM_wire6 or Read_ROM_wire7;
 Enable_PC<=Enable_PC_wire0 or Enable_PC_wire1 ; 
 EnableInst_Reg<=EnableInst_Reg_wire0 or EnableInst_Reg_wire1;
 Select_jump_Mux<=Select_jump_Mux_wire0 or Select_jump_Mux_wire1;
 Enable_DireccionCP<= Enable_DireccionCP_wire0 or Enable_DireccionCP_wire1 or Enable_DireccionCP_wire2 or Enable_DireccionCP_wire3 or Enable_DireccionCP_wire4 or Enable_DireccionCP_wire5;
 Read_rs1<=Read_rs1_wire0 or Read_rs1_wire1 or Read_rs1_wire2 or Read_rs1_wire3 or Read_rs1_wire4 or Read_rs1_wire5 or Read_rs1_wire6 or Read_rs1_wire7;
 Exce_Sum_con<=Exce_Sum_con_wire0 or Exce_Sum_con_wire1 or Exce_Sum_con_wire2 or Exce_Sum_con_wire3 or Exce_Sum_con_wire4 or Exce_Sum_con_wire5 or Exce_Sum_con_wire6 or Exce_Sum_con_wire7 or Exce_Sum_con_wire8 or Exce_Sum_con_wire9 or Exce_Sum_con_wire10 or Exce_Sum_con_wire11;
 EnableBR_OUT1<=(EnableBR_OUT1_wire0 or EnableBR_OUT1_wire1) ;
 Read_rs2<=(Read_rs2_wire0 or Read_rs2_wire1 or Read_rs2_wire2 or Read_rs2_wire3 or Read_rs2_wire4 or Read_rs2_wire5 or Read_rs2_wire6 or Read_rs2_wire7) and not auxiliar;
 EnableBR_OUT2<=EnableBR_OUT2_wire0 or EnableBR_OUT2_wire1;
 iRMux<=(iRMux_wire0 or iRMux_wire1 or iRMux_wire2 or iRMux_wire3 or iRMux_wire4 or iRMux_wire5 or iRMux_wire6 or iRMux_wire7) ;
 Exce_ALU<=(((Exce_ALU_wire0 or Exce_ALU_wire1 or Exce_ALU_wire2 or Exce_ALU_wire3 or Exce_ALU_wire4 or Exce_ALU_wire5 or Exce_ALU_wire6 or Exce_ALU_wire7 or Exce_ALU_wire8 or Exce_ALU_wire9 or Exce_ALU_wire10 or Exce_ALU_wire11 or Exce_ALU_wire12 or Exce_ALU_wire13 or Exce_ALU_wire14 or Exce_ALU_wire15) or auxiliar2) and not auxiliar3);
 Enable_ALU_OUT<=Enable_ALU_OUT_wire0 or Enable_ALU_OUT_wire1 or Enable_ALU_OUT_wire2 or Enable_ALU_OUT_wire3;
 iMux<=iMux_wire0 or iMux_wire1 or iMux_wire2 or iMux_wire3  or iMux_wire8 or iMux_wire9 ;
 amMux<=amMux_wire0 or amMux_wire1 or amMux_wire2 or amMux_wire3;
 WriteBR<=WriteBR_wire0 or WriteBR_wire1 or WriteBR_wire2 or WriteBR_wire3 or WriteBR_wire4 or WriteBR_wire5 or WriteBR_wire6 or WriteBR_wire7 or WriteBR_wire8 or WriteBR_wire9 or WriteBR_wire10 or WriteBR_wire11;
 Write_MD<=Write_MD_wire0 or Write_MD_wire1 or Write_MD_wire2 or Write_MD_wire3 or Write_MD_wire4 or Write_MD_wire5;
 Read_MD<=Read_MD_wire0 or Read_MD_wire1 or Read_MD_wire2 or Read_MD_wire3 or Read_MD_wire4 or Read_MD_wire5 or Read_MD_wire6 or Read_MD_wire7 ;
 Enable_Data_Reg<=Enable_Data_Reg_wire0 or Enable_Data_Reg_wire1;
 Branch_AND<=Branch_AND_wire0 or Branch_AND_wire1 or Branch_AND_wire2 or Branch_AND_wire3;
 Enable_sumcon<=Enable_sumcon_wire0 or Enable_sumcon_wire1 or Enable_sumcon_wire2 or Enable_sumcon_wire3 ;
 Select_Data_Mux<=Select_Data_Mux_wire0 or Select_Data_Mux_wire1 OR Select_Data_Mux_wire2 or Select_Data_Mux_wire3;
 ------
 -----
 -----------------------------------------------------------------------------------
 
 end MainDecoderArch;
 