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

entity FIFO is
  generic(
  bit_width : integer :=4;
  memory_depth : integer :=16
  );
  port (
  read : in std_logic;
  write : in std_logic;
  reset : in std_logic;
  Address
  Pin : in std_logic_vector ((bit_width -1) downto 0);
  Pout : out std_logic_vector ((bit_width -1) downto 0)
  );
end FIFO;

architecture memory of FIFO is

    signal MEM : std_logic_vector((bit_width*memory_depth -1) downto 0);

begin

    if(write) then
    

end memory;
