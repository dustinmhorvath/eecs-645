----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2015 09:08:39 PM
-- Design Name: 
-- Module Name: arbiter_structural_3cons - Structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arbiter_structural_3cons is
    PORT(
        REQ_1 : IN      STD_LOGIC;
        REQ_2 : IN      STD_LOGIC;
        REQ_3 : IN      STD_LOGIC;
        clk   : IN      STD_LOGIC;
        rst   : IN      STD_LOGIC;
        ACK_1 : OUT     STD_LOGIC;
        ACK_2 : OUT     STD_LOGIC;
        ACK_3 : OUT     STD_LOGIC
    );
end arbiter_structural_3cons;

architecture struct_no_priority of arbiter_structural_3cons is
    SIGNAL s1_current , s2_current  :  std_logic;
    SIGNAL s1_next    , s2_next     :  std_logic;

begin
    ----------------------------------
    -- memory elements
    ----------------------------------
    memory_elements : PROCESS(clk, rst)
    
    BEGIN
        IF (rst = '1') THEN
            s1_current <= '0';
            s2_current <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            s1_current <= s1_next;
            s2_current <= s2_next;
        END IF;
    END PROCESS memory_elements;

    ----------------------------------
    -- state logic
    ----------------------------------

    s1_next <= (    (s1_current and s2_current and REQ_2) or 
                    (s1_current and (not s2_current) and REQ_1) or 
                    ((not s2_current) and REQ_1 and (not REQ_2) and (not REQ_3)) or 
                    ((not s1_current) and (not s2_current) and (not REQ_1) and REQ_2 and (not REQ_3))
                    );
    s2_next <= (    ((not s1_current) and (not REQ_1) and (not REQ_2) and REQ_3) or
                    (s2_current and (not REQ_1) and REQ_2 and REQ_3) or
                    (s1_current and s2_current and REQ_2) or
                    ((not s1_current) and s2_current and REQ_1 and REQ_3) or
                    ((not s1_current) and (not s2_current) and (not REQ_1) and REQ_2 and (not REQ_3))
                    );

    ----------------------------------
    -- output logic
    ----------------------------------

    ACK_1 <= s1_current and (not s2_current);
    ACK_2 <= s1_current and s2_current;
    ACK_3 <= (not s1_current) and s2_current;

end struct_no_priority;
