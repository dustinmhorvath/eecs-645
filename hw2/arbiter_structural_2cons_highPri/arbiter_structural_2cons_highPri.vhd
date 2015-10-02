----------------------------------------------------------------------------------
-- Company: University of Kansas
-- Engineer: Dustin Horvath
-- 
-- Create Date: 09/28/2015 09:08:39 PM
-- Design Name: arbiter_structural_2cons_highPri
-- Module Name: arbiter_structural_2cons_highPri - Structural
-- Project Name: EECS645 Homework 2
-- 
-- Revision: See latest git commit at http://git.nichnologist.net/dhorvath/eecs/tree/master/eecs645/hw2
-- Additional Comments: None
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Define toplevel I/O
entity arbiter_structural_2cons_highPri is
    PORT(
        REQ_1 : IN      STD_LOGIC;
        REQ_2 : IN      STD_LOGIC;
        clk   : IN      STD_LOGIC;
        rst   : IN      STD_LOGIC;
        ACK_1 : OUT     STD_LOGIC;
        ACK_2 : OUT     STD_LOGIC
    );
end arbiter_structural_2cons_highPri;


architecture struct_high_index_priority of arbiter_structural_2cons_highPri is
    -- Define interim signals
    SIGNAL s1_current , s2_current  :  std_logic;
    SIGNAL s1_next    , s2_next     :  std_logic;

begin


    -- Define memory elements
    memory_elements : PROCESS(clk, rst)
    
    -- Define reset logic and state cycle behavior
    BEGIN
        IF (rst = '1') THEN
            s1_current <= '0';
            s2_current <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            s1_current <= s1_next;
            s2_current <= s2_next;
        END IF;
    END PROCESS memory_elements;

-- Define next state logic
    s1_next <= ((REQ_1 and (not REQ_2) and (not s2_current)) or (REQ_1 and s1_current and (not s2_current)));
    s2_next <= ((not s1_current) and REQ_2);


-- Define output logic
    ACK_1 <= s1_current and (not s2_current);
    ACK_2 <= s2_current and (not s1_current);

end struct_high_index_priority;
