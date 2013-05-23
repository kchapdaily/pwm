----------------------------------------------------------------------------------
-- Company: 
-- Engineer: KEVIN CHAPMAN
-- 
-- Create Date:    21:13:23 05/16/2013 
-- Design Name:	  	
-- Module Name:    top_level_pwm - Behavioral 
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

entity top_level_pwm is
port(
	clock 			: in std_logic; --default 100MHz
--	button 			: in std_logic; --will be used to change the pwm duty cycle
	enable 			: in std_logic;
	led 				: out std_logic;
	rled				: out std_logic
	);
end top_level_pwm;

architecture Behavioral of top_level_pwm is
signal pwm : std_logic;

component pwm_module is
port(
	clock 	: in std_logic; --default 100MHz
	enable 	: in std_logic;
--	duty		: in integer; --duty cycle of the pwm output, 0 through 99
	--freq 		: in integer; --frequency of pwm output in Hz
	pwm_out	: out std_logic
	);
end component;

begin

	led <= pwm;
	rled <= '1';
	
inst_pwm_module:pwm_module
port map(
	clock => clock,
	enable => enable,
--	duty => 50,
	--freq => 2000,
	pwm_out => pwm
	);


end Behavioral;

