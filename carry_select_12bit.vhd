library ieee;
use ieee.std_logic_1164.all;

entity carry_select_12bit is
	port
	(
		A, B: in std_logic_vector (11 downto 0);
		sum: out std_logic_vector (11 downto 0);
		Cout: out std_logic
	);
end carry_select_12bit;

architecture arch of carry_select_12bit is

	component carry_select_4bit is
	port
	(
		A, B: in std_logic_vector (3 downto 0);
		selector: in std_logic;
		sum: out std_logic_vector(3 downto 0);
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

	signal tmp_carry: std_logic_vector(3 downto 0);
	signal tmp_select: std_logic;
	begin
		P1: HalfAdder port map (A(0), B(0), tmp_carry(0), sum(0));

		full_adders: for i in 1 to 3 generate
			P2: fulladder port map(A(0), B(0), tmp_carry(i-1), tmp_carry(i), sum(i));
		end generate;

		P3: carry_select_4bit port map(A(7 downto 4), B(7 downto 4), tmp_carry(3), sum(7 downto 4), tmp_select);
		P4: carry_select_4bit port map (A(11 downto 8), B(11 downto 8), tmp_select, sum(11 downto 8), Cout);

end arch;