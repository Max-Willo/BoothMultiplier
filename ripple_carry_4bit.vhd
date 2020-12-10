library ieee;
use ieee.std_logic_1164.all;	

entity ripple_carry_4bit is
	port
	(
		A, B: in std_logic_vector(3 downto 0);
		C: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		Cout: out std_logic
	);
end ripple_carry_4bit;

architecture arch of ripple_carry_4bit is

	component FullAdder is
	port	
	(
		A, B, Cin: in std_logic;
		carryout, sum: out std_logic
	);
	end component;

	signal tmp_carry: std_logic_vector (3 downto 0);
	
	begin
		P1: FullAdder port map (A(0), B(0), C, tmp_carry(0), sum(0));

		FullAdders: for i in 1 to 3 generate
			P2: FullAdder port map (A(i), B(i), tmp_carry(i-1), tmp_carry(i), sum(i));
		end generate;
		
		Cout <= tmp_carry(3);

end arch;