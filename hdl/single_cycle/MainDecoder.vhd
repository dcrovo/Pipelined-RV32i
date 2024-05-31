--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE MainDecoder-- 
--DISEÑADOR: DANIEL_FAJARDO-- 
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MainDecoder is
	port(	
		--inputs
		opcode 	: in  std_logic_vector(6 downto 0); --instruction(6 downto 0)
		--outputs
		regdst	: out std_logic;
		immmux	: out std_logic;
		branch	: out std_logic;
		read_md : out std_logic;
		select_ammux: out std_logic;
		exce_alu	: out std_logic;
		write_md: out std_logic;
		irmmux	: out std_logic;
		write_br: out std_logic;
		data_mux : out std_logic
	);
end MainDecoder;

architecture Behavioral of MainDecoder is   

		signal i_regdst	  : std_logic;
		signal i_branch	  : std_logic;
		signal i_read_md  : std_logic;
		signal i_select_ammux : std_logic;
		signal i_exce_alu	  : std_logic;
		signal i_write_md : std_logic;
		signal i_irmmux	  : std_logic;
		signal i_write_br : std_logic;   
		signal i_immmux	  : std_logic;      
		signal i_data_mux : std_logic;



begin
	i_data_mux <= '0';
	data_mux <= i_data_mux;
		process (opcode)
		begin
			
		case opcode is
			when "0110011" => --and, or, add, sub, slt : 0x00
				i_regdst	<= '1';
				i_immmux 	<= '0';
				i_branch	<= '0';
				i_read_md 	<= '0';
				i_select_ammux 	<= '0';
				i_exce_alu		<= '1';
				i_write_md	<= '0';
				i_irmmux	<= '0';
				i_write_br	<= '1'; 
			when "0010011" => --addi
				i_regdst	<= '0';
				i_immmux  	<= '0';
				i_branch	<= '0';
				i_read_md 	<= '0';
				i_select_ammux 	<= '0';
				i_exce_alu		<= '1';
				i_write_md	<= '0';
				i_irmmux	<= '1';
				i_write_br 	<= '1';          
			when "0000011" => --load word (lw)  
				i_regdst	<= '1';
				i_immmux  	<= '0';
				i_branch	<= '0';
				i_read_md 	<= '1';
				i_select_ammux	<= '1';
				i_exce_alu		<= '1';
				i_write_md	<= '0';
				i_irmmux	<= '1';
				i_write_br 	<= '1'; 
			when "0100011" => --store word (sw) : 0x2b
				i_regdst	<= 'X'; --don't care
				i_immmux  	<= '0';
				i_branch	<= '0';
				i_read_md 	<= '0';
				i_select_ammux	<= 'X'; --don't care
				i_exce_alu		<= '1';
				i_write_md	<= '1';
				i_irmmux	<= '1';
				i_write_br 	<= '0';
			when "1100011" => --branch equal (beq)  
				i_regdst	<= 'X'; --don't care
				i_immmux  	<= '0';
				i_branch	<= '1'; 
				i_read_md	<= '0';
				i_select_ammux	<= 'X'; --don't care
				i_exce_alu		<= '1';
				i_write_md	<= '0';
				i_irmmux	<= '0';
				i_write_br	<= '0';
			when "0110111" => --load upper immediate
				i_regdst	<= '1'; 
				i_immmux  	<= '1';
				i_branch	<= '0'; 
				i_read_md	<= '0';
				i_select_ammux	<= '0'; 
				i_exce_alu		<= '1';
				i_write_md	<= '0';
				i_irmmux	<= '1';
				i_write_br	<= '1';
			when others => null; -
				i_regdst	<= '0';
				i_immmux  	<= '0';
				i_branch	<= '0';
				i_read_md 	<= '0';
				i_select_ammux	<= '0';
				i_exce_alu		<= '0';
				i_write_md	<= '0';
				i_irmmux	<= '0';
				i_write_br 	<= '0';
		end case;
		
 
		end process;
		--Connect internal signals to output signals
		regdst	  <= i_regdst;	
		branch	  <= i_branch;
		read_md   <= i_read_md;
		select_ammux  <= i_select_ammux;
		exce_alu	  <= i_exce_alu;
		write_md  <= i_write_md;
		irmmux	  <= i_irmmux;
		immmux	  <= i_immmux;
		write_br  <= i_write_br;

end Behavioral;

