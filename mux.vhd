library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port
	(
		A, B, selector: in std_logic;
		output: out std_logic
	);
end mux;

architecture arch of mux is

	component OR2
	port
	(
		A, B: in std_logic;
		output: out std_logic
	);
	end component;

	component AND2
	port
	(
		A, B: in std_logic;
		output: out std_logic
	);
	end component;

	component NOT1 is
	port
	(
		A: in std_logic;
		output: out std_logic
	);
	end component;

	signal tmp1, tmp2, tmp3: std_logic;

	begin

	P1: NOT1 port map (selector, tmp1);
	P2: AND2 port map (selector, A, tmp2);
	P3: AND2 port map (tmp1, B, tmp3);
	P4: OR2 port map (tmp2, tmp3, output);

end arch;