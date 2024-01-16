require 'pry'
# You have a bank of switches before you, numbered from 1 to n. Each switch is 
# connected to exactly one light that is initially off. You walk down the row of 
# switches and toggle every one of them. You go back to the beginning, and on this 
# second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go 
# back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat 
# this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns 
# an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# Initial Solution:
def toggle_light_switches(num_of_switches)
  light_on = false
  light_switches = (1..num_of_switches).to_a.each_with_object({}) do |num, hsh|
    hsh[num] = light_on
  end

  (1..num_of_switches).each do |count|
    lights_to_flip = light_switches.keys.select do |light_num|
      light_num % count == 0
    end
    lights_to_flip.each do |light_num|
      light_on = light_switches[light_num]
      light_switches[light_num] = !light_on
    end
  end
  light_switches.select {|_,v| v }.keys
end

#---------------------------------------------#
#             REFACTORED SOLUTION             #
#---------------------------------------------#

def initialize_light_switches(num_of_switches)
  light_on = false
  (1..num_of_switches).to_a.each_with_object({}) do |light_num, hsh|
    hsh[light_num] = light_on
  end
end

def lights_to_flip(light_switches, num)
  light_switches.keys.select do |light_num|
    light_num % num == 0
  end
end

def flip_lights(light_switches, lights_to_flip)
  lights_to_flip.each do |light_num|
    light_on = light_switches[light_num]
    light_switches[light_num] = !light_on
  end
end

def toggle_switches(num_of_switches)
  light_switches = initialize_light_switches(num_of_switches)
 
  (1..num_of_switches).each do |count|
    lights_to_flip = lights_to_flip(light_switches, count)
    flip_lights(light_switches, lights_to_flip)
  end
  light_switches
end

def on_lights(num_of_switches)
  light_switches = toggle_switches(num_of_switches)
  light_switches.select { |_,v| v }.keys
end

# Further Exploration
def light_status(num_of_switches)
  light_switches = toggle_switches(num_of_switches)
  on, off = light_switches.partition { |_, v| v }
  on.flatten!.reject! { |el| el == true }
  off.flatten!.reject! { |el| el == false }
  "lights #{off.join(', ')} are now off; #{on.join(', ')} are on"
end
  
puts light_status(10)

p toggle_light_switches(5) == [1, 4]
p toggle_light_switches(10) == [1, 4, 9]
p toggle_light_switches(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 
  169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 
  784, 841, 900, 961]

p on_lights(5) == [1, 4]
p on_lights(10) == [1, 4, 9]
p on_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 
  169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 
  784, 841, 900, 961]