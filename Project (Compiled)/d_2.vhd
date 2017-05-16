library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_2 is
   port (
      input0 	: 	in 	std_logic;
		input1	: 	in 	std_logic;
		clk		:	in		std_logic;
      output0	: 	out 	std_logic;
		output1	:	out 	std_logic
   	  );
end d_2;

architecture a_d_2 of d_2 is
begin
   process (clk)
   begin      
		if (clk'event and clk = '1') then
			output0 <= input0;
			output1 <= input1;
		end if;
   end process;
end a_d_2;