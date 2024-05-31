--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Control_Unit DE RVI32-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity RISCV32 is
    port(
        clk : in std_logic;
        clear : in std_logic;
        -- Salidas de control
        Enable_PC : out std_logic;
        Exce_Sum_con : out std_logic;
        Enable_Sum_con : out std_logic;
        Enable_Direccion_CP : out std_logic;
        Read_ROM : out std_logic;
        EnableInst_Reg : out std_logic;
        EnableiMux_Reg : out std_logic;
        Read_rs1 : out std_logic;
        EnableBR_OUT1 : out std_logic;
        Read_rs2 : out std_logic;
        EnableBR_OUT2 : out std_logic;
        Exce_ALU : out std_logic;
        Select_iRMux : out std_logic;
        Enable_ALU_OUT : out std_logic;
        Read_MD : out std_logic;
        Enable_Data_Reg : out std_logic;
        Branch_AND : out std_logic;
        Write_BR : out std_logic;
        Select_am_Mux : out std_logic;
        Select_iMux : out std_logic;
        Select_icMux : out std_logic;
        Select_jump_Mux : out std_logic;
        write_MD : out std_logic;
        EnableInst_Reg_2 : out std_logic;
        -- Salidas de Mux
        salidaData_Mux : out std_logic_vector(31 downto 0);
        salidaamMux : out std_logic_vector(31 downto 0);
        salidaiRMux : out std_logic_vector(31 downto 0);
        salidaiMux : out std_logic_vector(31 downto 0);
        salidaicMux : out std_logic_vector(14 downto 0);
        -- Salidas de registros
        DireccionCP_Reg : out std_logic_vector(14 downto 0);
        PC_Reg : out std_logic_vector(14 downto 0);
        sumcon_reg : out std_logic_vector(14 downto 0);
        Inst_reg : out std_logic_vector(31 downto 0);
        Inst_reg_2 : out std_logic_vector(6 downto 0);
        BR_OUT1 : out std_logic_vector(31 downto 0);
        BR_OUT2 : out std_logic_vector(31 downto 0);
        ALU_OUT : out std_logic_vector(31 downto 0);
        RAM_Direccion : out std_logic_vector(14 downto 0);
        Data_Reg : out std_logic_vector(31 downto 0);
        RAM_OUTPUT : out std_logic_vector(31 downto 0);
        ROM_OUTPUT : out std_logic_vector(31 downto 0)
    );
end RISCV32;

architecture RISCV32Arch of RISCV32 is

    signal wire0 : std_logic_vector(31 downto 0);
    signal wire1 : std_logic_vector(31 downto 0);
    signal wire2 : std_logic;
    signal wire3 : std_logic_vector(14 downto 0);
    signal wire4 : std_logic_vector(31 downto 0);
    signal wire5 : std_logic;
    signal wire6 : std_logic;
    signal wire7 : std_logic_vector(31 downto 0);
    signal wire8 : std_logic_vector(14 downto 0);

begin

    -- Conexiones de los subsistemas internos del procesador

    UA : entity work.RV32I
        port map(
            clk => clk,
            clear => clear,
            Enable_PC => Enable_PC,
            Exce_Sum_con => Exce_Sum_con,
            Enable_Sum_con => Enable_Sum_con,
            Enable_Direccion_CP => Enable_Direccion_CP,
            Read_ROM => wire2,
            EnableInst_Reg => EnableInst_Reg,
            EnableiMux_Reg => EnableiMux_Reg,
            Read_rs1 => Read_rs1,
            EnableBR_OUT1 => EnableBR_OUT1,
            Read_rs2 => Read_rs2,
            EnableBR_OUT2 => EnableBR_OUT2,
            Exce_ALU => Exce_ALU,
            Select_iRMux => Select_iRMux,
            Enable_ALU_OUT => Enable_ALU_OUT,
            Read_MD => wire6,
            Enable_Data_Reg => Enable_Data_Reg,
            Branch_AND => Branch_AND,
            Write_BR => Write_BR,
            Select_am_Mux => Select_am_Mux,
            Select_iMux => Select_iMux,
            Select_icMux => Select_icMux,
            Select_jump_Mux => Select_jump_Mux,
            write_MD => wire5,
            EnableInst_Reg_2 => EnableInst_Reg_2,
            salidaData_Mux => wire4,
            salidaamMux => salidaamMux,
            salidaiRMux => salidaiRMux,
            salidaiMux => salidaiMux,
            salidaicMux => salidaicMux,
            DireccionCP_Reg => wire3,
            PC_Reg => PC_Reg,
            sumcon_reg => sumcon_reg,
            Inst_reg => Inst_reg,
            Inst_reg_2 => Inst_reg_2,
            BR_OUT1 => BR_OUT1,
            BR_OUT2 => BR_OUT2,
            ALU_OUT => wire7,
            Data_Reg => Data_Reg,
            RAM_OUTPUT => wire0,
            ROM_OUTPUT => wire1
        );

    UB : entity work.Perifericos
        port map(
            Read_ROM => wire2,
            ROM_Direccion => wire3,
            ROM_Salida => wire1,
            RAM_Datain => wire4,
            RAM_Write_MD => wire5,
            RAM_Read_MD => wire6,
            RAM_Direccion => wire7(14 downto 0),
            RAM_Salida => wire0,
            clear => clear,
            clk => clk
        );

    -- Asignaciones de señales de salida
    RAM_OUTPUT <= wire0;
    ROM_OUTPUT <= wire1;
    Read_ROM <= wire2;
    DireccionCP_Reg <= wire3;
    salidaData_Mux <= wire4;
    write_MD <= wire5;
    Read_MD <= wire6;
    ALU_OUT <= wire7;
    RAM_Direccion <= wire7(14 downto 0);

end RISCV32Arch;