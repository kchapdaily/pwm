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
--	duty		: in integer; --duty cycle of the pwm output, 0 through 99
	--freq 		: in integer; --frequency of pwm output in Hz
	pwm_out 	: out std_logic
	);
end pwm_module;

architecture Behavioral of pwm_module is
signal pwm_count : integer range 0 to 99;
signal pwm_freq_count : integer range 0 to 1999;
--signal pwm_state_count : integer range 0 to 49;
signal pwm_freq_clock : std_logic:='0';
--signal pwm_state_clock : std_logic:='0';

begin

	pwm_freq_div:process(clock)
	begin	
		if rising_edge(clock) then
			if pwm_freq_count = 100 then
				pwm_freq_clock <= '1';
				pwm_freq_count <= 0;
			else
				pwm_freq_count <= pwm_freq_count + 1;
				pwm_freq_clock <= '0';
			end if;
		end if;
	end process;
	
--	pwm_state_div:process(clock, pwm_freq_clock)
--	begin
--		if rising_edge(clock) and pwm_freq_clock = '1' then
--			if pwm_state_count = 99 then
--				pwm_state_clock <= '1';
--				pwm_state_count <= 0;
--			else
--				pwm_state_count <= pwm_state_count + 1;
--				pwm_state_clock <= '0';
--			end if;
--		end if;
--	end process;		
--	
	process(clock, pwm_freq_clock, enable)
	begin
		if rising_edge(clock) and pwm_freq_clock = '1' then
			if enable = '1' then
				pwm_count <= pwm_count + 1;
				if pwm_count <= 99 then				
					if pwm_count <= 5 then
						pwm_out <= '1';
					else
						pwm_out <= '0';
					end if;
				else
					pwm_count <= 0;
				end if;
			
			else 
				pwm_out <= '0';
			end if;
		end if;
	end process;	

end Behavioral;






