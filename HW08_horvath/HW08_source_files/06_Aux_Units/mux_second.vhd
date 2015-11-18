LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY mux_second IS
   PORT( 
      input_0 : IN     std_logic_vector (31 DOWNTO 0);
      input_1 : IN     std_logic_vector (31 DOWNTO 0);
      sel     : IN     std_logic;
      output  : OUT    std_logic_vector (31 DOWNTO 0)
   );
END mux_second ;


ARCHITECTURE struct OF mux_second IS

BEGIN

-- Insert your code here --
    choose : process(input_0, input_1, sel)
    BEGIN
        if sel = '0' then
            output <= input_0;
        else
            output <= input_1;
        end if;
    end process choose;
---------------------------

END struct;
