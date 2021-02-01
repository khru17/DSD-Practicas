LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY hexadecimal IS PORT (
    CLR, CLK, EN : IN STD_LOGIC;
    DISPLAY : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
ATTRIBUTE PIN_NUMBERS OF hexadecimal: ENTITY IS
    "CLK:1 EN:2 CLR:13 DISPLAY(6):23 DISPLAY(5):22 DISPLAY(4):21 DISPLAY(3):20 DISPLAY(2):19 DISPLAY(1):18 DISPLAY(0):17";
END hexadecimal;

ARCHITECTURE A_hexadecimal OF hexadecimal IS

CONSTANT Q0 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111110"; --0
CONSTANT Q1 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110000"; --1
CONSTANT Q2 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1101101"; --2
CONSTANT Q3 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111001"; --3
CONSTANT Q4 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110011"; --4
CONSTANT Q5 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1011011"; --5
CONSTANT Q6 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1011111"; --6
CONSTANT Q7 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1110000"; --7
CONSTANT Q8 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111"; --8
CONSTANT Q9 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111011"; --9
CONSTANT QA : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1110111"; --A
CONSTANT QB : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0011111"; --B
CONSTANT QC : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001110"; --C
CONSTANT QD : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0111101"; --D
CONSTANT QE : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001111"; --E
CONSTANT QF : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000111"; --F

SIGNAL SAL : STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN
    PROCESS (CLK, CLR) 
    BEGIN
        IF ( CLR = '1') THEN
            SAL <= Q0;
        ELSIF (RISING_EDGE(CLK)) THEN
            IF ( EN = '1') THEN
                CASE SAL IS
                    WHEN Q0 => SAL <= Q1;
                    WHEN Q1 => SAL <= Q2;
                    WHEN Q2 => SAL <= Q3;
                    WHEN Q3 => SAL <= Q4;
                    WHEN Q4 => SAL <= Q5;
                    WHEN Q5 => SAL <= Q6;
                    WHEN Q6 => SAL <= Q7;
                    WHEN Q7 => SAL <= Q8;
                    WHEN Q8 => SAL <= Q9;
                    WHEN Q9 => SAL <= QA;
                    WHEN QA => SAL <= QB;
                    WHEN QB => SAL <= QC;
                    WHEN QC => SAL <= QD;
                    WHEN QD => SAL <= QE;
                    WHEN QE => SAL <= QF;
                    WHEN QF => SAL <= Q0;
                    WHEN OTHERS => SAL <= Q0;
                END CASE;
            END IF;
        END IF;
    END PROCESS;
    DISPLAY <= SAL;

END A_hexadecimal;