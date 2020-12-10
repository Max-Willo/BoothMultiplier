library ieee;
use ieee.std_logic_1164.all;

entity carry_select_2bit is
	port
	(
		A, B: in std_logic_vector (1 downto 0);
		selector: in std_logic;
		sum: out std_logic_vector (1 downto 0);
		Cout: out std_logic
	);
end carry_select_2bit;

architecture arch of carry_select_2bit is

	component FullAdder is
	port	
	(
		A, B, Cin: in std_logic;
		carryout, sum: out std_logic
	);
	end component;

	component mux is
	port
	(
		A, B, selector: in std_logic;
		output: out std_logic
	);
	end component;

	signal tmp_sum1, tmp_sum2: std_logic_vector (1 downto 0);
	signal tmp_carry1, tmp_carry2, tmp_carry3, tmp_carry4 : std_logic;

	begin
		P1: FullAdder port map (A(0), B(0), '0', tmp_carry1, tmp_sum1(0));
		P2: FullAdder port map (A(1), B(1), tmp_carry1, tmp_carry2, tmp_sum1(1));
		
		P3: FullAdder port map (A(0), B(0), '1', tmp_carry3, tmp_sum2(0));
		P4: FullAdder port map (A(1), B(1), tmp_carry3, tmp_carry4, tmp_sum2(1));

		sum_m: for i in 1 downto 0 generate
			P5: mux port map (tmp_sum1(i), tmp_sum2(i), selector, sum(i));

		end generate;

		P6: mux port map (tmp_carry2, tmp_carry4, selector, Cout);

end arch;