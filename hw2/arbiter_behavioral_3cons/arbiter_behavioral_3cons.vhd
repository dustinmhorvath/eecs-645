----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2015 09:25:35 PM
-- Design Name: 
-- Module Name: arbiter_behavioral_3cons - Behavioral
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


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY arbiter_behavioral_3cons IS
    PORT(
        REQ_1  :  IN    std_logic;
        REQ_2  :  IN    std_logic;
        REQ_3  :  IN    std_logic;
        clk    :  IN    std_logic;
        rst    :  IN    std_logic;
        ACK_1  :  OUT   std_logic;
        ACK_2  :  OUT   std_logic
	);
END arbiter_behavioral_3cons;

ARCHITECTURE behavioral_3cons OF arbiter_behavioral_3cons IS

	SUBTYPE STATE_TYPE IS
		std_logic_vector (1 DOWNTO 0);
	
	-- Hard coding for states
	CONSTANT NO_ACCESS  :  STATE_TYPE  :=  "00"  ;
	CONSTANT Con_01     :  STATE_TYPE  :=  "10"  ;
	CONSTANT Con_02     :  STATE_TYPE  :=  "11"  ;
	CONSTANT Con_03     :  STATE_TYPE  :=  "01"  ;
    
	-- Signals for states
	SIGNAL current_state : STATE_TYPE;
	SIGNAL next_state    : STATE_TYPE;
	
	SIGNAL REQ_VEC       : std_logic_vector (1 TO 3);
	
BEGIN

    REQ_VEC <= (REQ_1 & REQ_2 & REQ_3);
    
    ---------------------------------
    -- Memory elements defined
    ---------------------------------
	
	memory_elements  :  PROCESS(clk, rst)
	BEGIN
        IF (rst = '1') THEN
            current_state <= NO_ACCESS;
        ELSIF (clk'EVENT AND clk = '1') THEN
            current_state <= next_state;
        END IF;
    END PROCESS memory_elements;
    
    ---------------------------------
    -- State logic defined
    ---------------------------------
    
    state_logic  :  PROCESS (REQ_VEC, current_state)
    BEGIN
        CASE current_state IS
        WHEN NO_ACCESS =>
            next_state <= NO_ACCESS;
            IF (REQ_VEC = "100") THEN
                next_state <= Con_01;
            END IF;
            IF (REQ_VEC = "010") THEN
                next_state <= Con_02;
            END IF;
            IF (REQ_VEC = "001") THEN
                next_state <= Con_03;
            END IF;
        WHEN Con_01 =>
            next_state <= Con_01;
            IF (REQ_VEC(1) = '0') THEN
                next_state <= NO_ACCESS;
            END IF;
        WHEN Con_02 =>
            next_state <= Con_02;
            IF (REQ_VEC(2) = '0') THEN
                next_state <= NO_ACCESS;
            END IF;
        WHEN Con_03 =>
            next_state <= Con_03;
            IF (REQ_VEC(3) = '0') THEN
                next_state <= NO_ACCESS;
            END IF;
        WHEN OTHERS =>
            next_state <= NO_ACCESS;
        END CASE;
    END PROCESS state_logic;
    
    ---------------------------------
    -- Define output logic
    ---------------------------------
    
    output_logic  :  PROCESS (current_state)
    BEGIN
        CASE current_state IS
        WHEN Con_01 =>
            ACK_1 <= '1';
            ACK_2 <= '0';
        WHEN Con_02 =>
            ACK_1 <= '1';
            ACK_2 <= '1';
        WHEN Con_03 =>
            ACK_1 <= '0';
            ACK_2 <= '1';
        WHEN OTHERS =>
            ACK_1 <= '0';
            ACK_2 <= '0';
        END CASE;
    END PROCESS output_logic;
END behavioral_3cons;