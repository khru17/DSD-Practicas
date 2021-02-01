library ieee;
use ieee.std_logic_1164.all;

entity p3 is port (
	d : in std_logic_vector(6 downto 0);
	es, clk, clr : in std_logic;
	sel : in std_logic_vector(1 downto 0);
	q : out std_logic_vector(6 downto 0)
);

attribute PIN_NUMBERS of p3 : entity  is(
"clk:1  es:2  d(6):3  d(5):4  d(4):5 d(3):6  d(2):7  d(1):8  d(0):9 "&
"sel(0):10  sel(1):11 "&
"clr:13 "&
"q(6):20  q(5):19  q(4):18  q(3):17  q(2):16  q(1):15  q(0):14"

);
end p3;

architecture Ap3 of p3 is
begin
	

	process( clk, clr )
	begin
		if( clr = '1') then
			q <= (others => '0');
		elsif(rising_edge(clk)) then
		 	case sel is
				-- Retención
				when "00" =>
					for i in 0 to 6 loop
						q(i) <= q(i);
					end loop;
				-- Carga
				when "01" =>
					for i in 0 to 6 loop
						q(i) <= d(i);
					end loop;
				-- Recorrimiento a la Izquierda
				when "10" =>
					for i in 6 downto 0 loop
						if(i > 0) then	
							q(i) <= q(i-1);
					  	else 
					  		q(i) <= es;
					 	end if;
				 	end loop;
				-- Recorrimiento a la Derecha
				when "11" =>
			  		for i in 0 to 6 loop
						if(i < 6) then	
							q(i) <= q(i+1);
					  	else 
					  		q(i) <= es;
					 	end if;
				 	end loop;
				when others =>
					q <= "0101010";
		 		end case;
		end if;
	end process;

end Ap3;

			  	
