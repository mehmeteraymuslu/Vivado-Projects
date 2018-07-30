----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2018 09:39:57 AM
-- Design Name: 
-- Module Name: KnightRiderTop - Behavioral
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

entity KnightRiderTop is
    generic (
    bitlength_top : integer := 8
    );
    port (
    clk_top, reset_top : in std_logic;
    Pout_top : out std_logic_vector((bitlength_top-1) downto 0)
    );
end KnightRiderTop;

architecture car of KnightRiderTop is

component shift_reg 
    generic(
    bitlength : integer
    );
    port (
    clk : in std_logic; --Clock Input
    reset : in std_logic; --Reset
    Sin : in std_logic; --Serial Input
    S : in std_logic_vector(1 downto 0); --Selection for Mod
    Pin : in std_logic_vector((bitlength_top-1) downto 0); --Parallel Input
    Pout : out std_logic_vector((bitlength_top-1) downto 0) --Parallel Output
    );
end component;

component ClockDivider
    generic(
    division_rate : integer);
    port (
    clk, reset: in std_logic;
    clock_out: out std_logic
    );
end component;
    
    signal counter : integer:=1;
    signal clk_tmp : std_logic;
    signal Sin_top : std_logic;
    signal S_top : std_logic_vector(1 downto 0) := "11";
    signal Pin_top : std_logic_vector((bitlength_top-1) downto 0);
    
    begin

            CLK_DVDR1 : ClockDivider 
                generic map(division_rate => 10000000)
                port map(clk => clk_top, reset => reset_top, clock_out => clk_tmp);

            reg1 : shift_reg 
                generic map(bitlength => bitlength_top)
                port map(clk => clk_tmp,--input
                        reset => reset_top,--input
                        Sin => Sin_top,--input
                        S => S_top,--input
                        Pin => Pin_top,--input
                        Pout => Pout_top);--output

        process (clk_tmp, reset_top)
            begin
            --Knight Rider
            if (reset_top='1') then
            Sin_top <= '0';
            S_top <= "11";
            Pin_top <=  (0 => '1', others => '0');
            counter <= 1;
                elsif (rising_edge(clk_tmp)) then
                    if (counter=1) then --initialize
                        Sin_top <= '0';
                        S_top <= "11";
                        Pin_top <=  (0 => '1', others => '0');
                        counter <= counter + 1;
                    elsif (counter<=bitlength_top) then
                        S_top <= "10";
                        counter <= counter + 1;
                    elsif ((2*bitlength_top-1)>counter and counter>bitlength_top) then
                        S_top <= "01";
                        counter <= counter + 1;
                    elsif (counter>=(2*bitlength_top-1)) then
                        S_top <= "01";
                        counter <= 2;
                    end if;
            end if;
        end process;
end car;
