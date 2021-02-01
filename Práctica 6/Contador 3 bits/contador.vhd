LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY contador IS PORT (
    EN, CLK, CLR : IN std_logic;
    Q : INOUT std_logic_vector(2 DOWNTO 0)
);
ATTRIBUTE PIN_NUMBERS OF contador : ENTITY IS
    "CLK:1 CLR:13 EN:2 Q(2):23 Q(1):20 Q(0):17 ";
END contador;

ARCHITECTURE Acontador OF contador IS
BEGIN
    PROCESS ( CLK, CLR )
    VARIABLE AUX : std_logic;
    BEGIN
        IF ( CLR = '1' ) THEN   
            Q <= (OTHERS => '0');
        ELSIF ( rising_edge(CLK) ) THEN
            AUX := '1';
            FOR i IN 0 TO 2 LOOP
                IF ( i-1 >= 0) THEN
                    FOR j IN 0 TO i-1 LOOP
                        AUX := AUX AND Q(j);
                    END LOOP;
                END IF;
                AUX := AUX AND EN;
                Q(i) <= Q(i) XOR AUX;
            END LOOP;
        END IF;
    END PROCESS;
END Acontador;