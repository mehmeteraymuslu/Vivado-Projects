----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2018 01:05:58 PM
-- Design Name: 
-- Module Name: ClockDividerTop - Behavioral
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

entity ClockDividerTop is
  Port (
  clk : in std_logic;
  reset : in std_logic;
  clk_out : out std_logic
  );
end ClockDividerTop;

architecture divider of ClockDividerTop is

component ClockDivider
    generic(
    division_rate : integer);
    port (
    clk, reset: in std_logic;
    clock_out: out std_logic
    );
end component;

begin
    CLK_DVDR1 : ClockDivider 
        generic map(division_rate => 100000000)
        port map(clk => clk, reset => reset, clock_out => clk_out);
end divider;
