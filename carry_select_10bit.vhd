library ieee;
use ieee.std_logic_1164.all;

entity carry_select_10bit is
	port
	(
		A, B: in std_logic_vector (9 downto 0);
		sum: out std_logic_vector (9 downto 0);
		Cout: out std_logic
	);
end carry_select_10bit;

architecture arch of carry_select_10bit is

	component carry_select_4bit is
	port
	(
		A, B: in std_logic_vector (3 downto 0);
		selector: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		Cout: out std_logic
	);
	end component;

	component carry_select_2bit is
	port
	(
		A, B: in std_logic_vector (1 downto 0);
		selector: in std_logic;
		sum: out std_logic_vector (1 downto 0);
		Cout: out std_logic
	);
	end component;

	component FullAdder is
	port	
	(
		A, B, Cin: in std_logic;
		carryout, sum: out std_logic
	);
	end component;

	component HalfAdder is
	port	
	(
		A, B: in std_logic;
		carryout, sum: out std_logic
	);
	end component;

	signal tmp_carry1: std_logic_vector (3 downto 0);
	signal tmp_carry2: std_logic;

	begin
		P1: HalfAdder port map (A(0), B(0), tmp_carry1(0), sum(0));
		
		FullAdders: for i in 1 to 3 generate
			P2: FullAdder port map (A(i), B(i), tmp_carry1(i-1), tmp_carry1(i), sum(i));
		end generate;

		P3: carry_select_4bit port map (A( 7 downto 4), B(7 downto 4), tmp_carry1(3), sum (7 downto 4), tmp_carry2);

		P4: carry_select_2bit port map (A(9 downto 8), B(9 downto 8), tmp_carry2, sum(9 downto 8), Cout);

end arch;