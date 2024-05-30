library ieee;
use ieee.std_logic_1164.all;
LIBRARY altera_mf;
USE altera_mf.all;


entity tb_BancoDeRegistros is
end tb_BancoDeRegistros;

architecture tb of tb_BancoDeRegistros is

    component BancoDeRegistros
        port (
		       clk : in STD_LOGIC;
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
    end component;



	 
	 --------------------
	 --Cables de senal --
	 --------------------
		    signal  clk : STD_LOGIC;
		    signal  reset:  STD_LOGIC;
		    signal  Direccion_rsd :  STD_LOGIC_VECTOR(4 downto 0);
			 signal	Direccion_rs2 : STD_LOGIC_VECTOR(4 downto 0);
		    signal	Direccion_rs1 : STD_LOGIC_VECTOR(4 downto 0);
		    signal  Write_Br : STD_LOGIC;
			 signal	Read_rs1 : STD_logic;
			 signal	Read_rs2 : STD_logic;
			 signal	DataOut_rs1_rs2 :  std_logic_vector(31 downto 0);
		    signal  Datain_BR : STD_LOGIC_VECTOR(31 downto 0);
		 
	
    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : BancoDeRegistros
    port map (
	 
	         clk => clk,
		      reset => reset,
		      Direccion_rsd => Direccion_rsd,
				Direccion_rs2 => Direccion_rs2, 
		    	Direccion_rs1 => Direccion_rs1,
		      Write_Br =>  Write_Br,
			 	Read_rs1 => Read_rs1,
				Read_rs2  => Read_rs2,
			 	DataOut_rs1_rs2 => DataOut_rs1_rs2,
		      Datain_BR => Datain_BR
	
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
     Direccion_rsd     <= "00000";
	   Write_Br   <= '0';
		Datain_BR <= "00000000000000000000000000000000";
		Direccion_rs2  <= "00000";
		Direccion_rs1  <= "00000";
		 Read_rs1   <= '0';
		  Read_rs2   <= '0';
        -- Reset generation
        -- EDIT: Check that reset is really your reset signal
        reset <= '0';
        wait for 80 ns;
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
		  Direccion_rsd     <= "00000";
		  Write_Br   <= '1';
		  Datain_BR <= "00000000000000000000000000110011";
        wait for 40 ns ;
		  
	     Write_Br   <= '0';
		  wait for 140 ns ;

		  Direccion_rsd     <= "00001";
		  Write_Br   <= '1';
		  Datain_BR <= "00000000000000000000000000111011";
        wait for 40 ns ;
		  
		   Write_Br   <= '0';
		  wait for 220 ns ;
		  
		  Direccion_rs1  <= "00000";
		  Read_rs1   <= '1';
		  wait for 80 ns ;
		  
		  Read_rs1   <= '0';
		  wait for 320 ns ;
		  
		  Direccion_rs2  <= "00001";
		  Read_rs2   <= '1';
		  wait for 80 ns ;
		
		  wait;
        

    end process;

end tb;
