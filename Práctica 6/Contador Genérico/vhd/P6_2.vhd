
--  CYPRESS NOVA XVL Structural Architecture

--  JED2VHD Reverse Assembler - 6.3 IR 35


--    VHDL File: P6_2.vhd

--    Date: Fri Nov 20 12:31:48 2020

--  Disassembly from Jedec file for: c22v10

--  Device Ordercode is: PALCE22V10-15PC
library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.primitive.all;


-- Beginning Test Bench Header

ENTITY contadorgenerico IS
    PORT (
	                 clk :    in std_logic ;
	                 clr :    in std_logic ;
	                  en :    in std_logic ;
	                  ud :    in std_logic ;
	                   l :    in std_logic ;
	                   d :    in std_logic_vector (6 downto 0) ;
	                   c : inout std_logic ;
	                   q : inout std_logic_vector (6 downto 0)
    );
END contadorgenerico;

-- End of Test Bench Header

ARCHITECTURE DSMB of contadorgenerico is

	signal jed_node1	: std_logic:='0' ; -- clk
	signal jed_node2	: std_logic:='0' ; -- d(6)
	signal jed_node3	: std_logic:='0' ; -- d(5)
	signal jed_node4	: std_logic:='0' ; -- d(4)
	signal jed_node5	: std_logic:='0' ; -- d(3)
	signal jed_node6	: std_logic:='0' ; -- d(2)
	signal jed_node7	: std_logic:='0' ; -- d(1)
	signal jed_node8	: std_logic:='0' ; -- d(0)
	signal jed_node9	: std_logic:='0' ; -- en
	signal jed_node10	: std_logic:='0' ; -- ud
	signal jed_node11	: std_logic:='0' ; -- l
	signal jed_node12	: std_logic:='0' ;
	signal jed_node13	: std_logic:='0' ; -- clr
	signal jed_node14	: std_logic:='0' ;
	signal jed_node15	: std_logic:='0' ;
	signal jed_node24	: std_logic:='0' ;

	for all: c22v10m use entity primitive.c22v10m (sim);

SIGNAL  one:std_logic:='1';
SIGNAL  zero:std_logic:='0';
SIGNAL  jed_oept_1:std_logic:='0';
--Attribute PIN_NUMBERS of clk:SIGNAL is "0001";

SIGNAL  jed_oept_2:std_logic:='0';
--Attribute PIN_NUMBERS of d(6):SIGNAL is "0002";

SIGNAL  jed_oept_3:std_logic:='0';
--Attribute PIN_NUMBERS of d(5):SIGNAL is "0003";

SIGNAL  jed_oept_4:std_logic:='0';
--Attribute PIN_NUMBERS of d(4):SIGNAL is "0004";

SIGNAL  jed_oept_5:std_logic:='0';
--Attribute PIN_NUMBERS of d(3):SIGNAL is "0005";

SIGNAL  jed_oept_6:std_logic:='0';
--Attribute PIN_NUMBERS of d(2):SIGNAL is "0006";

SIGNAL  jed_oept_7:std_logic:='0';
--Attribute PIN_NUMBERS of d(1):SIGNAL is "0007";

SIGNAL  jed_oept_8:std_logic:='0';
--Attribute PIN_NUMBERS of d(0):SIGNAL is "0008";

SIGNAL  jed_oept_9:std_logic:='0';
--Attribute PIN_NUMBERS of en:SIGNAL is "0009";

SIGNAL  jed_oept_10:std_logic:='0';
--Attribute PIN_NUMBERS of ud:SIGNAL is "0010";

SIGNAL  jed_oept_11:std_logic:='0';
--Attribute PIN_NUMBERS of l:SIGNAL is "0011";

SIGNAL  jed_oept_13:std_logic:='0';
--Attribute PIN_NUMBERS of clr:SIGNAL is "0013";

SIGNAL  jed_oept_16:std_logic:='0';
SIGNAL  jed_sum_16,jed_fb_16:std_logic:='0';
--Attribute PIN_NUMBERS of q(0):SIGNAL is "0016";

SIGNAL  jed_oept_17:std_logic:='0';
SIGNAL  jed_sum_17,jed_fb_17:std_logic:='0';
--Attribute PIN_NUMBERS of q(1):SIGNAL is "0017";

SIGNAL  jed_oept_18:std_logic:='0';
SIGNAL  jed_sum_18,jed_fb_18:std_logic:='0';
--Attribute PIN_NUMBERS of q(2):SIGNAL is "0018";

SIGNAL  jed_oept_19:std_logic:='0';
SIGNAL  jed_sum_19,jed_fb_19:std_logic:='0';
--Attribute PIN_NUMBERS of q(3):SIGNAL is "0019";

SIGNAL  jed_oept_20:std_logic:='0';
SIGNAL  jed_sum_20,jed_fb_20:std_logic:='0';
--Attribute PIN_NUMBERS of q(4):SIGNAL is "0020";

SIGNAL  jed_oept_21:std_logic:='0';
SIGNAL  jed_sum_21,jed_fb_21:std_logic:='0';
--Attribute PIN_NUMBERS of q(5):SIGNAL is "0021";

SIGNAL  jed_oept_22:std_logic:='0';
SIGNAL  jed_sum_22,jed_fb_22:std_logic:='0';
--Attribute PIN_NUMBERS of q(6):SIGNAL is "0022";

SIGNAL  jed_oept_23:std_logic:='0';
SIGNAL  jed_sum_23,jed_fb_23:std_logic:='0';
--Attribute PIN_NUMBERS of c:SIGNAL is "0023";

SIGNAL  jed_oept_25:std_logic:='0';
SIGNAL  jed_node25,jed_sum_25:std_logic:='0';
SIGNAL  jed_oept_26:std_logic:='0';
SIGNAL  jed_node26,jed_sum_26:std_logic:='0';

BEGIN
jed_node1 <= clk ;
jed_node2 <= d(6) ;
jed_node3 <= d(5) ;
jed_node4 <= d(4) ;
jed_node5 <= d(3) ;
jed_node6 <= d(2) ;
jed_node7 <= d(1) ;
jed_node8 <= d(0) ;
jed_node9 <= en ;
jed_node10 <= ud ;
jed_node11 <= l ;
jed_node13 <= clr ;
Mcell_16:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_16,
     clk=>jed_node1,
     oe=>jed_oept_16,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>q(0),
     fb=>jed_fb_16
   );

Mcell_17:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_17,
     clk=>jed_node1,
     oe=>jed_oept_17,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>q(1),
     fb=>jed_fb_17
   );

Mcell_18:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_18,
     clk=>jed_node1,
     oe=>jed_oept_18,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>q(2),
     fb=>jed_fb_18
   );

Mcell_19:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_19,
     clk=>jed_node1,
     oe=>jed_oept_19,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>q(3),
     fb=>jed_fb_19
   );

Mcell_20:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_20,
     clk=>jed_node1,
     oe=>jed_oept_20,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>q(4),
     fb=>jed_fb_20
   );

Mcell_21:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_21,
     clk=>jed_node1,
     oe=>jed_oept_21,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>q(5),
     fb=>jed_fb_21
   );

Mcell_22:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_22,
     clk=>jed_node1,
     oe=>jed_oept_22,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>q(6),
     fb=>jed_fb_22
   );

Mcell_23:c22v10m
generic map(reg,
   ninv,
   xreg,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	12 ns, --tar
	20 ns, --tap
	20 ns  --tspr
)
port map(
     d=>jed_sum_23,
     clk=>jed_node1,
     oe=>jed_oept_23,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>c,
     fb=>jed_fb_23
   );

jed_node25<=jed_sum_25;
jed_node26<=jed_sum_26;
jed_oept_16<=(one);

jed_sum_16<= (((not(jed_fb_22)) and (not(jed_fb_21)) and (not(jed_fb_20))
 and (not(jed_fb_19)) and (not(jed_fb_18)) and (not(jed_fb_17))
 and (not(jed_fb_16)) and (jed_node10)) or
(not(not(jed_fb_16)) and (jed_node9) and (jed_node10)
 and not(jed_node11)) or
((not(jed_fb_22)) and not(not(jed_fb_16)) and (jed_node9)
 and not(jed_node11)) or
((not(jed_fb_21)) and not(not(jed_fb_16)) and (jed_node9)
 and not(jed_node11)) or
((not(jed_fb_20)) and not(not(jed_fb_16)) and (jed_node9)
 and not(jed_node11)) or
((not(jed_fb_19)) and not(not(jed_fb_16)) and (jed_node9)
 and not(jed_node11)) or
((not(jed_fb_18)) and not(not(jed_fb_16)) and (jed_node9)
 and not(jed_node11)) or
((not(jed_fb_17)) and not(not(jed_fb_16)) and (jed_node9)
 and not(jed_node11)) or
((jed_node8) and (jed_node9) and not(jed_node10) and (jed_node11)
) or
((not(jed_fb_16)) and (jed_node10) and (jed_node11)
) or
((not(jed_fb_16)) and not(jed_node9)));

jed_oept_17<=(one);

jed_sum_17<= (((not(jed_fb_22)) and (not(jed_fb_21)) and (not(jed_fb_20))
 and (not(jed_fb_19)) and (not(jed_fb_18)) and (not(jed_fb_17))
 and (jed_node10)) or
((not(jed_fb_22)) and not(not(jed_fb_17)) and not(not(jed_fb_16))
 and (jed_node9) and not(jed_node10) and not(jed_node11)
) or
((not(jed_fb_21)) and not(not(jed_fb_17)) and not(not(jed_fb_16))
 and (jed_node9) and not(jed_node10) and not(jed_node11)
) or
((not(jed_fb_20)) and not(not(jed_fb_17)) and not(not(jed_fb_16))
 and (jed_node9) and not(jed_node10) and not(jed_node11)
) or
((not(jed_fb_19)) and not(not(jed_fb_17)) and not(not(jed_fb_16))
 and (jed_node9) and not(jed_node10) and not(jed_node11)
) or
((not(jed_fb_18)) and not(not(jed_fb_17)) and not(not(jed_fb_16))
 and (jed_node9) and not(jed_node10) and not(jed_node11)
) or
(not(not(jed_fb_17)) and (not(jed_fb_16)) and (jed_node9)
 and (jed_node10) and not(jed_node11)) or
((jed_node7) and (jed_node9) and not(jed_node10) and (jed_node11)
) or
((not(jed_fb_17)) and (not(jed_fb_16)) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_17)) and (jed_node10) and (jed_node11)
) or
((not(jed_fb_17)) and not(not(jed_fb_16)) and (jed_node10)
) or
((not(jed_fb_17)) and not(jed_node9)));

jed_oept_18<=(one);

jed_sum_18<= (((not(jed_fb_22)) and not(not(jed_fb_18)) and not(not(jed_fb_17))
 and not(not(jed_fb_16)) and (jed_node9) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_21)) and not(not(jed_fb_18)) and not(not(jed_fb_17))
 and not(not(jed_fb_16)) and (jed_node9) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_20)) and not(not(jed_fb_18)) and not(not(jed_fb_17))
 and not(not(jed_fb_16)) and (jed_node9) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_19)) and not(not(jed_fb_18)) and not(not(jed_fb_17))
 and not(not(jed_fb_16)) and (jed_node9) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_22)) and (not(jed_fb_21)) and (not(jed_fb_20))
 and (not(jed_fb_19)) and (not(jed_fb_18)) and (jed_node10)
) or
(not(not(jed_fb_18)) and (not(jed_fb_17)) and (not(jed_fb_16))
 and (jed_node9) and (jed_node10) and not(jed_node11)
) or
((not(jed_fb_18)) and (not(jed_fb_17)) and not(not(jed_fb_16))
 and not(jed_node11)) or
((jed_node6) and (jed_node9) and not(jed_node10) and (jed_node11)
) or
((not(jed_fb_18)) and (not(jed_fb_16)) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_18)) and (jed_node10) and (jed_node11)
) or
((not(jed_fb_18)) and not(not(jed_fb_17)) and (jed_node10)
) or
((not(jed_fb_18)) and not(jed_node9)));

jed_oept_19<=(one);

jed_sum_19<= (((not(jed_fb_22)) and not(not(jed_fb_19)) and not(not(jed_fb_18))
 and not(not(jed_fb_17)) and not(not(jed_fb_16)) and (jed_node9)
 and not(jed_node10) and not(jed_node11)) or
((not(jed_fb_21)) and not(not(jed_fb_19)) and not(not(jed_fb_18))
 and not(not(jed_fb_17)) and not(not(jed_fb_16)) and (jed_node9)
 and not(jed_node10) and not(jed_node11)) or
((not(jed_fb_20)) and not(not(jed_fb_19)) and not(not(jed_fb_18))
 and not(not(jed_fb_17)) and not(not(jed_fb_16)) and (jed_node9)
 and not(jed_node10) and not(jed_node11)) or
(not(not(jed_fb_19)) and (not(jed_fb_18)) and (not(jed_fb_17))
 and (not(jed_fb_16)) and (jed_node9) and (jed_node10)
 and not(jed_node11)) or
((not(jed_fb_22)) and (not(jed_fb_21)) and (not(jed_fb_20))
 and (not(jed_fb_19)) and (jed_node10)) or
((not(jed_fb_19)) and (not(jed_fb_18)) and not(not(jed_fb_16))
 and not(jed_node11)) or
((not(jed_fb_19)) and not(not(jed_fb_18)) and (not(jed_fb_17))
 and not(jed_node11)) or
((jed_node5) and (jed_node9) and not(jed_node10) and (jed_node11)
) or
((not(jed_fb_19)) and (not(jed_fb_16)) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_19)) and (jed_node10) and (jed_node11)
) or
((not(jed_fb_19)) and not(not(jed_fb_17)) and (jed_node10)
) or
((not(jed_fb_19)) and not(jed_node9)));

jed_oept_20<=(one);

jed_sum_20<= (((not(jed_fb_22)) and not(not(jed_fb_20)) and not(not(jed_fb_19))
 and not(not(jed_fb_18)) and not(not(jed_fb_17)) and not(not(jed_fb_16))
 and (jed_node9) and not(jed_node10) and not(jed_node11)
) or
((not(jed_fb_21)) and not(not(jed_fb_20)) and not(not(jed_fb_19))
 and not(not(jed_fb_18)) and not(not(jed_fb_17)) and not(not(jed_fb_16))
 and (jed_node9) and not(jed_node10) and not(jed_node11)
) or
(not(not(jed_fb_20)) and (not(jed_fb_19)) and (not(jed_fb_18))
 and (not(jed_fb_17)) and (not(jed_fb_16)) and (jed_node9)
 and (jed_node10) and not(jed_node11)) or
((not(jed_fb_22)) and (not(jed_fb_21)) and (not(jed_fb_20))
 and (jed_node10)) or
((not(jed_fb_20)) and (not(jed_fb_18)) and not(not(jed_fb_17))
 and not(jed_node11)) or
((not(jed_fb_20)) and (not(jed_fb_19)) and not(not(jed_fb_18))
 and not(jed_node11)) or
((not(jed_fb_20)) and not(not(jed_fb_19)) and (not(jed_fb_16))
 and not(jed_node11)) or
((jed_node4) and (jed_node9) and not(jed_node10) and (jed_node11)
) or
((not(jed_fb_20)) and (not(jed_fb_17)) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_20)) and (jed_node10) and (jed_node11)
) or
((not(jed_fb_20)) and not(not(jed_fb_16)) and (jed_node10)
) or
((not(jed_fb_20)) and not(jed_node9)));

jed_oept_21<=(one);

jed_sum_21<= (((not(jed_fb_22)) and not(not(jed_fb_21)) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and not(not(jed_fb_18)) and not(not(jed_fb_17))
 and not(not(jed_fb_16)) and (jed_node9) and not(jed_node10)
 and not(jed_node11)) or
(not(not(jed_fb_21)) and (not(jed_fb_20)) and (not(jed_fb_19))
 and (not(jed_fb_18)) and (not(jed_fb_17)) and (not(jed_fb_16))
 and (jed_node9) and (jed_node10) and not(jed_node11)
) or
((not(jed_fb_21)) and (not(jed_fb_20)) and not(not(jed_fb_16))
 and not(jed_node11)) or
((not(jed_fb_21)) and (not(jed_fb_18)) and not(not(jed_fb_17))
 and not(jed_node11)) or
((not(jed_fb_21)) and (not(jed_fb_19)) and not(not(jed_fb_18))
 and not(jed_node11)) or
((not(jed_fb_21)) and not(not(jed_fb_20)) and (not(jed_fb_17))
 and not(jed_node11)) or
((jed_node3) and (jed_node9) and not(jed_node10) and (jed_node11)
) or
((not(jed_fb_21)) and (not(jed_fb_16)) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_22)) and (not(jed_fb_21)) and (jed_node10)
) or
((not(jed_fb_21)) and (jed_node10) and (jed_node11)
) or
((not(jed_fb_21)) and not(not(jed_fb_19)) and (jed_node10)
) or
((not(jed_fb_21)) and not(jed_node9)));

jed_oept_22<=(one);

jed_sum_22<= (((not(jed_fb_21)) and (not(jed_fb_20)) and (not(jed_fb_19))
 and (not(jed_fb_18)) and (not(jed_fb_17)) and (not(jed_fb_16))
 and (jed_node9) and (jed_node10) and not(jed_node11)
) or
((jed_node2) and (jed_node9) and not(jed_node10) and (jed_node11)
) or
((not(jed_fb_22)) and (not(jed_fb_21)) and not(jed_node11)
) or
((not(jed_fb_22)) and (not(jed_fb_20)) and not(jed_node11)
) or
((not(jed_fb_22)) and (not(jed_fb_19)) and not(jed_node11)
) or
((not(jed_fb_22)) and (not(jed_fb_18)) and not(jed_node11)
) or
((not(jed_fb_22)) and (not(jed_fb_17)) and not(jed_node11)
) or
((not(jed_fb_22)) and (not(jed_fb_16)) and not(jed_node11)
) or
((not(jed_fb_22)) and (jed_node10)) or
((not(jed_fb_22)) and not(jed_node9)));

jed_oept_23<=(one);

jed_sum_23<= (((not(jed_fb_22)) and (not(jed_fb_21)) and (not(jed_fb_20))
 and (not(jed_fb_19)) and (not(jed_fb_18)) and (not(jed_fb_17))
 and (not(jed_fb_16)) and (jed_node9) and (jed_node10)
 and not(jed_node11)) or
(not(not(jed_fb_22)) and not(not(jed_fb_21)) and not(not(jed_fb_20))
 and not(not(jed_fb_19)) and not(not(jed_fb_18)) and not(not(jed_fb_17))
 and not(not(jed_fb_16)) and (jed_node9) and not(jed_node10)
 and not(jed_node11)) or
((not(jed_fb_23)) and (jed_node11)) or
((not(jed_fb_23)) and not(jed_node9)));

jed_sum_25<= (((jed_node13)));

end DSMB;
