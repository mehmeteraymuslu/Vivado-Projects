----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2018 05:09:52 PM
-- Design Name: 
-- Module Name: FIFO - Behavioral
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
use IEEE.math_real.all;
use IEEE.numeric_std.all;

entity FIFO is
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
end FIFO;

architecture memory of FIFO is

    constant memory_width : integer :=integer(ceil(log2(real(memory_depth))));
    signal MEM : std_logic_vector((bit_width*memory_depth -1) downto 0) := (others => '0');
    signal temp : std_logic_vector((bit_width*(memory_depth-1) -1) downto 0) := (others => '0');

begin
    mem_operations : process(clk, write, Pin, reset)
    begin
        if(rising_edge(clk)) then
            if(reset='1') then
                MEM <= (others => '0');
                Pout <= (others => '0');
                temp <= (others => '0');
            elsif(write='1') then
                temp((bit_width*(memory_depth-1) -1) downto 0) <= MEM((bit_width*(memory_depth-1) -1) downto 0);
                MEM((bit_width*memory_depth -1) downto bit_width) <= temp((bit_width*(memory_depth-1) -1) downto 0);
                MEM((bit_width -1) downto 0) <= Pin;
            elsif(read='1') then
                Pout <= MEM((bit_width -1) downto 0);
                temp((bit_width*(memory_depth-1) -1) downto 0) <= MEM((bit_width*memory_depth -1) downto bit_width);
                MEM((bit_width*(memory_depth-1) -1) downto 0) <= temp((bit_width*(memory_depth-1) -1) downto 0);
                MEM((bit_width*memory_depth -1) downto (bit_width*(memory_depth-1))) <= (others => '0');
            end if;
        end if;
    end process mem_operations;
end memory;
