----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2018 03:53:11 PM
-- Design Name: 
-- Module Name: ShiftRegister - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;

entity shift_sipo is
    port (clk, reset, Sin : in std_logic;
    clock_out: out std_logic;
    Pout : out std_logic_vector(6 downto 0));
end shift_sipo;

architecture exam of shift_sipo is
    
    signal temp: std_logic_vector(6 downto 0);
    signal count: integer:=1;
    signal tmp : std_logic := '0';
    
    begin
        process (clk)
            begin
                if(reset='1') then
                count<=1;
                tmp<='0';
                elsif(clk'event and clk='1') then
                count <=count+1;
                    if (count = 50000000) then
                    tmp <= NOT tmp;
                    count <= 1;
                    end if;
                end if;
            clock_out <= tmp;
            
            if (tmp'event and tmp='1') then
            temp <= temp(5 downto 0)& Sin;
            end if ;
        end process;
    Pout <= temp;
end exam;