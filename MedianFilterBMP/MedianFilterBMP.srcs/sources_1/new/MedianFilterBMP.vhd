----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2018 02:03:06 PM
-- Design Name: 
-- Module Name: MedianFilterBMP - MedianFilter
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

entity MedianFilterBMP is
    generic(
    width : in integer;
    height : in integer
    );
    port (
    picture : in std_logic_vector(width*height downto 0);
    picture_out : out std_logic_vector(width*height downto 0)
    );
end MedianFilterBMP;

architecture MedianFilter of MedianFilterBMP is

begin


end MedianFilter;
