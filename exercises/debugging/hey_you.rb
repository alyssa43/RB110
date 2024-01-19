# String#upcase! is a destructive method, so why does this code print HEY you 
# instead of HEY YOU? Modify the code so that it produces the expected output.

# def shout_out_to(name)
#   name.chars.each { |c| c.upcase! }

#   puts 'HEY ' + name
# end

# shout_out_to('you') # expected: 'HEY YOU'

# This code isn't working as expected because when we invoke `String#chars` on 
# the local variable `name` it returns a new Array object containing all of the 
# characters within the calling String. Meaning that whatever we do with that 
# Array, it will not mutate the String object that `name` is referencing. 

# To fix, this code to run as expected we just need to invoke `String#upcase` on 
# the `name` variable in the last line of our code so that it will return that 
# value along with the String `'HEY'`.

def shout_out_to(name)
  puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'

