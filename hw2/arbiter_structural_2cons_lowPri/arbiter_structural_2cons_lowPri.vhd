----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2015 09:08:39 PM
-- Design Name: 
-- Module Name: arbiter_structural_2cons_lowPri - Structural
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


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY arbiter_structural_2cons_lowPri IS
    PORT(
        REQ_1 : IN      STD_LOGIC;
        REQ_2 : IN      STD_LOGIC;
        clk   : IN      STD_LOGIC;
        rst   : IN      STD_LOGIC;
        ACK_1 : OUT     STD_LOGIC;
        ACK_2 : OUT     STD_LOGIC
    );
END arbiter_structural_2cons_lowPri;

ARCHITECTURE struct_low_index_priority of arbiter_structural_2cons_lowPri IS
    SIGNAL s1_current , s2_current  :  std_logic;
    SIGNAL s1_next    , s2_next     :  std_logic;

BEGIN
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

    s1_next <= ((not s2_current) and REQ_1);
    s2_next <= (((not s1_current) and (not REQ_1) and REQ_2) or ((not s1_current) and S2_current and REQ_2));

    ----------------------------------
    -- output logic
    ----------------------------------

    ACK_1 <= s1_current and (not s2_current);
    ACK_2 <= s2_current and (not s1_current);

END struct_low_index_priority;
