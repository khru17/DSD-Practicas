LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY MarquesinaROM2 IS PORT(
    clr, clk : IN STD_LOGIC;
    dir : IN STD_LOGIC_VECTOR ( 3 DOWNTO 0 );
    display : OUT STD_LOGIC_VECTOR ( 6 DOWNTO 0 );
    an : INOUT STD_LOGIC_VECTOR ( 2 DOWNTO 0 )
);
ATTRIBUTE PIN_NUMBERS OF MarquesinaROM2 : ENTITY is
    "clk:1 dir(3):2 dir(2):3 dir(1):4 dir(0):5 clr:13 ";
END MarquesinaROM2;

ARCHITECTURE A_MarquesinaROM2 OF MarquesinaROM2 IS

	CONSTANT cod_w: STD_LOGIC_VECTOR (3 DOWNTO 0):="0000"; -- 08
	CONSTANT cod_d: STD_LOGIC_VECTOR (3 DOWNTO 0):="0001"; -- 3D
	CONSTANT cod_i: STD_LOGIC_VECTOR (3 DOWNTO 0):="0011"; -- 06
	CONSTANT cod_s: STD_LOGIC_VECTOR (3 DOWNTO 0):="0010"; -- 5B
	CONSTANT cod_e: STD_LOGIC_VECTOR (3 DOWNTO 0):="0110"; -- 4F
	CONSTANT cod_n: STD_LOGIC_VECTOR (3 DOWNTO 0):="0111"; -- 55
	CONSTANT cod_o: STD_LOGIC_VECTOR (3 DOWNTO 0):="0101"; -- 7E
	CONSTANT cod_g: STD_LOGIC_VECTOR (3 DOWNTO 0):="0100"; -- 7B
	CONSTANT cod_t: STD_LOGIC_VECTOR (3 DOWNTO 0):="1100"; -- 0F
	CONSTANT cod_a: STD_LOGIC_VECTOR (3 DOWNTO 0):="1101"; -- 77				
	CONSTANT cod_l: STD_LOGIC_VECTOR (3 DOWNTO 0):="1111"; -- 0E
	CONSTANT cod_x: STD_LOGIC_VECTOR (3 DOWNTO 0):="1110";

	TYPE Memoria IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR (3 DOWNTO 0);
	CONSTANT ROM0: Memoria:=(cod_w, cod_w, cod_d, cod_i, cod_s, cod_e, cod_n, cod_o, cod_w, cod_d, cod_i, cod_g, cod_i, cod_t, cod_a, cod_l);
	CONSTANT ROM1: Memoria:=(cod_w, cod_d, cod_i, cod_s, cod_e, cod_n, cod_o, cod_w, cod_d, cod_i, cod_g, cod_i, cod_t, cod_a, cod_l, cod_w);
	CONSTANT ROM2: Memoria:=(cod_d, cod_i, cod_s, cod_e, cod_n, cod_o, cod_w, cod_d, cod_i, cod_g, cod_i, cod_t, cod_a, cod_l, cod_w, cod_w);

	SIGNAL d0: STD_LOGIC_VECTOR (3 DOWNTO 0); -- Display Izquierdo 6
	SIGNAL d1: STD_LOGIC_VECTOR (3 DOWNTO 0); -- Display Centro 5
	SIGNAL d2: STD_LOGIC_VECTOR (3 DOWNTO 0); -- Display Derecho 3
	SIGNAL mostrar: STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
	
		-- Contador de anillo
		PROCESS ( clk , clr )
		BEGIN 
				IF ( clr = '1') THEN
					an <= "110";
				ELSIF ( rising_edge(clk) ) THEN
					CASE an IS
						WHEN "110" => an <= "101";
						WHEN "101" => an <= "011";
						WHEN "011" => an <= "110";
						WHEN OTHERS => an <= "---";
					END CASE;
				END IF;
		END PROCESS;

		-- Multiplexor de memoria
		PROCESS ( dir )
		BEGIN
				d0 <= ROM0 (conv_integer (dir));
				d1 <= ROM1 (conv_integer (dir));
				d2 <= ROM2 (conv_integer (dir));
		END PROCESS ;

		-- Multiplexor de salida
		PROCESS ( an, d0, d1, d2 )
		BEGIN
				IF ( an = "110" ) THEN
					mostrar <= d0;
				ELSIF ( an = "101") THEN
					mostrar <= d1;
				ELSIF (an = "011") THEN
                    mostrar <= d2;
                ELSE
                    mostrar <= cod_x;
				END IF;
		END PROCESS;

		-- Convertidor
		PROCESS ( mostrar )
		BEGIN
			CASE mostrar IS
				WHEN "0000" => display <="0001000"; -- 08
				WHEN "0001" => display <="0111101"; -- 3D
				WHEN "0011" => display <="0000110"; -- 06
				WHEN "0010" => display <="1011011"; -- 5B
				WHEN "0110" => display <="1001111"; -- 4F
				WHEN "0111" => display <="1010101"; -- 55
				WHEN "0101" => display <="1111110"; -- 7E
				WHEN "0100" => display <="1111011"; -- 7B
				WHEN "1100" => display <="0001111"; -- 0F
				WHEN "1101" => display <="1110111"; -- 77
				WHEN "1111" => display <="0001110"; -- 0E
				WHEN others => display <="-------"; --
			END CASE;
		END PROCESS;
END A_MarquesinaROM2;
