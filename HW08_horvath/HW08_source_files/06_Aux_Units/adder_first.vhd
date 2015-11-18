LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;

ENTITY adder_first IS
   PORT( 
      PC            : IN     std_logic_vector (31 DOWNTO 0);
      PC_icremented : OUT    std_logic_vector (31 DOWNTO 0)
   );
END adder_first ;


ARCHITECTURE struct OF adder_first IS
    
BEGIN

-- Insert your code here --
    add : process(PC)
    BEGIN
        PC_icremented <= conv_std_logic_vector((unsigned(PC) + 4), 32);
    end process add;
---------------------------

END struct;
