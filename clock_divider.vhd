----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:38:06 05/17/2013 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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

entity clock_divider is
generic(
	freq  : integer := 100000
	);
port(
	clock : in std_logic;
	div	: out std_logic
	);
end clock_divider;

architecture Behavioral of clock_divider is
signal count : std_logic:=0;
begin

process(clock)
begin	
	if rising_edge(clock) then
		if count = 0 then
			div <= '1';
			count <= ((100000000/freq)-1);
		else
			div <= '0';
			enable_count <= count - 1;
		end if;
	end if;
end process;


end Behavioral;

