library ieee;
use ieee.std_logic_1164.all;

entity OR2 is
	port
	(
		A, B: in std_logic;
		output: out std_logic
	);
end OR2;

architecture OR_arch of OR2 is
begin
	output <= A or B;
end OR_arch;
