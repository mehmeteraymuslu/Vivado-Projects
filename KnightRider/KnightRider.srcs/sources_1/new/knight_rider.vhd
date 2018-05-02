----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2018 04:23:19 PM
-- Design Name: 
-- Module Name: knight_rider - Behavioral
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

entity knightrider is
    port (
    clk, reset : in std_logic;
    Pout : out std_logic_vector(7 downto 0)
    );
end knightrider;

architecture car of knightrider is
    
    signal temp: std_logic_vector(7 downto 0) := "00000001";
    signal count: integer:=1;
    signal counter: integer:=1;
    signal clk_tmp : std_logic := '0';
    
    begin
        process (clk, reset, clk_tmp)
            begin
                --Stop Clock with Reset
                if(reset='1') then
                count<=1;
                clk_tmp<='0';
                --Clock Divider
                elsif(rising_edge(clk)) then
                count <=count+1;
                    if (count = 5000000) then
                    clk_tmp <= NOT clk_tmp;
                    count <= 1;
                    end if;
                end if;
            
            --Knight Rider
            if(reset='1') then
            temp <= "00000001"; --Reset Outputs
            counter <= 1;
            elsif (rising_edge(clk_tmp)) then
                if (counter=1) then
                    counter <= counter + 1;
                elsif (counter<=8) then
                    temp <= temp(6 downto 0) & temp(7);
                    counter <= counter + 1;
                elsif (16>counter and counter>8) then
                    temp <= temp(0) & temp(7 downto 1);
                    counter <= counter + 1;
                elsif (counter=16) then
                    temp <= (others =>'1');
                    counter <= counter + 1;
                elsif (counter=17) then
                    temp <= (others =>'0');
                    counter <= counter + 1;
                elsif (counter=18) then
                    temp <= (others =>'1');
                    counter <= counter + 1;
                elsif (counter=19) then
                    temp <= (others =>'0');
                    counter <= counter + 1;
                elsif (counter=20) then
                    temp <= "00000001";
                    counter <= 2;
                end if;
            end if;
        end process;
    Pout <= temp;
end car;
