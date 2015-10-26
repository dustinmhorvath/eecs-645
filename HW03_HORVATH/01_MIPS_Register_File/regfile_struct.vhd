LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY RegFile IS
   PORT( 
      ReadAddr_1 : IN     std_logic_vector (4 DOWNTO 0);
      ReadAddr_2 : IN     std_logic_vector (4 DOWNTO 0);
      RegWrite   : IN     std_logic;
      WriteAddr  : IN     std_logic_vector (4 DOWNTO 0);
      WriteData  : IN     std_logic_vector (31 DOWNTO 0);
      clk        : IN     std_logic;
      rst        : IN     std_logic;
      ReadData_1 : OUT    std_logic_vector (31 DOWNTO 0);
      ReadData_2 : OUT    std_logic_vector (31 DOWNTO 0)
   );
END RegFile ;


ARCHITECTURE bahvioral OF RegFile IS

   -- Architecture declarations
   type reg_file_mem_type is array(0 to 31) of std_logic_vector(31 downto 0);
      
   constant zero_register : std_logic_vector(31 downto 0) := (others => '0');
   constant initial_reg_file : reg_file_mem_type := (others => zero_register);

   -- Internal signal declarations
   SIGNAL reg_file_mem : reg_file_mem_type;

BEGIN
   ---------------------------------------------------------------------------
   process1 : PROCESS (clk, rst)
   ---------------------------------------------------------------------------
   BEGIN
      -- Asynchronous Reset
      IF (rst = '1') THEN
         -- Reset Actions
         reg_file_mem <= initial_reg_file;

      ELSIF (clk'EVENT AND clk = '1') THEN
         IF RegWrite = '1' THEN
            reg_file_mem(CONV_INTEGER(UNSIGNED(WriteAddr))) <= WriteData;
         END IF;
      END IF;
   END PROCESS process1;

   ReadData_1 <= reg_file_mem(CONV_INTEGER(UNSIGNED(ReadAddr_1)));
   ReadData_2 <= reg_file_mem(CONV_INTEGER(UNSIGNED(ReadAddr_2)));

END bahvioral;
