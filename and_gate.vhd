library ieee;
use ieee.std_logic_1164.all;

entity AND2 is
	port
	(
		A, B: in std_logic;
		output: out std_logic
	);
end AND2;

architecture AND_arch of AND2 is
begin
	output <= A and B;
end AND_arch;
