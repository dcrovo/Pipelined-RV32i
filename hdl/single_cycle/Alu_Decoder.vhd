library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity alu_decode is
    port(    
        -- inputs
        aluop   : in std_logic; -- from control unit
        op_code : in std_logic_vector(6 downto 0); -- from decoder
        funct7  : in std_logic_vector(6 downto 0); -- from decoder
        funct3  : in std_logic_vector(2 downto 0); -- from decoder
        -- outputs
        alucontrol : out std_logic_vector(3 downto 0) -- changed to std_logic_vector
    );
end alu_decode;

architecture Behavioral of alu_decode is 

    -- Internal signal to hold the ALU control signal
    signal sig_aluctrl : std_logic_vector(3 downto 0);

begin
                
    process (op_code, funct7, funct3, aluop)
    begin

        if (aluop = '1') then
            case op_code is
                when "0110011" => -- and, or, add, sub, slt 
                    if (funct7 = "0000000") then
                        case funct3 is
                            when "000" => sig_aluctrl <= "0000"; -- ADD
                            when "001" => sig_aluctrl <= "0001"; -- SLL
                            when "010" => sig_aluctrl <= "0010"; -- SLT
                            when "011" => sig_aluctrl <= "0011"; -- SLTU
                            when "100" => sig_aluctrl <= "0100"; -- XOR
                            when "101" => sig_aluctrl <= "0101"; -- SRL
                            when "110" => sig_aluctrl <= "0110"; -- OR
                            when "111" => sig_aluctrl <= "0111"; -- AND
                            when others => sig_aluctrl <= "1111"; -- default
                        end case;
                    elsif (funct7 = "0100000") then 
                        case funct3 is
                            when "000" => sig_aluctrl <= "1000"; -- SUB
                            when "101" => sig_aluctrl <= "1001"; -- SRA
                            when others => sig_aluctrl <= "1111"; -- default
                        end case;
                    end if;
                when "0010011" => -- addi
                    if (funct7 = "0000000") then
                        case funct3 is
                            when "001" => sig_aluctrl <= "1010"; -- SLLI
                            when "101" => sig_aluctrl <= "1011"; -- SRLI
                            when others => sig_aluctrl <= "1111"; -- default
                        end case;
                    elsif (funct7 = "0100000") then
                        if (funct3 = "101") then
                            sig_aluctrl <= "1100"; -- SRAI
                        else
                            sig_aluctrl <= "1111"; -- default
                        end if;                    
                    else
                        case funct3 is
                            when "000" => sig_aluctrl <= "0000"; -- ADDI
                            when "010" => sig_aluctrl <= "0010"; -- SLTI
                            when "011" => sig_aluctrl <= "0011"; -- SLTIU
                            when "100" => sig_aluctrl <= "0100"; -- XORI
                            when "110" => sig_aluctrl <= "0110"; -- ORI
                            when "111" => sig_aluctrl <= "0111"; -- ANDI
                            when others => sig_aluctrl <= "1111"; -- default
                        end case;
                    end if;
                when "0000011" => -- load word (lw) 
                    if (funct3 = "010") then
                        sig_aluctrl <= "1101"; -- LW
                    else
                        sig_aluctrl <= "1111"; -- default
                    end if;
                when "0100011" => -- store word (sw)
                    if (funct3 = "010") then
                        sig_aluctrl <= "1110"; -- SW
                    else
                        sig_aluctrl <= "1111"; -- default
                    end if;
                when "1100011" => -- branch equal (beq) 
                    case funct3 is
                        when "000" => sig_aluctrl <= "1111"; -- BEQ
                        when "100" => sig_aluctrl <= "1001"; -- BLT
                        when "101" => sig_aluctrl <= "1010"; -- BGE
                        when others => sig_aluctrl <= "1111"; -- default
                    end case;
                when "0110111" => -- LUI
                    sig_aluctrl <= "1100"; -- LUI
                when others =>
                    sig_aluctrl <= "1111"; -- NO_OP
            end case;
        else
            sig_aluctrl <= "1111"; -- NO_OP
        end if;

    end process;

    alucontrol <= sig_aluctrl;

end Behavioral;
