library ieee;
use ieee.std_logic_1164.all;

entity p2 is port (

    d, t, s, r, j, k, clk, clr : in std_logic;
    sel : in std_logic_vector(1 downto 0);
    sal : out std_logic_vector(5 downto 0)
);
attribute PIN_NUMBERS of p2 : entity is (
	"sal(0):14 sal(1):15 sal(2):16 sal(3):17 sal(4):18 sal(5):19 "
);
end p2;


architecture Ap2 of p2 is

signal qd, qt, qsr, qjk : std_logic;
signal mux : std_logic;

begin
    --Flip-Flop D
    process (clk, clr )
    begin
        if (clr = '1') then
            qd <= '0';
        elsif (clk'event and clk = '1') then
            qd <= d;
        end if;   
    end process;

    --Flip-Flop T
    process (clk, clr )
    begin
        if (clr = '1') then
            qt <= '0';
        elsif (clk'event and clk = '1') then
            qt <= (t and (not qt)) or ((not t) and qt);
        end if;   
    end process;


    --Flip-Flop SR
    process (clk, clr )
    begin
        if (clr = '1') then
            qsr <= '0';
        elsif (clk'event and clk = '1') then
            qsr <= (s) or ((not r) and qsr);
        end if;   
    end process;

    process (clk, clr )
    begin
        if (clr = '1') then
            qjk <= '0';
        elsif (clk'event and clk = '1') then
            qjk <= (j and (not qjk)) or ((not k) and qjk);
        end if;   
    end process;
    
    process (mux, qd, qt, qsr, qjk, sel)
    begin
        if( sel = "00") then
            mux <= qjk;
        elsif ( sel = "01") then    
            mux <= qt;
        elsif ( sel = "10") then
            mux <= qd;
        else
            mux <= qsr;
        end if;
    end process;
    
    sal <= "111111" when (mux = '0') else   
        "011000";

    
end Ap2;