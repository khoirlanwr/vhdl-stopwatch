library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity binBCD14 is
	port (
		b : in STD_LOGIC_VECTOR (13 downto 0);
		p : out STD_LOGIC_VECTOR (16 downto 0)
	);
end binBCD14;

architecture Behavioral of binBCD14 is
begin
	process(b)
		variable z : STD_LOGIC_VECTOR (32 downto 0);
	begin
		for i in 0 to 32 loop
			z(i) := '0';
		end loop;
		
		z(16 downto 3) := b;
		
		for i in 0 to 10 loop
			if z(17 downto 14) > 4 then
				z(17 downto 14) := z(17 downto 14) + 3;
			end if;
			if z(21 downto 18) > 4 then
				z(21 downto 18) := z(21 downto 18) + 3;
			end if;
			if z(25 downto 22) > 4 then
				z(25 downto 22) := z(25 downto 22) + 3;
			end if;
			if z(29 downto 26) > 4 then
				z(29 downto 26) := z(29 downto 26) + 3;
			end if;
			z(32 downto 1) := z(31 downto 0);
		end loop;
		
		p <= z(30 downto 14);
		
	end process;
end Behavioral;