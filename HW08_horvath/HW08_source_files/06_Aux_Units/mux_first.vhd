LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY mux_first IS
   PORT( 
      instruction_15_11 : IN     std_logic_vector (4 DOWNTO 0);
      instruction_20_16 : IN     std_logic_vector (4 DOWNTO 0);
      sel               : IN     std_logic;
      output            : OUT    std_logic_vector (4 DOWNTO 0)
   );
END mux_first ;


ARCHITECTURE struct OF mux_first IS

BEGIN

-- Insert your code here --
    choose : process(instruction_15_11, instruction_20_16, sel)
    BEGIN
        if sel = '0' then
            output <= instruction_20_16;
        else
            output <= instruction_15_11;
        end if;
    end process choose;
---------------------------

END struct;
