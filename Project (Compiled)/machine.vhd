library ieee;
use ieee.std_logic_1164.all;

entity machine is
	port (
		clk			:	in		std_logic;
		user_input	:	in		std_logic;
		state_1		:	out	std_logic;
		state_2		:	out	std_logic;
		state_3		:	out	std_logic;
		state_4		:	out	std_logic;
		state_5		:	out	std_logic;
		state_6		:	out	std_logic;
		state_7		:	out	std_logic;
		state_8		:	out	std_logic
	);
end machine;

architecture behav of machine is
	type states is (s0, s1, s2, s3, s4, s5, s6, s7);
	signal reg_state, next_state	:	states := s0;
begin
	-- pamet automatu
	process (clk)
	begin
		if clk'event and clk = '1' then
			reg_state <= next_state;
		end if;
	end process;
	
	-- prechodova funkce automatu
	process (reg_state, user_input)
	begin
		next_state <= reg_state;
		case reg_state is
			when s0 =>
				if user_input = '1' then
					next_state <= s1;
				end if;
			when s1 =>
				if user_input = '1' then
					next_state <= s2;
				end if;
			when s2 =>
				if user_input = '1' then
					next_state <= s3;
				end if;
			when s3 =>
				if user_input = '1' then
					next_state <= s4;
				end if;
			when s4 =>
				if user_input = '1' then
					next_state <= s5;
				end if;
			when s5 =>
				if user_input = '1' then
					next_state <= s6;
				end if;
			when s6 =>
				if user_input = '1' then
					next_state <= s7;
				end if;
			when s7 =>
				if user_input = '1' then
					next_state <= s0;
				end if;
			when others =>
				next_state <= reg_state;
		end case;
	end process;
	
	process(reg_state)
	begin
		case reg_state is
			when s0 =>
				state_1 <= '1';
				state_2 <= '0';
				state_3 <= '0';
				state_4 <= '0';
				state_5 <= '0';
				state_6 <= '0';
				state_7 <= '0';
				state_8 <= '0';
			when s1 =>
				state_1 <= '0';
				state_2 <= '1';
				state_3 <= '0';
				state_4 <= '0';
				state_5 <= '0';
				state_6 <= '0';
				state_7 <= '0';
				state_8 <= '0';
			when s2 =>
				state_1 <= '0';
				state_2 <= '0';
				state_3 <= '1';
				state_4 <= '0';
				state_5 <= '0';
				state_6 <= '0';
				state_7 <= '0';
				state_8 <= '0';
			when s3 =>
				state_1 <= '0';
				state_2 <= '0';
				state_3 <= '0';
				state_4 <= '1';
				state_5 <= '0';
				state_6 <= '0';
				state_7 <= '0';
				state_8 <= '0';
			when s4 =>
				state_1 <= '0';
				state_2 <= '0';
				state_3 <= '0';
				state_4 <= '0';
				state_5 <= '1';
				state_6 <= '0';
				state_7 <= '0';
				state_8 <= '0';
			when s5 =>
				state_1 <= '0';
				state_2 <= '0';
				state_3 <= '0';
				state_4 <= '0';
				state_5 <= '0';
				state_6 <= '1';
				state_7 <= '0';
				state_8 <= '0';
			when s6 =>
				state_1 <= '0';
				state_2 <= '0';
				state_3 <= '0';
				state_4 <= '0';
				state_5 <= '0';
				state_6 <= '0';
				state_7 <= '1';
				state_8 <= '0';
			when s7 =>
				state_1 <= '0';
				state_2 <= '0';
				state_3 <= '0';
				state_4 <= '0';
				state_5 <= '0';
				state_6 <= '0';
				state_7 <= '0';
				state_8 <= '1';
			when others => null;
		end case;
	end process;
end behav;