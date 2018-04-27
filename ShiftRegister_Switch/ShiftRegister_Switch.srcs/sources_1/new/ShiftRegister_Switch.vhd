----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2018 04:42:42 PM
-- Design Name: 
-- Module Name: ShiftRegister_Switch - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ShiftRegister_Switch is
    port (Switch, Sin : in std_logic;
    Pout : out std_logic_vector(7 downto 0));
end ShiftRegister_Switch;

architecture Behavioral of ShiftRegister_Switch is
    signal temp: std_logic_vector(7 downto 0);
        begin
        process (Switch)
            begin
            if (Switch'event and Switch='1') then
            temp <= temp(6 downto 0)& Sin;
            end if ;
        end process;
    Pout <= temp;
end Behavioral;