library ieee;
use ieee.std_logic_1164.all;
ENTITY Contador IS PORT (
  clk, clr, lb, eb, ec : in std_logic;
  display: out std_logic_vector (6 downto 0));
END Contador;

ARCHITECTURE aContador of Contador IS
SIGNAL edo: std_logic_vector(2 downto 0);
constant e0 : std_logic_vector(2 downto 0) := "000";
constant e1 : std_logic_vector(2 downto 0) := "001";
constant e2 : std_logic_vector(2 downto 0) := "010";
constant e3 : std_logic_vector(2 downto 0) := "011";
constant e4 : std_logic_vector(2 downto 0) := "100";
constant e5 : std_logic_vector(2 downto 0) := "101";
constant e6 : std_logic_vector(2 downto 0) := "110";
BEGIN
PROCESS(clr,clk)
BEGIN
      IF(clr='1') THEN
        edo <= e0;
      ELSIF(rising_edge(clk)) THEN
        IF( lb ='1') THEN
          edo <= e0;
        ELSE
          IF(eb ='1') THEN
            CASE edo IS
                WHEN e0 => edo <= e1;
                WHEN e1 => edo <= e2;
                WHEN e2 => edo <= e3;
                WHEN e3 => edo <= e4;
                WHEN e4 => edo <= e5;
                WHEN e5 => edo <= e6;
				        WHEN e6 => edo <= e0;
                WHEN others => edo <= "---";
            END CASE;
        ELSE
          edo <= edo;
          END IF;
      END IF;
END IF;
END PROCESS;


PROCESS(ec,edo)
begin
    IF( ec='0') THEN
      display <= "0000001";
    elsif (ec = '1') then
        CASE edo IS
          WHEN e0=> display <= "1111110"; 
          WHEN e1=> display <= "0110000"; 
          WHEN e2=> display <= "1101101"; 
          WHEN e3=> display <= "1111001"; 
          WHEN e4=> display <= "0110011"; 
          WHEN e5=> display <= "1011011";
          WHEN e6=> display <= "1011111";
          WHEN others => display <="-------"; 
        END CASE;
    END IF;
  END PROCESS;
END ARCHITECTURE;