LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY RAM IS
	PORT
	(
      clock		: IN STD_LOGIC  ;	
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		address		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
		rden		: IN STD_LOGIC  ;
		wren		: IN STD_LOGIC ;
		aclr		: IN STD_LOGIC  ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM;


ARCHITECTURE SYN OF ram IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (31 DOWNTO 0);



	COMPONENT altsyncram
	GENERIC (
		clock_enable_input_a		: STRING;
		clock_enable_output_a		: STRING;
		init_file		: STRING;
		intended_device_family		: STRING;
		lpm_hint		: STRING;
		lpm_type		: STRING;
		numwords_a		: NATURAL;
		operation_mode		: STRING;
		outdata_aclr_a		: STRING;
		outdata_reg_a		: STRING;
		power_up_uninitialized		: STRING;
		read_during_write_mode_port_a		: STRING;
		widthad_a		: NATURAL;
		width_a		: NATURAL;
		width_byteena_a		: NATURAL
	);
	PORT (
			aclr0	: IN STD_LOGIC ;
			address_a	: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
			clock0	: IN STD_LOGIC ;
			data_a	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren_a	: IN STD_LOGIC ;
			q_a	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			rden_a	: IN STD_LOGIC 
	);
	END COMPONENT;

BEGIN
	q    <= sub_wire0(31 DOWNTO 0);

	altsyncram_component : altsyncram
	GENERIC MAP (
		clock_enable_input_a => "BYPASS",
		clock_enable_output_a => "BYPASS",
		init_file => "\Users\danie\iCloudDrive\Msc\hdl\redf22.mif",
		intended_device_family => "Stratix IV",
		lpm_hint => "ENABLE_RUNTIME_MOD=NO",
		lpm_type => "altsyncram",
		numwords_a => 32768,
		operation_mode => "SINGLE_PORT",
		outdata_aclr_a => "CLEAR0",
		outdata_reg_a => "CLOCK0",
		power_up_uninitialized => "FALSE",
		read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
		widthad_a => 15,
		width_a => 32,
		width_byteena_a => 1
	)
	PORT MAP (
		aclr0 => aclr,
		address_a => address,
		clock0 => clock,
		data_a => data,
		wren_a => wren,
		rden_a => rden,
		q_a => sub_wire0
	);
END SYN;
