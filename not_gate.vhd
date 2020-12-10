library ieee;
use ieee.std_logic_1164.all;

entity NOT1 is
	port
	(
		A: in std_logic;
		output: out std_logic
	);
end NOT1;

architecture NOT_arch of NOT1 is
begin
	output <= not A;
end NOT_arch;
