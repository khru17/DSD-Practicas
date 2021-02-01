LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY contadorGenerico IS PORT (
    CLK, CLR, EN, UD, L : IN std_logic;
    D : IN std_logic_vector(6 DOWNTO 0);
    C : OUT std_logic;
    Q : INOUT std_logic_vector(6 DOWNTO 0)
);
ATTRIBUTE PIN_NUMBERS OF contadorGenerico : ENTITY IS
    "CLK:1 CLR:13 D(6):2 D(5):3 D(4):4 D(3):5 D(2):6 D(1):7 D(0):8 EN:9 "&
    "UD:10 L:11 Q(6):22 Q(5):21 Q(4):20 Q(3):19 Q(2):18 Q(1):17 Q(0):16 C:23 ";

END contadorGenerico;

ARCHITECTURE AcontadorGenerico OF contadorGenerico IS
BEGIN

    PROCESS ( CLK, CLR )     
    BEGIN
        IF( CLR = '1') THEN
            Q <= (OTHERS => '0');
            C <= '0';
        ELSIF ( rising_edge(CLK) ) THEN
            
            IF ( EN = '0' ) THEN
                Q <= Q;
            ELSIF (EN = '1') THEN

                IF ( L = '1' AND UD = '0') THEN
                    Q <= D;
                ELSIF ( L = '0' AND UD = '1' ) THEN
                    IF ( Q = "1111111") THEN
                        C <= '1';
                    ELSE 
                        C <= '0';
                        Q <= Q + 1;
                    END IF;
                ELSIF ( L = '0' AND UD = '0' ) THEN 
                    IF ( Q = "0000000") THEN
                        C <= '1';
                    ELSE 
                        C <= '0';
                        Q <= Q - 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;

END AcontadorGenerico;