library ieee;
use ieee.std_logic_1164.all;

entity NAND2 is
	port
	(
		A, B: in std_logic;
		output: out std_logic
	);
end NAND2;

architecture NAND2_arch of NAND2 is
begin
	output <= A nand B;
end NAND2_arch;
