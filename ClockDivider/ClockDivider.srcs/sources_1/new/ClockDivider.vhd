----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2018 11:08:50 AM
-- Design Name: 
-- Module Name: ClockDivider - Behavioral
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

entity ClockDivider is
    generic(
    division_rate : integer);
    port (
    clk, reset: in std_logic;
    clock_out: out std_logic
    );
end ClockDivider;

architecture clkdivider of ClockDivider is

signal count: integer:=1;
signal clk_tmp : std_logic := '0';

begin
    process (clk, reset, clk_tmp)
        begin
            --Stop Clock with Reset
            if(reset='1') then
            count<=1;
            clk_tmp<='0';
            --Clock Divider
            elsif(rising_edge(clk)) then
            count <=count+1;
                if (count = division_rate) then --Division Rate
                clk_tmp <= NOT clk_tmp;
                count <= 1;
                end if;
            end if;
        clock_out <= clk_tmp;
    end process;
end clkdivider;