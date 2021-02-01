LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY boleta IS PORT (
    CLR, CLK, EN : IN STD_LOGIC;
    DISPLAY : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
ATTRIBUTE PIN_NUMBERS OF boleta: ENTITY IS
    "CLK:1 EN:2 CLR:13 DISPLAY(6):23 DISPLAY(5):22 DISPLAY(4):21 DISPLAY(3):20 DISPLAY(2):19 DISPLAY(1):18 DISPLAY(0):17";
END boleta;
-- BOLETA: 2014130354

ARCHITECTURE A_boleta OF boleta IS
-- ALIAS
CONSTANT L0 : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
CONSTANT L1 : STD_LOGIC_VECTOR(1 DOWNTO 0) := "01";
CONSTANT L2 : STD_LOGIC_VECTOR(1 DOWNTO 0) := "10";
-- LETRAS
CONSTANT N0 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111110";
CONSTANT N1 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110000";
CONSTANT N2 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1101101";
CONSTANT N3 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111001";
CONSTANT N4 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110011";
CONSTANT N5 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1011011";
-- SE�AL DE APOYO
SIGNAL SAL : STD_LOGIC_VECTOR(8 DOWNTO 0);
-- LETRA CON SU ALIAS
CONSTANT N2_0 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L0&N2;
CONSTANT N0_0 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L0&N0;

CONSTANT N1_0 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L0&N1;
CONSTANT N4_0 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L0&N4;

CONSTANT N1_1 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L1&N1;
CONSTANT N3_0 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L0&N3;

CONSTANT N0_1 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L1&N0;
CONSTANT N3_1 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L1&N3;

CONSTANT N5_0 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L0&N5;
CONSTANT N4_1 : STD_LOGIC_VECTOR(8 DOWNTO 0) := L1&N4;

BEGIN
    PROCESS (CLK, CLR)
    BEGIN
        IF (CLR = '1') THEN
            SAL <= N2_0;
        ELSIF ( RISING_EDGE(CLK)) THEN
            IF ( EN = '1' ) THEN
                CASE SAL IS 
                    WHEN N2_0 => SAL <= N0_0;
                    WHEN N0_0 => SAL <= N1_0;
                    WHEN N1_0 => SAL <= N4_0;
                    WHEN N4_0 => SAL <= N1_1;
                    WHEN N1_1 => SAL <= N3_0;
                    WHEN N3_0 => SAL <= N0_1;
                    WHEN N0_1 => SAL <= N3_1;
                    WHEN N3_1 => SAL <= N5_0;
                    WHEN N5_0 => SAL <= N4_1;
                    WHEN N4_1 => SAL <= N2_0;
                    WHEN OTHERS => SAL <= N2_0;
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    DISPLAY <= SAL(6 DOWNTO 0);

END A_boleta;
