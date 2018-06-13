----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:33 06/27/2017 
-- Design Name: 
-- Module Name:    alu4bit - Behavioral 
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
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu4bit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC_VECTOR (2 downto 0);
           x : out  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end alu4bit;

architecture Behavioral of alu4bit is
signal cy0,cy1,cy2,sign:std_logic;
signal d,e:std_logic_vector(3 downto 0);
begin
process(a,b,s,sign,cy0,cy1,cy2,d,e) is
begin
case s is
when "000" =>
x<= a + b;
cy0<=a(0) and b(0);
cy1<=(a(1)and b(1))or (b(1)and cy0) or(a(1) and cy0);
cy2<=(a(2)and b(2))or (b(2)and cy1) or(a(2) and cy1);
c<=(a(3)and b(3))or (b(3)and cy2) or(a(3) and cy2);
when "001" =>
d<=not b+1;
e<=a+d;
cy0<=a(0) and d(0);
cy1<=(a(1)and d(1))or (d(1)and cy0) or(a(1) and cy0);
cy2<=(a(2)and d(2))or (d(2)and cy1) or(a(2) and cy1);
sign<=(a(3)and d(3))or (d(3)and cy2) or(a(3) and cy2);

if b = "0000" then
sign<='1';
end if;
c<=not sign;
if sign='0' then
x<= not e+1;
else
x<=e;
end if;
when "010" =>
x<= a and b;
c<='0';
when "011" =>
x<= a or b;
c<='0';
when "100" =>
x<= a nand b;
c<='0';
when "101" =>
x<= a xor  b;
c<='0';
when "110" =>
x<= a xnor b;
c<='0';
when others =>
x<= a ;
c<='0';
end case;
end process;
end Behavioral;

