LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY PC_register IS
   PORT( 
      PC_next : IN     std_logic_vector (31 DOWNTO 0);
      clk     : IN     std_logic;
      rst     : IN     std_logic;
      PC      : OUT    std_logic_vector (31 DOWNTO 0)
   );
END PC_register ;


ARCHITECTURE struct OF PC_register IS


BEGIN
    
   rotate : PROCESS (PC_next, clk, rst)
   ---------------------------------------------------------------------------
   BEGIN
      IF (rst = '1') THEN
         PC <= x"00400000";

      ELSIF (clk'EVENT AND clk = '1') THEN
         PC <= PC_next;
      END IF;
   END PROCESS rotate;
---------------------------

END struct;
