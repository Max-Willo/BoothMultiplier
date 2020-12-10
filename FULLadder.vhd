library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port	
	(
		A, B, Cin: in std_logic;
		carryout, sum: out std_logic
	);
end FullAdder;


architecture FullAdder_A of FullAdder is

	signal s_tmp, c_tmp1, c_tmp2, c_tmp3 : std_logic;

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

	component OR2
	port
	(
		A, B: in std_logic;
		output: out std_logic
	);
	end component;

	begin

	-- Carry
	P1: AND2 port map(A, B, c_tmp1);
	P2: AND2 port map(c_tmp1, Cin, c_tmp2);
	P3: OR2 port map (c_tmp1, c_tmp2, carryout);

	--Sum
	P4: XOR2 port map(A, B, s_tmp);
	P5: XOR2 port map(s_tmp, Cin, sum);
	

end FullAdder_A;
