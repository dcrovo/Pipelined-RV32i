
--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE BANCO DE REGISTROS DE RVI32--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity BancoDeRegistros is
       port(
            clk : in STD_LOGIC;
            reset: in STD_LOGIC;
            Direccion_rsd : in STD_LOGIC_VECTOR(4 downto 0);
            Direccion_rs2 : in STD_LOGIC_VECTOR(4 downto 0);
            Direccion_rs1 : in STD_LOGIC_VECTOR(4 downto 0);
            Write_Br : in STD_LOGIC;
            Read_rs1 : in STD_logic;
            Read_rs2 : in STD_logic;
            DataOut_rs1_rs2 : out std_logic_vector(31 downto 0);
            Datain_BR : in STD_LOGIC_VECTOR(31 downto 0)
       );
end BancoDeRegistros;

architecture Behavioral of BancoDeRegistros is 
    type ram_type is array (31 downto 0) of std_logic_vector (31 downto 0);
    signal myRam: ram_type;
begin

    process(clk, reset)
    begin
        if reset = '1' then
            -- Inicializar DataOut_rs1_rs2 en caso de reset
            DataOut_rs1_rs2 <= (others => '0');
				myRam(conv_integer("00000")) <= (others => '0');
				myRam(conv_integer("00001")) <= (others => '0');
				myRam(conv_integer("00010")) <= (others => '0');
				myRam(conv_integer("00011")) <= (others => '0');
				myRam(conv_integer("00100")) <= (others => '0');
				myRam(conv_integer("00101")) <= (others => '0');
				myRam(conv_integer("00110")) <= (others => '0');
				myRam(conv_integer("00111")) <= (others => '0');
				myRam(conv_integer("01000")) <= (others => '0');
				myRam(conv_integer("01001")) <= (others => '0');
				myRam(conv_integer("01010")) <= (others => '0');
				myRam(conv_integer("01011")) <= (others => '0');
				myRam(conv_integer("01100")) <= (others => '0');
				myRam(conv_integer("01101")) <= (others => '0');
				myRam(conv_integer("01110")) <= (others => '0');
				myRam(conv_integer("01111")) <= (others => '0');
				myRam(conv_integer("10000")) <= (others => '0');
				myRam(conv_integer("10001")) <= (others => '0');
				myRam(conv_integer("10010")) <= (others => '0');
				myRam(conv_integer("10011")) <= (others => '0');
				myRam(conv_integer("10100")) <= (others => '0');
				myRam(conv_integer("10101")) <= (others => '0');
				myRam(conv_integer("10110")) <= (others => '0');
				myRam(conv_integer("10111")) <= (others => '0');
				myRam(conv_integer("11000")) <= (others => '0');
				myRam(conv_integer("11001")) <= (others => '0');
				myRam(conv_integer("11010")) <= (others => '0');
			   myRam(conv_integer("11011")) <= (others => '0');
				myRam(conv_integer("11100")) <= (others => '0');
				myRam(conv_integer("11101")) <= (others => '0');
				myRam(conv_integer("11110")) <= (others => '0');
				myRam(conv_integer("11111")) <= (others => '0');
	
				
				
        elsif rising_edge(clk) then
            if Write_Br = '1' then
                myRam(conv_integer(Direccion_rsd)) <= Datain_BR;
            elsif Read_rs1 = '1'  then
                DataOut_rs1_rs2 <= myRam(conv_integer(Direccion_rs1));
            elsif Read_rs2 = '1'  then
                DataOut_rs1_rs2 <= myRam(conv_integer(Direccion_rs2));
            end if;
        end if;
    end process;

end Behavioral;
