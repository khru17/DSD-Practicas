LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY contador_10 IS PORT (
    CLK, CLR, E :  IN STD_LOGIC;
    Q : INOUT STD_LOGIC_VECTOR (9 DOWNTO 0)
);
ATTRIBUTE PIN_NUMBERS OF contador_10 : ENTITY IS
	 "CLK:1 E:2 CLR:13 ";
END contador_10;

ARCHITECTURE A_contador_10 OF contador_10 IS
BEGIN
    PROCESS ( CLK, CLR)
    VARIABLE AUX : STD_LOGIC;
    BEGIN
        IF (CLR = '1') THEN
            Q <= (OTHERS => '0');
        ELSIF (RISING_EDGE(CLK)) THEN
            IF (E = '0' ) THEN
                Q <= Q;
            ELSIF ( E = '1' ) THEN
                FOR i IN 0 TO 9 LOOP
                    AUX := '1';
                    FOR j IN 0 TO i-1 LOOP
                        AUX := AUX AND Q(j);
                    END LOOP;
                    Q(i) <= Q(i) XOR (E AND AUX);
                END LOOP;
            END IF;
        END IF;
    END PROCESS;


END A_contador_10;