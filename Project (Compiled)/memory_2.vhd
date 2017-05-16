library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_2 is
   port (
      input0 	: 	in 	std_logic;
		input1	: 	in 	std_logic;
		button	:	in		std_logic;
		clk		:	in		std_logic;
      output0	: 	out 	std_logic;
		output1	:	out 	std_logic
   	  );
end memory_2;

architecture a_memory_2 of memory_2 is
SIGNAL mux_0 :	std_logic;
SIGNAL mux_1 :	std_logic;
SIGNAL d_0 : std_logic;
SIGNAL d_1 : std_logic;
begin
Inst_mux4_2:	ENTITY work.mux4_2
	PORT MAP(
      input00 => d_0,
		input01 => d_1,
		input10 => input0,
		input11 => input1,
      a 		  => button,
      output0 => mux_0,
		output1 => mux_1
	);

Inst_d_2:	ENTITY work.d_2
	PORT MAP(
      input0 	=> mux_0,
		input1 	=> mux_1,
		clk		=> clk,
      output0	=>	d_0,
		output1	=>	d_1
	);

output0 <= d_0;
output1 <= d_1;
end a_memory_2;