library ieee;
use ieee.std_logic_1164.all;

entity XOR2 is
	port
	(
		A, B: in std_logic;
		output: out std_logic
	);
end XOR2;

architecture XOR_arch of XOR2 is
begin
	output <= A xor B;
end XOR_arch;
