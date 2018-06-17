library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity mod10kcnt is
	port (
		clr, btn : in STD_LOGIC;
		clk : in STD_LOGIC;
		pause : in STD_LOGIC;
		q : out STD_LOGIC_VECTOR (13 downto 0));
end mod10kcnt;

architecture Behavioral of mod10kcnt is
	signal count : STD_LOGIC_VECTOR (13 downto 0);
	signal flag, lastbtn: STD_LOGIC;
begin
	process(clk,clr)
	begin
		if clr = '1' then
			count <= (others => '0');
		elsif clk'event and clk ='1' then
			if (btn='1' and lastbtn='0') then
				flag <= not flag;
			end if;
			
			if conv_integer(count) = 9999 then
				count <= (others => '0');
			elsif (flag='0') then
				count <= count + 1;
			end if;
			
			lastbtn <= btn;
		end if;
	end process;
	q <= count;
end Behavioral;