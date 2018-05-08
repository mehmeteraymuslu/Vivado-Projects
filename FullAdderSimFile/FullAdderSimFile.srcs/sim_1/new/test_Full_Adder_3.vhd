----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2018 03:35:21 PM
-- Design Name: 
-- Module Name: test_Full_Adder_3 - test
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

entity test_Full_Adder_3 is
end;

architecture test of test_Full_Adder_3 is
component Full_Adder_2
port (
	S		: out std_logic;
	C_out	: out std_logic;
	x		: in std_logic;
	y 		: in std_logic;
	C_in	: in std_logic);
end component;

signal x_in					: std_logic;
signal y_in					: std_logic;
signal c_in					: std_logic;
signal s_out				: std_logic;
signal c_out				: std_logic;
signal s_expected			: std_logic;
signal c_out_expected		: std_logic;

signal inputs 				: std_logic_vector(2 downto 0);
signal outputs				: std_logic_vector(1 downto 0);

-----------------------------------------------------------------------------
-- Testbench Internal Signals
-----------------------------------------------------------------------------
file file_VECTORS : text;
file file_RESULTS : text;

begin
	dev_to_test:	Full_Adder_2 port map (
		S => s_out, C_out => c_out,
		x => x_in, y => y_in, C_in => c_in);
		
	-- create test outputs
	inputs <= c_in & y_in & x_in;
	c_out_expected <= outputs(1);
	s_expected <= outputs(0);
	
	expected_proc : process(inputs)
		begin
			case inputs is
			when "000" => outputs <= "00";
			when "001" => outputs <= "01";
			when "010" => outputs <= "01";
			when "011" => outputs <= "10";
			when "100" => outputs <= "01";
			when "101" => outputs <= "10";
			when "110" => outputs <= "10";
			when "111" => outputs <= "11";
			when others => outputs <= (others => 'X');
			end case;
		end process expected_proc;
		
		
	stimulus : process
		
		-- variables for test bench
		variable ErrCnt	: integer := 0;
		variable WriteBuf : line ;
        variable v_ILINE     : line;
        variable v_OLINE     : line;
        variable v_SPACE     : character;
        variable v_ADD_TERM1 : std_logic;
        variable v_ADD_TERM2 : std_logic;
        variable v_ADD_TERM3 : std_logic;
		
		begin
		
		file_open(file_VECTORS, "input_vectors.txt",  read_mode);
        file_open(file_RESULTS, "output_results.txt", write_mode);
        
        write(v_OLINE, character('C'));
        write(v_OLINE, character('S'));
        writeline(file_RESULTS, v_OLINE);    


        while not endfile(file_VECTORS) loop
            readline(file_VECTORS, v_ILINE);
            read(v_ILINE, v_ADD_TERM1);
            read(v_ILINE, v_SPACE);           -- read in the space character
            read(v_ILINE, v_ADD_TERM2);
            read(v_ILINE, v_SPACE);           -- read in the space character
            read(v_ILINE, v_ADD_TERM3);


              -- Pass the variable to a signal to allow the ripple-carry to use it
              y_in <= v_ADD_TERM1;
              x_in <= v_ADD_TERM2;
              c_in <= v_ADD_TERM3;						

						wait for 10 ns;

                write(v_OLINE, c_out, right, 1);
                write(v_OLINE, s_out, right, 1);
                writeline(file_RESULTS, v_OLINE);						

            if (c_out_expected /= c_out) then
            write(WriteBuf, string'("ERROR FA test failed at c_out: x = "));
            write(WriteBuf, x_in); write(WriteBuf, string'(", y = "));
            write(WriteBuf, y_in); write(WriteBuf, string'(", c_in = "));
            write(WriteBuf, c_in);
            
            writeline(Output, WriteBuf);
            ErrCnt := ErrCnt+1;
            
            end if;
            
            if(s_expected /= s_out) then
            write(WriteBuf, string'("ERROR FA test failed at sum: x = "));
            write(WriteBuf, x_in); write(WriteBuf, string'(", y = "));
            write(WriteBuf, y_in); write(WriteBuf, string'(", c_in = "));
            write (WriteBuf, c_in);
            
            writeline(Output, WriteBuf);
            ErrCnt := ErrCnt+1;
            end if;

        end loop;
		
		file_close(file_VECTORS);
        file_close(file_RESULTS);
        
        wait;
		
		if (ErrCnt = 0) then
			report "SUCCESS! Full Adder Test Completed.";
		else
			report "The Full Adder is broken." severity warning;
		end if;

	end process stimulus;
    
end test;

