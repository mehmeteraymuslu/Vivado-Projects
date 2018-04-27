----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2018 10:51:05 AM
-- Design Name: 
-- Module Name: LEDBlink - Behavioral
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

ENTITY part1 IS
PORT ( SIGNAL SW : IN STD_LOGIC;
SIGNAL LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); -- red LEDs
END part1;

ARCHITECTURE Behavior OF part1 IS
BEGIN
LEDG(0) <= SW;
LEDG(1) <= SW;
LEDG(2) <= SW;
LEDG(3) <= SW;
LEDG(4) <= SW;
LEDG(5) <= SW;
LEDG(6) <= SW;
LEDG(7) <= SW;
END Behavior;

