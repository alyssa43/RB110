require 'pry'

=begin

PEDAC TEMPLATE
==============

P => [UNDERSTAND THE] PROBLEM: Write a method that takes a floating point
 number that represents an angle between 0 and 360 degrees and returns a
 String that represents that angle in degrees, minutes and seconds. You
 should use a degree symbol (°) to represent degrees, a single quote (')
 to represent minutes, and a double quote (") to represent seconds. A
 degree has 60 minutes, while a minute has 60 seconds.

 You should use two digit numbers with leading zeros when formatting the 
 minutes and seconds, e.g., 321°03'07".

  -INPUT: A number, either Float or Integer, representing an angle
  -OUTPUT: A string representing the degrees, minutes and seconds of input angle

  -RULES:
    -EXPLICIT:
			- input number will be between 0 and 360
			- ° will represent degrees
      - ' will represent minutes
      - " will represent seconds
      - 1 degree is equal to 60 minutes
      - Must use two digit number for minutes and seconds
  
    -IMPLICIT:
      - The whole number in front of the decimal is equal to the degrees
      - To get minutes, multiply decimal by 60
      - to get seconds, multiply decimal from above equation and multiply by 60

E => EXAMPLES AND TEST CASES:
  dms(30) == %(30°00'00")
  dms(76.73) == %(76°43'48")
  dms(254.6) == %(254°36'00")
  dms(93.034773) == %(93°02'05")
  dms(0) == %(0°00'00")
  dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

D => DATA STRUCTURE:
	- Integers, Floats, Strings

A => ALGORITHM:
	- create a method called `dms` that takes one argument called `num`
  - isolate the whole number of `num`:
    - invoke `to_i` on `num`
    - assign that return value to a local variable called `degrees`
  - isolate the decimal portion of `num` and calculate `minutes`:
    - subtract `degrees` from `num`
    - multiply that return value by 60
    - save that return value to a local variable called 'minutes'
  - isolate the decimal portin of `minutes` and calculate `seconds`:
    - invoke 'to_i' on `minutes`
    - subtract that return value from `minutes`
    - multiply that return value by 60
    - save that return value to a local variable called `seconds`
  - format code to display ('degrees')°(`minutes`)'(`seconds`)"
C => CODE WITH INTENT:
=end

DEGREE_SIGN = "\xC2\xB0"
MINUTES_SIGN = "'"
SECONDS_SIGN = '"'
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def isolate_decimal(num)
  (num - num.to_i).round(4)
end

def format_number(num)
  "%02d" % num.to_i
end

def dms(num)
  degrees = num.to_i
  minutes = isolate_decimal(num) * MINUTES_PER_DEGREE
  seconds = isolate_decimal(minutes) * SECONDS_PER_MINUTE
  "#{degrees}#{DEGREE_SIGN}#{format_number(minutes)}#{MINUTES_SIGN}#{format_number(seconds)}#{SECONDS_SIGN}"
end

puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")