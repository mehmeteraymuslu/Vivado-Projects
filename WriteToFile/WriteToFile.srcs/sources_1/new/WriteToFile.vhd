----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2018 10:24:24 AM
-- Design Name: 
-- Module Name: WriteToFile - Behavioral
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

entity WriteToFile is
  Port (
  X : in std_logic;
  Y : out std_logic
  );
end WriteToFile;

architecture Behavioral of WriteToFile is

begin

    Y <= X;

end Behavioral;
