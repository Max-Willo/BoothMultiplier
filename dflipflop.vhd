library ieee;
use ieee.std_logic_1164.all;

entity dflipflop is 
	port
	(
		D, clk, reset: in std_logic;
		Q_not, Q: out std_logic
	);
end dflipflop;

architecture dff_arch of dflipflop is

	component NAND2
		port
		(
			A, B: in std_logic;
			output: out std_logic
		);
	end component;

	component NOT1
		port
		(
			A: in std_logic;
			output: out std_logic
		);
	end component;

	signal t1, t2, t3, q_out, q_out_not: std_logic;
	begin

	P1: NOT1 port map (D, t1);
	P2: NAND2 port map (D, clk, t2);
	P3: NAND2 port map (t1, clk, t3);
	P4: NAND2 port map (t2, q_out_not, q_out);
	P5: NAND2 port map (t3, q_out, q_out_not);

	Q <= q_out;
	Q_not <= q_out_not;

end dff_arch;
