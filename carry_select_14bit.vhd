library ieee;
use ieee.std_logic_1164.all;

entity carry_select_14bit is
	port
	(
		A, B: in std_logic_vector (13 downto 0);
		sum: out std_logic_vector (13 downto 0);
		Cout: out std_logic
	);
end carry_select_14bit;

architecture arch of carry_select_14bit is

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

	signal tmp_carry: std_logic_vector (4 downto 0);
	signal tmp_select: std_logic_vector(1 downto 0);
	begin
		P1: HalfAdder port map(A(0), B(0), tmp_carry(0), sum(0));
		
		FullAdders: for i in 1 to 3 generate
			P2: FullAdder port map(A(i), B(i), tmp_carry(i-1), tmp_carry(i), sum(i));
		end generate;

		P3: carry_select_4bit port map(A(7 downto 4), B(7 downto 4), tmp_carry(3), sum(7 downto 4), tmp_select(0));
		P4: carry_select_2bit port map(A(13 downto 12), B(13 downto 12), tmp_select(1), sum(13 downto 12), Cout);

end architecture;
