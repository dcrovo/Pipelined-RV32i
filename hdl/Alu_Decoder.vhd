--PONTIFICIA_UNIVERSIDAD_JAVERIANA-- 
--VHDL DE Control_Unit DE RVI32--
--DISEÑADOR: DANIEL_FAJARDO--
--6/10/2020--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-----
--En esta seccion se colocan las senales de entrada y salidas basandonos en el diagrama en bloques.
entity Alu_Decoder is
       port( 
				 opcode : in STD_LOGIC_vector(16 downto 0);
				  ALU_Control2 : out std_logic_vector(3 downto 0);
				 ALU_Control1 : out std_logic_vector(2 downto 0)
				 );
				 
end Alu_Decoder;



architecture Alu_DecoderArch of Alu_Decoder is
signal R :std_logic_vector(2 downto 0);
signal I :std_logic_vector(2 downto 0);
signal Rin :std_logic_vector(2 downto 0);
signal Iin :std_logic_vector(2 downto 0);
--signal S :std_logic(2 downto 0);
--signal L :std_logic(2 downto 0);
signal B :std_logic_vector(3 downto 0);
signal Selectwire : std_logic;

 begin

selectwire<=not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0);

R(0)<=(not opcode(16) and opcode(15) and not opcode(14) and not opcode(13) and not opcode(12) and not opcode(11) and not opcode(10) and not opcode(9) and not opcode(8) and not opcode(7) and not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0)) or (not opcode(16) and not opcode(15) and not opcode(14) and not opcode(13) and not opcode(12) and not opcode(11) and not opcode(10) and opcode(9) and  opcode(8) and not opcode(7) and not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0))or( not opcode(16) and not opcode(15) and not opcode(14) and not opcode(13) and not opcode(12) and not opcode(11) and not opcode(10) and not opcode(9) and  opcode(8) and not opcode(7) and not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));
R(1)<=(not opcode(16) and not opcode(15) and not opcode(14) and not opcode(13) and not opcode(12) and not opcode(11) and not opcode(10) and opcode(9) and  opcode(8) and  opcode(7) and not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0))or(not opcode(16) and not opcode(15) and not opcode(14) and not opcode(13) and not opcode(12) and not opcode(11) and not opcode(10) and opcode(9) and  opcode(8) and not opcode(7) and not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0))or( not opcode(16) and not opcode(15) and not opcode(14) and not opcode(13) and not opcode(12) and not opcode(11) and not opcode(10) and not opcode(9) and  opcode(8) and opcode(7) and not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));
R(2)<=(not opcode(16) and not opcode(15) and not opcode(14) and not opcode(13) and not opcode(12) and not opcode(11) and not opcode(10) and opcode(9) and not opcode(8) and not opcode(7) and not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0))or(not opcode(16) and not opcode(15) and not opcode(14) and not opcode(13) and not opcode(12) and not opcode(11) and not opcode(10) and not opcode(9) and  opcode(8) and not opcode(7) and not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0))or(not opcode(16) and not opcode(15) and not opcode(14) and not opcode(13) and not opcode(12) and not opcode(11) and not opcode(10) and not opcode(9) and  opcode(8) and  opcode(7) and not opcode(6)and opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));

I(0)<=(not opcode(9) and not opcode(8) and  opcode(7)and not opcode(6)and not opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0)) or(opcode(9) and not opcode(8) and  not opcode(7)and not opcode(6)and not opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0)) or (opcode(9) and opcode(8) and  not opcode(7)and not opcode(6)and not opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));
I(1)<=(opcode(9) and not opcode(8) and  not opcode(7)and not opcode(6)and not opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0))or(opcode(9) and not opcode(8) and  not opcode(7)and not opcode(6)and not opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0))or(opcode(9) and  opcode(8) and  opcode(7)and not opcode(6)and not opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));
I(2)<=(opcode(9) and not opcode(8) and  opcode(7)and not opcode(6)and not opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0))or( opcode(9) and opcode(8) and  not opcode(7)and not opcode(6)and not opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0))or(opcode(9) and opcode(8) and  opcode(7)and not opcode(6)and not opcode(5) and opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));
 
B(0)<=(not opcode(9) and not opcode(8) and not opcode(7)and  opcode(6)and  opcode(5) and not opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));---beq--000
B(1)<=(opcode(9) and not opcode(8) and not opcode(7)and  opcode(6)and  opcode(5) and not opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));---blt--100
B(2)<=(opcode(9) and not opcode(8) and opcode(7)and  opcode(6)and  opcode(5) and not opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));--bge--101
B(3)<=(not opcode(9) and not opcode(8) and  opcode(7) and  opcode(6)and  opcode(5) and not opcode(4)and not opcode(3)and not opcode(2)and opcode(1)and opcode(0));---bne--001
----
--0001-->beq
--0010-->blt
--0100-->bge
--1000-->bne
Rin(0)<=R(0) and Selectwire;
Rin(1)<=R(1) and Selectwire;
Rin(2)<=R(2) and Selectwire;

Iin(0)<=I(0) and not Selectwire;
Iin(1)<=I(1) and not Selectwire;
Iin(2)<=I(2) and not Selectwire;

ALU_Control2<=B;
ALU_Control1<=(Rin) or (Iin);

 end Alu_DecoderArch;
 