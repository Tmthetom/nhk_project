library ieee;
use ieee.std_logic_1164.all;

entity pulse is
	port (
		clk			:	in		std_logic;
		user_input	:	in		std_logic;
		output_1		:	out	std_logic
	);
end pulse;

architecture behav of pulse is
	type states is (s0, s1, s2);
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
				elsif user_input = '0' then
					next_state <= s0;
				end if;
			when s2 =>
				if user_input = '0' then
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
				output_1 <= '0';
			when s1 =>
				output_1 <= '1';
			when s2 =>
				output_1 <= '0';
			when others => null;
		end case;
	end process;
end behav;