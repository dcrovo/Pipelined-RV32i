-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 16.8.2020 04:34:54 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_RISCV32 is
end tb_RISCV32;

architecture tb of tb_RISCV32 is

    component RISCV32
        port (
	    ---------------------------------------
		       -----Senales de salida de Control------
			   ---------------------------------------
			   clk : 					in std_logic;
			   clear 					:in std_logic;
			   Enable_PC : 			out std_logic;
			   Exce_Sum_con : 		out std_logic;
			   Enable_Sum_con : 		out std_logic;
			   Enable_Direccion_CP :  out std_logic;
			   Read_ROM :				out std_logic;
			   EnableInst_Reg : 		out std_logic;
			   EnableiMux_Reg         :out std_logic;
			   Read_rs1 : 			out std_logic;
			   EnableBR_OUT1 : 		out std_logic;
			   Read_rs2 : 			out std_logic;
			   EnableBR_OUT2 : 		out std_logic;
			   Exce_ALU : 			out std_logic;
			   Select_iRMux : 		out std_logic;
			   Enable_ALU_OUT : 		out std_logic;
			   Read_MD : 				out std_logic;
			   Enable_Data_Reg: 		out std_logic;
			   Branch_AND : 			out std_logic;
			   Write_BR : 			out std_logic;
			   Select_am_Mux : 		out std_logic;
			   Select_iMux : 			out std_logic;
			   Select_icMux : 		out std_logic;
			   Select_jump_Mux: 		out std_logic;
			   write_MD: 		        out std_logic;
			   EnableInst_Reg_2      : out std_logic;
			   ------------------------	
		  ------------------------	
		   --------Mux Salidas-----
		   ------------------------
		   salidaData_Mux:  out  std_logic_vector(31 DOWNTO 0);
		   salidaamMux:  out  std_logic_vector(31 DOWNTO 0);
		   salidaiRMux:  out  std_logic_vector(31 DOWNTO 0);
		   salidaiMux:   out  std_logic_vector(31 DOWNTO 0);
		   salidaicMux:  out  std_logic_vector(14 DOWNTO 0);
		  ---Registros de salida----
		  DireccionCP_Reg : out std_logic_vector(14 DOWNTO 0);
		  PC_Reg : out std_logic_vector(14 DOWNTO 0);
		  sumcon_reg : out std_logic_vector(14 DOWNTO 0);
		  Inst_reg : out std_logic_vector(31 DOWNTO 0);
		  Inst_reg_2 : out std_logic_vector(6 DOWNTO 0);
		  BR_OUT1 : out std_logic_vector(31 DOWNTO 0);
		  BR_OUT2 : out std_logic_vector(31 DOWNTO 0);
		  ALU_OUT : out std_logic_vector(31 DOWNTO 0);
		  RAM_Direccion : out std_logic_vector(14 DOWNTO 0);
		  Data_Reg : out std_logic_vector(31 DOWNTO 0);
		  RAM_OUTPUT : out std_logic_vector(31 DOWNTO 0);
		  ROM_OUTPUT : out std_logic_vector(31 DOWNTO 0)
		 
		  );
    end component;



	 
	 --------------------
	 --Cables de senal --
	 --------------------
    ---------------------------------------
		       -----Senales de salida de Control------
			   ---------------------------------------
			signal   clk : 					 std_logic;
			signal   clear 					: std_logic;
			signal   Enable_PC : 		 std_logic;
			signal   Exce_Sum_con : 	 std_logic;
			signal   Enable_Sum_con : 	 std_logic;
			signal   Enable_Direccion_CP :   std_logic;
			signal   Read_ROM :				 std_logic;
			signal   EnableInst_Reg : 		 std_logic;
			signal   EnableiMux_Reg : 		 std_logic;			
			signal   Read_rs1 : 		 std_logic;
			signal   EnableBR_OUT1 : 	 std_logic;
			signal   Read_rs2 : 			 std_logic;
			signal   EnableBR_OUT2 : 		 std_logic;
			signal   Exce_ALU : 			 std_logic;
			signal   Select_iRMux : 		 std_logic;
			signal   Enable_ALU_OUT : 	 std_logic;
			signal   Read_MD : 			 std_logic;
			signal   Enable_Data_Reg: 	 std_logic;
			signal   Branch_AND : 		 std_logic;
			signal	   Write_BR : 			 std_logic;
			signal   Select_am_Mux : 		 std_logic;
			signal   Select_iMux : 	 std_logic;
			signal   Select_icMux : 		 std_logic;
			signal   Select_jump_Mux: 		 std_logic;
			signal   write_MD: 		        std_logic;
			signal EnableInst_Reg_2     :   std_logic;
			signal Inst_reg_2 : std_logic_vector(6 DOWNTO 0);
			   ------------------------	
		  ------------------------	
		   --------Mux Salidas-----
		   ------------------------
		   signal salidaData_Mux:    std_logic_vector(31 DOWNTO 0);
		   signal salidaamMux:    std_logic_vector(31 DOWNTO 0);
		   signal salidaiRMux:    std_logic_vector(31 DOWNTO 0);
		   signal salidaiMux:     std_logic_vector(31 DOWNTO 0);
		   signal salidaicMux:    std_logic_vector(14 DOWNTO 0);
		  ---Registros de salida----
		  signal DireccionCP_Reg : std_logic_vector(14 DOWNTO 0);
		  signal PC_Reg :  std_logic_vector(14 DOWNTO 0);
		  signal sumcon_reg : std_logic_vector(14 DOWNTO 0);
		  signal Inst_reg : std_logic_vector(31 DOWNTO 0);
		  signal BR_OUT1 : std_logic_vector(31 DOWNTO 0);
		  signal BR_OUT2 :  std_logic_vector(31 DOWNTO 0);
		  signal  ALU_OUT :  std_logic_vector(31 DOWNTO 0);
		  signal Data_Reg :  std_logic_vector(31 DOWNTO 0);
		  signal  RAM_OUTPUT :  std_logic_vector(31 DOWNTO 0);
		  signal ROM_OUTPUT : std_logic_vector(31 DOWNTO 0);
	 
	
	 
    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : RISCV32
    port map (
		clk => clk, 
		clear => clear, 					
		Enable_PC => Enable_PC, 
 		Exce_Sum_con => Exce_Sum_con, 
 		Enable_Sum_con => Enable_Sum_con, 
 		Enable_Direccion_CP => Enable_Direccion_CP, 
 		Read_ROM => Read_ROM, 
 		EnableInst_Reg => EnableInst_Reg, 
		EnableiMux_Reg=> EnableiMux_Reg,
 		Read_rs1 => Read_rs1,
		EnableBR_OUT1=> EnableBR_OUT1 ,
		Read_rs2 => Read_rs2 ,
 		EnableBR_OUT2=>  EnableBR_OUT2, 
 		Exce_ALU => Exce_ALU,
		Select_iRMux => Select_iRMux , 
		Enable_ALU_OUT => Enable_ALU_OUT, 
 		Read_MD  => Read_MD,
 		Enable_Data_Reg => Enable_Data_Reg ,
 		Branch_AND =>  Branch_AND,
 		Write_BR => Write_BR,
 		Select_am_Mux => Select_am_Mux, 
		Select_iMux => Select_iMux,
        Select_icMux => Select_icMux,
		Select_jump_Mux => Select_jump_Mux,
		write_MD => write_MD,
		EnableInst_Reg_2 =>  EnableInst_Reg_2  ,

		------------------------
		salidaData_Mux => salidaData_Mux,	
		salidaamMux => salidaamMux,
		salidaiRMux => salidaiRMux,
		salidaiMux => salidaiMux,
		salidaicMux => salidaicMux,
		DireccionCP_Reg => DireccionCP_Reg,
		PC_Reg  => PC_Reg,
		sumcon_reg => sumcon_reg,
		Inst_reg => Inst_reg,
		Inst_reg_2  =>	 Inst_reg_2 ,
		BR_OUT1 => BR_OUT1,
		BR_OUT2 => BR_OUT2,
		ALU_OUT =>ALU_OUT,
		Data_Reg => Data_Reg,
		RAM_OUTPUT =>RAM_OUTPUT,
		ROM_OUTPUT =>ROM_OUTPUT 
	
	 );

	clock_driver_proc: process
	begin
		clk <= '0';
		wait for TbPeriod / 2;
		clk <= '1';
		wait for TbPeriod / 2;
	end process clock_driver_proc;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- Reset generation
        -- EDIT: Check that reset is really your reset signal
        clear <= '0';
        wait for 110 ns;
        clear <= '1';
        wait for 20 ns;
        clear <= '0';
        wait;
        

    end process;

end tb;
