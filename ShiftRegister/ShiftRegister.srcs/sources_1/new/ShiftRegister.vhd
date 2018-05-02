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
end shift_reg;

architecture shiftreg of shift_reg is
    
    signal temp: std_logic_vector((bitlength-1) downto 0);

    begin
        process (clk, reset, Sin, S, Pin)
            begin
            --Universal Shift Register
            if(reset='1') then
            temp <= (others => '0'); --Reset Outputs
            elsif (rising_edge(clk)) then
                if(S="00") then --Hold
                temp <= temp((bitlength-1) downto 0);
                elsif(S="01") then --Shitf Right
                temp <= Sin & temp((bitlength-1) downto 1);
                elsif(S="10") then --Shift Left
                temp <= temp((bitlength-2) downto 0)& Sin;
                elsif(S="11") then --Parallel Load
                temp <= Pin((bitlength-1) downto 0);
                end if; 
            end if;
        end process;
    Pout <= temp;
end shiftreg;