--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE RVI32_single_cycle-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RVI32_single_cycle is
    port (
        clk: in std_logic;
        clear: in std_logic
        
    );
end RVI32_single_cycle;

architecture Behavioral of RVI32_single_cycle is

    -- Señales internas
    signal i_read_data_1, i_read_data_2, i_write_data, ImmExt, i_out_irmux: std_logic_vector(31 downto 0):=  (others => '0');
    signal i_ammux : std_logic_vector(31 downto 0):=  (others => '0');
    signal i_regdst, i_branch, i_read_md, i_select_ammux, i_reg_write, i_exce_alu: std_logic :='0'; 
    signal i_select_ic_mux, i_write_md, i_irmmux, i_immmux, i_write_br : std_logic :='0';
	signal i_pc_in, i_pc_out : std_logic_vector(14 downto 0) := (others => '0');
 
	signal i_out_imux: std_logic_vector(31 downto 0) :=  (others => '0');
	signal ALUControl	: std_logic_vector(3 downto 0) :=  (others => '0');
    signal incremento	: std_logic_vector(14 downto 0) :=  (others => '0'); 
    signal out_ic_mux	: std_logic_vector(14 downto 0) :=  (others => '0');
    signal ALUResult    :  std_logic_vector(31 downto 0) :=  (others => '0');
    signal Zero         : std_logic :='0';
     
	------ internal signals for decode
	signal i_instruction: std_logic_vector(31 downto 0) :=  (others => '0');
	signal i_add_rs1   	: std_logic_vector (4 downto 0) :=  (others => '0');		
	signal i_add_rs2  	: std_logic_vector (4 downto 0) :=  (others => '0');	
	signal i_add_rd	   	: std_logic_vector (4 downto 0) :=  (others => '0');	
	signal i_out_reg_mux :std_logic_vector (4 downto 0) :=  (others => '0');	
	signal i_imm_o   	: std_logic_vector (11 downto 0) :=  (others => '0');	
	signal i_imm_sh  	: std_logic_vector (11 downto 0) :=  (others => '0');
	signal i_imm_lui 	: std_logic_vector (19 downto 0) :=  (others => '0');
	signal i_opcode 	: std_logic_vector (6 downto 0) :=  (others => '0');	
	signal i_func7 		: std_logic_vector (6 downto 0) :=  (others => '0');		
	signal i_func3 		: std_logic_vector (2 downto 0) :=  (others => '0');	
    signal i_datamux   : std_logic := '0';
    signal i_offset     : std_logic_vector(14 downto 0) := (others => '0') ;

begin
    incremento(0) <= '1';
    i_offset <= i_out_imux(14 downto 0);
	-- Instancia del PC
    PC_Reg_inst: entity work.PC_Reg
        port map (
            clk => clk,
            clear => clear,
            PC_in => i_pc_in, -- Conectar a la salida de la ALU o el siguiente PC
            PC_out => i_pc_out,
            Enable => '1'
        );
	
	-- Instancia del banco de registros
	BancoDeRegistros_inst: entity work.BancoDeRegistros
	port map (
		clk => clk,
		clear => clear,
		rs1 => i_add_rs1,
		rs2 => i_add_rs2,
		rd => i_out_reg_mux,
		RegWrite => i_write_br,
		ReadData1 => i_read_data_1,
		ReadData2 => i_read_data_2,
		WriteData => i_write_data
	);
	decode_inst: entity work.decode
		port map (

			instruction	=> 	i_instruction,
			add_rs1		=>	i_add_rs1,			
			add_rs2		=>	i_add_rs2,
			add_rd		=>	i_add_rd,
			imm_o		=>	i_imm_o,
			imm_sh  	=>	i_imm_sh,
			imm_lui 	=>	i_imm_lui,
			opcode		=>	i_opcode,
			func7		=>	i_func7,
			func3		=>	i_func3

		);

    -- Instancia de la ROM para las instrucciones
    ROM_inst: entity work.ROM
        port map (
            clk => clk,
            addr => i_pc_out,
            dout => i_instruction
        );
    ic_mux_inst: entity work.mux2_1
        generic map(
            G_size => 15
        )
        port map (
            b => i_offset,
            a => incremento, 
            sel => i_select_ic_mux,
            y => out_ic_mux 
            
        );
        
     ir_mux_inst: entity work.mux2_1
        generic map(
            G_size => 32
        )
        port map (

             a  => i_out_imux,
             b => i_read_data_2,
             y => i_out_irmux, 
             sel => i_irmmux
             );
             
      sum_con_inst: entity work.Sum_con
        port map (
   
				 Salida_Sum_con => i_pc_in,
				 Salida_ic_Mux => out_ic_mux,
				 Salida_PC_Reg => i_pc_out
        );


				 

    -- Instancia del decodificador principal
    MainDecoder_inst: entity work.MainDecoder
    port map (
        opcode 		=> i_opcode,
		regdst		=> i_regdst,
		branch		=> i_branch,
		read_md			=> i_read_md,
		select_ammux	=> i_select_ammux,
		exce_alu	=> i_exce_alu,		
		write_md	=> i_write_md,
		irmmux	=> i_irmmux,		
		immmux	=> i_immmux,
		write_br	=> i_write_br,	
        data_mux	=> i_datamux	

		);

    -- Instancia del decodificador de la ALU
    Alu_Decoder_inst: entity work.alu_decode
        port map (
            aluop => i_exce_alu,
            op_code => i_opcode,
            funct7 => i_func7,
            funct3 => i_func3,
            ALUControl => ALUControl

        );

    -- Instancia de la extensión de signo
    SignExtension_inst: entity work.SignExtension
        port map (
            Instr => i_instruction,
            ImmSel => "010", -- Ejemplo: Immediate from instruction
            Imm => ImmExt
        );



    -- MUX para seleccionar el segundo operando de la ALU
    iMux_inst: entity work.iMux
        port map (
            A => i_read_data_2,
            B => ImmExt,
            Sel => i_immmux,
            Y => i_out_imux
        );

	reg_mux_inst: entity work.mux2_1
	generic map(
		G_size => 5
	)	
	port map (
		a => i_add_rs2,
		b => i_add_rd,
		sel => i_regdst,
		y => i_out_reg_mux
	);
	am_mux_inst: entity work.mux2_1
	generic map(
		G_size => 32
	)	
	port map (
		a => i_ammux,
		b => ALUResult,
		sel => i_select_ammux,
		y => i_write_data
	);

    -- Instancia de la ALU
    ALU32_inst: entity work.ALU32
        port map (
            A => i_read_data_1,
            B => i_out_irmux,
            ALUControl => ALUControl,
            Result => ALUResult,
            Zero => Zero
        );

    -- Lógica de control de Branch
    Branch_AND_inst: entity work.ANDb
        port map (
            A => i_branch,
            B => Zero,
            Y => i_select_ic_mux
        );

    -- Instancia de la RAM
    RAM_inst: entity work.RAM
        port map (
            clk => clk,
            addr => ALUResult,
            we => i_write_md,
            din => i_write_data,
            dout => i_ammux
        );

    -- MUX para seleccionar el dato a escribir en el registro
    Data_Mux_inst: entity work.Data_Mux
        port map (
            A => i_out_imux,
            B => i_read_data_2,
            Sel => i_datamux,
            Y => i_write_data
        );

end Behavioral;
