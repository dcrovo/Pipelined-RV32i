library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity decode is
	port(
		instruction	: in std_logic_vector (31 downto 0); 
		add_rs1	: out std_logic_vector (4 downto 0);		
		add_rs2	: out std_logic_vector (4 downto 0);	
		add_rd	: out std_logic_vector (4 downto 0);		
		imm_o	: out std_logic_vector (11 downto 0);
		imm_sh  : out std_logic_vector (11 downto 0);	
		imm_lui : out std_logic_vector (19 downto 0);
		opcode	: out std_logic_vector (6 downto 0);	
		func7	: out std_logic_vector (6 downto 0);		
		func3	: out std_logic_vector (2 downto 0)				
	);
end decode;

architecture Behavioral of decode is
	signal i_instr   : std_logic_vector (31 downto 0);
	signal i_add_rs1   : std_logic_vector (4 downto 0);		
	signal i_add_rs2   : std_logic_vector (4 downto 0);	
	signal i_add_rd	   : std_logic_vector (4 downto 0);		
	signal i_imm_o   : std_logic_vector (11 downto 0);	
	signal i_imm_sh  : std_logic_vector (11 downto 0);
	signal i_imm_lui : std_logic_vector (19 downto 0);
	signal i_opcode : std_logic_vector (6 downto 0);	
	signal i_func7 : std_logic_vector (6 downto 0);		
	signal i_func3 : std_logic_vector (2 downto 0);	

begin
	
	process (instruction)
	begin
		--assign incoming instruction to internal signal
			i_instr       <= instruction;
			i_func7       <= instruction(31 downto 25);	
			i_add_rs2     <= instruction(24 downto 20);
			i_add_rs1     <= instruction(19 downto 15);	
			i_func3       <= instruction(14 downto 12);
			i_add_rd      <= instruction(11 downto 7);		
			i_opcode      <= instruction(6 downto 0);	

	end process;

	
	process (i_instr)

	begin
		
		case i_opcode is
				
			when "0010011" => -- i type
				i_imm_o <= std_logic_vector(i_instr(31 downto 20));

			when "0000011" => -- li type 
				i_imm_o <= std_logic_vector(i_instr(31 downto 20));

			when "0100011" => -- s type 
				i_imm_sh <= std_logic_vector (i_instr(31 downto 25) & i_instr(11 downto 7)); 

			when "1100011" => --branch (beq, blt, bge) 
				i_imm_o <= std_logic_vector (i_instr(31) & i_instr(7) & i_instr(30 downto 25) & i_instr(11 downto 8));

			when "0110111" => --LUI 
				i_imm_lui <= std_logic_vector (i_instr(31 downto 12));

			when others => null; -- Not impleme nted
				i_imm_o <= std_logic_vector(i_instr(31 downto 20));
		end case;

	end process;

		add_rs1	<= i_add_rs1;	
		add_rs2	<= i_add_rs2;	
		add_rd	<= i_add_rd;		
		imm_o	<= i_imm_o;	
		imm_sh  <= i_imm_sh;
		imm_lui	<= i_imm_lui;
		opcode	<= i_opcode;	
		func7	<= i_func7;			
		func3	<= i_func3;	

end behavioral;