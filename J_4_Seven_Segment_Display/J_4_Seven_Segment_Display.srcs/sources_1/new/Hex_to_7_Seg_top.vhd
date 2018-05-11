----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2018 08:58:19 AM
-- Design Name: 
-- Module Name: Hex_to_7_Seg_top - behavior
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
-- File:        Lab_4.vhd
-- Engineer:    Jordan Christman
-- Description:    This is a top level design that uses a Hex_to_7_Seg.vhd design
--                by instantiation of 2 components "seg0" and "seg1"
-------------------------------------------------------------------------------
-- Lab 4 Tasks (Part 2)
-- 1) Fill in the "?" with the correct values
-- 
-- 2) Implement Lab_4.vhd on your BASYS 2 board
---------------------------------------------------
-- Use the comments to help you figure out how to
-- get this design to work
---------------------------------------------------
-- *** NOTE ***
--     This should be your Top Level Design file in Xilinx ISE or Quartus II
-- *** NOTE ***
-- Library's
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
-- *** NOTE ***
-- There appears to be only one 7 segment display output
-- This is because we are multiplexing the output which means
-- We are alternating the display output on the same lines
-- *** NOTE ***
-- Entity Declaration
entity Lab_4 is
port (
    seg_out        : out std_logic_vector(6 downto 0);
    enable0        : out std_logic;
    enable1        : out std_logic;
    enable2        : out std_logic;
    enable3        : out std_logic;
    hex_in_0    : in std_logic_vector(3 downto 0);
    hex_in_1    : in std_logic_vector(3 downto 0);
    clk         : in std_logic;
    reset        : in std_logic);
end Lab_4;
-- Architecture Body
architecture behavior of Lab_4 is
--------------------------------
-- Component Instantiations
-- 7 segment display
--------------------------------
component Hex_to_7_Seg
port (
    seven_seg         : out std_logic_vector( 6 downto 0);
    hex             : in std_logic_vector(3 downto 0));
end component;
-- Signals for holding each 7 segment displays value
signal Seg_0    : std_logic_vector(6 downto 0);
signal Seg_1    : std_logic_vector(6 downto 0);
-- Signals for Multiplexing the 7 Segment Display
-- The BASYS 2 Board has a default input clock of 50MHz 
-- a 25-bit counter is required to count to 50000000 (50 million (50 MHz))
-- we will be counting to 100,000 to achieve a 500Hz refresh rate
-- This is computed by 50,000,000 / 500 = 100,000
signal counter        : unsigned(25 downto 0) := to_unsigned(0, 26); -- counts every clock pulse
constant maxcount    : integer := 100000;    -- change this value to change your refresh rate
signal toggle        : std_logic_vector(1 downto 0) := "10";    -- used to control which display is active
begin
        -- Instantiate 2 instances of the Hex_to_7_Seg.vhd design file
        seg1 : Hex_to_7_Seg
            port map (Seg_1, hex_in_1);
        seg0 : Hex_to_7_Seg
            port map (Seg_0, hex_in_0);
            
        -- Signal Assignments (This all happens continuously)    
        enable0 <= toggle(0); -- if signal toggle's LSB is 0 then the specified
                              -- 7 segment display associated with it is turned on
                              
        enable1 <= toggle(1); -- if signal toggle's MSB is 0 then the specified
                              -- 7 segment display associated with it is turned on
                              
        enable2 <= '1';        -- Turns a 7 segment display off (never changes)
        enable3 <= '1';        -- Turns a 7 segment display off (never changes)
            
        -- Counter Process that counts every clock pulse
        counter_proc: process(clk)
        begin
            if(rising_edge(clk)) then
                if(reset = '1' or counter = maxcount) then
                    counter <= (others => '0');
                else
                    counter <= counter + 1;
                end if;
            end if;
        end process counter_proc;
        
        -- Process that checks if signal counter has reached a value
        -- of constant maxcount
        -- if so we invert the toggle signal so that whichever display
        -- is active becomes inactive and the inactive display is now active
        toggle_count_proc: process(clk)
        begin
            if(rising_edge(clk)) then
                if(reset = '1') then
                    toggle <= toggle;
                elsif(counter = maxcount) then
                    toggle <= not toggle;
                end if;
            end if;
        end process toggle_count_proc;
        
        -- Toggle the seven segment displays
        -- This process is evaluated when the toggle signal changes
        -- or either of the Seg_0 or Seg_1 signals change state
        toggle_proc: process(toggle, Seg_1, Seg_0)
        begin
            if(toggle(1) = '1') then
                seg_out <= Seg_1;
            else
                seg_out <= Seg_0;
            end if;
        end process toggle_proc;
end behavior;
