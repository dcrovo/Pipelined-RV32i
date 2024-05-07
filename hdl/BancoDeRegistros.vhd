
--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE BANCO DE REGISTROS DE RVI32--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity BancoDeRegistros is
       port(clk : in STD_LOGIC;
		      reset: in STD_LOGIC;
		      Direccion_rsd : in STD_LOGIC_VECTOR(4 downto 0);
				Direccion_rs2 :in STD_LOGIC_VECTOR(4 downto 0);
				Direccion_rs1 :in STD_LOGIC_VECTOR(4 downto 0);
		      Write_Br :in STD_LOGIC;
				Read_rs1 : in STD_logic;
				Read_rs2 : in STD_logic;
				DataOut_rs1_rs2 : out std_logic_vector(31 downto 0);
		      Datain_BR : in STD_LOGIC_VECTOR(31 downto 0)
				);
		 
end BancoDeRegistros;
--Se genera una matriz de 32 columnas por 16 filas, es decir, 16 registros de 32 bits.
architecture Behavioral of BancoDeRegistros is 
type ram_type is array ( 15 downto 0) of std_logic_vector (31 downto 0);
signal myRam: ram_type;

begin

process(clk,reset,Write_BR,Read_rs1,Read_rs2)
  begin
if(reset='1')then
DataOut_rs1_rs2(0)<='0';
DataOut_rs1_rs2(1)<='0';
DataOut_rs1_rs2(2)<='0';
DataOut_rs1_rs2(3)<='0';
DataOut_rs1_rs2(4)<='0';
DataOut_rs1_rs2(5)<='0';
DataOut_rs1_rs2(6)<='0';
DataOut_rs1_rs2(7)<='0';
DataOut_rs1_rs2(8)<='0';
DataOut_rs1_rs2(9)<='0';
DataOut_rs1_rs2(10)<='0';
DataOut_rs1_rs2(11)<='0';
DataOut_rs1_rs2(12)<='0';
DataOut_rs1_rs2(13)<='0';
DataOut_rs1_rs2(14)<='0';
DataOut_rs1_rs2(15)<='0';
DataOut_rs1_rs2(16)<='0';
DataOut_rs1_rs2(17)<='0';
DataOut_rs1_rs2(18)<='0';
DataOut_rs1_rs2(19)<='0';
DataOut_rs1_rs2(20)<='0';
DataOut_rs1_rs2(21)<='0';
DataOut_rs1_rs2(22)<='0';
DataOut_rs1_rs2(23)<='0';
DataOut_rs1_rs2(24)<='0';
DataOut_rs1_rs2(25)<='0';
DataOut_rs1_rs2(26)<='0';
DataOut_rs1_rs2(27)<='0';
DataOut_rs1_rs2(28)<='0';
DataOut_rs1_rs2(29)<='0';
DataOut_rs1_rs2(30)<='0';
DataOut_rs1_rs2(31)<='0';




 else if(rising_edge(clk)) then
   
    if(Write_BR ='1') then
	  myRam(conv_integer(Direccion_rsd))<= Datain_BR;

	    else
		  if(Read_rs1='1' and Read_rs2='0')then
		  DataOut_rs1_rs2<=myRam(conv_integer(Direccion_rs1));
		    else
			  if( Read_rs2='1' and Read_rs1='0')then
			   DataOut_rs1_rs2<=myRam(conv_integer(Direccion_rs2));
				    end if;
					   end if;
                     end if;
			               end if;
							end if;
		
end process;
end Behavioral;
