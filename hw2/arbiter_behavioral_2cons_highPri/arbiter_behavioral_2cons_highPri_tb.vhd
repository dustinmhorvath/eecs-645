----------------------------------------------------------------------------------
-- Company: University of Kansas
-- Engineer: Dustin Horvath
-- 
-- Create Date: 09/28/2015 09:08:39 PM
-- Design Name: arbiter_behavioral_2cons_highPri_tb
-- Module Name: arbiter_behavioral_2cons_highPri_tb - Behavioral
-- Project Name: EECS645 Homework 2
--
-- Revision: See latest git commit at http://git.nichnologist.net/dhorvath/eecs/tree/master/eecs645/hw2
-- Additional Comments: None
-- 
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY arbiter_behavioral_2cons_highPri_tb IS
END arbiter_behavioral_2cons_highPri_tb;

ARCHITECTURE behavior OF arbiter_behavioral_2cons_highPri_tb IS

    COMPONENT arbiter_behavioral_2cons_highPri
        -- Define toplevel I/O
        PORT(
            REQ_1  : IN     std_logic;
            REQ_2  : IN     std_logic;
            clk    : IN     std_logic;
            rst    : IN     std_logic;
            ACK_1  : OUT    std_logic;
            ACK_2  : OUT    std_logic
        );
    END COMPONENT;

    -- Define interim signals
    signal REQ_1  :  std_logic  := '0';
    signal REQ_2  :  std_logic  := '0';
    signal clk    :  std_logic  := '0';
    signal rst    :  std_logic  := '0';
    
    
    signal ACK_1  :  std_logic;
    signal ACK_2  :  std_logic;
    
    constant clk_period  :  time  := 10 ns;
    
BEGIN

    -- Unit Under Test
    -- Map elements of simulation to elements of UUT
    uut: arbiter_behavioral_2cons_highPri PORT MAP(
                    REQ_1 => REQ_1,
                    REQ_2 => REQ_2,
                    clk => clk,
                    rst => rst,
                    ACK_1 => ACK_1,
                    ACK_2 => ACK_2
                );
    
    clk_process :process
    begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
    end process;
    
    
    stim_proc: process
    begin
            rst <= '1';
        wait for clk_period*3;
            rst <= '0';
        wait for clk_period*3;
        
        --begin stimulus
            REQ_1 <= '1';
            REQ_2 <= '1';
        wait for clk_period*3;
            REQ_1 <= '1';
            REQ_2 <= '0';
        wait for clk_period*3;
            REQ_1 <= '1';
            REQ_2 <= '1';
        wait for clk_period*3;
            REQ_1 <= '0';
            REQ_2 <= '1';
        wait for clk_period*3;
            REQ_1 <= '1';
            REQ_2 <= '1';
        wait for clk_period*3;
            REQ_1 <= '1';
            REQ_2 <= '0';
        wait for clk_period*3;
            REQ_1 <= '1';
            REQ_2 <= '1';
        wait for clk_period*3;
            REQ_1 <= '0';
            REQ_2 <= '0';
        wait for clk_period*3;
            REQ_1 <= '0';
            REQ_2 <= '1';
        wait for clk_period*3;
        
            rst <= '1';
        wait for clk_period*3;
            rst <= '1';
        wait for clk_period*3;
        
        wait;
    end process;

END;