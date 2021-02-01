LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY sensores_1 IS PORT(
    unid : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0 );
    dece : OUT STD_LOGIC_VECTOR( 2 DOWNTO 0 );
    ent : IN STD_LOGIC_VECTOR ( 1 DOWNTO 0);
    clr, clk : IN STD_LOGIC
);
ATTRIBUTE PIN_NUMBERS OF sensores_1 : ENTITY IS (
    "clk:1 clr:13 ent(1):2 ent(0):3 "
);
END sensores_1;


ARCHITECTURE A_sensores_1 OF sensores_1 IS 
TYPE estados IS (q0, q1, q2, q3, q4, q5, q6, q7);
SIGNAL sal : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
SIGNAL edo_act, edo_sig: estados;

BEGIN
    -- PROCESO DE TRANSICIÓN
    TRANSICION : PROCESS ( clr, clk )
        BEGIN
            IF( clr = '1' ) THEN
                edo_act <= q0;
            ELSIF ( clk'event and clk= '1' ) THEN
                edo_act <= edo_sig;
            END IF;
    END PROCESS ;

    -- PROCESO DE LOS ESTADOS
    ESTADOS_AUTOMATA : PROCESS ( ent, edo_act )
    BEGIN
        CASE edo_act IS
            -- ESTADO q0
            WHEN q0 =>
                IF ( ent="00" ) THEN
                    sal <= "00";
                    edo_sig <= q0;
                ELSIF ( ent="10" ) THEN
                    sal <= "00";
                    edo_sig <= q1;
                ELSIF ( ent="01" ) THEN
                    sal <= "00";
                    edo_sig <= q4;
                ELSIF ( ent="11" ) THEN
                    sal <= "00";
                    edo_sig <= q7;
                END IF;
            
            -- ESTADO q1
            WHEN q1 =>
                IF ( ent="00" ) THEN
                    sal <= "00";
                    edo_sig <= q0;
                ELSIF ( ent="10" ) THEN
                    sal <= "00";
                    edo_sig <= q1;
                ELSIF ( ent="01" ) THEN
                    sal <= "00";
                    edo_sig <= q4;
                ELSIF ( ent="11" ) THEN
                    sal <= "00";
                    edo_sig <= q2;
                END IF;

            -- ESTADO q2
            WHEN q2 =>
                IF ( ent="00" ) THEN
                    sal <= "00";
                    edo_sig <= q0;
                ELSIF ( ent="10" ) THEN
                    sal <= "00";
                    edo_sig <= q1;
                ELSIF ( ent="01" ) THEN
                    sal <= "00";
                    edo_sig <= q3;
                ELSIF ( ent="11" ) THEN
                    sal <= "00";
                    edo_sig <= q2;
                END IF;

            -- ESTADO q3
            WHEN q3 =>
                IF ( ent="00" ) THEN
                    sal <= "01";
                    edo_sig <= q0;
                ELSIF ( ent="10" ) THEN
                    sal <= "01";
                    edo_sig <= q1;
                ELSIF ( ent="01" ) THEN
                    sal <= "00";
                    edo_sig <= q3;
                ELSIF ( ent="11" ) THEN
                    sal <= "00";
                    edo_sig <= q2;
                END IF;    

            -- ESTADO q4
            WHEN q4 =>
                IF ( ent="00" ) THEN
                    sal <= "00";
                    edo_sig <= q0;
                ELSIF ( ent="10" ) THEN
                    sal <= "00";
                    edo_sig <= q1;
                ELSIF ( ent="01" ) THEN
                    sal <= "00";
                    edo_sig <= q4;
                ELSIF ( ent="11" ) THEN
                    sal <= "00";
                    edo_sig <= q5;
            END IF;

            -- ESTADO q5
            WHEN q5 =>
                IF ( ent="00" ) THEN
                    sal <= "00";
                    edo_sig <= q0;
                ELSIF ( ent="10" ) THEN
                    sal <= "00";
                    edo_sig <= q6;
                ELSIF ( ent="01" ) THEN
                    sal <= "00";
                    edo_sig <= q4;
                ELSIF ( ent="11" ) THEN
                    sal <= "00";
                    edo_sig <= q5;
                END IF;
            
            -- ESTADO q6
            WHEN q6 =>
                IF ( ent="00" ) THEN
                    sal <= "10";
                    edo_sig <= q0;
                ELSIF ( ent="10" ) THEN
                    sal <= "00";
                    edo_sig <= q6;
                ELSIF ( ent="01" ) THEN
                    sal <= "10";
                    edo_sig <= q4;
                ELSIF ( ent="11" ) THEN
                    sal <= "00";
                    edo_sig <= q5;
                END IF;

            -- ESTADO q7
            WHEN q7 =>
                IF ( ent="00" ) THEN
                    sal <= "00";
                    edo_sig <= q0;
                ELSIF ( ent="10" ) THEN
                    sal <= "00";
                    edo_sig <= q1;
                ELSIF ( ent="01" ) THEN
                    sal <= "00";
                    edo_sig <= q4;
                ELSIF ( ent="11" ) THEN
                    sal <= "00";
                    edo_sig <= q7;
                END IF;
        END CASE;
    END PROCESS ;

    -- CONTADOR DECADA
    CONTADOR_DECADA : PROCESS ( clr, clk ) 
    BEGIN
        IF ( clr = '1' ) THEN
            unid <= (OTHERS => '0');
            dece <= (OTHERS => '0');
        ELSIF ( clk'event and clk='1' ) THEN
            IF (sal = "01" ) THEN   
                unid <= unid + 1;
                IF ( unid="1001" ) THEN
                    unid <= "0000";
                    dece <= dece + 1;
                END IF;
            ELSIF( sal="10" ) THEN
                unid <= unid -1;
                IF ( unid="0000" ) THEN
                    unid <= "1001";
                    dece <= dece - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

END A_sensores_1;
