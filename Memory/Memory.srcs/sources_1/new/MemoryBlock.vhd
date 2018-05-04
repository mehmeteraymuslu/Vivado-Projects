----------------------------------------------------------------------------------
-- Company: C Tech Biliþim Teknolojileri Sanayi ve Ticaret A.Þ.
-- Engineer: Mehmet Eray Muslu
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: 
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

entity MemoryBlock is
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
end MemoryBlock;

architecture memory of MemoryBlock is

    signal MEM : std_logic_vector((bit_width*memory_depth -1) downto 0);
    constant memory_width : integer :=integer(ceil(log2(real(memory_depth))));

begin
    mem_operations : process(clk, write, address, Pin, reset)
    begin
        if(rising_edge(clk)) then
            if(reset='1') then
                MEM <= (others => '0');
                Pout <= (others => '0');
            elsif(write='1') then
                MEM(((to_integer(unsigned(address))+1)*4-1) downto to_integer(unsigned(address))*4) <= Pin;
            elsif(read='1') then
                Pout <= MEM(((to_integer(unsigned(address))+1)*4-1) downto to_integer(unsigned(address))*4);
            end if;
        end if;
    end process mem_operations;
end memory;