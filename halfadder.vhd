library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
	port	
	(
		A, B: in std_logic;
		carryout, sum: out std_logic
	);
end HalfAdder;

architecture HalfAdder_A of HalfAdder is

	component XOR2 is
	port
	(
		A, B: in std_logic;
		output: out std_logic
	);
	end component;

	component AND2 is
	port
	(
		A, B: in std_logic;
		output: out std_logic
	);
	end component;

	begin

	P1: AND2 port map(A, B, carryout);
	P2: XOR2 port map(A, B, sum);

end HalfAdder_A;
