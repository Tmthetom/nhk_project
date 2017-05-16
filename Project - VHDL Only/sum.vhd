library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum is
   port (
      data0 : in std_logic;
		data1 : in std_logic;
		data2 : in std_logic;
		data3 : in std_logic;
		data4 : in std_logic;
		data5 : in std_logic;
		data6 : in std_logic;
		data7 : in std_logic;
      y 		: out std_logic_vector (3 downto 0)
   	  );
end sum;

architecture a_sum of sum is
SIGNAL d0	:	integer;
SIGNAL d1	:	integer;
SIGNAL d2	:	integer;
SIGNAL d3	:	integer;
SIGNAL d4	:	integer;
SIGNAL d5	:	integer;
SIGNAL d6	:	integer;
SIGNAL d7	:	integer;
begin
   process (data0)
   begin      
		case data0 is
			when '0' => d0 <= 0;
			when '1' => d0 <= 1;
		end case;
   end process;
	
	process (data1)
   begin      
		case data1 is
			when '0' => d1 <= 0;
			when '1' => d1 <= 1;
		end case;
   end process;
	
	process (data2)
   begin      
		case data2 is
			when '0' => d2 <= 0;
			when '1' => d2 <= 1;
		end case;
   end process;
	
	process (data3)
   begin      
		case data3 is
			when '0' => d3 <= 0;
			when '1' => d3 <= 1;
		end case;
   end process;
	
	process (data4)
   begin      
		case data4 is
			when '0' => d4 <= 0;
			when '1' => d4 <= 1;
		end case;
   end process;
	
	process (data5)
   begin      
		case data5 is
			when '0' => d5 <= 0;
			when '1' => d5 <= 1;
		end case;
   end process;
	
	process (data6)
   begin      
		case data6 is
			when '0' => d6 <= 0;
			when '1' => d6 <= 1;
		end case;
   end process;
	
	process (data7)
   begin      
		case data7 is
			when '0' => d7 <= 0;
			when '1' => d7 <= 1;
		end case;
   end process;

y <= std_logic_vector(to_unsigned(d0 + d1 + d2 + d3 + d4 + d5 + d6 + d7,4));
end a_sum;