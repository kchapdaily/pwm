----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:33 05/16/2013 
-- Design Name: 
-- Module Name:    pwm_control - Behavioral 
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

entity pwm_control is
port(
	clock : in std_logic;
	enable : in std_logic;
	pwm_out : out std_logic
	);
end pwm_control;

architecture Behavioral of pwm_control is
signal count : integer range 0 to 4999;

process(clock)
begin
	if rising_edge(clock) and count = 4999 then
		clk_enable <= '1';
		count <= 0;
	else
		clk_enable <= '0'l
		count <= count + 1;
	end if;
end process

begin


end Behavioral;

