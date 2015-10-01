----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2015 03:09:11 PM
-- Design Name: 
-- Module Name: arbiter_structural_2cons_highPriv_tb - Structural
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY arbiter_structural_2cons_highPri_tb IS
END arbiter_structural_2cons_highPri_tb;

ARCHITECTURE behavior OF arbiter_structural_2cons_highPri_tb IS

    COMPONENT arbiter_structural_2cons_highPri
     PORT(
        REQ_1  : IN     std_logic;
        REQ_2  : IN     std_logic;
        clk    : IN     std_logic;
        rst    : IN     std_logic;
        ACK_1  : OUT    std_logic;
        ACK_2  : OUT    std_logic
    );
    END COMPONENT;
    
    signal REQ_1  :  std_logic  := '0';
    signal REQ_2  :  std_logic  := '0';
    signal clk    :  std_logic  := '0';
    signal rst    :  std_logic  := '0';
    
    
    signal ACK_1  :  std_logic;
    signal ACK_2  :  std_logic;
    
    constant clk_period  :  time  := 10 ns;
    
BEGIN

    -- Unit Under Test
    uut: arbiter_structural_2cons_highPri PORT MAP(
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