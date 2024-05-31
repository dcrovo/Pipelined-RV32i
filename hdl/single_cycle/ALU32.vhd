library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU32 is
    port(
        A, B: in std_logic_vector(31 downto 0);
        ALUControl: in std_logic_vector(3 downto 0);
        Result: out std_logic_vector(31 downto 0);
        Zero: out std_logic
    );
end ALU32;

architecture Behavioral of ALU32 is
    signal signed_A, signed_B: signed(31 downto 0);
    signal signed_Result: signed(31 downto 0);
begin
    signed_A <= signed(A);
    signed_B <= signed(B);
    
    process (A, B, ALUControl)
    begin
        case ALUControl is
            when "0000" => Result <= A and B; -- AND
            when "0001" => Result <= A or B;  -- OR
            when "0010" => Result <= std_logic_vector(signed_A + signed_B); -- ADD
            when "0110" => Result <= std_logic_vector(signed_A - signed_B); -- SUB
            when "0111" => -- SLT
                if signed_A < signed_B then
                    Result <= (others => '1');
                else
                    Result <= (others => '0');
                end if;
            when others => Result <= (others => '0');
        end case;
        Zero <= '1' when Result = x"00000000" else '0';
    end process;
end Behavioral;
