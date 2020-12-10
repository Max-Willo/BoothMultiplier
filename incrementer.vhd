library ieee;
use ieee.std_logic_1164.all;

entity incrementer is
	port
	(
		A: in std_logic_vector (8 downto 0);
		Cin: std_logic;
		output: out std_logic_vector (8 downto 0);
		Cout: out std_logic
	);
end incrementer;

architecture arch of incrementer is
	component HalfAdder is
	port	
	(
		A, B: in std_logic;
		carryout, sum: out std_logic
	);
	end component;

	signal tmp_carry: std_logic_vector (8 downto 0);

	begin 
		P1: HalfAdder port map (A(0), Cin, output(0), tmp_carry(0));
		P2: HalfAdder port map (A(1), tmp_carry(1), output(1), tmp_carry(1));
		P3: HalfAdder port map (A(2), tmp_carry(2), output(2), tmp_carry(2));
		P4: HalfAdder port map (A(3), tmp_carry(3), output(3), tmp_carry(3));
		P5: HalfAdder port map (A(4), tmp_carry(4), output(4), tmp_carry(4));
		P6: HalfAdder port map (A(5), tmp_carry(5), output(5), tmp_carry(5));
		P7: HalfAdder port map (A(6), tmp_carry(6), output(6), tmp_carry(6));
		P8: HalfAdder port map (A(7), tmp_carry(7), output(7), tmp_carry(7));
		P9: HalfAdder port map (A(8), tmp_carry(8), output(8), Cout);
end arch;
