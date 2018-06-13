--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:35:47 06/27/2017
-- Design Name:   
-- Module Name:   E:/vipul/vipulalu/tbalu.vhd
-- Project Name:  vipulalu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu4bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbalu IS
END tbalu;
 
ARCHITECTURE behavior OF tbalu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu4bit
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         s : IN  std_logic_vector(2 downto 0);
         x : OUT  std_logic_vector(3 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal s : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal x : std_logic_vector(3 downto 0);
   signal c : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu4bit PORT MAP (
          a => a,
          b => b,
          s => s,
          x => x,
          c => c
        );

   -- Clock process definitions
 --   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      a<="0101";
		b<="0011";
		s<="000";
		wait for 50 ns;
		a<="1001";
		b<="0111";
		s<="000";
		wait for 50 ns;
		a<="0101";
		b<="0011";
		s<="001";
		wait for 50 ns;
		a<="0011";
		b<="0101";
		s<="001";
		wait for 50 ns;
		a<="0101";
		b<="0011";
		s<="010";
		wait for 50 ns;
		a<="0101";
		b<="0011";
		s<="011";
		wait for 50 ns;
		a<="0101";
		b<="0011";
		s<="100";
		wait for 50 ns;
		a<="0101";
		b<="0011";
		s<="101";
		wait for 50 ns;
		a<="0101";
		b<="0011";
		s<="110";
		wait for 50 ns;
		a<="0101";
		b<="0011";
		s<="111";
		wait for 50 ns;
		
     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
