library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Practica1 is port(
	a, b, ref : in std_logic_vector(2 downto 0);
	sel :  std_logic;
	comparador : out std_logic_vector(2 downto 0);
	display : out std_logic_vector(6 downto 0)
);
end Practica1;

architecture APractica1 of Practica1 is

constant mayor: std_logic_vector(6 downto 0):="111 1000"; --78
constant menor: std_logic_vector(6 downto 0):="100 1110"; --4E
constant igual: std_logic_vector(6 downto 0):="100 1000"; --48
signal auxMux: std_logic_vector(2 downto 0);

begin

	auxMux <= a when sel = '0' else b;

	process (auxMux, ref, comparador)
		begin
			if(auxMux > ref) then comparador <= "100";
			elsif(auxMux < ref) then comparador <= "001";
			else comparador <= "010";
		end if;
	end process;

	process(comparador)
	begin
		case comparador is
			when "100" => display <= mayor;
			when "001" => display <= menor;
			when others => display <= igual;
		end case;
	end process;

end APractica1;


