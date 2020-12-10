library ieee;
use ieee.std_logic_1164.all;	

entity BoothAdder is
	port
	(
		A, B: in std_logic_vector(7 downto 0);
		sum: out std_logic_vector(15 downto 0)
	);
end BoothAdder;

architecture arch of BoothAdder is

	component booth_unit_0
		port
		(
			data: in std_logic_vector (7 downto 0);
			control: in std_logic_vector(2 downto 0);
			data_out: out std_logic_vector( 15 downto 0)
		);
	end component;