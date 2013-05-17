----------------------------------------------------------------------------------
-- Company: 
-- Engineer: KEVIN CHAPMAN
-- 
-- Create Date:    17:46:45 05/17/2013 
-- Design Name: 
-- Module Name:    pwm_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_module is
port(
	clock 	: in std_logic; --default 100MHz
	enable 	: in std_logic;
	freq 		: in integer; --frequency of pwm output
	duty		: in integer; --duty cycle of the pwm output, 0 through 99
	pwm 		: out std_logic
	);
end pwm_module;

architecture Behavioral of pwm_module is
signal enable_count : integer;
signal pwm_count : integer;
signal div_clock : std_logic;

component clock_divider is
generic(
	freq  : integer := 100000
	);
port(
	clock : in std_logic;
	div	: out std_logic
	);
end component;

begin

pwm_freq_clk:clock_divider
generic map(freq => 2000)
port map(
	clock => clock,
	div => div_clock
	);

end Behavioral;






