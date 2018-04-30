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

entity shift_reg is
    port (
    clk, reset, Sin : in std_logic;
    S : in std_logic_vector(1 downto 0);
    Pin : in std_logic_vector(5 downto 0);
    clock_out: out std_logic;
    Pout : out std_logic_vector(5 downto 0)
    );
end shift_reg;

architecture shiftreg of shift_reg is
    
    signal temp: std_logic_vector(5 downto 0);
    signal count: integer:=1;
    signal clk_tmp : std_logic := '0';
    
    begin
        process (clk)
            begin
                --Stop Clock with Reset
                if(reset='1') then
                count<=1;
                clk_tmp<='0';
                --Clock Divider
                elsif(rising_edge(clk)) then
                count <=count+1;
                    if (count = 50000000) then
                    clk_tmp <= NOT clk_tmp;
                    count <= 1;
                    end if;
                end if;
            clock_out <= clk_tmp;
            
            --Universal Shift Register
            if(reset='1') then
            temp <= (others => '0'); --Reset Outputs
            elsif (rising_edge(clk_tmp)) then
                if(S="00") then --Hold
                temp <= temp(5 downto 0);
                elsif(S="01") then --Shitf Right
                temp <= Sin & temp(5 downto 1);
                elsif(S="10") then --Shift Left
                temp <= temp(4 downto 0)& Sin;
                elsif(S="11") then --Parallel Load
                temp <= Pin(5 downto 0);
                end if; 
            end if;
        end process;
    Pout <= temp;
end shiftreg;