LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY DataMem IS
   PORT( 
      Address : IN     std_logic_vector (31 DOWNTO 0);
      MemWrite   : IN     std_logic;
      WriteData  : IN     std_logic_vector (31 DOWNTO 0);
      clk        : IN     std_logic;
      rst        : IN     std_logic;
      ReadData : OUT    std_logic_vector (31 DOWNTO 0)
   );
END DataMem ;


ARCHITECTURE behavioral OF DataMem IS

   -- Architecture declarations
   type data_memory_type is array(0 to 255) of std_logic_vector(31 downto 0);
      
   constant zero_register : std_logic_vector(31 downto 0) := (others => '0');
   constant initial_data_file : data_memory_type := (others => zero_register);

   -- Internal signal declarations
   SIGNAL data_mem : data_memory_type;

BEGIN

    clk_process : PROCESS (clk, rst)
    
    BEGIN
      IF (rst = '1') THEN
         -- Reset Actions
         data_mem <= initial_data_file;

      ELSIF (clk'EVENT AND clk = '1') THEN
         IF MemWrite = '1' THEN
            data_mem(CONV_INTEGER(UNSIGNED(Address))) <= WriteData;
         END IF;
      END IF;
   END PROCESS clk_process;

   ReadData <= data_mem(CONV_INTEGER(UNSIGNED(Address)));
   

END behavioral;
