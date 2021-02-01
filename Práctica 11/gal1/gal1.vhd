library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity cartaASM is port(
    d : in std_logic_vector (5 downto 0);
    clk, clr, ini : in std_logic;
    a : out std_logic_vector(5 downto 0);
    lb, eb, ec : out std_logic
);
attribute PIN_NUMBERS of cartaASM : entity is
    " clk:1 d(5):2 d(4):3 d(3):4 d(2):5 d(1):6 d(0):7 "&
    " ini:8 clr:13 "&
    " ec:22 eb:21 lb:20 a(5):19 a(4):18 a(3):17 a(2):16 a(1):15 a(0):14 ";   
end cartaASM;

architecture a_cartaASM of cartaASM is 

signal la, ea, z, a0 : std_logic;
type estados is (e0, e1, e2);
signal edo_act, edo_sig : estados;

begin

    process ( clr, clk )
    begin
        if ( clr = '1' ) then
            edo_act <= e0;
        elsif ( rising_edge(clk) ) then
            edo_act <= edo_sig;
        end if;
    end process;
	
	 
    process ( edo_act, ini, a0, z )
    begin
        la <= '0';
        lb <= '0';
        ea <= '0';
        eb <= '0';
        ec <= '0';
        case edo_act is
            -- Estado e0 
            when e0 =>
                lb <= '1';
                if ( ini = '1' ) then
                    edo_sig <= e1;
                elsif ( ini = '0' ) then
                    la <= '1';
                    edo_sig <= e0;
            end if;

            -- Estado e1
            when e1 =>
                ea <= '1';
                if ( z = '1' ) then
                    edo_sig <= e2;
                elsif ( z = '0' ) then 
                    if ( a0 = '1' ) then
                        eb <= '1';
                    elsif ( a0 = '0' ) then
                        edo_sig <= e1;
                    end if;
            end if;
            
            -- Estado e2
            when e2 => 
                ec <= '1';
                if ( ini = '1' ) then
                    edo_sig <= e2;
                elsif ( ini = '0' ) then
                    edo_sig <= e0;   
            end if;
        end case;
    end process;

    process( clk , clr ) 
    begin
        if ( clr = '1' ) then
            a <= "000000";
        elsif ( rising_edge(clk) ) then
            if( ea = '0' and la = '1') then
                a <= d;
            elsif ( ea = '1' and la = '0' ) then
                a <= '0' & a(5 downto 1);
            elsif (ea = '0' and la = '0' ) then
                    a <= a;
            end if;
        end if;
    end process; 

    a0 <= a(0);
    z <= not(a(5) or a(4) or a(3) or a(2) or a(1) or a(0));

end a_cartaASM;