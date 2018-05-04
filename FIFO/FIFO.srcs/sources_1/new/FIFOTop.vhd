----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2018 04:16:00 PM
-- Design Name: 
-- Module Name: FIFOTop - FIFOTop
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


entity FIFOTop is
    generic(
        bit_width_top : integer := 4;
        memory_depth_top : integer := 16
    );
    port (
        clk_top : in std_logic;
        read_top : in std_logic;
        write_top : in std_logic;
        reset_top : in std_logic;
        Pin_top : in std_logic_vector ((bit_width_top -1) downto 0);
        Pout_top : out std_logic_vector ((bit_width_top -1) downto 0);
        clk_out_control_top : out std_logic
    );
end FIFOTop;

architecture FIFOTop of FIFOTop is

component FIFO is
  generic(
    bit_width : integer;
    memory_depth : integer
);
port (
    clk : in std_logic;
    read : in std_logic;
    write : in std_logic;
    reset : in std_logic;
    Pin : in std_logic_vector ((bit_width -1) downto 0);
    Pout : out std_logic_vector ((bit_width -1) downto 0)
);
end component;

component ClockDivider
    generic(
    division_rate : integer);
    port (
    clk, reset: in std_logic;
    clock_out: out std_logic
    );
end component;

signal clk_out_top : std_logic;

begin

    CLK_DVDR1 : ClockDivider 
        generic map(division_rate => 100000000)
        port map(clk => clk_top, reset => reset_top, clock_out => clk_out_top);

    MEMO1 : FIFO
        generic map(bit_width =>bit_width_top, memory_depth => memory_depth_top)
        port map(clk => clk_out_top, read => read_top, write => write_top, reset => reset_top, Pin => Pin_top, Pout => Pout_top);
        
    clk_out_control_top <= clk_out_top;
        
end FIFOTop;
