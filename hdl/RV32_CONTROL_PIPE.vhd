---PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Control_Unit DE RVI32--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity RV32_CONTROL_PIPE is
       port( 
		       
				 clear : in std_logic;--
				 Enable_PC : out STD_LOGIC;--
				 WriteBR : out STD_LOGIC;--
             EnableiMux_Reg : out STD_LOGIC;--
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
             EnableInst_Reg_2  : out STD_LOGIC;--
				 --------------
				 clk : in std_logic
				 );
				 
end RV32_CONTROL_PIPE;



architecture MainDecoderArch of RV32_CONTROL_PIPE is

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
signal Enable_PC_wire0 : std_logic:='0';
signal Enable_PC_wire1 : std_logic:='0';
signal Enable_PC_wire2 : std_logic:='0';
signal Enable_PC_wire3 : std_logic:='0';
signal Enable_PC_wire4 : std_logic:='0';
signal Enable_PC_wire5 : std_logic:='0';
signal Enable_PC_wire6 : std_logic:='0';
signal Enable_PC_wire7 : std_logic:='0';
signal Enable_PC_wire8 : std_logic:='0';--
signal Enable_PC_wire9 : std_logic:='0';--
signal Enable_PC_wire10 : std_logic:='0';
signal Enable_PC_wire11 : std_logic:='0';
signal Enable_PC_wire12 : std_logic:='0';
signal Enable_PC_wire13 : std_logic:='0';
signal Enable_PC_wire14 : std_logic:='0';
signal Enable_PC_wire15 : std_logic:='0';


-------------------Cables para sumcon-------------
signal Exce_Sum_con_wire0 : std_logic:='0';
signal Exce_Sum_con_wire1  : std_logic:='0';
signal Exce_Sum_con_wire2 : std_logic:='0';
signal Exce_Sum_con_wire3  : std_logic:='0';
signal Exce_Sum_con_wire8 : std_logic:='0';
signal Exce_Sum_con_wire9  : std_logic:='0';
signal Exce_Sum_con_wire10 : std_logic:='0';
signal Exce_Sum_con_wire11  : std_logic:='0';
signal Exce_Sum_con_wire4 : std_logic:='0';
signal Exce_Sum_con_wire5  : std_logic:='0';
signal Exce_Sum_con_wire6 : std_logic:='0';
signal Exce_Sum_con_wire7  : std_logic:='0';
signal Exce_Sum_con_wire12  : std_logic:='0';
signal Exce_Sum_con_wire13  : std_logic:='0';
signal Exce_Sum_con_wire14  : std_logic:='0';
signal Exce_Sum_con_wire15  : std_logic:='0';
signal Exce_Sum_con_wire16  : std_logic:='0';---
signal Exce_Sum_con_wire17  : std_logic:='0';
signal Exce_Sum_con_wire18  : std_logic:='0';
signal Exce_Sum_con_wire19  : std_logic:='0';---
signal Exce_Sum_con_wire20  : std_logic:='0';---
signal Exce_Sum_con_wire21  : std_logic:='0';
signal Exce_Sum_con_wire22  : std_logic:='0';
signal Exce_Sum_con_wire23  : std_logic:='0';---
signal Exce_Sum_con_wire24  : std_logic:='0';---
signal Exce_Sum_con_wire25  : std_logic:='0';
signal Exce_Sum_con_wire26  : std_logic:='0';
signal Exce_Sum_con_wire27  : std_logic:='0';---
signal Exce_Sum_con_wire28  : std_logic:='0';---
signal Exce_Sum_con_wire29  : std_logic:='0';
signal Exce_Sum_con_wire30  : std_logic:='0';
signal Exce_Sum_con_wire31  : std_logic:='0';---

------------------------------------------------
signal Enable_sumcon_wire0 : std_logic :='0';
signal Enable_sumcon_wire1 : std_logic:='0';
signal Enable_sumcon_wire2 : std_logic:='0';
signal Enable_sumcon_wire3 : std_logic:='0';
signal Enable_sumcon_wire4 : std_logic:='0';
signal Enable_sumcon_wire5 : std_logic:='0';
signal Enable_sumcon_wire6 : std_logic:='0';
signal Enable_sumcon_wire7 : std_logic:='0';
signal Enable_sumcon_wire8 : std_logic:='0';
signal Enable_sumcon_wire9 : std_logic:='0';
signal Enable_sumcon_wire10 : std_logic:='0';--
signal Enable_sumcon_wire11 : std_logic:='0';--
signal Enable_sumcon_wire12 : std_logic:='0';
signal Enable_sumcon_wire13 : std_logic:='0';
signal Enable_sumcon_wire14 : std_logic:='0';
signal Enable_sumcon_wire15 : std_logic:='0';

-------------------Cables para EnableInst_Reg-------------
signal Enable_DireccionCP_wire0 : std_logic:='0';
signal Enable_DireccionCP_wire1 : std_logic:='0';
signal Enable_DireccionCP_wire2 : std_logic:='0';
signal Enable_DireccionCP_wire3 : std_logic:='0';
signal Enable_DireccionCP_wire4 : std_logic:='0';
signal Enable_DireccionCP_wire5 : std_logic:='0';
signal Enable_DireccionCP_wire6 : std_logic:='0';
signal Enable_DireccionCP_wire7 : std_logic:='0';
signal Enable_DireccionCP_wire8 : std_logic:='0';--
signal Enable_DireccionCP_wire9 : std_logic:='0';--
signal Enable_DireccionCP_wire10 : std_logic:='0';
signal Enable_DireccionCP_wire11 : std_logic:='0';
signal Enable_DireccionCP_wire12 : std_logic:='0';
signal Enable_DireccionCP_wire13 : std_logic:='0';
signal Enable_DireccionCP_wire14 : std_logic:='0';
signal Enable_DireccionCP_wire15 : std_logic:='0';
----------------------------------------------------------

----------------Cables para Read_ROM---------------------
signal Read_ROM_wire0 : std_logic:='0';
signal Read_ROM_wire1 : std_logic:='0';
signal Read_ROM_wire2 : std_logic:='0';
signal Read_ROM_wire3 : std_logic:='0';
signal Read_ROM_wire4 : std_logic:='0';
signal Read_ROM_wire5 : std_logic:='0';
signal Read_ROM_wire6 : std_logic:='0';
signal Read_ROM_wire7 : std_logic:='0';
signal Read_ROM_wire8 : std_logic:='0';
signal Read_ROM_wire9 : std_logic:='0';
signal Read_ROM_wire10 : std_logic:='0';
signal Read_ROM_wire11 : std_logic:='0';
signal Read_ROM_wire12 : std_logic:='0';--
signal Read_ROM_wire13 : std_logic:='0';
signal Read_ROM_wire14 : std_logic:='0';
signal Read_ROM_wire15 : std_logic:='0';--
signal Read_ROM_wire16 : std_logic:='0';--
signal Read_ROM_wire17 : std_logic:='0';
signal Read_ROM_wire18 : std_logic:='0';
signal Read_ROM_wire19 : std_logic:='0';--
signal Read_ROM_wire20 : std_logic:='0';--
signal Read_ROM_wire21 : std_logic:='0';
signal Read_ROM_wire22 : std_logic:='0';
signal Read_ROM_wire23 : std_logic:='0';--
signal Read_ROM_wire24 : std_logic:='0';--
signal Read_ROM_wire25 : std_logic:='0';
signal Read_ROM_wire26 : std_logic:='0';
signal Read_ROM_wire27 : std_logic:='0';--
----------------------------------------------------------
-------------------Cables para EnableInst_Reg-------------
signal EnableInst_Reg_wire0 : std_logic:='0';
signal EnableInst_Reg_wire1 : std_logic:='0';
signal EnableInst_Reg_wire2 : std_logic:='0';
signal EnableInst_Reg_wire3 : std_logic:='0';
signal EnableInst_Reg_wire4 : std_logic:='0';
signal EnableInst_Reg_wire5 : std_logic:='0';
signal EnableInst_Reg_wire6 : std_logic:='0';
signal EnableInst_Reg_wire7 : std_logic:='0';
signal EnableInst_Reg_wire8 : std_logic:='0';
signal EnableInst_Reg_wire9 : std_logic:='0';
signal EnableInst_Reg_wire10 : std_logic:='0';--
signal EnableInst_Reg_wire11 : std_logic:='0';--
signal EnableInst_Reg_wire12 : std_logic:='0';
signal EnableInst_Reg_wire13 : std_logic:='0';

----------------Cables para Enable iMux_Reg--------------
signal EnableiMux_Reg_wire0 : std_logic:='0';--
signal EnableiMux_Reg_wire1 : std_logic:='0';--
signal EnableiMux_Reg_wire2 : std_logic:='0';
signal EnableiMux_Reg_wire3 : std_logic:='0';
signal EnableiMux_Reg_wire4 : std_logic:='0';
signal EnableiMux_Reg_wire5 : std_logic:='0';
signal EnableiMux_Reg_wire6 : std_logic:='0';
signal EnableiMux_Reg_wire7 : std_logic:='0';
signal EnableiMux_Reg_wire8 : std_logic:='0';
signal EnableiMux_Reg_wire9 : std_logic:='0';
signal EnableiMux_Reg_wire10 : std_logic:='0';
signal EnableiMux_Reg_wire11 : std_logic:='0';

----------------Cables para Enable iMux_Reg--------------
signal EnableInst_Reg_2_wire0 : std_logic:='0';--
signal EnableInst_Reg_2_wire1 : std_logic:='0';--
signal EnableInst_Reg_2_wire2 : std_logic:='0';
signal EnableInst_Reg_2_wire3 : std_logic:='0';
signal EnableInst_Reg_2_wire4 : std_logic:='0';
signal EnableInst_Reg_2_wire5 : std_logic:='0';
signal EnableInst_Reg_2_wire6 : std_logic:='0';
signal EnableInst_Reg_2_wire7 : std_logic:='0';
signal EnableInst_Reg_2_wire8 : std_logic:='0';
signal EnableInst_Reg_2_wire9 : std_logic:='0';
signal EnableInst_Reg_2_wire10 : std_logic:='0';
signal EnableInst_Reg_2_wire11 : std_logic:='0';

----------------Cables para Read_rs1---------------------
signal Read_rs1_wire0 : std_logic:='0';
signal Read_rs1_wire1 : std_logic:='0';
signal Read_rs1_wire2 : std_logic:='0';
signal Read_rs1_wire3 : std_logic:='0';
signal Read_rs1_wire4 : std_logic:='0';
signal Read_rs1_wire5 : std_logic:='0';
signal Read_rs1_wire6 : std_logic:='0';
signal Read_rs1_wire7 : std_logic:='0';
signal Read_rs1_wire8 : std_logic:='0';
signal Read_rs1_wire9 : std_logic:='0';
signal Read_rs1_wire10 : std_logic:='0';
signal Read_rs1_wire11 : std_logic:='0';
signal Read_rs1_wire12 : std_logic:='0';
signal Read_rs1_wire13 : std_logic:='0';
signal Read_rs1_wire14 : std_logic:='0';
signal Read_rs1_wire15 : std_logic:='0';
signal Read_rs1_wire16 : std_logic:='0';
signal Read_rs1_wire17 : std_logic:='0';
signal Read_rs1_wire18 : std_logic:='0';
signal Read_rs1_wire19 : std_logic:='0';
signal Read_rs1_wire20 : std_logic:='0';
signal Read_rs1_wire21 : std_logic:='0';
signal Read_rs1_wire22 : std_logic:='0';
signal Read_rs1_wire23 : std_logic:='0';
signal Read_rs1_wire24 : std_logic:='0';--
signal Read_rs1_wire25 : std_logic:='0';
signal Read_rs1_wire26 : std_logic:='0';
signal Read_rs1_wire27 : std_logic:='0';
signal Read_rs1_wire28 : std_logic:='0';
signal Read_rs1_wire29 : std_logic:='0';
signal Read_rs1_wire30 : std_logic:='0';
signal Read_rs1_wire31 : std_logic:='0';--
signal Read_rs1_wire32 : std_logic:='0';--
signal Read_rs1_wire33 : std_logic:='0';
signal Read_rs1_wire34 : std_logic:='0';
signal Read_rs1_wire35 : std_logic:='0';
signal Read_rs1_wire36 : std_logic:='0';
signal Read_rs1_wire37 : std_logic:='0';
signal Read_rs1_wire38 : std_logic:='0';
signal Read_rs1_wire39 : std_logic:='0';--
signal Read_rs1_wire40 : std_logic:='0';--
signal Read_rs1_wire41 : std_logic:='0';
signal Read_rs1_wire42 : std_logic:='0';
signal Read_rs1_wire43 : std_logic:='0';
signal Read_rs1_wire44 : std_logic:='0';
signal Read_rs1_wire45 : std_logic:='0';
signal Read_rs1_wire46 : std_logic:='0';
signal Read_rs1_wire47 : std_logic:='0';--

----------------------------------------------------------
-------------------Cables para EnableBR_OUT1-------------
signal EnableBR_OUT1_wire0 : std_logic:='0';
signal EnableBR_OUT1_wire1 : std_logic:='0';
signal EnableBR_OUT1_wire2 : std_logic:='0';
signal EnableBR_OUT1_wire3 : std_logic:='0';
signal EnableBR_OUT1_wire4 : std_logic:='0';--
signal EnableBR_OUT1_wire5 : std_logic:='0';--
signal EnableBR_OUT1_wire6 : std_logic:='0';
signal EnableBR_OUT1_wire7 : std_logic:='0';
signal EnableBR_OUT1_wire8 : std_logic:='0';
signal EnableBR_OUT1_wire9 : std_logic:='0';
signal EnableBR_OUT1_wire10 : std_logic:='0';
signal EnableBR_OUT1_wire11 : std_logic:='0';
----------------------------------------------------------
----------------Cables para Read_rs2---------------------
signal Read_rs2_wire0 : std_logic:='0';
signal Read_rs2_wire1 : std_logic:='0';
signal Read_rs2_wire2 : std_logic:='0';
signal Read_rs2_wire3 : std_logic:='0';
signal Read_rs2_wire4 : std_logic:='0';
signal Read_rs2_wire5 : std_logic:='0';
signal Read_rs2_wire6 : std_logic:='0';
signal Read_rs2_wire7 : std_logic:='0';
signal Read_rs2_wire8 : std_logic:='0';
signal Read_rs2_wire9 : std_logic:='0';
signal Read_rs2_wire10 : std_logic:='0';
signal Read_rs2_wire11 : std_logic:='0';
signal Read_rs2_wire12 : std_logic:='0';
signal Read_rs2_wire13 : std_logic:='0';
signal Read_rs2_wire14 : std_logic:='0';
signal Read_rs2_wire15 : std_logic:='0';
signal Read_rs2_wire16 : std_logic:='0';--
signal Read_rs2_wire17 : std_logic:='0';
signal Read_rs2_wire18 : std_logic:='0';
signal Read_rs2_wire19 : std_logic:='0';
signal Read_rs2_wire20 : std_logic:='0';
signal Read_rs2_wire21 : std_logic:='0';
signal Read_rs2_wire22 : std_logic:='0';
signal Read_rs2_wire23 : std_logic:='0';--
signal Read_rs2_wire24 : std_logic:='0';--
signal Read_rs2_wire25 : std_logic:='0';
signal Read_rs2_wire26 : std_logic:='0';
signal Read_rs2_wire27 : std_logic:='0';
signal Read_rs2_wire28 : std_logic:='0';
signal Read_rs2_wire29 : std_logic:='0';
signal Read_rs2_wire30 : std_logic:='0';
signal Read_rs2_wire31 : std_logic:='0';--
signal Read_rs2_wire32 : std_logic:='0';--
signal Read_rs2_wire33 : std_logic:='0';
signal Read_rs2_wire34 : std_logic:='0';
signal Read_rs2_wire35 : std_logic:='0';
signal Read_rs2_wire36 : std_logic:='0';
signal Read_rs2_wire37 : std_logic:='0';
signal Read_rs2_wire38 : std_logic:='0';
signal Read_rs2_wire39 : std_logic:='0';--
signal Read_rs2_wire40 : std_logic:='0';--
signal Read_rs2_wire41 : std_logic:='0';
signal Read_rs2_wire42 : std_logic:='0';
signal Read_rs2_wire43 : std_logic:='0';
signal Read_rs2_wire44 : std_logic:='0';
signal Read_rs2_wire45 : std_logic:='0';
signal Read_rs2_wire46 : std_logic:='0';
signal Read_rs2_wire47 : std_logic:='0';--
----------------------------------------------------------
-------------------Cables para EnableBR_OUT2-------------
signal EnableBR_OUT2_wire0 : std_logic:='0';
signal EnableBR_OUT2_wire1 : std_logic:='0';
signal EnableBR_OUT2_wire2 : std_logic:='0';
signal EnableBR_OUT2_wire3 : std_logic:='0';
signal EnableBR_OUT2_wire4 : std_logic:='0';--
signal EnableBR_OUT2_wire5 : std_logic:='0';--
signal EnableBR_OUT2_wire6 : std_logic:='0';
signal EnableBR_OUT2_wire7 : std_logic:='0';
signal EnableBR_OUT2_wire8 : std_logic:='0';
signal EnableBR_OUT2_wire9 : std_logic:='0';
signal EnableBR_OUT2_wire10 : std_logic:='0';
signal EnableBR_OUT2_wire11 : std_logic:='0';
----------------------------------------------------------
----------------Cables para Exccec_ALU---------------------
signal Exce_ALU_wire0 : std_logic:='0';--
signal Exce_ALU_wire1 : std_logic:='0';
signal Exce_ALU_wire2 : std_logic:='0';
signal Exce_ALU_wire3 : std_logic:='0';
signal Exce_ALU_wire4 : std_logic:='0';
signal Exce_ALU_wire5 : std_logic:='0';
signal Exce_ALU_wire6 : std_logic:='0';--
signal Exce_ALU_wire7 : std_logic:='0';--
signal Exce_ALU_wire8 : std_logic:='0';
signal Exce_ALU_wire9 : std_logic:='0';
signal Exce_ALU_wire10 : std_logic:='0';
signal Exce_ALU_wire11 : std_logic:='0';
signal Exce_ALU_wire12 : std_logic:='0';
signal Exce_ALU_wire13 : std_logic:='0';--
signal Exce_ALU_wire14 : std_logic:='0';--
signal Exce_ALU_wire15 : std_logic:='0';
signal Exce_ALU_wire16 : std_logic:='0';
signal Exce_ALU_wire17 : std_logic:='0';
signal Exce_ALU_wire18 : std_logic:='0';
signal Exce_ALU_wire19 : std_logic:='0';
signal Exce_ALU_wire20 : std_logic:='0';--
signal Exce_ALU_wire21 : std_logic:='0';--
signal Exce_ALU_wire22 : std_logic:='0';
signal Exce_ALU_wire23 : std_logic:='0';
signal Exce_ALU_wire24 : std_logic:='0';
signal Exce_ALU_wire25 : std_logic:='0';
signal Exce_ALU_wire26 : std_logic:='0';
signal Exce_ALU_wire27 : std_logic:='0';--
signal Exce_ALU_wire28 : std_logic:='0';--
signal Exce_ALU_wire29 : std_logic:='0';
signal Exce_ALU_wire30 : std_logic:='0';
signal Exce_ALU_wire31 : std_logic:='0';
signal Exce_ALU_wire32 : std_logic:='0';
signal Exce_ALU_wire33 : std_logic:='0';
signal Exce_ALU_wire34 : std_logic:='0';--
----------------------------------------------------------

-------------------Cables para IRMUX------------
signal iRMux_wire0 : std_logic:='0';
signal iRMux_wire1 : std_logic:='0';
signal iRMux_wire2 : std_logic:='0';
signal iRMux_wire3 : std_logic:='0';
signal iRMux_wire4 : std_logic:='0';
signal iRMux_wire5 : std_logic:='0';
signal iRMux_wire6 : std_logic:='0';
signal iRMux_wire7 : std_logic:='0';
signal iRMux_wire8 : std_logic:='0';
signal iRMux_wire9 : std_logic:='0';
signal iRMux_wire10 : std_logic:='0';
signal iRMux_wire11 : std_logic:='0';
signal iRMux_wire12 : std_logic:='0';
signal iRMux_wire13 : std_logic:='0';

----------------------------------------------------------
----------------Cables para Exccec_ALU---------------------
signal iMux_wire0 : std_logic:='0';--
signal iMux_wire1 : std_logic:='0';
signal iMux_wire2 : std_logic:='0';
signal iMux_wire3 : std_logic:='0';
signal iMux_wire4 : std_logic:='0';
signal iMux_wire5 : std_logic:='0';
signal iMux_wire6 : std_logic:='0';--
signal iMux_wire7 : std_logic:='0';--
signal iMux_wire8 : std_logic:='0';
signal iMux_wire9 : std_logic:='0';
signal iMux_wire10 : std_logic:='0';
signal iMux_wire11 : std_logic:='0';
signal iMux_wire12 : std_logic:='0';
signal iMux_wire13 : std_logic:='0';--
signal iMux_wire14 : std_logic:='0';--
signal iMux_wire15: std_logic:='0';
signal iMux_wire16 : std_logic:='0';
signal iMux_wire17 : std_logic:='0';
signal iMux_wire18 : std_logic:='0';
signal iMux_wire19 : std_logic:='0';
signal iMux_wire20 : std_logic:='0';--
----------------------------------------------------------
-------------------Cables para Enable_ALU_OUT-------------
signal Enable_ALU_OUT_wire0 : std_logic:='0';
signal Enable_ALU_OUT_wire1 : std_logic:='0';
signal Enable_ALU_OUT_wire2 : std_logic:='0';
signal Enable_ALU_OUT_wire3 : std_logic:='0';
signal Enable_ALU_OUT_wire4 : std_logic:='0';--
signal Enable_ALU_OUT_wire5 : std_logic:='0';
signal Enable_ALU_OUT_wire6 : std_logic:='0';
signal Enable_ALU_OUT_wire7 : std_logic:='0';--
signal Enable_ALU_OUT_wire8 : std_logic:='0';--
signal Enable_ALU_OUT_wire9 : std_logic:='0';
signal Enable_ALU_OUT_wire10 : std_logic:='0';
signal Enable_ALU_OUT_wire11 : std_logic:='0';--
signal Enable_ALU_OUT_wire12 : std_logic:='0';--
signal Enable_ALU_OUT_wire13 : std_logic:='0';
signal Enable_ALU_OUT_wire14 : std_logic:='0';
signal Enable_ALU_OUT_wire15 : std_logic:='0';--
signal Enable_ALU_OUT_wire16 : std_logic:='0';--
signal Enable_ALU_OUT_wire17 : std_logic:='0';
signal Enable_ALU_OUT_wire18 : std_logic:='0';
signal Enable_ALU_OUT_wire19 : std_logic:='0';--

----------------------------------------------------------
-------------------Cables para writeBR-------------
signal WriteBR_wire0 : std_logic:='0';
signal WriteBR_wire1 : std_logic:='0';
signal WriteBR_wire2 : std_logic:='0';
signal WriteBR_wire3 : std_logic:='0';
signal WriteBR_wire4 : std_logic:='0';
signal WriteBR_wire5 : std_logic:='0';
----------------------------------------------------------
-------------------Cables para jump_Reg-------------
signal Select_jump_Mux_wire0 : std_logic:='0';
signal Select_jump_Mux_wire1 : std_logic:='0';

----------------------------------------------------------
-------------------Cables para amMux-------------
signal amMux_wire0 : std_logic:='0';
signal amMux_wire1 : std_logic:='0';
signal amMux_wire2 : std_logic:='0';
signal amMux_wire3 : std_logic:='0';
----------------------------------------------------------

-------------------Cables para Enable_Data_Mux-------------
signal Select_Data_Mux_wire0 : std_logic:='0';
signal Select_Data_Mux_wire1 : std_logic:='0';
signal Select_Data_Mux_wire2 : std_logic:='0';
signal Select_Data_Mux_wire3 : std_logic:='0';
signal Select_Data_Mux_wire4 : std_logic:='0';
signal Select_Data_Mux_wire5 : std_logic:='0';
--------------------------------------------------------------
signal Branch_AND_wire0 : std_logic:='0';
signal Branch_AND_wire1 : std_logic:='0';
signal Branch_AND_wire2: std_logic:='0';
signal Branch_AND_wire3: std_logic:='0';
------------------------------------------------------------------
signal Write_MD_wire0 : std_logic:='0';
signal Write_MD_wire1 : std_logic:='0';
signal Write_MD_wire2 : std_logic:='0';
signal Write_MD_wire3 : std_logic:='0';
signal Write_MD_wire4 : std_logic:='0';
signal Write_MD_wire5 : std_logic:='0';
--------------------------------------------------------------------
 
signal Read_MD_wire0 :std_logic:='0';
signal Read_MD_wire1 :std_logic:='0';
signal Read_MD_wire2 :std_logic:='0';
signal Read_MD_wire3 :std_logic:='0';
signal Read_MD_wire4 :std_logic:='0';
signal Read_MD_wire5 :std_logic:='0';
signal Read_MD_wire6 :std_logic:='0';
signal Read_MD_wire7 :std_logic:='0';

signal Enable_Data_Reg_wire0 : std_logic:='0';
signal Enable_Data_Reg_wire1 : std_logic:='0';



--------------------------------------------------------------------------------
--------------Entradas y salida de cada Flip Flop de la One HOT-----------------
--------------------------------------------------------------------------------

-------------------------------------
----------ONEHOT D's-----------------
-------------------------------------
signal DEntradaEstado1: std_logic:='0';
signal DEntradaEstado2: std_logic:='0';
signal DEntradaEstado3: std_logic:='0';
signal DEntradaEstado4: std_logic:='0';
signal DEntradaEstado5: std_logic:='0';
signal DEntradaEstado6: std_logic:='0';
signal DEntradaEstado7: std_logic:='0';
signal DEntradaEstado8: std_logic:='0';
signal DEntradaEstado9: std_logic:='0';
signal DEntradaEstado10: std_logic:='0';
signal DEntradaEstado11: std_logic:='0';
signal DEntradaEstado12: std_logic:='0';
signal DEntradaEstado13: std_logic:='0';
signal DEntradaEstado14: std_logic:='0';
signal DEntradaEstado15: std_logic:='0';
signal DEntradaEstado16: std_logic:='0';
signal DEntradaEstado17: std_logic:='0';
signal DEntradaEstado18: std_logic:='0';
signal DEntradaEstado19: std_logic:='0';
signal DEntradaEstado20: std_logic:='0';
signal DEntradaEstado21: std_logic:='0';
signal DEntradaEstado22: std_logic:='0';
signal DEntradaEstado23: std_logic:='0';
signal DEntradaEstado24: std_logic:='0';
signal DEntradaEstado25: std_logic:='0';
signal DEntradaEstado26: std_logic:='0';
signal DEntradaEstado27: std_logic:='0';
signal DEntradaEstado28: std_logic:='0';
signal DEntradaEstado29: std_logic:='0';
signal DEntradaEstado30: std_logic:='0';
signal DEntradaEstado31: std_logic:='0';
signal DEntradaEstado32: std_logic:='0';
signal DEntradaEstado33: std_logic:='0';
signal DEntradaEstado34: std_logic:='0';
signal DEntradaEstado35: std_logic:='0';
signal DEntradaEstado36: std_logic:='0';
signal DEntradaEstado37: std_logic:='0';
signal DEntradaEstado38: std_logic:='0';
signal DEntradaEstado39: std_logic:='0';
signal DEntradaEstado40: std_logic:='0';
signal DEntradaEstado41: std_logic:='0';
signal DEntradaEstado42: std_logic:='0';
signal DEntradaEstado43: std_logic:='0';
signal DEntradaEstado44: std_logic:='0';
signal DEntradaEstado45: std_logic:='0';
signal DEntradaEstado46: std_logic:='0';
signal DEntradaEstado47: std_logic:='0';
signal DEntradaEstado48: std_logic:='0';
signal DEntradaEstado49: std_logic:='0';
signal DEntradaEstado50: std_logic:='0';
signal DEntradaEstado51: std_logic:='0';
signal DEntradaEstado52: std_logic:='0';
signal DEntradaEstado53: std_logic:='0';
signal DEntradaEstado54: std_logic:='0';
signal DEntradaEstado55: std_logic:='0';
signal DEntradaEstado56: std_logic:='0';
signal DEntradaEstado57: std_logic:='0';
signal DEntradaEstado58: std_logic:='0';
signal DEntradaEstado59: std_logic:='0';
signal DEntradaEstado60: std_logic:='0';
signal DEntradaEstado61: std_logic:='0';
signal DEntradaEstado62: std_logic:='0';
signal DEntradaEstado63: std_logic:='0';
signal DEntradaEstado64: std_logic:='0';
signal DEntradaEstado65: std_logic:='0';
signal DEntradaEstado66: std_logic:='0';
signal DEntradaEstado67: std_logic:='0';
signal DEntradaEstado68: std_logic:='0';
signal DEntradaEstado69: std_logic:='0';
signal DEntradaEstado70: std_logic:='0';
signal DEntradaEstado71: std_logic:='0';
signal DEntradaEstado72: std_logic:='0';
signal DEntradaEstado73: std_logic:='0';
signal DEntradaEstado74: std_logic:='0';
signal DEntradaEstado75: std_logic:='0';
signal DEntradaEstado76: std_logic:='0';
signal DEntradaEstado77: std_logic:='0';
signal DEntradaEstado78: std_logic:='0';
signal DEntradaEstado79: std_logic:='0';
signal DEntradaEstado80: std_logic:='0';
signal DEntradaEstado81: std_logic:='0';
signal DEntradaEstado82: std_logic:='0';
signal DEntradaEstado83: std_logic:='0';
signal DEntradaEstado84: std_logic:='0';
signal DEntradaEstado85: std_logic:='0';
signal DEntradaEstado86: std_logic:='0';
signal DEntradaEstado87: std_logic:='0';
signal DEntradaEstado88: std_logic:='0';
signal DEntradaEstado89: std_logic:='0';
signal DEntradaEstado90: std_logic:='0';
signal DEntradaEstado91: std_logic:='0';
signal DEntradaEstado92: std_logic:='0';
signal DEntradaEstado93: std_logic:='0';
signal DEntradaEstado94: std_logic:='0';
signal DEntradaEstado95: std_logic:='0';
signal DEntradaEstado96: std_logic:='0';
signal DEntradaEstado97: std_logic:='0';
signal DEntradaEstado98: std_logic:='0';
signal DEntradaEstado99: std_logic:='0';
signal DEntradaEstado100: std_logic:='0';
signal DEntradaEstado101: std_logic:='0';
signal DEntradaEstado102: std_logic:='0';
signal DEntradaEstado103: std_logic:='0';
signal DEntradaEstado104: std_logic:='0';
signal DEntradaEstado105: std_logic:='0';
signal DEntradaEstado106: std_logic:='0';
signal DEntradaEstado107: std_logic:='0';
signal DEntradaEstado108: std_logic:='0';
-------------------------------------
----------ONEHOT Q's-----------------
-------------------------------------

signal QSalidaEstado0: std_logic:='0';
signal QSalidaEstado1: std_logic:='0';
signal QSalidaEstado2: std_logic:='0';
signal QSalidaEstado3: std_logic:='0';
signal QSalidaEstado4: std_logic:='0';
signal QSalidaEstado5: std_logic:='0';
signal QSalidaEstado6: std_logic:='0';
signal QSalidaEstado7: std_logic:='0';
signal QSalidaEstado8: std_logic:='0';
signal QSalidaEstado9: std_logic:='0';
signal QSalidaEstado10: std_logic:='0';
signal QSalidaEstado11: std_logic:='0';
signal QSalidaEstado12: std_logic:='0';
signal QSalidaEstado13: std_logic:='0';
signal QSalidaEstado14: std_logic:='0';
signal QSalidaEstado15: std_logic:='0';
signal QSalidaEstado16: std_logic:='0';
signal QSalidaEstado17: std_logic:='0';
signal QSalidaEstado18: std_logic:='0';
signal QSalidaEstado19: std_logic:='0';
signal QSalidaEstado20: std_logic:='0';
signal QSalidaEstado21: std_logic:='0';
signal QSalidaEstado22: std_logic:='0';
signal QSalidaEstado23: std_logic:='0';
signal QSalidaEstado24: std_logic:='0';
signal QSalidaEstado25: std_logic:='0';
signal QSalidaEstado26: std_logic:='0';
signal QSalidaEstado27: std_logic:='0';
signal QSalidaEstado28: std_logic:='0';
signal QSalidaEstado29: std_logic:='0';
signal QSalidaEstado30: std_logic:='0';
signal QSalidaEstado31: std_logic:='0';
signal QSalidaEstado32: std_logic:='0';
signal QSalidaEstado33: std_logic:='0';
signal QSalidaEstado34: std_logic:='0';
signal QSalidaEstado35: std_logic:='0';
signal QSalidaEstado36: std_logic:='0';
signal QSalidaEstado37: std_logic:='0';
signal QSalidaEstado38: std_logic:='0';
signal QSalidaEstado39: std_logic:='0';
signal QSalidaEstado40: std_logic:='0';
signal QSalidaEstado41: std_logic:='0';
signal QSalidaEstado42: std_logic:='0';
signal QSalidaEstado43: std_logic:='0';
signal QSalidaEstado44: std_logic:='0';
signal QSalidaEstado45: std_logic:='0';
signal QSalidaEstado46: std_logic:='0';
signal QSalidaEstado47: std_logic:='0';
signal QSalidaEstado48: std_logic:='0';
signal QSalidaEstado49: std_logic:='0';
signal QSalidaEstado50: std_logic:='0';
signal QSalidaEstado51: std_logic:='0';
signal QSalidaEstado52: std_logic:='0';
signal QSalidaEstado53: std_logic:='0';
signal QSalidaEstado54: std_logic:='0';
signal QSalidaEstado55: std_logic:='0';
signal QSalidaEstado56: std_logic:='0';
signal QSalidaEstado57: std_logic:='0';
signal QSalidaEstado58: std_logic:='0';
signal QSalidaEstado59: std_logic:='0';
signal QSalidaEstado60: std_logic:='0';
signal QSalidaEstado61: std_logic:='0';
signal QSalidaEstado62: std_logic:='0';
signal QSalidaEstado63: std_logic:='0';
signal QSalidaEstado64: std_logic:='0';
signal QSalidaEstado65: std_logic:='0';
signal QSalidaEstado66: std_logic:='0';
signal QSalidaEstado67: std_logic:='0';
signal QSalidaEstado68: std_logic:='0';
signal QSalidaEstado69: std_logic:='0';
signal QSalidaEstado70: std_logic:='0';
signal QSalidaEstado71: std_logic:='0';
signal QSalidaEstado72: std_logic:='0';
signal QSalidaEstado73: std_logic:='0';
signal QSalidaEstado74: std_logic:='0';
signal QSalidaEstado75: std_logic:='0';
signal QSalidaEstado76: std_logic:='0';
signal QSalidaEstado77: std_logic:='0';
signal QSalidaEstado78: std_logic:='0';
signal QSalidaEstado79: std_logic:='0';
signal QSalidaEstado80: std_logic:='0';
signal QSalidaEstado81: std_logic:='0';
signal QSalidaEstado82: std_logic:='0';
signal QSalidaEstado83: std_logic:='0';
signal QSalidaEstado84: std_logic:='0';
signal QSalidaEstado85: std_logic:='0';
signal QSalidaEstado86: std_logic:='0';
signal QSalidaEstado87: std_logic:='0';
signal QSalidaEstado88: std_logic:='0';
signal QSalidaEstado89: std_logic:='0';
signal QSalidaEstado90: std_logic:='0';
signal QSalidaEstado91: std_logic:='0';
signal QSalidaEstado92: std_logic:='0';
signal QSalidaEstado93: std_logic:='0';
signal QSalidaEstado94: std_logic:='0';
signal QSalidaEstado95: std_logic:='0';
signal QSalidaEstado96: std_logic:='0';
signal QSalidaEstado97: std_logic:='0';
signal QSalidaEstado98: std_logic:='0';
signal QSalidaEstado99: std_logic:='0';
signal QSalidaEstado100: std_logic:='0';
signal QSalidaEstado101: std_logic:='0';
signal QSalidaEstado102: std_logic:='0';
signal QSalidaEstado103: std_logic:='0';
signal QSalidaEstado104: std_logic:='0';
signal QSalidaEstado105: std_logic:='0';
signal QSalidaEstado106: std_logic:='0';
signal QSalidaEstado107: std_logic:='0';
signal QSalidaEstado108: std_logic:='0';



 begin
 -----------------------------------------Condiciones de transiccion---------------------------------------------------------------------------------
 --jump_Mux_Opcode<=(opcodeC(0) and opcodeC(1) and opcodeC(2) and  opcodeC(3) and not opcodeC(4) and opcodeC(5) and  opcodeC(6));--1101111
R_Opcode<=(not opcodeC(6) and opcodeC(5) and opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--0110011
B_Opcode<=(opcodeC(6) and opcodeC(5) and not opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--1100011
I_Opcode<=(not opcodeC(6) and not opcodeC(5) and opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--0010011
 --S_Opcode<=(not opcodeC(6) and opcodeC(5) and not opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--0100011
L_Opcode<=(not opcodeC(6) and not opcodeC(5) and not opcodeC(4) and not opcodeC(3) and not opcodeC(2) and opcodeC(1) and opcodeC(0));--0000011
 Sw_Opcode<=(opcodeC(6) and opcodeC(5) and opcodeC(4) and opcodeC(3) and opcodeC(2) and opcodeC(1) and opcodeC(0));--1111111
 
-------------circuito de arranque---------------------

  --------------------------------------------------------  
--DEntradaEstado1<= QSalidaEstado28 or QSalidaEstado32;
	DEntradaEstado2<= QSalidaEstado1;
	DEntradaEstado3<=QSalidaEstado2;
	DEntradaEstado4<=QSalidaEstado3;
	DEntradaEstado5<=QSalidaEstado4;
	DEntradaEstado6<=QSalidaEstado5;
	DEntradaEstado7<=QSalidaEstado6;
	DEntradaEstado8<=QSalidaEstado7;
	DEntradaEstado9<=QSalidaEstado8;
	DEntradaEstado10<=QSalidaEstado9;
   DEntradaEstado11<=QSalidaEstado10;
   DEntradaEstado12<=QSalidaEstado11;
   DEntradaEstado13<=QSalidaEstado12;
	DEntradaEstado14<=QSalidaEstado13;
   DEntradaEstado15<=QSalidaEstado14;
   DEntradaEstado16<=QSalidaEstado15;
   DEntradaEstado17<=QSalidaEstado16;
   DEntradaEstado18<=QSalidaEstado17;
   DEntradaEstado19<=QSalidaEstado18;
   DEntradaEstado20<=QSalidaEstado19;
   DEntradaEstado21<=QSalidaEstado20;
   DEntradaEstado22<=QSalidaEstado21;
	DEntradaEstado23<=QSalidaEstado22;
   DEntradaEstado24<=QSalidaEstado23;
   DEntradaEstado25<=QSalidaEstado24;
   DEntradaEstado26<=QSalidaEstado25;
	DEntradaEstado27<=QSalidaEstado26;
   DEntradaEstado28<=QSalidaEstado27;

		      ----------------
				---B Execution--
				----------------
   DEntradaEstado29<=(QSalidaEstado28 AND B_Opcode) or (QSalidaEstado44 AND B_Opcode) or (QSalidaEstado60 AND B_Opcode);
   DEntradaEstado30<=QSalidaEstado29;
   DEntradaEstado31<=QSalidaEstado30;
   DEntradaEstado32<=QSalidaEstado31;
   DEntradaEstado33<=QSalidaEstado32;
   DEntradaEstado34<=QSalidaEstado33;
   DEntradaEstado35<=QSalidaEstado34;
   DEntradaEstado36<=QSalidaEstado35;
   DEntradaEstado37<=QSalidaEstado36;
   DEntradaEstado38<=QSalidaEstado37;
   DEntradaEstado39<=QSalidaEstado38;
   DEntradaEstado40<=QSalidaEstado39;
   DEntradaEstado41<=QSalidaEstado40;
   DEntradaEstado42<=QSalidaEstado41;
   DEntradaEstado43<=QSalidaEstado42;
   DEntradaEstado44<=QSalidaEstado43;
	         ----------------
				---L Execution--
				----------------
	DEntradaEstado45<=(QSalidaEstado28 AND L_Opcode) or (QSalidaEstado44 AND L_Opcode) or (QSalidaEstado60 AND L_Opcode) or (QSalidaEstado76 AND L_Opcode) or (QSalidaEstado92 AND L_Opcode)  or (QSalidaEstado108 AND L_Opcode);
   DEntradaEstado46<=QSalidaEstado45;
   DEntradaEstado47<=QSalidaEstado46;
   DEntradaEstado48<=QSalidaEstado47;
   DEntradaEstado49<=QSalidaEstado48;
   DEntradaEstado50<=QSalidaEstado49;
   DEntradaEstado51<=QSalidaEstado50;
   DEntradaEstado52<=QSalidaEstado51;
   DEntradaEstado53<=QSalidaEstado52;
   DEntradaEstado54<=QSalidaEstado53;	
   DEntradaEstado55<=QSalidaEstado54;
   DEntradaEstado56<=QSalidaEstado55;
   DEntradaEstado57<=QSalidaEstado56;
   DEntradaEstado58<=QSalidaEstado57;
   DEntradaEstado59<=QSalidaEstado58;
   DEntradaEstado60<=QSalidaEstado59;

   		   ----------------
				---R Execution--
				----------------
            DEntradaEstado61<=(QSalidaEstado28 AND R_Opcode) or (QSalidaEstado44 AND R_Opcode) or (QSalidaEstado60 AND R_Opcode) or (QSalidaEstado76 AND R_Opcode) or (QSalidaEstado92 AND R_Opcode);
            DEntradaEstado62<=QSalidaEstado61;
            DEntradaEstado63<=QSalidaEstado62;
            DEntradaEstado64<=QSalidaEstado63;
            DEntradaEstado65<=QSalidaEstado64;
            DEntradaEstado66<=QSalidaEstado65;
            DEntradaEstado67<=QSalidaEstado66;
            DEntradaEstado68<=QSalidaEstado67;
            DEntradaEstado69<=QSalidaEstado68;
            DEntradaEstado70<=QSalidaEstado69;
            DEntradaEstado71<=QSalidaEstado70;
            DEntradaEstado72<=QSalidaEstado71;
            DEntradaEstado73<=QSalidaEstado72;
            DEntradaEstado74<=QSalidaEstado73;
            DEntradaEstado75<=QSalidaEstado74;
            DEntradaEstado76<=QSalidaEstado75;

            ----------------
				---I Execution--
				----------------

            DEntradaEstado77<=(QSalidaEstado28 AND I_Opcode) or (QSalidaEstado44 AND I_Opcode) or (QSalidaEstado60 AND I_Opcode) or (QSalidaEstado76 AND I_Opcode) or (QSalidaEstado92 AND I_Opcode) or (QSalidaEstado108 AND I_Opcode);
            DEntradaEstado78<=QSalidaEstado77;
            DEntradaEstado79<=QSalidaEstado78;
            DEntradaEstado80<=QSalidaEstado79;
            DEntradaEstado81<=QSalidaEstado80;
            DEntradaEstado82<=QSalidaEstado81;
            DEntradaEstado83<=QSalidaEstado82;
            DEntradaEstado84<=QSalidaEstado83;
            DEntradaEstado85<=QSalidaEstado84;
            DEntradaEstado86<=QSalidaEstado85;
            DEntradaEstado87<=QSalidaEstado86;
            DEntradaEstado88<=QSalidaEstado87;
            DEntradaEstado89<=QSalidaEstado88;
            DEntradaEstado90<=QSalidaEstado89;
            DEntradaEstado91<=QSalidaEstado90;
            DEntradaEstado92<=QSalidaEstado91;
            ----------------
				---SW Execution--
				----------------

            DEntradaEstado93<=(QSalidaEstado28 AND SW_Opcode) or (QSalidaEstado44 AND SW_Opcode) or (QSalidaEstado60 AND SW_Opcode) or (QSalidaEstado76 AND SW_Opcode) or (QSalidaEstado92 AND SW_Opcode)  or (QSalidaEstado108 AND SW_Opcode);
            DEntradaEstado94<=QSalidaEstado93;
            DEntradaEstado95<=QSalidaEstado94;
            DEntradaEstado96<=QSalidaEstado95;
            DEntradaEstado97<=QSalidaEstado96;
            DEntradaEstado98<=QSalidaEstado97;
            DEntradaEstado99<=QSalidaEstado98;
            DEntradaEstado100<=QSalidaEstado99;
            DEntradaEstado101<=QSalidaEstado100;
            DEntradaEstado102<=QSalidaEstado101;
            DEntradaEstado103<=QSalidaEstado102;
            DEntradaEstado104<=QSalidaEstado103;
            DEntradaEstado105<=QSalidaEstado104;
            DEntradaEstado106<=QSalidaEstado105;
            DEntradaEstado107<=QSalidaEstado106;
            DEntradaEstado108<=QSalidaEstado107;
 
	
-------------------------------------------------
------------lABEL OUTPUT ONE-HOT MACHINE---------
------------------------------------------------- 
-------------------------------------------------
 -----------------FETCH--------------------------
 ------------------------------------------------

  Enable_PC_wire0          <=  QSalidaEstado1;
  Enable_PC_wire1          <=  QSalidaEstado2;
  Exce_Sum_con_wire0       <=  QSalidaEstado3;
  Exce_Sum_con_wire1       <=  QSalidaEstado4;
  Exce_Sum_con_wire2       <=  QSalidaEstado5;
  Exce_Sum_con_wire3       <=  QSalidaEstado6;
  Enable_sumcon_wire0      <=  QSalidaEstado5;
  Enable_sumcon_wire1      <=  QSalidaEstado6;
  Enable_DireccionCP_wire0 <=  QsalidaEstado7;
  Enable_DireccionCP_wire1 <=  QSalidaEstado8;
  Read_ROM_wire0           <=  QSalidaEstado9;
  Read_ROM_wire1           <=  QSalidaEstado10;
  Read_ROM_wire2           <=  QSalidaEstadO11;
  Read_ROM_wire3           <=  QSalidaEstado12;
  EnableInst_Reg_wire0     <=  QSalidaEstado11;
  EnableInst_Reg_wire1     <=  QSalidaEstado12;
  -------------------------------------------------
  -----------------FETCH+DECODE--------------------
    -----------------------------------------------
  Enable_PC_wire2          <=  QSalidaEstado13;
  Enable_PC_wire3          <=  QSalidaEstado14;
  Exce_Sum_con_wire4       <=  QSalidaEstado15;
  Exce_Sum_con_wire5       <=  QSalidaEstado16;
  Exce_Sum_con_wire6       <=  QSalidaEstado17;
  Exce_Sum_con_wire7       <=  QSalidaEstado18;
  Enable_sumcon_wire2      <=  QSalidaEstado17;
  Enable_sumcon_wire3      <=  QSalidaEstado18;
  Enable_DireccionCP_wire2 <=  QsalidaEstado19;
  Enable_DireccionCP_wire3 <=  QSalidaEstado20;
  Read_ROM_wire4           <=  QSalidaEstado21;
  Read_ROM_wire5           <=  QSalidaEstado22;
  Read_ROM_wire6           <=  QSalidaEstado23;
  Read_ROM_wire7           <=  QSalidaEstado24;
  EnableInst_Reg_wire2     <=  QSalidaEstado23;
  EnableInst_Reg_wire3     <=  QSalidaEstado24;
  EnableiMux_Reg_wire0 <=QSalidaEstado13;---------------------D
  EnableiMux_Reg_wire1 <=QSalidaEstado14;
  -----------------------------------------
  EnableInst_Reg_2_wire0 <=QSalidaEstado13;---------------------D
  EnableInst_Reg_2_wire1 <=QSalidaEstado14;
  -----------------------------------------
  Read_rs1_wire0       <= QSalidaEstado13;
  Read_rs1_wire1       <= QSalidaEstado14;
  Read_rs1_wire2       <= QSalidaEstado15;
  Read_rs1_wire3       <= QSalidaEstado16;
  Read_rs1_wire4       <= QSalidaEstado17;
  Read_rs1_wire5       <= QSalidaEstado18;
  Read_rs1_wire6       <= QSalidaEstado19;
  Read_rs1_wire7       <= QSalidaEstado20;
  EnableBR_OUT1_wire0  <=QSalidaEstado19;
  EnableBR_OUT1_wire1  <=QSalidaEstado20;
  Read_rs2_wire0       <=QSalidaEstado21;
  Read_rs2_wire1       <=QSalidaEstado22;
  Read_rs2_wire2       <=QSalidaEstado23;
  Read_rs2_wire3       <=QSalidaEstado24;
  Read_rs2_wire4       <=QSalidaEstado25;
  Read_rs2_wire5       <=QSalidaEstado26;
  Read_rs2_wire6       <=QSalidaEstado27;
  Read_rs2_wire7       <=QSalidaEstado28;
  EnableBR_OUT2_wire0  <=QSalidaEstado27;
  EnableBR_OUT2_wire1  <=QSalidaEstado28;
				----------------
				---B Execution--
				----------------
            Enable_PC_wire4          <=  QSalidaEstado29;--------F
            Enable_PC_wire5          <=  QSalidaEstado30;
            Exce_Sum_con_wire8       <=  QSalidaEstado31;
            Exce_Sum_con_wire9       <=  QSalidaEstado32;
            Exce_Sum_con_wire10       <=  QSalidaEstado33;
            Exce_Sum_con_wire11       <=  QSalidaEstado34;
            Enable_sumcon_wire4      <=  QSalidaEstado33;
            Enable_sumcon_wire5      <=  QSalidaEstado34;
            Enable_DireccionCP_wire4 <=  QsalidaEstado35;
            Enable_DireccionCP_wire5 <=  QSalidaEstado36;
            Read_ROM_wire8           <=  QSalidaEstado37;
            Read_ROM_wire9           <=  QSalidaEstado38;
            Read_ROM_wire10           <=  QSalidaEstado39;
            Read_ROM_wire11           <=  QSalidaEstado40;
            EnableInst_Reg_wire4     <=  QSalidaEstado39;
            EnableInst_Reg_wire5     <=  QSalidaEstado40;
            EnableiMux_Reg_wire2 <=QSalidaEstado29;---------------------D
            EnableiMux_Reg_wire3 <=QSalidaEstado30;
              -----------------------------------------
                EnableInst_Reg_2_wire2 <=QSalidaEstado29;---------------------D
                EnableInst_Reg_2_wire3 <=QSalidaEstado30;
                      -----------------------------------------
            Read_rs1_wire8       <= QSalidaEstado29;
            Read_rs1_wire9       <= QSalidaEstado30;
            Read_rs1_wire10       <= QSalidaEstado31;
            Read_rs1_wire11      <= QSalidaEstado32;
            Read_rs1_wire12       <= QSalidaEstado33;
            Read_rs1_wire13       <= QSalidaEstado34;
            Read_rs1_wire14       <= QSalidaEstado35;
            Read_rs1_wire15       <= QSalidaEstado36;
            EnableBR_OUT1_wire2  <=QSalidaEstado35;
            EnableBR_OUT1_wire3  <=QSalidaEstado36;
            Read_rs2_wire8       <=QSalidaEstado37;
            Read_rs2_wire9       <=QSalidaEstado38;
            Read_rs2_wire10       <=QSalidaEstado39;
            Read_rs2_wire11       <=QSalidaEstado40;
            Read_rs2_wire12       <=QSalidaEstado41;
            Read_rs2_wire13       <=QSalidaEstado42;
            Read_rs2_wire14       <=QSalidaEstado43;
            Read_rs2_wire15       <=QSalidaEstado44;
            EnableBR_OUT2_wire2  <=QSalidaEstado43;
            EnableBR_OUT2_wire3  <=QSalidaEstado44;
  Exce_ALU_wire0		  <= QSalidaEstado29;
  Exce_ALU_wire1       <= QSalidaEstado30;
  Exce_ALU_wire2       <= QSalidaEstado31;
  Exce_ALU_wire3       <= QSalidaEstado32;
  Exce_ALU_wire4       <= QSalidaEstado33;
  Exce_ALU_wire5       <= QSalidaEstado34;
  Exce_ALU_wire6       <= QSalidaEstado35;
  iRMux_wire0          <= QSalidaEstado29;
  iRMux_wire1          <= QSalidaEstado30;
  iRMux_wire2          <= QSalidaEstado31;
  iRMux_wire3          <= QSalidaEstado32;
  iRMux_wire4          <= QSalidaEstado33;
  iRMux_wire5          <= QSalidaEstado34;
  iRMux_wire6          <= QSalidaEstado35;
  Enable_ALU_OUT_wire0  <= QSalidaEstado32;
  Enable_ALU_OUT_wire1  <= QSalidaEstado33;
  Enable_ALU_OUT_wire2  <= QSalidaEstado34;
  Enable_ALU_OUT_wire3  <= QSalidaEstado35;
  Branch_AND_wire0     <= QSalidaEstado32;
  Branch_AND_wire1     <= QSalidaEstado33;
  Branch_AND_wire2     <= QSalidaEstado34;
  Branch_AND_wire3     <= QSalidaEstado35;
  Exce_Sum_con_wire12     <= QSalidaEstado36;
  Exce_Sum_con_wire13     <= QSalidaEstado37;
  Exce_Sum_con_wire14     <= QSalidaEstado38;
  Exce_Sum_con_wire15     <= QSalidaEstado39;
  Enable_sumcon_wire6      <=  QSalidaEstado38;
  Enable_sumcon_wire7      <=  QSalidaEstado39;
  Enable_PC_wire12     <=  QSalidaEstado38;
  Enable_PC_wire13     <= QSalidaEstado39;
  Enable_DireccionCP_wire6<=QsalidaEstado40;
  Enable_DireccionCP_wire7<=QSalidaEstado41;
				----------------
				---L Execution--
				----------------
            Enable_PC_wire6          <=  QSalidaEstado45;--------------F
            Enable_PC_wire7          <=  QSalidaEstado46;
            Exce_Sum_con_wire16       <=  QSalidaEstado47;
            Exce_Sum_con_wire17       <=  QSalidaEstado48;
            Exce_Sum_con_wire18       <=  QSalidaEstado49;
            Exce_Sum_con_wire19       <=  QSalidaEstado50;
            Enable_sumcon_wire8      <=  QSalidaEstado49;
            Enable_sumcon_wire9      <=  QSalidaEstado50;
            Enable_DireccionCP_wire8 <=  QsalidaEstado51;
            Enable_DireccionCP_wire9 <=  QSalidaEstado52;
            Read_ROM_wire12           <=  QSalidaEstado53;
            Read_ROM_wire13           <=  QSalidaEstado54;
            Read_ROM_wire14           <=  QSalidaEstado55;
            Read_ROM_wire15           <=  QSalidaEstado56;
            EnableInst_Reg_wire6    <=  QSalidaEstado55;
            EnableInst_Reg_wire7     <=  QSalidaEstado56;
            EnableiMux_Reg_wire4 <=QSalidaEstado45;---------------------D
            EnableiMux_Reg_wire5 <=QSalidaEstado46;

        -----------------------------------------
  EnableInst_Reg_2_wire4 <=QSalidaEstado45;---------------------D
  EnableInst_Reg_2_wire5 <=QSalidaEstado46;
  -----------------------------------------

            Read_rs1_wire16       <= QSalidaEstado45;
            Read_rs1_wire17       <= QSalidaEstado46;
            Read_rs1_wire18       <= QSalidaEstado47;
            Read_rs1_wire19       <= QSalidaEstado48;
            Read_rs1_wire20       <= QSalidaEstado49;
            Read_rs1_wire21       <= QSalidaEstado50;
            Read_rs1_wire22       <= QSalidaEstado51;
            Read_rs1_wire23       <= QSalidaEstado52;
            EnableBR_OUT1_wire4  <=QSalidaEstado51;
            EnableBR_OUT1_wire5  <=QSalidaEstado52;
            Read_rs2_wire16       <=QSalidaEstado53;
            Read_rs2_wire17       <=QSalidaEstado54;
            Read_rs2_wire18       <=QSalidaEstado55;
            Read_rs2_wire19       <=QSalidaEstado56;
            Read_rs2_wire20       <=QSalidaEstado57;
            Read_rs2_wire21       <=QSalidaEstado58;
            Read_rs2_wire22       <=QSalidaEstado59;
            Read_rs2_wire23       <=QSalidaEstado60;
            EnableBR_OUT2_wire4  <=QSalidaEstado59;
            EnableBR_OUT2_wire5  <=QSalidaEstado60;
  Exce_ALU_wire7		  <= QSalidaEstado45;------------------E
  Exce_ALU_wire8       <= QSalidaEstado46;
  Exce_ALU_wire9       <= QSalidaEstado47;
  Exce_ALU_wire10       <= QSalidaEstado48;
  Exce_ALU_wire11       <= QSalidaEstado49;
  Exce_ALU_wire12       <= QSalidaEstado50;
  Exce_ALU_wire13       <= QSalidaEstado51;
  Enable_ALU_OUT_wire4  <= QSalidaEstado48;
  Enable_ALU_OUT_wire5  <= QSalidaEstado49;
  Enable_ALU_OUT_wire6  <= QSalidaEstado50;
  Enable_ALU_OUT_wire7  <= QSalidaEstado51;
  Read_MD_wire0         <= QSalidaEstado52;         
  Read_MD_wire1         <= QSalidaEstado53;  
  Read_MD_wire2         <= QSalidaEstado54;
  Read_MD_wire3         <= QSalidaEstado55;
  Enable_Data_Reg_wire0 <= QSalidaEstado54;
  Enable_Data_Reg_wire1 <= QSalidaEstado55;
  WriteBR_wire0         <= QSalidaEstado56;
  WriteBR_wire1         <= QSalidaEstado57;
  amMux_wire0           <= QSalidaEstado56;
  amMux_wire1           <= QSalidaEstado57;

				----------------
				---R Execution--
				----------------
            Enable_PC_wire8           <=  QSalidaEstado61;----------F
            Enable_PC_wire9           <=  QSalidaEstado62;
            Exce_Sum_con_wire20       <=  QSalidaEstado63;
            Exce_Sum_con_wire21       <=  QSalidaEstado64;
            Exce_Sum_con_wire22       <=  QSalidaEstado65;
            Exce_Sum_con_wire23       <=  QSalidaEstado66;
            Enable_sumcon_wire10       <=  QSalidaEstado65;
            Enable_sumcon_wire11       <=  QSalidaEstado66;
            Enable_DireccionCP_wire10  <=  QsalidaEstado67;
            Enable_DireccionCP_wire11  <=  QSalidaEstado68;
            Read_ROM_wire16            <=  QSalidaEstado69;
            Read_ROM_wire17            <=  QSalidaEstado70;
            Read_ROM_wire18           <=  QSalidaEstado71;
            Read_ROM_wire19           <=  QSalidaEstado72;
            EnableInst_Reg_wire8      <=  QSalidaEstado71;
            EnableInst_Reg_wire9      <=  QSalidaEstado72;
            EnableiMux_Reg_wire6 <=QSalidaEstado61;---------------------D
            EnableiMux_Reg_wire7 <=QSalidaEstado62;

              -----------------------------------------
  EnableInst_Reg_2_wire6 <=QSalidaEstado61;---------------------D
  EnableInst_Reg_2_wire7 <=QSalidaEstado62;
  -----------------------------------------
            Read_rs1_wire24            <= QSalidaEstado61;
            Read_rs1_wire25            <= QSalidaEstado62;
            Read_rs1_wire26       <= QSalidaEstado63;
            Read_rs1_wire27      <= QSalidaEstado64;
            Read_rs1_wire28       <= QSalidaEstado65;
            Read_rs1_wire29       <= QSalidaEstado66;
            Read_rs1_wire30       <= QSalidaEstado67;
            Read_rs1_wire31       <= QSalidaEstado68;
            EnableBR_OUT1_wire6  <=QSalidaEstado67;
            EnableBR_OUT1_wire7  <=QSalidaEstado68;
            Read_rs2_wire24       <=QSalidaEstado69;
            Read_rs2_wire25       <=QSalidaEstado70;
            Read_rs2_wire26       <=QSalidaEstado71;
            Read_rs2_wire27       <=QSalidaEstado72;
            Read_rs2_wire28       <=QSalidaEstado73;
            Read_rs2_wire29       <=QSalidaEstado74;
            Read_rs2_wire30       <=QSalidaEstado75;
            Read_rs2_wire31       <=QSalidaEstado76;
            EnableBR_OUT2_wire6  <=QSalidaEstado75;
            EnableBR_OUT2_wire7  <=QSalidaEstado76;
  Exce_ALU_wire14		  <= QSalidaEstado61;---------------E
  Exce_ALU_wire15       <= QSalidaEstado62;
  Exce_ALU_wire16       <= QSalidaEstado63;
  Exce_ALU_wire17       <= QSalidaEstado64;
  Exce_ALU_wire18       <= QSalidaEstado65;
  Exce_ALU_wire19       <= QSalidaEstado66;
  Exce_ALU_wire20       <= QSalidaEstado67;
  iRMux_wire7          <= QSalidaEstado61;
  iRMux_wire8          <= QSalidaEstado62;
  iRMux_wire9          <= QSalidaEstado63;
  iRMux_wire10          <= QSalidaEstado64;
  iRMux_wire11          <= QSalidaEstado65;
  iRMux_wire12          <= QSalidaEstado66;
  iRMux_wire13          <= QSalidaEstado67;
  Enable_ALU_OUT_wire8  <= QSalidaEstado64;
  Enable_ALU_OUT_wire9  <= QSalidaEstado65;
  Enable_ALU_OUT_wire10  <= QSalidaEstado66;
  Enable_ALU_OUT_wire11  <= QSalidaEstado67;
  WriteBR_wire2         <= QSalidaEstado68;
  WriteBR_wire3         <= QSalidaEstado69;

  				----------------
				---I Execution--
				----------------
            Enable_PC_wire10           <=  QSalidaEstado77;----------F
            Enable_PC_wire11           <=  QSalidaEstado78;
            Exce_Sum_con_wire24       <=  QSalidaEstado79;
            Exce_Sum_con_wire25       <=  QSalidaEstado80;
            Exce_Sum_con_wire26       <=  QSalidaEstado81;
            Exce_Sum_con_wire27       <=  QSalidaEstado82;
            Enable_sumcon_wire12       <=  QSalidaEstado81;
            Enable_sumcon_wire13       <=  QSalidaEstado82;
            Enable_DireccionCP_wire12  <=  QsalidaEstado83;
            Enable_DireccionCP_wire13  <=  QSalidaEstado84;
            Read_ROM_wire20            <=  QSalidaEstado85;
            Read_ROM_wire21            <=  QSalidaEstado86;
            Read_ROM_wire22           <=  QSalidaEstado87;
            Read_ROM_wire23           <=  QSalidaEstado88;
            EnableInst_Reg_wire10      <=  QSalidaEstado87;
            EnableInst_Reg_wire11      <=  QSalidaEstado88;
            EnableiMux_Reg_wire8 <=QSalidaEstado77;---------------------D
            EnableiMux_Reg_wire9 <=QSalidaEstado78;

  -----------------------------------------
  EnableInst_Reg_2_wire8 <=QSalidaEstado77;---------------------D
  EnableInst_Reg_2_wire9 <=QSalidaEstado78;
  -----------------------------------------

            Read_rs1_wire32            <= QSalidaEstado77;
            Read_rs1_wire33            <= QSalidaEstado78;
            Read_rs1_wire34       <= QSalidaEstado79;
            Read_rs1_wire35      <= QSalidaEstado80;
            Read_rs1_wire36       <= QSalidaEstado81;
            Read_rs1_wire37       <= QSalidaEstado82;
            Read_rs1_wire38       <= QSalidaEstado83;
            Read_rs1_wire39       <= QSalidaEstado84;
            EnableBR_OUT1_wire8  <=QSalidaEstado83;
            EnableBR_OUT1_wire9  <=QSalidaEstado84;
            Read_rs2_wire32       <=QSalidaEstado85;
            Read_rs2_wire33       <=QSalidaEstado86;
            Read_rs2_wire34       <=QSalidaEstado87;
            Read_rs2_wire35       <=QSalidaEstado88;
            Read_rs2_wire36       <=QSalidaEstado89;
            Read_rs2_wire37       <=QSalidaEstado90;
            Read_rs2_wire38       <=QSalidaEstado91;
            Read_rs2_wire39       <=QSalidaEstado92;
            EnableBR_OUT2_wire8  <=QSalidaEstado91;
            EnableBR_OUT2_wire9  <=QSalidaEstado92;
  Exce_ALU_wire21		  <= QSalidaEstado77;---------------E
  Exce_ALU_wire22       <= QSalidaEstado78;
  Exce_ALU_wire23       <= QSalidaEstado79;
  Exce_ALU_wire24       <= QSalidaEstado80;
  Exce_ALU_wire25       <= QSalidaEstado81;
  Exce_ALU_wire26       <= QSalidaEstado82;
  Exce_ALU_wire27       <= QSalidaEstado83;
  Enable_ALU_OUT_wire12  <= QSalidaEstado80;
  Enable_ALU_OUT_wire13  <= QSalidaEstado81;
  Enable_ALU_OUT_wire14  <= QSalidaEstado82;
  Enable_ALU_OUT_wire15  <= QSalidaEstado83;
  WriteBR_wire4         <= QSalidaEstado84;
  WriteBR_wire5         <= QSalidaEstado85;
  

    		   ----------------
				---SW Execution--
				----------------
            Enable_PC_wire14           <=  QSalidaEstado93;----------F
            Enable_PC_wire15           <=  QSalidaEstado94;
            Exce_Sum_con_wire28        <=  QSalidaEstado95;
            Exce_Sum_con_wire29        <=  QSalidaEstado96;
            Exce_Sum_con_wire30        <=  QSalidaEstado97;
            Exce_Sum_con_wire31        <=  QSalidaEstado98;
            Enable_sumcon_wire14       <=  QSalidaEstado97;
            Enable_sumcon_wire15       <=  QSalidaEstado98;
            Enable_DireccionCP_wire14  <=  QsalidaEstado99;
            Enable_DireccionCP_wire15  <=  QSalidaEstado100;
            Read_ROM_wire24            <=  QSalidaEstado101;
            Read_ROM_wire25            <=  QSalidaEstado102;
            Read_ROM_wire26            <=  QSalidaEstado103;
            Read_ROM_wire27            <=  QSalidaEstado104;
            EnableInst_Reg_wire12      <=  QSalidaEstado103;
            EnableInst_Reg_wire13      <=  QSalidaEstado104;
            EnableiMux_Reg_wire10       <=QSalidaEstado93;---------------------D
            EnableiMux_Reg_wire11       <=QSalidaEstado94;

  -----------------------------------------
  EnableInst_Reg_2_wire10 <=QSalidaEstado93;---------------------D
  EnableInst_Reg_2_wire11 <=QSalidaEstado94;
  -----------------------------------------

            Read_rs1_wire40            <= QSalidaEstado93;
            Read_rs1_wire41            <= QSalidaEstado94;
            Read_rs1_wire42            <= QSalidaEstado95;
            Read_rs1_wire43            <= QSalidaEstado96;
            Read_rs1_wire44            <= QSalidaEstado97;
            Read_rs1_wire45            <= QSalidaEstado98;
            Read_rs1_wire46            <= QSalidaEstado99;
            Read_rs1_wire47            <= QSalidaEstado100;
            EnableBR_OUT1_wire10        <=QSalidaEstado99;
            EnableBR_OUT1_wire11        <=QSalidaEstado100;
            Read_rs2_wire40            <=QSalidaEstado101;
            Read_rs2_wire41            <=QSalidaEstado102;
            Read_rs2_wire42            <=QSalidaEstado103;
            Read_rs2_wire43            <=QSalidaEstado104;
            Read_rs2_wire44           <=QSalidaEstado105;
            Read_rs2_wire45           <=QSalidaEstado106;
            Read_rs2_wire46       <=QSalidaEstado107;
            Read_rs2_wire47       <=QSalidaEstado108;
            EnableBR_OUT2_wire10  <=QSalidaEstado107;
            EnableBR_OUT2_wire11  <=QSalidaEstado108;
  Exce_ALU_wire28		    <= QSalidaEstado93;---------------E
  Exce_ALU_wire29        <= QSalidaEstado94;
  Exce_ALU_wire30        <= QSalidaEstado95;
  Exce_ALU_wire31        <= QSalidaEstado96;
  Exce_ALU_wire32        <= QSalidaEstado97;
  Exce_ALU_wire33        <= QSalidaEstado98;
  Exce_ALU_wire34        <= QSalidaEstado99;
  Enable_ALU_OUT_wire16  <= QSalidaEstado96;
  Enable_ALU_OUT_wire17  <= QSalidaEstado97;
  Enable_ALU_OUT_wire18  <= QSalidaEstado98;
  Enable_ALU_OUT_wire19  <= QSalidaEstado99;
  Write_MD_wire0         <= QSalidaEstado100;
  Write_MD_wire1         <= QSalidaEstado101;
  Write_MD_wire2         <= QSalidaEstado102;
  Write_MD_wire3         <= QSalidaEstado103;
  Write_MD_wire4         <= QSalidaEstado104;
  Write_MD_wire5         <= QSalidaEstado105;
  Select_Data_Mux_wire0         <= QSalidaEstado100;
  Select_Data_Mux_wire1         <= QSalidaEstado101;
  Select_Data_Mux_wire2         <= QSalidaEstado102;
  Select_Data_Mux_wire3         <= QSalidaEstado103;
  Select_Data_Mux_wire4         <= QSalidaEstado104;
  Select_Data_Mux_wire5         <= QSalidaEstado105;
  
  	
 process(clk,clear)
 
 begin
  if(clear='1' and rising_edge(clk))then
      QSalidaEstado1<='1';
      QSalidaEstado2<='0';
      QSalidaEstado3<='0';
      QSalidaEstado4<='0';
      QSalidaEstado5<='0';
      QSalidaEstado6<='0';
      QSalidaEstado7<='0';
      QSalidaEstado8<='0';
      QSalidaEstado9<='0';
      QSalidaEstado10<='0';
      QSalidaEstado11<='0';
      QSalidaEstado12<='0';
      QSalidaEstado13<='0';
      QSalidaEstado14<='0';
      QSalidaEstado15<='0';
      QSalidaEstado16<='0';
      QSalidaEstado17<='0';
      QSalidaEstado18<='0';
      QSalidaEstado19<='0';
      QSalidaEstado20<='0';
      QSalidaEstado21<='0';
      QSalidaEstado22<='0';
		QSalidaEstado23<='0';
      QSalidaEstado24<='0';
      QSalidaEstado25<='0';
      QSalidaEstado26<='0';
      QSalidaEstado27<='0';
      QSalidaEstado28<='0';
      QSalidaEstado29<='0';
      QSalidaEstado30<='0';
      QSalidaEstado31<='0';
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
  QSalidaEstado69<='0'; 
  QSalidaEstado70<='0';
 QSalidaEstado71<='0';
 QSalidaEstado72<='0';
 QSalidaEstado73<='0';
QSalidaEstado74<='0';
QSalidaEstado75<='0';
QSalidaEstado76<='0';
QSalidaEstado77<='0';
QSalidaEstado78<='0';
QSalidaEstado79<='0';
QSalidaEstado80<='0';
QSalidaEstado81<='0';
QSalidaEstado82<='0';
QSalidaEstado83<='0';
QSalidaEstado84<='0';
QSalidaEstado85<='0';
QSalidaEstado86<='0';
QSalidaEstado87<='0';
QSalidaEstado88<='0';
QSalidaEstado89<='0';
QSalidaEstado90<='0';
QSalidaEstado91<='0';
QSalidaEstado92<='0';
QSalidaEstado93<='0';
QSalidaEstado94<='0';
QSalidaEstado95<='0';
QSalidaEstado96<='0';
QSalidaEstado97<='0';
QSalidaEstado98<='0';
QSalidaEstado99<='0';
QSalidaEstado100<='0';
QSalidaEstado101<='0';
QSalidaEstado102<='0';
QSalidaEstado103<='0';
QSalidaEstado104<='0';
QSalidaEstado105<='0';
QSalidaEstado106<='0';
QSalidaEstado107<='0';
QSalidaEstado108<='0';
	
	
 ELSE if(rising_edge(clk))then--Estado0--

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
  QSalidaEstado39<=DEntradaEstado39; 
  QSalidaEstado40<=DEntradaEstado40;
  QSalidaEstado41<=DEntradaEstado41;
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
  QSalidaEstado69<=DEntradaEstado69;
  QSalidaEstado70<=DEntradaEstado70;
  QSalidaEstado71<=DEntradaEstado71;
  QSalidaEstado72<=DEntradaEstado72;
  QSalidaEstado73<=DEntradaEstado73;
  QSalidaEstado74<=DEntradaEstado74;
  QSalidaEstado75<=DEntradaEstado75;
  QSalidaEstado76<=DEntradaEstado76;
  QSalidaEstado77<=DEntradaEstado77;
  QSalidaEstado78<=DEntradaEstado78;
  QSalidaEstado79<=DEntradaEstado79;
  QSalidaEstado80<=DEntradaEstado80;
  QSalidaEstado81<=DEntradaEstado81;
  QSalidaEstado82<=DEntradaEstado82;
  QSalidaEstado83<=DEntradaEstado83;
  QSalidaEstado84<=DEntradaEstado84;
  QSalidaEstado85<=DEntradaEstado85;
  QSalidaEstado86<=DEntradaEstado86;
  QSalidaEstado87<=DEntradaEstado87;
  QSalidaEstado88<=DEntradaEstado88;
  QSalidaEstado89<=DEntradaEstado89;
  QSalidaEstado90<=DEntradaEstado90;
  QSalidaEstado91<=DEntradaEstado91;
  QSalidaEstado92<=DEntradaEstado92;
  QSalidaEstado93<=DEntradaEstado93;
  QSalidaEstado94<=DEntradaEstado94;
  QSalidaEstado95<=DEntradaEstado95;
  QSalidaEstado96<=DEntradaEstado96;
  QSalidaEstado97<=DEntradaEstado97;
  QSalidaEstado98<=DEntradaEstado98;
  QSalidaEstado99<=DEntradaEstado99;
  QSalidaEstado100<=DEntradaEstado100;
  QSalidaEstado101<=DEntradaEstado101;
  QSalidaEstado102<=DEntradaEstado102;
  QSalidaEstado103<=DEntradaEstado103;
  QSalidaEstado104<=DEntradaEstado104;
  QSalidaEstado105<=DEntradaEstado105;
  QSalidaEstado106<=DEntradaEstado106;
  QSalidaEstado107<=DEntradaEstado107;
  QSalidaEstado108<=DEntradaEstado108;

  END IF ;
   END IF ;
  end process;
  ---------------------------------------------------------------------------------
  ------------------------SALIDA DE CONTROL----------------------------------------
  ---------------------------------------------------------------------------------
  Enable_PC           <=Enable_PC_wire0 or Enable_PC_wire1 or Enable_PC_wire2 or Enable_PC_wire3 or Enable_PC_wire4 or Enable_PC_wire5 or Enable_PC_wire6 or Enable_PC_wire7  or Enable_PC_wire8 or Enable_PC_wire9 or Enable_PC_wire10 or Enable_PC_wire11 or Enable_PC_wire12 or Enable_PC_wire13  or Enable_PC_wire14 or Enable_PC_wire15; 
  Exce_Sum_con        <=Exce_Sum_con_wire0 or Exce_Sum_con_wire1 or Exce_Sum_con_wire2 or Exce_Sum_con_wire3 or Exce_Sum_con_wire4 or Exce_Sum_con_wire5 or Exce_Sum_con_wire6 or Exce_Sum_con_wire7 or Exce_Sum_con_wire8 or Exce_Sum_con_wire9 or Exce_Sum_con_wire10 or Exce_Sum_con_wire11 or Exce_Sum_con_wire12 or Exce_Sum_con_wire13 or Exce_Sum_con_wire14 or Exce_Sum_con_wire15 or Exce_Sum_con_wire16 or Exce_Sum_con_wire17 or Exce_Sum_con_wire18 or Exce_Sum_con_wire19 or Exce_Sum_con_wire20 or Exce_Sum_con_wire21 or Exce_Sum_con_wire22 or Exce_Sum_con_wire23 or Exce_Sum_con_wire24 or Exce_Sum_con_wire25 or Exce_Sum_con_wire26 or Exce_Sum_con_wire27 or Exce_Sum_con_wire28 or Exce_Sum_con_wire29 or Exce_Sum_con_wire30 or Exce_Sum_con_wire31;
  Enable_sumcon       <=Enable_sumcon_wire0 or Enable_sumcon_wire1 or Enable_sumcon_wire2 or Enable_sumcon_wire3 or Enable_sumcon_wire4 or Enable_sumcon_wire5 or Enable_sumcon_wire6 or Enable_sumcon_wire7 or Enable_sumcon_wire8 or Enable_sumcon_wire9 or Enable_sumcon_wire10 or Enable_sumcon_wire11  or Enable_sumcon_wire12  or Enable_sumcon_wire13 or Enable_sumcon_wire14 or Enable_sumcon_wire15;
  Enable_DireccionCP  <= Enable_DireccionCP_wire0 or Enable_DireccionCP_wire1 or Enable_DireccionCP_wire2 or Enable_DireccionCP_wire3 or Enable_DireccionCP_wire4 or Enable_DireccionCP_wire5 or Enable_DireccionCP_wire6 or Enable_DireccionCP_wire7 or Enable_DireccionCP_wire8 or Enable_DireccionCP_wire9 or Enable_DireccionCP_wire10 or Enable_DireccionCP_wire11 or Enable_DireccionCP_wire12 or Enable_DireccionCP_wire13 or Enable_DireccionCP_wire14 or Enable_DireccionCP_wire15;
  Read_ROM            <=Read_ROM_wire0 or Read_ROM_wire1 or Read_ROM_wire2 or Read_ROM_wire3 OR Read_ROM_wire4 or Read_ROM_wire5 or Read_ROM_wire6 or Read_ROM_wire7 OR Read_ROM_wire8 or Read_ROM_wire9 or Read_ROM_wire10 or Read_ROM_wire11 or Read_ROM_wire12 OR Read_ROM_wire13 or Read_ROM_wire14 or Read_ROM_wire15 or Read_ROM_wire16 OR Read_ROM_wire17 or Read_ROM_wire18 or Read_ROM_wire19 or Read_ROM_wire20 or Read_ROM_wire21 or Read_ROM_wire22 or Read_ROM_wire23  or Read_ROM_wire24  or Read_ROM_wire25  or Read_ROM_wire26  or Read_ROM_wire27;
  EnableInst_Reg      <=EnableInst_Reg_wire0 or EnableInst_Reg_wire1 or EnableInst_Reg_wire2 or EnableInst_Reg_wire3 or EnableInst_Reg_wire4 or EnableInst_Reg_wire5  or EnableInst_Reg_wire6 or EnableInst_Reg_wire7 or EnableInst_Reg_wire8 or EnableInst_Reg_wire9 or EnableInst_Reg_wire10 or EnableInst_Reg_wire11  or EnableInst_Reg_wire12  or EnableInst_Reg_wire13;
  EnableiMux_Reg      <=EnableiMux_Reg_wire0 or EnableiMux_Reg_wire1 or EnableiMux_Reg_wire2 or EnableiMux_Reg_wire3 or EnableiMux_Reg_wire4 or EnableiMux_Reg_wire5 or EnableiMux_Reg_wire6 or EnableiMux_Reg_wire7 or EnableiMux_Reg_wire8 or EnableiMux_Reg_wire9 or EnableiMux_Reg_wire10 or EnableiMux_Reg_wire11;    
  EnableInst_Reg_2   <=EnableInst_Reg_2_wire0 or EnableInst_Reg_2_wire1 or EnableInst_Reg_2_wire2 or EnableInst_Reg_2_wire3 or EnableInst_Reg_2_wire4 or EnableInst_Reg_2_wire5 or EnableInst_Reg_2_wire6 or EnableInst_Reg_2_wire7 or  EnableInst_Reg_2_wire8 or EnableInst_Reg_2_wire9 or EnableInst_Reg_2_wire10 or EnableInst_Reg_2_wire11; 
  Read_rs1            <=Read_rs1_wire0 or Read_rs1_wire1 or Read_rs1_wire2 or Read_rs1_wire3 or Read_rs1_wire4 or Read_rs1_wire5 or Read_rs1_wire6 or Read_rs1_wire7 or Read_rs1_wire8 or Read_rs1_wire9 or Read_rs1_wire10 or Read_rs1_wire11 or Read_rs1_wire12 or Read_rs1_wire13 or Read_rs1_wire14 or Read_rs1_wire15 or Read_rs1_wire16 or Read_rs1_wire17 or Read_rs1_wire18 or Read_rs1_wire19 or Read_rs1_wire20 or Read_rs1_wire21 or Read_rs1_wire22 or Read_rs1_wire23 or Read_rs1_wire24 or Read_rs1_wire25 or Read_rs1_wire26 or Read_rs1_wire27 or Read_rs1_wire28 or Read_rs1_wire29 or Read_rs1_wire30 or Read_rs1_wire31 or Read_rs1_wire32 or Read_rs1_wire33 or Read_rs1_wire34 or Read_rs1_wire35 or Read_rs1_wire36 or Read_rs1_wire37 or Read_rs1_wire38 or Read_rs1_wire39  or Read_rs1_wire40  or Read_rs1_wire41  or Read_rs1_wire42  or Read_rs1_wire43  or Read_rs1_wire44  or Read_rs1_wire45 or Read_rs1_wire46  or Read_rs1_wire47;
  EnableBR_OUT1       <=EnableBR_OUT1_wire0 or EnableBR_OUT1_wire1 or EnableBR_OUT1_wire2 or EnableBR_OUT1_wire3 or EnableBR_OUT1_wire4 or EnableBR_OUT1_wire5 or EnableBR_OUT1_wire6 or EnableBR_OUT1_wire7 or EnableBR_OUT1_wire8 or EnableBR_OUT1_wire9 or EnableBR_OUT1_wire10 or EnableBR_OUT1_wire11;
  Read_rs2            <=Read_rs2_wire0 or Read_rs2_wire1 or Read_rs2_wire2 or Read_rs2_wire3 or Read_rs2_wire4 or Read_rs2_wire5 or Read_rs2_wire6 or Read_rs2_wire7 or Read_rs2_wire8 or Read_rs2_wire9 or Read_rs2_wire10 or Read_rs2_wire11 or Read_rs2_wire12 or Read_rs2_wire13 or Read_rs2_wire14 or Read_rs2_wire15 or Read_rs2_wire16 or Read_rs2_wire17 or Read_rs2_wire18 or Read_rs2_wire19 or Read_rs2_wire20 or Read_rs2_wire21 or Read_rs2_wire22 or Read_rs2_wire23 or Read_rs2_wire24 or Read_rs2_wire25 or Read_rs2_wire26 or Read_rs2_wire27 or Read_rs2_wire28 or Read_rs2_wire29 or Read_rs2_wire30 or Read_rs2_wire31 or Read_rs2_wire32 or Read_rs2_wire33 or Read_rs2_wire34 or Read_rs2_wire35 or Read_rs2_wire36 or Read_rs2_wire37 or Read_rs2_wire38 or Read_rs2_wire39 or Read_rs2_wire40 or Read_rs2_wire41 or Read_rs2_wire42 or Read_rs2_wire43 or Read_rs2_wire44 or Read_rs2_wire45 or Read_rs2_wire46 or Read_rs2_wire47;
  EnableBR_OUT2       <=EnableBR_OUT2_wire0 or EnableBR_OUT2_wire1 or EnableBR_OUT2_wire2 or EnableBR_OUT2_wire3 or EnableBR_OUT2_wire4 or EnableBR_OUT2_wire5 or EnableBR_OUT2_wire6 or EnableBR_OUT2_wire7 or EnableBR_OUT2_wire8 or EnableBR_OUT2_wire9 or EnableBR_OUT2_wire10 or EnableBR_OUT2_wire11 ;
  Exce_ALU            <= Exce_ALU_wire0 or Exce_ALU_wire1 or Exce_ALU_wire2 or Exce_ALU_wire3 or Exce_ALU_wire4 or Exce_ALU_wire5 or Exce_ALU_wire6 or Exce_ALU_wire7 or Exce_ALU_wire8 or Exce_ALU_wire9 or Exce_ALU_wire10 or Exce_ALU_wire11 or Exce_ALU_wire12 or Exce_ALU_wire13 or Exce_ALU_wire14 or Exce_ALU_wire15 or Exce_ALU_wire16 or Exce_ALU_wire17 or Exce_ALU_wire18 or Exce_ALU_wire19 or Exce_ALU_wire20 or Exce_ALU_wire21 or Exce_ALU_wire22 or Exce_ALU_wire23 or Exce_ALU_wire24 or Exce_ALU_wire25 or Exce_ALU_wire26 or Exce_ALU_wire27 or Exce_ALU_wire28 or Exce_ALU_wire29 or Exce_ALU_wire30 or Exce_ALU_wire31 or Exce_ALU_wire32 or Exce_ALU_wire33 or Exce_ALU_wire34; 
  iMux                <= '0';--iMux_wire0 or iMux_wire1 or iMux_wire2 or iMux_wire3 or iMux_wire4 or iMux_wire5 or iMux_wire6 or iMux_wire7 or iMux_wire8 or iMux_wire9 or iMux_wire10 or iMux_wire11 or iMux_wire12 or iMux_wire13 or iMux_wire14 or iMux_wire15 or iMux_wire16 or iMux_wire17 or iMux_wire18 or iMux_wire19 or iMux_wire20;
  Enable_ALU_OUT      <=Enable_ALU_OUT_wire0 or Enable_ALU_OUT_wire1 or Enable_ALU_OUT_wire2 or Enable_ALU_OUT_wire3 or Enable_ALU_OUT_wire4 or Enable_ALU_OUT_wire5 or Enable_ALU_OUT_wire6 or Enable_ALU_OUT_wire7 or Enable_ALU_OUT_wire8 or Enable_ALU_OUT_wire9 or Enable_ALU_OUT_wire10 or Enable_ALU_OUT_wire11 or Enable_ALU_OUT_wire12 or Enable_ALU_OUT_wire13 or Enable_ALU_OUT_wire14 or Enable_ALU_OUT_wire15 or Enable_ALU_OUT_wire16 or Enable_ALU_OUT_wire17 or Enable_ALU_OUT_wire18 or Enable_ALU_OUT_wire19;
  WriteBR             <= WriteBR_wire0 or WriteBR_wire1 or WriteBR_wire2 or WriteBR_wire3 or WriteBR_wire4 or WriteBR_wire5;
  Select_jump_Mux     <='0';--Select_jump_Mux_wire0 or Select_jump_Mux_wire1;
  iRMux               <= iRMux_wire0 or iRMux_wire1 or iRMux_wire2 or iRMux_wire3 or iRMux_wire4 or iRMux_wire5 or iRMux_wire6 or iRMux_wire7 or iRMux_wire8 or iRMux_wire9 or iRMux_wire10 or iRMux_wire11 or iRMux_wire12 or iRMux_wire13;
  amMux               <=amMux_wire0 or amMux_wire1;
  Write_MD            <=Write_MD_wire0 or Write_MD_wire1 or Write_MD_wire2 or Write_MD_wire3 or Write_MD_wire4 or Write_MD_wire5;
  Read_MD             <=Read_MD_wire0 or Read_MD_wire1 or Read_MD_wire2 or Read_MD_wire3;
  Enable_Data_Reg     <=Enable_Data_Reg_wire0 or Enable_Data_Reg_wire1;
  Branch_AND          <=Branch_AND_wire0 or Branch_AND_wire1 or Branch_AND_wire2 or Branch_AND_wire3;
  Select_Data_Mux     <=Select_Data_Mux_wire0 or Select_Data_Mux_wire1 OR Select_Data_Mux_wire2 or Select_Data_Mux_wire3 or Select_Data_Mux_wire4 or Select_Data_Mux_wire5;
 ------
 -----
 -----------------------------------------------------------------------------------
 
 end MainDecoderArch;
 