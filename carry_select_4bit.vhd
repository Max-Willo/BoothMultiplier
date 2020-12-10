library ieee;
use ieee.std_logic_1164.all;

entity carry_select_4bit is
	port
	(
		A, B: in std_logic_vector (3 downto 0);
		selector: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		Cout: out std_logic
	);
end carry_select_4bit;

architecture arch of carry_select_4bit is
	
	component ripple_carry_4bit
	port
	(
		A, B: in std_logic_vector(3 downto 0);
		C: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		Cout: out std_logic
	);
	end component;
	
	component mux
	port
	(
		A, B, selector: in std_logic;
		output: out std_logic
	);
	end component;

	signal tmp_sum1, tmp_sum2: std_logic_vector (3 downto 0);
	signal tmp_carry1, tmp_carry2: std_logic;

	begin

		P1: ripple_carry_4bit port map (A, B, '0', tmp_sum1, tmp_carry1);
		P2: ripple_carry_4bit port map (A, B, '1', tmp_sum2, tmp_carry2);

		sum_m: for i in 3 downto 0 generate
			P3: mux port map (tmp_sum1(i), tmp_sum2(i), selector, sum(i));
		end generate;

		P4: mux port map(tmp_carry1, tmp_carry2, selector, Cout);

end arch;
			
