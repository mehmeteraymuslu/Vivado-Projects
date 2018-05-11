----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2018 09:13:54 AM
-- Design Name: 
-- Module Name: Counter_1 - behavior
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
-- File:        Counter_1.vhd
-- Engineer:    Jordan Christman
-- Description:    Counter_1 counts from 0 to 255 and displays the data on the 
--                LED's located on the front of the board
-------------------------------------------------------------------------------
-- Lab 5 Tasks
-- 1) Fill in the "?" with the correct values
--
-- 2) Compile & Simulate Counter_1.vhd in ModelSim
--            * Note ModelSim will give you compiling
--              error's if you do not change the "?"
-- 
-- 3) Implement Counter_1.vhd on your BASYS 2 board
--
-- 4) Try and implement what you learned in lab 4 to display a
--       the count value on the 7 segment displays. Can you get it
--      to display on all 4 segments?
-- Use the comments to help you figure out how to
-- get this design to work
-- Library's
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use IEEE.numeric_std.all;
-- Entity Declaration
entity Counter_1 is
    Generic (
        max_val     : integer := 2**8; -- sets the max_value to 2^8 --> 256
        simulation    : boolean := true);
    Port (
        count         : out std_logic_vector(integer(ceil(log2(real(max_val)))) - 1 downto 0);
        clk         : in std_logic;
        reset         : in std_logic);
end Counter_1;
-- Architecture Body
architecture behavior of Counter_1 is
    -- Constants and signals used to create counter processes
    constant bit_depth    : integer := integer(ceil(log2(real(max_val))));
    signal count_reg    : unsigned(bit_depth - 1 downto 0) := (others => '0');
    
    -- a 25-bit counter is required to count to 50000000 (50 million/ 50 MHz)
    signal counter            : unsigned(25 downto 0) := to_unsigned(0, 26);
    constant maxcount        : integer := 50000000;
    constant max_count_reg    : integer := 256;
    
    begin
    count <= std_logic_vector(count_reg);    -- we are performing a conversion
                                            -- from unsigned to std_logic_vector
    
        ------------------------------------------------------
        -- Counter Process
        -- This process counts to 50 Million
        -- Since the BASYS 2 board clock is running at
        -- 50MHz this clock will reach "maxcount" every second
        ------------------------------------------------------
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
        
        ----------------------------------------------------
        -- Second Counter Process
        -- This process counts 0 to 256
        -- The count_reg is incremented every time
        -- the signal "counter = maxcount"
        --
        -- There are two options for Counter.vhd
        -- they are based on the value of the generic simulation
        -- be sure you have the correct generic defined 
        -- when you go to synthesize your design
        ----------------------------------------------------
        
        -- This process is implemented when we want to synthesize
    synthesis: if simulation = false generate    
        second_count_proc: process(clk)
        begin
            if(rising_edge(clk)) then
                if(reset = '1' or count_reg = max_count_reg) then
                    count_reg <= (others => '0');
                elsif(counter = maxcount) then
                    count_reg <= count_reg + 1;
                end if;
            end if;
        end process second_count_proc;
    end generate;
    -- This process is implemented for simulation purposes
    sim: if simulation = true generate    
        second_count_proc: process(clk)
        begin
            if(rising_edge(clk)) then
                if(reset = '1' or count_reg = max_count_reg) then
                    count_reg <= (others => '0');
                else
                    count_reg <= count_reg + 1;
                end if;
            end if;
        end process second_count_proc;
    end generate;    
        
end behavior;
