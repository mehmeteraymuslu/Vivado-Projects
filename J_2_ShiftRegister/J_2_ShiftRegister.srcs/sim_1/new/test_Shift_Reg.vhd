----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2018 05:02:42 PM
-- Design Name: 
-- Module Name: test_Shift_Reg - test
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
use IEEE.numeric_std.all;

entity test_Shift_Reg is
end;

architecture test of test_Shift_Reg is
  
component Shift_Reg
port (
      A:		out std_logic;
      B:     	out std_logic;
	  C:		out std_logic;
	  D:		out std_logic;
	  data_in:	in	std_logic;
	  reset:		in	std_logic;
	  clk:		in 	std_logic);
end component;

signal S_data_in : std_logic := '0';
signal S_reset : std_logic := '0';
signal S_clk : std_logic := '1';
signal S_A, S_B, S_C, S_D: std_logic;

begin
      
	dev_to_test:  shift_reg 
		port map(A => S_A, B => S_B, C => S_C, D => S_D, data_in => S_data_in, reset => S_reset, clk => S_clk); 

    
	clk_stimulus:  process
	begin
		wait for 10 ns;
		S_clk <= not S_clk;
	end process clk_stimulus;
	
	data_stimulus:  process
	begin
		wait for 40 ns;
		S_data_in <= not S_data_in;
		wait for 150 ns;
	end process data_stimulus;
  
end test;
