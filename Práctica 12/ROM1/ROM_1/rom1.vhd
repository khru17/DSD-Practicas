LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY MarquesinaROM1 IS PORT(
    clr, clk : IN STD_LOGIC;
    dir : IN STD_LOGIC_VECTOR ( 2 DOWNTO 0 );
    display : OUT STD_LOGIC_VECTOR ( 6 DOWNTO 0 );
    an : INOUT STD_LOGIC_VECTOR ( 2 DOWNTO 0 )
);
ATTRIBUTE PIN_NUMBERS OF MarquesinaROM1 : ENTITY is
    "clk:1 dir(2):2 dir(1):3 dir(0):4 clr:13 ";
END MarquesinaROM1;

ARCHITECTURE A_MarquesinaROM1 OF MarquesinaROM1 IS
	CONSTANT d : STD_LOGIC_VECTOR( 6 DOWNTO 0 ):="0111101"; -- 3D
	CONSTANT i : STD_LOGIC_VECTOR( 6 DOWNTO 0 ):="0000110"; -- 06
	CONSTANT s : STD_LOGIC_VECTOR( 6 DOWNTO 0 ):="1011011"; -- 5B
	CONSTANT e : STD_LOGIC_VECTOR( 6 DOWNTO 0 ):="1001111"; -- 4F
	CONSTANT n : STD_LOGIC_VECTOR( 6 DOWNTO 0 ):="1010101"; -- 55
	CONSTANT o : STD_LOGIC_VECTOR( 6 DOWNTO 0 ):="1111110"; -- 7E
	CONSTANT linea : STD_LOGIC_VECTOR( 6 DOWNTO 0 ):="0000000"; -- 00

	TYPE Memoria IS ARRAY(0 TO 7) OF STD_LOGIC_VECTOR(6 DOWNTO 0);
	CONSTANT ROM0 : Memoria:=( d, i, s, e, n, o, linea, linea );
	CONSTANT ROM1 : Memoria:=( linea, d, i, s, e, n, o, linea );
	CONSTANT ROM2 : Memoria:=( linea, linea, d, i, s, e, n, o );

	SIGNAL d0 : STD_LOGIC_VECTOR( 6 DOWNTO 0 );		--Display derecho
	SIGNAL d1 : STD_LOGIC_VECTOR( 6 DOWNTO 0 );		--Display central
	SIGNAL d2 : STD_LOGIC_VECTOR( 6 DOWNTO 0 );		--Display izquierdo
BEGIN
		-- Contador de anillo
		PROCESS ( clk , clr )
		BEGIN 
				IF ( clr = '1') THEN
					an <= "011";
				ELSIF ( rising_edge(clk) ) THEN
					CASE an IS
						WHEN "011" => an <= "101";
						WHEN "101" => an <= "110";
						WHEN "110" => an <= "011";
						WHEN OTHERS => an <= "---";
					END CASE;
				END IF;
		END PROCESS;

		--Multiplexor de memoria
		PROCESS (dir )
		BEGIN
				d0 <= ROM0 (conv_integer (dir));
				d1 <= ROM1 (conv_integer (dir));
				d2 <= ROM2 (conv_integer (dir));
		END PROCESS ;

		--Multiplexor de salida
		PROCESS ( an, d0, d1, d2 )
		BEGIN
				IF ( an = "011" ) THEN
					display <= d0;
				ELSIF ( an = "101") THEN
					display <= d1;
				ELSIF (an = "110") THEN
					display <= d2;
				END IF;
		END PROCESS;
END A_MarquesinaROM1;