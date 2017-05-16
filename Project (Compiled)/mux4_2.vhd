library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4_2 is
   port (
      input00	:	in	std_logic;
		input01	:	in	std_logic;
		input10	:	in std_logic;
		input11	:	in	std_logic;
      a 			: 	in std_logic;
      output0	:  out std_logic;
		output1	:	out std_logic
   	  );
end mux4_2;

architecture a_mux4_2 of mux4_2 is
begin
   process (input00, input01, input10, input11, a)
   begin      
		case a is
			when '0' => output0 <= input00; output1 <= input01;
			when '1' => output0 <= input10; output1 <= input11;
		end case;
   end process;
end a_mux4_2;