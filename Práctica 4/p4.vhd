library ieee;
use ieee.std_logic_1164.all;

entity Mealy is port(
	clk, clr, e: in std_logic;
	sal : out std_logic;
	display : out std_logic_vector (6 downto 0)
);

attribute PIN_NUMBERS of Mealy : entity is (
	"clk:1 e:2 clr:13 "&
	"display(0):14  display(1):15  display(2):16  display(3):17 "&
	"display(4):18  display(5):19  display(6):20 "
	
);
end Mealy;

architecture AMealy of Mealy is
signal q0, q1, d0, d1: std_logic;
begin

	process (clk, clr)
	begin
		if (clr = '1') then
			q0 <= '0';
			q1 <= '0';
		 elsif (rising_edge(clk)) then
			q0 <= d0;
			q1 <= d1;
		 end if;
	end process;
	
	d0 <= (q1 and (not q0) and (not e)) or ((not q1) and (not q0) and e);
	d1 <= (q1 and (not q0)) or ((not q1) and q0 and e);
	sal <= q1 and q0 and e;
	
	process(sal)
	begin
		if (sal = '1') then
			display <= "1110111";
	 	else
	 		display <=  "1001111";
	 	end if;
	end process;	
	
end AMealy;
