library ieee;
use ieee.std_logic_1164.all;

entity nhk is
	port (
		clk_in		:	in 	std_logic;
		button1		:	in		std_logic;
		button2		:	in		std_logic;
		input0		:	in		std_logic;
		input1		:	in		std_logic;
		segm			:	out	std_logic_vector(6 downto 0)
	);
end nhk;

architecture arch of nhk is
SIGNAL mem_10	:	std_logic;
SIGNAL mem_11	:	std_logic;
SIGNAL mem_20	:	std_logic;
SIGNAL mem_21	:	std_logic;
SIGNAL mem_30	:	std_logic;
SIGNAL mem_31	:	std_logic;
SIGNAL mem_40	:	std_logic;
SIGNAL mem_41	:	std_logic;
SIGNAL mem_50	:	std_logic;
SIGNAL mem_51	:	std_logic;
SIGNAL mem_60	:	std_logic;
SIGNAL mem_61	:	std_logic;
SIGNAL mem_70	:	std_logic;
SIGNAL mem_71	:	std_logic;
SIGNAL mem_80	:	std_logic;
SIGNAL mem_81	:	std_logic;

SIGNAL s_pulse	:	std_logic;

SIGNAL s_state1	:	std_logic;
SIGNAL s_state2	:	std_logic;
SIGNAL s_state3	:	std_logic;
SIGNAL s_state4	:	std_logic;
SIGNAL s_state5	:	std_logic;
SIGNAL s_state6	:	std_logic;
SIGNAL s_state7	:	std_logic;
SIGNAL s_state8	:	std_logic;

SIGNAL s_sum		: std_logic_vector(3 downto 0);
begin
Inst_memory_1:	ENTITY	work.memory_2
	PORT MAP(
	   input0 => input0,
		input1 => input1,
		button => button1,
		clk	 => clk_in,
      output0=> mem_10,
		output1=> mem_11
	);
Inst_memory_2:	ENTITY	work.memory_2
	PORT MAP(
		input0 => mem_10,
		input1 => mem_11,
		button => button1,
		clk	 => clk_in,
      output0=> mem_20,
		output1=> mem_21
	);
Inst_memory_3:	ENTITY	work.memory_2
	PORT MAP(
		input0 => mem_20,
		input1 => mem_21,
		button => button1,
		clk	 => clk_in,
      output0=> mem_30,
		output1=> mem_31
	);
Inst_memory_4:	ENTITY	work.memory_2
	PORT MAP(
		input0 => mem_30,
		input1 => mem_31,
		button => button1,
		clk	 => clk_in,
      output0=> mem_40,
		output1=> mem_41
	);
Inst_memory_5:	ENTITY	work.memory_2
	PORT MAP(
		input0 => mem_40,
		input1 => mem_41,
		button => button1,
		clk	 => clk_in,
      output0=> mem_50,
		output1=> mem_51
	);
Inst_memory_6:	ENTITY	work.memory_2
	PORT MAP(
		input0 => mem_50,
		input1 => mem_51,
		button => button1,
		clk	 => clk_in,
      output0=> mem_60,
		output1=> mem_61
	);
Inst_memory_7:	ENTITY	work.memory_2
	PORT MAP(
		input0 => mem_60,
		input1 => mem_61,
		button => button1,
		clk	 => clk_in,
      output0=> mem_70,
		output1=> mem_71
	);
Inst_memory_8:	ENTITY	work.memory_2
	PORT MAP(
		input0 => mem_70,
		input1 => mem_71,
		button => button1,
		clk	 => clk_in,
      output0=> mem_80,
		output1=> mem_81
	);
Inst_pulse	 :	ENTITY	work.pulse
	PORT MAP(
		clk	 		=> clk_in,
		user_input	=> button2,
		output_1		=> s_pulse
	);
Inst_machine :	ENTITY	work.machine
	PORT MAP(
		clk	 		=> clk_in,
		user_input  => s_pulse,
		state_1 => s_state1,
		state_2 => s_state2,
		state_3 => s_state3,
		state_4 => s_state4,
		state_5 => s_state5,
		state_6 => s_state6,
		state_7 => s_state7,
		state_8 => s_state8
	);
Inst_sum		 :	ENTITY	work.sum
	PORT MAP(
      data0 => (mem_10 xor mem_11),
		data1 => ((mem_20 xor mem_21) and (s_state2 or s_state3 or s_state4 or s_state5 or s_state6 or s_state7 or s_state8)),
		data2 => ((mem_30 xor mem_31) and (s_state3 or s_state4 or s_state5 or s_state6 or s_state7 or s_state8)),
		data3 => ((mem_40 xor mem_41) and (s_state4 or s_state5 or s_state6 or s_state7 or s_state8)),
		data4 => ((mem_50 xor mem_51) and (s_state5 or s_state6 or s_state7 or s_state8)),
		data5 => ((mem_60 xor mem_61) and (s_state6 or s_state7 or s_state8)),
		data6 => ((mem_70 xor mem_71) and (s_state7 or s_state8)),
		data7 => ((mem_80 xor mem_81) and (s_state8)),
      y 		=> s_sum
	);
Inst_decoder :	ENTITY	work.decoder_segm
	PORT MAP(
		input4	=> s_sum,
		output7	=> segm
	);
end arch;