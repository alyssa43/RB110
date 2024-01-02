# You are given a method named spin_me that takes a string as an argument and returns a string that
# contains the same words, but with each word's characters reversed. Given the method's 
# implementation, will the returned string be the same object as the one passed in as an argument 
# or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ").object_id
end

p spin_me(string) # "olleh dlrow"

# The returned object will not be the same object that was passed in as an argument, it will be a
# different object. This happens in this example because when we call the `String#split` method on
# `str` it then returns a new Array object, and we no longer are working with the `str` object. 
# However, if we changed `str` to an Array object and passed that in as the argument, it would 
# indeed mutate the orignal Array object. 