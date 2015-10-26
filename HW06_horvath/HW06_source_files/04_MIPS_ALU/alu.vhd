LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;

ENTITY ALU IS
   PORT( 
      A           : IN     std_logic_vector (31 DOWNTO 0);
      ALU_control : IN     std_logic_vector (3 DOWNTO 0);
      B           : IN     std_logic_vector (31 DOWNTO 0);
      ALU_result  : OUT    std_logic_vector (31 DOWNTO 0);
      zero        : OUT    std_logic
   );
END ALU ;


ARCHITECTURE behav OF ALU IS

   -- Architecture declarations
   constant zero_value : std_logic_vector(31 downto 0) := (others => '0');

   -- Internal signal declarations
   SIGNAL ALU_result_internal : std_logic_vector(31 DOWNTO 0);

--0000 AND
--0001 OR
--0010 add
--0110 sub
--0111 slt
--1100 nor

BEGIN
    ALU_result <= ALU_result_internal;
   
   -- insert your design here --
    compute : process(A, B, ALU_control)
    BEGIN
    
        if ALU_control = "0000" then
            ALU_result_internal <= A and B;
            end if;
        if ALU_control = "0001" then
            ALU_result_internal <= A or B;
            end if;
        if ALU_control = "0010" then
            ALU_result_internal <= A + B;
            end if;
        if ALU_control = "0110" then
            ALU_result_internal <= A - B;
            end if;
        if ALU_control = "0111" then
            if A < B then 
                ALU_result_internal <= std_logic_vector(conv_std_logic_vector(1,32));
            else
                ALU_result_internal <= std_logic_vector(conv_std_logic_vector(0,32));
            
                end if;
            end if;
        if ALU_control = "1100" then
            ALU_result_internal <= A nor B;
            end if;
            
        
    
    
    end process compute;
    
    zero_compute : process(ALU_result_internal)
        BEGIN
            if ALU_result_internal = "00000000000000000000000000000000" then
                zero <= '1';
                else
                   zero <= '0';
                end if;
    end process zero_compute;
   -----------------------------
   
END behav;
