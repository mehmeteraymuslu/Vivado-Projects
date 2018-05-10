----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2018 05:14:42 PM
-- Design Name: 
-- Module Name: USR - behavior
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


-------------------------------------------------------------------------------
-- File:        USR.vhd
-- Engineer:    Jordan Christman
-- Description:    This is an implementation of a 8 bit universal shift register 
--                 behavioral architecture.
-------------------------------------------------------------------------------
-- Librarys
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
-- Entity Declariation
entity USR is 
generic (
    data_width     : integer := 8);
port (
    A         : out std_logic_vector(data_width - 1 downto 0);
    I         : in std_logic_vector(data_width - 1 downto 0);
    S        : in std_logic_vector(1 downto 0);
    reset     : in std_logic;
    clk        : in std_logic);
end USR;
-- Architecture Body
architecture behavior of USR is
signal A_reg    : std_logic_vector(data_width - 1 downto 0) := (others => '0');
begin
    A <= A_reg;
    
    -- Process for all shift register operations
    USR_proc: process(clk)
    begin
        if(rising_edge(clk)) then
            if(reset = '1') then
                A_reg <= (others => '0');
            else
                case S is
                    when "00" => -- Hold
                        A_reg <= A_reg;
                        
                    when "01" => -- Right shift
                        A_reg(data_width - 1) <= '0';
                        A_reg(data_width - 2 downto 0) <= A_reg(data_width - 1 downto 1);
                        
                    when "10" => -- Left shift
                        A_reg(data_width - 1 downto 1) <= A_reg(data_width - 2 downto 0);
                        A_reg(0) <= '0';
                        
                    when "11" => -- Parallel Load
                        A_reg <= I;
                        
                    when others => -- Error code
                        A_reg <= (others => 'X');
                        
                end case;
            end if;
        end if;
    end process USR_proc;
end behavior;
