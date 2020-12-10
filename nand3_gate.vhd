library ieee;
use ieee.std_logic_1164.all;

entity NAND3 is
	port
	(
		A, B, C: in std_logic;
		output: out std_logic
	);
end NAND3;

architecture NAND3_arch of NAND3 is
begin
	output <= not (A and (B and C));
end NAND3_arch;
