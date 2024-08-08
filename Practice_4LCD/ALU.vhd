LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity alu is 
	port(
		A, B, op : in STD_logic_vector (3 downto 0);
		x : inout STD_logic_vector (7 downto 0);
		true : inout STD_logic);
END ENTity ALU;

ARCHITECTURE VILLAPRO OF ALU IS 


BEGIN

process (A,B,op,X,true)
begin

case op is
			WHEN "0000" =>
						X <= "00000000";
			WHEN "0001" => 
						X <= "0000" & (B - A);
			WHEN "0010" => 
						X <= "0000" & (A - B);
			WHEN "0011" => 
						X <= "0000" & (A + B);
			WHEN "0100" => 
						X <= "0000" & (A XOR B);
			WHEN "0101" => 
						X <= "0000" & (A XNOR B);
			WHEN "0110" => 
						X <= "0000" & (A NAND B);
			WHEN "0111" => 
						X <= "0000" & (A OR B);
			WHEN "1000" => 
						X <= "0000" & (A NOR B);
			WHEN "1001" => 
						if(A > B) then true <= '1'; 
						else true <= '0';
						end if;
			WHEN "1010" => 
						if(A < B) then true <= '1'; 
						else true <= '0';
						end if;
			WHEN "1011" => 
						if(A = B) then true <= '1'; 
						else true <= '0';
						end if;
			WHEN "1100" => 
						X <= (A * B);
			WHEN "1101" => 
						X <= "0000" & (NOT A);
			WHEN "1110" => 
						X <= "0000" & (NOT B);
			WHEN "1111" => 
						if (unsigned(A) mod 2 = 0) then
							true <= '1';
						else
							true <= '0';
						end if;
	end case;
end process;
end VILLAPRO;