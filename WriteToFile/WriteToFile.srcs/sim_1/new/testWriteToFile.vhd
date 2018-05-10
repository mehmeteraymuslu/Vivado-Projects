----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2018 10:25:20 AM
-- Design Name: 
-- Module Name: testWriteToFile - writetof
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
use IEEE.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all;

entity testWriteToFile is
  Port (
  Dummy : in std_logic
  );
end testWriteToFile;

architecture writetof of testWriteToFile is

file f_dest_file : text;

begin
    
    stimulus : process

        variable v_oline : line;
        
        begin
        
            file_open(f_dest_file, "destination.txt", write_mode);

            write(v_oline, character('C'));
            writeline(f_dest_file, v_oline);
            
            wait for 10 ns;
            
            file_close(f_dest_file);
            
            wait;
            
			report "SUCCESS! Full Adder Test Completed.";
        
    end process stimulus;

end writetof;
