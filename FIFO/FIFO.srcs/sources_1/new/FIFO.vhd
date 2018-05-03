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
  bit_width : integer :=4;
  memory_depth : integer :=16
  );
  port (
  clk : in std_logic;
  read : in std_logic;
  write : in std_logic;
  reset : in std_logic;
  address : in std_logic_vector(integer(ceil(log2(real(memory_depth)))) - 1 downto 0);
  Pin : in std_logic_vector ((bit_width -1) downto 0);
  Pout : out std_logic_vector ((bit_width -1) downto 0)
  );
end FIFO;

architecture memory of FIFO is

    signal MEM : std_logic_vector((bit_width*memory_depth -1) downto 0);
    constant memory_width : integer :=integer(ceil(log2(real(memory_depth))));

begin
    reset_mem : process (clk, reset)
    begin
        if(rising_edge(clk)) then
            if(reset='1') then
                MEM <= (others => '0');
            end if;   
        end if;    
    end process reset_mem;
    
    write_to_mem : process(clk, write, address, Pin)
    begin
        if(rising_edge(clk)) then
            if(write='1') then
                MEM(((to_integer(unsigned(address))+1)*4-1) downto to_integer(unsigned(address))*4) <= Pin;
            end if;
        end if;
    end process write_to_mem;
    
    read_from_mem : process(clk, read, address, MEM)
    begin
        if(rising_edge(clk)) then
            if(read='1') then
                Pout <= MEM(((to_integer(unsigned(address))+1)*4-1) downto to_integer(unsigned(address))*4);
            end if;
        end if;
    end process read_from_mem;
end memory;
