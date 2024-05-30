library ieee;
use ieee.std_logic_1164.all;
LIBRARY altera_mf;
USE altera_mf.all;


entity tb_RV32_CONTROL_PIPE is
end tb_RV32_CONTROL_PIPE;

architecture tb of tb_RV32_CONTROL_PIPE is

    component RV32_CONTROL_PIPE
        port (
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
				 --------------
				 clk : in std_logic
		 
		  );
    end component;



	 
	 --------------------
	 --Cables de senal --
	 --------------------
	
	         signal clear :  std_logic;--
				signal Enable_PC :  STD_LOGIC;--
				signal WriteBR :  STD_LOGIC;--
				signal Read_rs1 :  STD_LOGIC;--
		      signal EnableInst_Reg :  STD_LOGIC;--
				signal Read_ROM :  STD_LOGIC;--
				signal Enable_DireccionCP :  STD_LOGIC;--
				signal Read_rs2 :  STD_LOGIC;--
				signal EnableBR_OUT2 :  STD_LOGIC;--
				signal Select_jump_Mux :  STD_LOGIC;--
				signal Branch_AND :  STD_LOGIC;--
				signal amMux : STD_LOGIC;--
				signal iRMux :  STD_LOGIC;--
				signal iMux :  STD_LOGIC;--
				signal Exce_Sum_con :  STD_LOGIC;--
				signal Exce_ALU :  STD_LOGIC;--
				signal EnableBR_OUT1 :  STD_LOGIC;--
				signal Enable_ALU_OUT:  STD_LOGIC;--
				signal Write_MD :  STD_LOGIC;--
				signal Read_MD :  STD_LOGIC;--
				signal Enable_Data_Reg :  STD_LOGIC;--
				signal opcodeC : std_logic_vector(6 downto 0);
				signal Enable_sumcon : STD_LOGIC;--
				signal Select_Data_Mux :  STD_LOGIC;--
				signal EnableiMux_Reg  :  STD_LOGIC;--
				 --------------
				signal clk :  std_logic;
	
	
    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : RV32_CONTROL_PIPE
    port map (
	 
	          clear  => clear,
				 Enable_PC   => Enable_PC,
				 WriteBR   => WriteBR,
				 EnableiMux_Reg => EnableiMux_Reg,
			    Read_rs1   => Read_rs1,
		       EnableInst_Reg  => EnableInst_Reg,
				 Read_ROM   => Read_ROM,
				 Enable_DireccionCP  => Enable_DireccionCP,
				 Read_rs2   => Read_rs2,
				 EnableBR_OUT2   => EnableBR_OUT2,
				 Select_jump_Mux   => Select_jump_Mux,
				 Branch_AND   => Branch_AND,
				 amMux   =>  amMux,
			    iRMux  => iRMux,
				 iMux   => iMux,
				 Exce_Sum_con   => Exce_Sum_con,
				 Exce_ALU   => Exce_ALU,
				 EnableBR_OUT1   => EnableBR_OUT1,
			    Enable_ALU_OUT  => Enable_ALU_OUT,
				 Write_MD   =>   Write_MD,
				 Read_MD   => Read_MD ,
				 Enable_Data_Reg  => Enable_Data_Reg,
				 opcodeC   => opcodeC,
				 Enable_sumcon  => Enable_sumcon,
				 Select_Data_Mux   => Select_Data_Mux,
				 clk   =>  clk
	
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
 
        -- Reset generation
        -- EDIT: Check that reset is really your reset signal
        clear <= '0';
        wait for 70 ns;
        clear <= '1';
		  opcodeC     <= "1100011";
        wait for 10 ns;
        clear <= '0';
		  wait for 250 ns;
		  opcodeC     <= "1100011";
		   wait for 200 ns;
		  opcodeC     <= "1100011";
		 
		 
		  wait;
        

    end process;

end tb;