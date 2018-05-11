----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2018 09:39:51 AM
-- Design Name: 
-- Module Name: RC_servo - behavior
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
--                                 Lab 7 RC Servo
--                                 Udemy Course
--                                 RC_servo.vhd
-------------------------------------------------------------------------------
-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
-- Entity Declaration
entity RC_servo is
Port (
    seg_out        : out std_logic_vector(6 downto 0);
    enable0        : out std_logic;
    enable1        : out std_logic;
    enable2        : out std_logic;
    enable3        : out std_logic;
    pwm_out        : out std_logic;
    one         : in std_logic;        -- up or down by 1
    five         : in std_logic;        -- up or down by 5
    add         : in std_logic;        -- determines count up or down
    clk         : in std_logic;
    enable        : in std_logic);
end RC_servo;
-- Architectural Body
architecture behavior of RC_servo is
-- Component Instantiations
-- Hex to 7 seg display component
component Hex_to_7_Seg
port (
    seven_seg         : out std_logic_vector( 6 downto 0);
    hex             : in std_logic_vector(3 downto 0));
end component;
-- Pulse Width Modulator (PWM) component
component PWM
generic (
    bit_depth    : integer := 8;
    input_clk    : integer := 50000000; -- 50MHz
    freq        : integer := 80); -- 50Hz
port (
    pwm_out     : out std_logic;
    resolution    : in std_logic_vector(bit_depth - 1 downto 0);
    clk            : in std_logic;
    enable        : in std_logic);
end component;
-- Constants
constant maxcount        : integer := 100000;
constant bit_depth        : integer := 8;
constant input_clk        : integer := 50000000;
constant freq            : integer := 50;
-- Signals
-- Signals for holding 7 seg values
signal Seg_0    : std_logic_vector(6 downto 0):= (others => '0');
signal Seg_1    : std_logic_vector(6 downto 0):= (others => '0');
-- Signal used to hold PWM resolution value
signal pwm_res : std_logic_vector(bit_depth - 1 downto 0) := (others => '0');
signal pwm_int : integer range 0 to 2**bit_depth := 0;
-- signals for toggling
-- a 25-bit counter is required to count to 50000000 (50 million/50 MHz)
-- we will be counting to 100,000 to achieve a 500Hz refresh rate 
signal counter                : unsigned(25 downto 0) := to_unsigned(0, 26);
signal toggle                : std_logic_vector(1 downto 0) := "10";
-- Signals used to indicate when the push button
signal start_count_lead_1        : std_logic := '0';
signal start_count_follow_1        : std_logic := '0';
signal start_count_1            : std_logic := '0';
signal start_count_lead_5        : std_logic := '0';
signal start_count_follow_5        : std_logic := '0';
signal start_count_5            : std_logic := '0';
begin
    -- Instantiate 2 instances of the 7 segment converter
    seg1 : Hex_to_7_Seg
        port map (seven_seg => Seg_1, hex => pwm_res(7 downto 4));
    seg0 : Hex_to_7_Seg
        port map (seven_seg => Seg_0, hex => pwm_res(3 downto 0));
            
    -- Instantiate Pulse Width Modulator
    pmod : PWM
        generic map (bit_depth => bit_depth, input_clk => input_clk, freq => freq)
        port map (pwm_out => pwm_out, resolution => pwm_res, clk => clk, enable => enable);
        
    -- Signal Assignments
    -- Enabling / Disabling 7 Segment Displays on Basys 2 board
    enable0 <= toggle(0);
    enable1 <= toggle(1);
    enable2 <= '1';
    enable3 <= '1';
    
    --pwm_res <= pwm_int;
    pwm_res <= std_logic_vector(to_unsigned(pwm_int,pwm_res'length));
    
    -- Counter to create 60Hz
    counter_proc: process(clk)
    begin
        if(rising_edge(clk)) then
            if(counter = maxcount) then
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;
        end if;
    end process counter_proc;
    
    -- Process that flags seven segs to toggle at 60Hz
    toggle_count_proc: process(clk)
    begin
        if(rising_edge(clk)) then
            if(counter = maxcount) then
                toggle <= not toggle;
            end if;
        end if;
    end process toggle_count_proc;
    
    -- Toggle the seven segment displays
    toggle_proc: process(toggle, Seg_1, Seg_0)
    begin
        if(toggle(1) = '1') then
            seg_out <= Seg_1;
        else
            seg_out <= Seg_0;
        end if;
    end process toggle_proc;
    
    -- edge detection circuitry for adding / subtracting 1
    -- start_count_1 = '1' on the rising edge of the 'one' input
    start_count_1 <= start_count_lead_1 and (not start_count_follow_1);
    start_count_proc_1: process(clk)
        begin
        if(rising_edge(clk)) then
            if(enable = '1') then
                start_count_lead_1 <= '0';
                start_count_follow_1 <= '0';
            else
                start_count_lead_1 <= one;
                start_count_follow_1 <= start_count_lead_1;
            end if;
        end if;
    end process start_count_proc_1;
    
    -- edge detection circuitry for adding / subtracting 5
    -- start_count_5 = '1' on the rising edge of the 'five' input
    start_count_5 <= start_count_lead_5 and (not start_count_follow_5);
    start_count_proc_5: process(clk)
        begin
        if(rising_edge(clk)) then
            if(enable = '1') then
                start_count_lead_5 <= '0';
                start_count_follow_5 <= '0';
            else
                start_count_lead_5 <= five;
                start_count_follow_5 <= start_count_lead_5;
            end if;
        end if;
    end process start_count_proc_5;
    
    -- Create counter to keep track of the 'one' and 'five' button presses
    count_proc_1: process(clk)
        begin
        if(rising_edge(clk)) then
            if(add = '1') then
                if(start_count_1 = '1') then
                    pwm_int <= pwm_int + 1;
                elsif(start_count_5 = '1') then
                    pwm_int <= pwm_int + 5;
                end if;
            else
                if(start_count_1 = '1') then
                    pwm_int <= pwm_int - 1;
                elsif(start_count_5 = '1') then
                    pwm_int <= pwm_int - 5;
                end if;
            end if;
        end if;
    end process count_proc_1;
end behavior;
