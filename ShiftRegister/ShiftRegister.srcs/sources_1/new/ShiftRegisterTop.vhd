----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2018 01:22:55 PM
-- Design Name: 
-- Module Name: ShiftRegisterTop - ShiftRegisterTop
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

entity ShiftRegisterTop is
  generic(
  bitlength_top : integer := 6
  );
  Port (
  clk_top : in std_logic;
  reset_top : in std_logic;
  Sin_top : in std_logic;
  S_top : in std_logic_vector(1 downto 0);
  Pin_top : in std_logic_vector((bitlength_top-1) downto 0);
  Pout_top : out std_logic_vector((bitlength_top-1) downto 0)   
  );
end ShiftRegisterTop;

architecture shiftregarch of ShiftRegisterTop is

component shift_reg is
    generic(
    bitlength : integer
    );
    port (
    clk : in std_logic; --Clock Input
    reset : in std_logic; --Reset
    Sin : in std_logic; --Serial Input
    S : in std_logic_vector(1 downto 0); --Selection for Mod
    Pin : in std_logic_vector((bitlength-1) downto 0); --Parallel Input
    Pout : out std_logic_vector((bitlength-1) downto 0) --Parallel Output
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
        
    SHFT_REGA : shift_reg
        generic map(bitlength => bitlength_top)
        port map(clk => clk_out_top, reset => reset_top, Sin => Sin_top, S => S_top, Pin => Pin_top, Pout => Pout_top);
end shiftregarch;
