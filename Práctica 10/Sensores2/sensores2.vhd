LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY sensores_2 IS PORT (
    clr, clk : IN STD_LOGIC;
    display : OUT STD_LOGIC_VECTOR( 6 DOWNTO 0 );
    unid : IN STD_LOGIC_VECTOR( 3 DOWNTO 0 );
    dece : IN STD_LOGIC_VECTOR( 2 DOWNTO 0 );
    sel : OUT STD_LOGIC_VECTOR( 2 DOWNTO 0 )
);
ATTRIBUTE PIN_NUMBERS OF sensores_2 : ENTITY IS
    "clk:1 clk:13 dece(2):3 dece(1):4 dece(0):5 "&
    "unid(3):6 unid(2):7 unid(1):8 unid(0):9 "&
    "sel(2):23 sel(1):22 sel(0):21 ";
END sensores_2;

ARCHITECTURE A_sensores_2 OF sensores_2 IS
    
CONSTANT e1 : STD_LOGIC_VECTOR( 3 DOWNTO 0 ) := "0"&dece;
SIGNAL e2 : STD_LOGIC_VECTOR( 3 DOWNTO 0 ) := "0000";
SIGNAL anillo : STD_LOGIC_VECTOR( 2 DOWNTO 0 );
SIGNAL bcd : STD_LOGIC_VECTOR( 3 DOWNTO 0);

BEGIN

    -- CONTADOR DE ANILLO
    CONTADOR : PROCESS( clr, clk )
    BEGIN
        IF ( clr = '1' ) THEN
            anillo <= "110";
        ELSIF ( clk'event and clk='1' ) THEN
            CASE anillo IS
                WHEN "110" => anillo <= "101";
                WHEN "101" => anillo <= "011";
                WHEN "011" => anillo <= "110";
                WHEN OTHERS => anillo <= "---";
            END CASE;
        END IF;
    END PROCESS CONTADOR;

    -- MULTIPLEXOR
    MULTIPLEXOR : PROCESS ( bcd, unid, dece, e2, anillo )
    BEGIN
        sel <= anillo;
        IF( sel = "110" ) THEN
            bcd <= unid;
        ELSIF( sel = "101") THEN
            bcd <= e1;
        ELSIF( sel = "011" ) THEN
            bcd <= e2;
        ELSE
            bcd <= "----";
        END IF;
    END PROCESS MULTIPLEXOR;

    -- CONVERTIDOR DE C�DIGO
    CONVERTIDOR : PROCESS (bcd)
    BEGIN
        CASE bcd IS
            WHEN "0000" => display <= "1111110"; -- 0 7E
            WHEN "0001" => display <= "0110000"; -- 1 30
            WHEN "0010" => display <= "1101101"; -- 2 6D
            WHEN "0011" => display <= "1111001"; -- 3 79
            WHEN "0100" => display <= "0110011"; -- 4 33
            WHEN "0101" => display <= "1011011"; -- 5 5B
            WHEN "0110" => display <= "1011111"; -- 6 5F
            WHEN "0111" => display <= "1110000"; -- 7 70
            WHEN "1000" => display <= "1111111"; -- 8 7F
            WHEN "1001" => display <= "1110011"; -- 9 73
            WHEN OTHERS => display <= "-------";
        END CASE;
    END PROCESS CONVERTIDOR;

END A_sensores_2;